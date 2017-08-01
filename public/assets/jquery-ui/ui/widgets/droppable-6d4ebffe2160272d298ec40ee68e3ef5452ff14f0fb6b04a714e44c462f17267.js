!function(e){"function"==typeof define&&define.amd?define(["jquery","./draggable","./mouse","../version","../widget"],e):e(jQuery)}(function(e){e.widget("ui.droppable",{version:"1.12.1",widgetEventPrefix:"drop",options:{accept:"*",addClasses:!0,greedy:!1,scope:"default",tolerance:"intersect",activate:null,deactivate:null,drop:null,out:null,over:null},_create:function(){var t,i=this.options,s=i.accept;this.isover=!1,this.isout=!0,this.accept=e.isFunction(s)?s:function(e){return e.is(s)},this.proportions=function(){if(!arguments.length)return t||(t={width:this.element[0].offsetWidth,height:this.element[0].offsetHeight});t=arguments[0]},this._addToManager(i.scope),i.addClasses&&this._addClass("ui-droppable")},_addToManager:function(t){e.ui.ddmanager.droppables[t]=e.ui.ddmanager.droppables[t]||[],e.ui.ddmanager.droppables[t].push(this)},_splice:function(e){for(var t=0;t<e.length;t++)e[t]===this&&e.splice(t,1)},_destroy:function(){var t=e.ui.ddmanager.droppables[this.options.scope];this._splice(t)},_setOption:function(t,i){if("accept"===t)this.accept=e.isFunction(i)?i:function(e){return e.is(i)};else if("scope"===t){var s=e.ui.ddmanager.droppables[this.options.scope];this._splice(s),this._addToManager(i)}this._super(t,i)},_activate:function(t){var i=e.ui.ddmanager.current;this._addActiveClass(),i&&this._trigger("activate",t,this.ui(i))},_deactivate:function(t){var i=e.ui.ddmanager.current;this._removeActiveClass(),i&&this._trigger("deactivate",t,this.ui(i))},_over:function(t){var i=e.ui.ddmanager.current;i&&(i.currentItem||i.element)[0]!==this.element[0]&&this.accept.call(this.element[0],i.currentItem||i.element)&&(this._addHoverClass(),this._trigger("over",t,this.ui(i)))},_out:function(t){var i=e.ui.ddmanager.current;i&&(i.currentItem||i.element)[0]!==this.element[0]&&this.accept.call(this.element[0],i.currentItem||i.element)&&(this._removeHoverClass(),this._trigger("out",t,this.ui(i)))},_drop:function(i,s){var o=s||e.ui.ddmanager.current,n=!1;return!(!o||(o.currentItem||o.element)[0]===this.element[0])&&(this.element.find(":data(ui-droppable)").not(".ui-draggable-dragging").each(function(){var s=e(this).droppable("instance");if(s.options.greedy&&!s.options.disabled&&s.options.scope===o.options.scope&&s.accept.call(s.element[0],o.currentItem||o.element)&&t(o,e.extend(s,{offset:s.element.offset()}),s.options.tolerance,i))return n=!0,!1}),!n&&(!!this.accept.call(this.element[0],o.currentItem||o.element)&&(this._removeActiveClass(),this._removeHoverClass(),this._trigger("drop",i,this.ui(o)),this.element)))},ui:function(e){return{draggable:e.currentItem||e.element,helper:e.helper,position:e.position,offset:e.positionAbs}},_addHoverClass:function(){this._addClass("ui-droppable-hover")},_removeHoverClass:function(){this._removeClass("ui-droppable-hover")},_addActiveClass:function(){this._addClass("ui-droppable-active")},_removeActiveClass:function(){this._removeClass("ui-droppable-active")}});var t=e.ui.intersect=function(){function e(e,t,i){return e>=t&&e<t+i}return function(t,i,s,o){if(!i.offset)return!1;var n=(t.positionAbs||t.position.absolute).left+t.margins.left,r=(t.positionAbs||t.position.absolute).top+t.margins.top,a=n+t.helperProportions.width,l=r+t.helperProportions.height,p=i.offset.left,d=i.offset.top,c=p+i.proportions().width,h=d+i.proportions().height;switch(s){case"fit":return p<=n&&a<=c&&d<=r&&l<=h;case"intersect":return p<n+t.helperProportions.width/2&&a-t.helperProportions.width/2<c&&d<r+t.helperProportions.height/2&&l-t.helperProportions.height/2<h;case"pointer":return e(o.pageY,d,i.proportions().height)&&e(o.pageX,p,i.proportions().width);case"touch":return(r>=d&&r<=h||l>=d&&l<=h||r<d&&l>h)&&(n>=p&&n<=c||a>=p&&a<=c||n<p&&a>c);default:return!1}}}();return e.ui.ddmanager={current:null,droppables:{"default":[]},prepareOffsets:function(t,i){var s,o,n=e.ui.ddmanager.droppables[t.options.scope]||[],r=i?i.type:null,a=(t.currentItem||t.element).find(":data(ui-droppable)").addBack();e:for(s=0;s<n.length;s++)if(!(n[s].options.disabled||t&&!n[s].accept.call(n[s].element[0],t.currentItem||t.element))){for(o=0;o<a.length;o++)if(a[o]===n[s].element[0]){n[s].proportions().height=0;continue e}n[s].visible="none"!==n[s].element.css("display"),n[s].visible&&("mousedown"===r&&n[s]._activate.call(n[s],i),n[s].offset=n[s].element.offset(),n[s].proportions({width:n[s].element[0].offsetWidth,height:n[s].element[0].offsetHeight}))}},drop:function(i,s){var o=!1;return e.each((e.ui.ddmanager.droppables[i.options.scope]||[]).slice(),function(){this.options&&(!this.options.disabled&&this.visible&&t(i,this,this.options.tolerance,s)&&(o=this._drop.call(this,s)||o),!this.options.disabled&&this.visible&&this.accept.call(this.element[0],i.currentItem||i.element)&&(this.isout=!0,this.isover=!1,this._deactivate.call(this,s)))}),o},dragStart:function(t,i){t.element.parentsUntil("body").on("scroll.droppable",function(){t.options.refreshPositions||e.ui.ddmanager.prepareOffsets(t,i)})},drag:function(i,s){i.options.refreshPositions&&e.ui.ddmanager.prepareOffsets(i,s),e.each(e.ui.ddmanager.droppables[i.options.scope]||[],function(){if(!this.options.disabled&&!this.greedyChild&&this.visible){var o,n,r,a=t(i,this,this.options.tolerance,s),l=!a&&this.isover?"isout":a&&!this.isover?"isover":null;l&&(this.options.greedy&&(n=this.options.scope,r=this.element.parents(":data(ui-droppable)").filter(function(){return e(this).droppable("instance").options.scope===n}),r.length&&(o=e(r[0]).droppable("instance"),o.greedyChild="isover"===l)),o&&"isover"===l&&(o.isover=!1,o.isout=!0,o._out.call(o,s)),this[l]=!0,this["isout"===l?"isover":"isout"]=!1,this["isover"===l?"_over":"_out"].call(this,s),o&&"isout"===l&&(o.isout=!1,o.isover=!0,o._over.call(o,s)))}})},dragStop:function(t,i){t.element.parentsUntil("body").off("scroll.droppable"),t.options.refreshPositions||e.ui.ddmanager.prepareOffsets(t,i)}},!1!==e.uiBackCompat&&e.widget("ui.droppable",e.ui.droppable,{options:{hoverClass:!1,activeClass:!1},_addActiveClass:function(){this._super(),this.options.activeClass&&this.element.addClass(this.options.activeClass)},_removeActiveClass:function(){this._super(),this.options.activeClass&&this.element.removeClass(this.options.activeClass)},_addHoverClass:function(){this._super(),this.options.hoverClass&&this.element.addClass(this.options.hoverClass)},_removeHoverClass:function(){this._super(),this.options.hoverClass&&this.element.removeClass(this.options.hoverClass)}}),e.ui.droppable});