// Generated by LiveScript 1.3.1
var slice$ = [].slice;
(function(){
  var ldCover;
  ldCover = function(opt){
    var ret, cls, this$ = this;
    opt == null && (opt = {});
    this.opt = import$({
      delay: 300,
      autoZ: true,
      baseZ: 1000
    }, opt);
    this.root = !opt.root
      ? (ret = document.createElement("div"), ret.innerHTML = "<div class=\"base\"></div>", ret)
      : typeof opt.root === 'string'
        ? document.querySelector(opt.root)
        : opt.root;
    cls = typeof opt.type === 'string'
      ? opt.type.split(' ')
      : opt.type;
    this.base = this.root.querySelector('.base');
    this.root.classList.add.apply(this.root.classList, ['ldcv'].concat(cls || []));
    this.root.addEventListener('click', function(e){
      var action;
      if (e.target === this$.root) {
        return this$.toggle(false);
      }
      action = e.target.getAttribute("data-ldcv-set");
      if (action != null) {
        return this$.set(action);
      }
    });
    this.evtHandler = {};
    return this;
  };
  ldCover.prototype = import$(Object.create(Object.prototype), {
    promises: [],
    append: function(it){
      var base;
      base = this.root.childNodes[0];
      return (base && base.classList.contains('base')
        ? base
        : this.root).appendChild(it);
    },
    get: function(){
      var this$ = this;
      return new Promise(function(res, rej){
        this$.promises.push({
          res: res,
          rej: rej
        });
        return this$.toggle(true);
      });
    },
    set: function(v, hide){
      hide == null && (hide = true);
      this.promises.splice(0).map(function(p){
        return p.res(v);
      });
      if (hide) {
        return this.toggle(false);
      }
    },
    isOn: function(){
      return this.root.classList.contains('active');
    },
    toggle: function(v){
      var isActive, z, ref$, idx, this$ = this;
      if (!(v != null) && this.root.classList.contains('running')) {
        return;
      }
      this.root.classList.add('running');
      if (v != null) {
        this.root.classList[v ? 'add' : 'remove']('active');
      } else {
        this.root.classList.toggle('active');
      }
      isActive = this.root.classList.contains('active');
      if (this.opt.autoZ) {
        if (isActive) {
          this.root.style.zIndex = this.z = z = ((ref$ = ldCover.zstack)[ref$.length - 1] || 0) + this.opt.baseZ;
          ldCover.zstack.push(z);
        } else {
          if ((idx = ldCover.zstack.indexOf(this.z)) < 0) {
            return;
          }
          this.root.style.zIndex = "";
          ldCover.zstack.splice(idx, 1);
        }
      }
      if (this.opt.transformFix && !isActive) {
        this.root.classList.remove('shown');
      }
      setTimeout(function(){
        this$.root.classList.remove('running');
        if (this$.opt.transformFix && isActive) {
          return this$.root.classList.add('shown');
        }
      }, this.opt.delay);
      if (this.promises.length && !isActive) {
        this.set(undefined, false);
      }
      return this.fire("toggle." + (isActive ? 'on' : 'off'));
    },
    on: function(n, cb){
      var ref$;
      return ((ref$ = this.evtHandler)[n] || (ref$[n] = [])).push(cb);
    },
    fire: function(n){
      var v, i$, ref$, len$, cb, results$ = [];
      v = slice$.call(arguments, 1);
      for (i$ = 0, len$ = (ref$ = this.evtHandler[n] || []).length; i$ < len$; ++i$) {
        cb = ref$[i$];
        results$.push(cb.apply(this, v));
      }
      return results$;
    }
  });
  import$(ldCover, {
    zstack: []
  });
  if (typeof module != 'undefined' && module !== null) {
    module.exports = ldCover;
  }
  if (window) {
    return window.ldCover = ldCover;
  }
})();
function import$(obj, src){
  var own = {}.hasOwnProperty;
  for (var key in src) if (own.call(src, key)) obj[key] = src[key];
  return obj;
}
