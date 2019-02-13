# ldCover

vanilla popup / dialog library.


## Usage

var ldcv = new ldCover({ ... });

configurations:

 * root: container.
 * type: additional class to add. default: ''. space seprated. 
 * transform-fix: true/false. default: false.
   add a 'shown' class after ldCover is shown, which remove transform from .inner block.
   useful when content is blurred due to transform, but might lead to glitches when doing transition. use it carefully.
 * delay: milliseconds. default 300. should be aligned with transition duration. use to control 'shown' and 'running' classes.
 * auto-z: update root's z-index automatically. default true.
 * base-z: the minimal z-index of root. default 1000.
   - with auto-z, ldCover keeps track of all cover' z-index and always use larger z-index for newly toggled covers. base-z is then used as a base value for all auto-z covers.



Methods:
 * toggle(state): toggle on/off ldCover.
 * get(): toggle on ldCover and return a promise, which will only be resolved when ldCover.set is called.
 * set(v, hide=true): set value, which resolve promises from get, and hide ldCover if hide = true.
   - use data-ldcv-set on elements to automatically set value when elements are clicked.
 * on(event, cb): listen to certain event. evnets:
   - toggle.on: when ldCover is toggled on.
   - toggle.off: when ldCover is toggled off.


## Spec. and structure

A simple ldCover popup are built with following html structure:

 * .ldcv          - topmost, fullscreen container
   * .base        - control the overall size and position for this box ( could be omit )
     *  .inner     - dialog container. constraint size. transition animation goes here


one can decorate ldCover widgets by adding classes over the outmost element. following classes are defined by default:

 * .ldcv.bare:
   - no covered bk.
   - custom position for .ldcv > .base
   - overflow: visible for .ldcv > .base > .inner (why?)

 * centering
   - by default .base is centered with vertical-align + ::after pseudo class. instead you can choose different methods, described below:
   - .ldcv.margin-centered
     - center with margin: auto + left/right/top/bottom: 0 and position: absolute. need width/height to be provided.
   - .ldcv.transform-centered
     - with transform-center, .base is centered with left: 50%, top: 50% + transform: translate(-50%,-50%), which don't need width/height to be provided anymore.
     - NOTE: this might causes content to be blur, so use it carefully.

## Action

Simple popup could be configured with automatically set invocation to resolve promises waited by get. use ```data-ldcv-set``` attribute on elements to indicate what values to be passed into set:

```
  <div class="ldcv">
    <button data-ldcv-set="1"> OK </button>
    <button data-ldcv-set="0"> Cancel </button>
  </div>
```

use get function to wait for the return value:

```
ldcv.get!then -> if it == "1" => "OK" else "Cancel"
```


## Todo

 * implement all this nice transitional effect:
   - https://tympanus.net/Development/ModalWindowEffects/
   - https://tympanus.net/Development/PageTransitions/


## License

MIT
