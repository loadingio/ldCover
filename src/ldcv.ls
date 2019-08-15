(->
  parent = (r, s, e = document) ->
    n = r; while n and n != e => n = n.parentNode # must under e
    if n != e => return null
    n = r; while n and n != e and n.matches and !n.matches(s) => n = n.parentNode # must match s selector
    if n == e and (!e.matches or !e.matches(s)) => return null
    return n

  ldCover = (opt={}) ->
    @opt = {delay: 300, auto-z: true, base-z: 1000, escape: true, by-display: true} <<< opt
    @promises = []
    @root = if !opt.root =>
      ret = document.createElement("div")
      ret.innerHTML = """<div class="base"></div>"""
      ret
    else if typeof(opt.root) == \string => document.querySelector(opt.root) else opt.root
    cls = if typeof(opt.type) == \string => opt.type.split ' ' else opt.type
    if @root.getAttribute(\data-lock) => if that == \true => @opt.lock = true
    @inner = @root.querySelector '.inner'
    @base = @root.querySelector '.base'
    @root.classList.add.apply @root.classList, <[ldcv]> ++ (cls or [])
    if @opt.by-display => @root.style.display = \none
    @root.addEventListener \click, (e) ~>
      if e.target == @root and !@opt.lock => return @toggle false
      tgt = parent(e.target, '*[data-ldcv-set]', @root)
      if tgt and (action = tgt.getAttribute("data-ldcv-set"))? =>
        if !parent(tgt, '.disabled', @root) => @set action
    @evt-handler = {}
    @

  ldCover.prototype = Object.create(Object.prototype) <<< do
    # append element into ldcv. should be used for ldcv created without providing root.
    append: ->
      base = @root.childNodes.0
      (if base and base.classList.contains('base') => base else @root).appendChild it
    get: -> new Promise (res, rej) ~>
      @promises.push {res, rej}
      @toggle true
    # clear promises list and call res for each item
    set: (v, hide = true) ->
      @promises.splice 0 .map (p) -> p.res v
      if hide => @toggle false
    is-on: -> return @root.classList.contains(\active)
    toggle: (v) ->
      if !(v?) and @root.classList.contains \running => return
      @root.classList.add \running
      if @opt.by-display => @root.style.display = \block
      # why setTimeout?
      # It seems even if element is not visible ( opacity = 0, visibility = hidden ), mouse moving over them might
      # still makes animation slow down.
      # set z-index to -1 seems to work but if ldcv is in another div with greater z-index, it then won't work.
      #
      # To maximize performance, we set `display` style to `none` for nonactive ldcv element, and set it to
      # `block` when we need to activate it.
      #
      # But when ldcv is visible by setting `display` to `block` and adding 'active' at the same time,
      # all visual styles ( such as opacity, transform etc ) will be inited by active class instead of
      # the non-active value. This makes entering transition not work.
      #
      # Thus, we first set `block` here, give it a break by `setTimeout`, then set `active` class immediately
      #
      # if we want to remove thie setTimeout, either we have to use css animation to force animation, or we just
      # setTimeout for adding active class only.
      #
      # Additionally, we should check if quickly toggle on / off will cause problem due to setTimeout.
      <~ setTimeout _, 50
      if v? => @root.classList[if v => \add else \remove](\active)
      else @root.classList.toggle \active
      is-active = @root.classList.contains(\active)
      if !@opt.lock and @opt.escape and is-active =>
        esc = (e) ~> if e.keyCode == 27 =>
          @toggle false
          document.removeEventListener \keyup, esc
        document.addEventListener \keyup, esc
      if @opt.animation and @inner =>
        @inner.classList[if is-active => \add else \remove].apply @inner.classList, @opt.animation.split(' ')
      if @opt.auto-z =>
        if is-active =>
          @root.style.zIndex = @z = z = (ldCover.zstack[* - 1] or 0) + @opt.base-z
          ldCover.zstack.push z
        else
          idx = ldCover.zstack.indexOf(@z)
          delete @z # must delete z to prevent some modal being toggled off twice.
          if idx < 0 => @root.classList.remove(\running); return
          @root.style.zIndex = ""
          r = ldCover.zstack.splice(idx, 1)
      if @opt.transform-fix and !is-active => @root.classList.remove \shown
      setTimeout (~>
        @root.classList.remove \running
        if @opt.transform-fix and is-active => @root.classList.add \shown
        if !is-active and @opt.by-display => @root.style.display = \none
      ), @opt.delay
      if @promises.length and !is-active => @set undefined, false
      @fire "toggle.#{if is-active => \on else \off}"

    on: (n, cb) -> @evt-handler.[][n].push cb
    fire: (n, ...v) -> for cb in (@evt-handler[n] or []) => cb.apply @, v

  ldCover <<< do
    zstack: []

  if module? => module.exports = ldCover
  if window => window.ldCover = ldCover
)!
