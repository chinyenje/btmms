!function(e){if("object"==typeof exports&&"undefined"!=typeof module)module.exports=e();else if("function"==typeof define&&define.amd)define([],e);else{var n;n="undefined"!=typeof window?window:"undefined"!=typeof global?global:"undefined"!=typeof self?self:this,n.dragula=e()}}(function(){return function e(n,t,r){function o(u,c){if(!t[u]){if(!n[u]){var a="function"==typeof require&&require;if(!c&&a)return a(u,!0);if(i)return i(u,!0);var l=new Error("Cannot find module '"+u+"'");throw l.code="MODULE_NOT_FOUND",l}var f=t[u]={exports:{}};n[u][0].call(f.exports,function(e){var t=n[u][1][e];return o(t?t:e)},f,f.exports,e,n,t,r)}return t[u].exports}for(var i="function"==typeof require&&require,u=0;u<r.length;u++)o(r[u]);return o}({1:[function(e,n,t){"use strict";function r(e){var n=u[e];return n?n.lastIndex=0:u[e]=n=new RegExp(c+e+a,"g"),n}function o(e,n){var t=e.className;t.length?r(n).test(t)||(e.className+=" "+n):e.className=n}function i(e,n){e.className=e.className.replace(r(n)," ").trim()}var u={},c="(?:^|\\s)",a="(?:\\s|$)";n.exports={add:o,rm:i}},{}],2:[function(e,n,t){(function(t){"use strict";function r(e,n){function t(e){return-1!==ce.containers.indexOf(e)||ue.isContainer(e)}function r(e){var n=e?"remove":"add";o(oe,n,"mousedown",w),o(oe,n,"mouseup",Y)}function c(e){var n=e?"remove":"add";o(oe,n,"mousemove",x)}function p(e){var n=e?"remove":"add";o(oe,n,"selectstart",b),o(oe,n,"click",b)}function y(){r(!0),Y({})}function b(e){te&&e.preventDefault()}function w(e){J=e.clientX,Q=e.clientY;var n=1!==i(e)||e.metaKey||e.ctrlKey;if(!n){var t=e.target,r=S(t);r&&(te=r,c(),"mousedown"===e.type&&(v(t)?t.focus():e.preventDefault()))}}function x(e){if(te){if(0===i(e))return void Y({});if(void 0===e.clientX||e.clientX!==J||void 0===e.clientY||e.clientY!==Q){if(ue.ignoreInputTextSelection){var n=g("clientX",e),t=g("clientY",e),r=document.elementFromPoint(n,t);if(v(r))return}var o=te;c(!0),p(),N(),O(o);var a=u(V);$=g("pageX",e)-a.left,G=g("pageY",e)-a.top,E.add(ee||V,"gu-transit"),k(),A(e)}}}function S(e){if(!(ce.dragging&&z||t(e))){for(var n=e;e.parentElement&&t(e.parentElement)===!1;){if(ue.invalid(e,n))return;if(e=e.parentElement,!e)return}var r=e.parentElement;if(r&&!ue.invalid(e,n)){var o=ue.moves(e,r,n,m(e));if(o)return{item:e,source:r}}}}function C(e){var n=S(e);n&&O(n)}function O(e){F(e.item,e.source)&&(ee=e.item.cloneNode(!0),ce.emit("cloned",ee,e.item,"copy")),H=e.source,V=e.item,W=Z=m(e.item),ce.dragging=!0,ce.emit("drag",V,H)}function T(){return!1}function N(){if(ce.dragging){var e=ee||V;B(e,e.parentElement)}}function X(){te=!1,c(!0),p(!0)}function Y(e){if(X(),ce.dragging){var n=ee||V,t=g("clientX",e),r=g("clientY",e),o=a(z,t,r),i=R(o,t,r);i&&(ee&&ue.copySortSource||!ee||i!==H)?B(n,i):ue.removeOnSpill?P():D()}}function B(e,n){var t=e.parentElement;ee&&ue.copySortSource&&n===H&&t.removeChild(V),L(n)?ce.emit("cancel",e,H,H):ce.emit("drop",e,n,H,Z),I()}function P(){if(ce.dragging){var e=ee||V,n=e.parentElement;n&&n.removeChild(e),ce.emit(ee?"cancel":"remove",e,n,H),I()}}function D(e){if(ce.dragging){var n=arguments.length>0?e:ue.revertOnSpill,t=ee||V,r=t.parentElement;r===H&&ee&&r.removeChild(ee);var o=L(r);o===!1&&!ee&&n&&H.insertBefore(t,W),o||n?ce.emit("cancel",t,H,H):ce.emit("drop",t,r,H,Z),I()}}function I(){var e=ee||V;X(),q(),e&&E.rm(e,"gu-transit"),ne&&clearTimeout(ne),ce.dragging=!1,ie&&ce.emit("out",e,ie,H),ce.emit("dragend",e),H=V=ee=W=Z=ne=ie=null}function L(e,n){var t;return t=void 0!==n?n:z?Z:m(ee||V),e===H&&t===W}function R(e,n,r){function o(){var o=t(i);if(o===!1)return!1;var u=U(i,e),c=_(i,u,n,r),a=L(i,c);return a?!0:ue.accepts(V,i,H,c)}for(var i=e;i&&!o();)i=i.parentElement;return i}function A(e){function n(e){ce.emit(e,l,ie,H)}function t(){s&&n("over")}function r(){ie&&n("out")}if(z){e.preventDefault();var o=g("clientX",e),i=g("clientY",e),u=o-$,c=i-G;z.style.left=u+"px",z.style.top=c+"px";var l=ee||V,f=a(z,o,i),d=R(f,o,i),s=null!==d&&d!==ie;if((s||null===d)&&(r(),ie=d,t()),d===H&&ee&&!ue.copySortSource)return void(l.parentElement&&l.parentElement.removeChild(l));var v,p=U(d,f);if(null!==p)v=_(d,p,o,i);else{if(ue.revertOnSpill!==!0||ee)return void(ee&&l.parentElement&&l.parentElement.removeChild(l));v=W,d=H}(null===v||v!==l&&v!==m(l)&&v!==Z)&&(Z=v,d.insertBefore(l,v),ce.emit("shadow",l,d,H))}}function M(e){E.rm(e,"gu-hide")}function j(e){ce.dragging&&E.add(e,"gu-hide")}function k(){if(!z){var e=V.getBoundingClientRect();z=V.cloneNode(!0),z.style.width=d(e)+"px",z.style.height=s(e)+"px",E.rm(z,"gu-transit"),E.add(z,"gu-mirror"),ue.mirrorContainer.appendChild(z),o(oe,"add","mousemove",A),E.add(ue.mirrorContainer,"gu-unselectable"),ce.emit("cloned",z,V,"mirror")}}function q(){z&&(E.rm(ue.mirrorContainer,"gu-unselectable"),o(oe,"remove","mousemove",A),z.parentElement.removeChild(z),z=null)}function U(e,n){for(var t=n;t!==e&&t.parentElement!==e;)t=t.parentElement;return t===oe?null:t}function _(e,n,t,r){function o(){var n,o,i,u=e.children.length;for(n=0;u>n;n++){if(o=e.children[n],i=o.getBoundingClientRect(),c&&i.left>t)return o;if(!c&&i.top>r)return o}return null}function i(){var e=n.getBoundingClientRect();return u(c?t>e.left+d(e)/2:r>e.top+s(e)/2)}function u(e){return e?m(n):n}var c="horizontal"===ue.direction,a=n!==e?i():o();return a}function F(e,n){return"boolean"==typeof ue.copy?ue.copy:ue.copy(e,n)}var K=arguments.length;1===K&&Array.isArray(e)===!1&&(n=e,e=[]);var z,H,V,$,G,J,Q,W,Z,ee,ne,te,re=document.body,oe=document.documentElement,ie=null,ue=n||{};void 0===ue.moves&&(ue.moves=f),void 0===ue.accepts&&(ue.accepts=f),void 0===ue.invalid&&(ue.invalid=T),void 0===ue.containers&&(ue.containers=e||[]),void 0===ue.isContainer&&(ue.isContainer=l),void 0===ue.copy&&(ue.copy=!1),void 0===ue.copySortSource&&(ue.copySortSource=!1),void 0===ue.revertOnSpill&&(ue.revertOnSpill=!1),void 0===ue.removeOnSpill&&(ue.removeOnSpill=!1),void 0===ue.direction&&(ue.direction="vertical"),void 0===ue.ignoreInputTextSelection&&(ue.ignoreInputTextSelection=!0),void 0===ue.mirrorContainer&&(ue.mirrorContainer=re);var ce=h({containers:ue.containers,start:C,end:N,cancel:D,remove:P,destroy:y,dragging:!1});return ue.removeOnSpill===!0&&ce.on("over",M).on("out",j),r(),ce}function o(e,n,r,o){var i={mouseup:"touchend",mousedown:"touchstart",mousemove:"touchmove"},u={mouseup:"MSPointerUp",mousedown:"MSPointerDown",mousemove:"MSPointerMove"};t.navigator.msPointerEnabled&&y[n](e,u[r],o),y[n](e,i[r],o),y[n](e,r,o)}function i(e){if(void 0!==e.touches)return e.touches.length;if(void 0!==e.buttons)return e.buttons;if(void 0!==e.which)return e.which;var n=e.button;return void 0!==n?1&n?1:2&n?3:4&n?2:0:void 0}function u(e){var n=e.getBoundingClientRect();return{left:n.left+c("scrollLeft","pageXOffset"),top:n.top+c("scrollTop","pageYOffset")}}function c(e,n){if("undefined"!=typeof t[n])return t[n];var r=document.documentElement;if(r.clientHeight)return r[e];var o=document.body;return o[e]}function a(e,n,t){var r,o=e||{},i=o.className;return o.className+=" gu-hide",r=document.elementFromPoint(n,t),o.className=i,r}function l(){return!1}function f(){return!0}function d(e){return e.width||e.right-e.left}function s(e){return e.height||e.bottom-e.top}function v(e){return"INPUT"===e.tagName||"TEXTAREA"===e.tagName||"SELECT"===e.tagName}function m(e){function n(){var n=e;do n=n.nextSibling;while(n&&1!==n.nodeType);return n}return e.nextElementSibling||n()}function p(e){return e.targetTouches&&e.targetTouches.length?e.targetTouches[0]:e.changedTouches&&e.changedTouches.length?e.changedTouches[0]:e}function g(e,n){var t=p(n),r={pageX:"clientX",pageY:"clientY"};return e in r&&!(e in t)&&r[e]in t&&(e=r[e]),t[e]}var h=e("contra/emitter"),y=e("crossvent"),E=e("./classes");n.exports=r}).call(this,"undefined"!=typeof global?global:"undefined"!=typeof self?self:"undefined"!=typeof window?window:{})},{"./classes":1,"contra/emitter":4,crossvent:8}],3:[function(e,n,t){"use strict";var r=e("ticky");n.exports=function(e,n,t){e&&r(function(){e.apply(t||null,n||[])})}},{ticky:6}],4:[function(e,n,t){"use strict";var r=e("atoa"),o=e("./debounce");n.exports=function(e,n){var t=n||{},i={};return void 0===e&&(e={}),e.on=function(n,t){return i[n]?i[n].push(t):i[n]=[t],e},e.once=function(n,t){return t._once=!0,e.on(n,t),e},e.off=function(n,t){var r=arguments.length;if(1===r)delete i[n];else if(0===r)i={};else{var o=i[n];if(!o)return e;o.splice(o.indexOf(t),1)}return e},e.emit=function(){var n=r(arguments);return e.emitterSnapshot(n.shift()).apply(this,n)},e.emitterSnapshot=function(n){var u=(i[n]||[]).slice(0);return function(){var i=r(arguments),c=this||e;if("error"===n&&t["throws"]!==!1&&!u.length)throw 1===i.length?i[0]:i;return u.forEach(function(r){t.async?o(r,i,c):r.apply(c,i),r._once&&e.off(n,r)}),e}},e}},{"./debounce":3,atoa:5}],5:[function(e,n,t){n.exports=function(e,n){return Array.prototype.slice.call(e,n)}},{}],6:[function(e,n,t){var r,o="function"==typeof setImmediate;r=o?function(e){setImmediate(e)}:function(e){setTimeout(e,0)},n.exports=r},{}],7:[function(e,n,t){(function(e){function t(){try{var e=new r("cat",{detail:{foo:"bar"}});return"cat"===e.type&&"bar"===e.detail.foo}catch(n){}return!1}var r=e.CustomEvent;n.exports=t()?r:"function"==typeof document.createEvent?function(e,n){var t=document.createEvent("CustomEvent");return n?t.initCustomEvent(e,n.bubbles,n.cancelable,n.detail):t.initCustomEvent(e,!1,!1,void 0),t}:function(e,n){var t=document.createEventObject();return t.type=e,n?(t.bubbles=Boolean(n.bubbles),t.cancelable=Boolean(n.cancelable),t.detail=n.detail):(t.bubbles=!1,t.cancelable=!1,t.detail=void 0),t}}).call(this,"undefined"!=typeof global?global:"undefined"!=typeof self?self:"undefined"!=typeof window?window:{})},{}],8:[function(e,n,t){(function(t){"use strict";function r(e,n,t,r){return e.addEventListener(n,t,r)}function o(e,n,t){return e.attachEvent("on"+n,l(e,n,t))}function i(e,n,t,r){return e.removeEventListener(n,t,r)}function u(e,n,t){var r=f(e,n,t);return r?e.detachEvent("on"+n,r):void 0}function c(e,n,t){function r(){var e;return m.createEvent?(e=m.createEvent("Event"),e.initEvent(n,!0,!0)):m.createEventObject&&(e=m.createEventObject()),e}function o(){return new s(n,{detail:t})}var i=-1===v.indexOf(n)?o():r();e.dispatchEvent?e.dispatchEvent(i):e.fireEvent("on"+n,i)}function a(e,n,r){return function(n){var o=n||t.event;o.target=o.target||o.srcElement,o.preventDefault=o.preventDefault||function(){o.returnValue=!1},o.stopPropagation=o.stopPropagation||function(){o.cancelBubble=!0},o.which=o.which||o.keyCode,r.call(e,o)}}function l(e,n,t){var r=f(e,n,t)||a(e,n,t);return h.push({wrapper:r,element:e,type:n,fn:t}),r}function f(e,n,t){var r=d(e,n,t);if(r){var o=h[r].wrapper;return h.splice(r,1),o}}function d(e,n,t){var r,o;for(r=0;r<h.length;r++)if(o=h[r],o.element===e&&o.type===n&&o.fn===t)return r}var s=e("custom-event"),v=e("./eventmap"),m=t.document,p=r,g=i,h=[];t.addEventListener||(p=o,g=u),n.exports={add:p,remove:g,fabricate:c}}).call(this,"undefined"!=typeof global?global:"undefined"!=typeof self?self:"undefined"!=typeof window?window:{})},{"./eventmap":9,"custom-event":7}],9:[function(e,n,t){(function(e){"use strict";var t=[],r="",o=/^on/;for(r in e)o.test(r)&&t.push(r.slice(2));n.exports=t}).call(this,"undefined"!=typeof global?global:"undefined"!=typeof self?self:"undefined"!=typeof window?window:{})},{}]},{},[2])(2)});