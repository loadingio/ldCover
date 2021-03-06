(function(){
  var fire, ldcv, ldAlert;
  fire = function(e, n){
    if (e[n]) {
      return e[n]();
    }
  };
  ldcv = new ldCover({
    root: '.ldcv'
  });
  window.ldAlert = ldAlert = function(){
    var args, res$, i$, to$, opt, evt, root, dom, c, k, ref$, v;
    res$ = [];
    for (i$ = 0, to$ = arguments.length; i$ < to$; ++i$) {
      res$.push(arguments[i$]);
    }
    args = res$;
    if (typeof args[0] === 'object') {
      opt = args[0];
    } else {
      opt = {
        title: args[0],
        desc: args[1],
        type: args[2]
      };
    }
    evt = opt.event;
    /* we should prepare ldcv and its root here. */
    root = ldcv.root;
    if (opt.clone) {
      root = root.cloneNode(true);
      document.body.appendChild(root);
    }
    if (!ldAlert.dom) {
      ldAlert.dom = dom = {};
      Array.from(ldcv.root.querySelectorAll('[data-name]')).map(function(d){
        return dom[d.getAttribute('data-name')] = d;
      });
      dom.root = root;
    } else {
      dom = ldAlert.dom;
    }
    ['title', 'desc', 'foot', 'yes', 'no', 'cancel'].map(function(it){
      if (opt[it]) {
        return dom[it].innerHTML = opt[it];
      }
    });
    if (opt.type) {
      c = icon.svg + "" + icon[opt.type] + icon.bounce + "<desc>" + Math.random() + "</desc></svg>";
      dom.icon.setAttribute('src', "data:image/svg+xml," + encodeURIComponent(c));
    }
    if (opt.foot) {
      dom.footroot.classList.remove('d-none');
    }
    if (opt.toggle) {
      for (k in ref$ = opt.toggle) {
        v = ref$[k];
        dom[k].style.display = v ? 'inline-block' : 'none';
      }
    }
    if (opt.style) {
      for (k in ref$ = opt.style) {
        v = ref$[k];
        import$(dom[k].style, v);
      }
    }
    if (opt.timer) {
      setTimeout(function(){
        return ldcv.set();
      }, opt.timer);
    }
    fire(evt, 'beforeOpen');
    return ldcv.get()['finally'](function(){
      if (opt.clone) {
        document.body.removeChild(root);
      }
      return fire(evt, 'afterClose');
    });
  };
  return window.fire = function(){
    return ldAlert({
      title: 'Failed',
      desc: 'Your <b>last action</b> is not successful. more about your <b>last action</b> in the following link.',
      type: 'error',
      foot: '<a href="#">Why did this action fail?</a>',
      yes: 'hello',
      toggle: {
        cancel: true,
        closebtn: true
      },
      style: {
        root: {
          background: "linear-gradient(45deg,rgba(0,0,0,.5),rgba(255,255,255,.5))"
        }
      },
      event: {
        beforeOpen: function(it){
          return console.log('beforeOpen', it);
        },
        afterClose: function(it){
          return console.log('afterClose', it);
        }
      }
    }).then(function(it){
      return console.log("got value: ", it);
    });
  };
})();
function import$(obj, src){
  var own = {}.hasOwnProperty;
  for (var key in src) if (own.call(src, key)) obj[key] = src[key];
  return obj;
}