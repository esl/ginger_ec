$('.toggledefinition').addClass('do_toggledefinition');

(function($) {
    'use strict';

    $.widget("ui.toggledefinition", {

        _init: function() {

            var me = this,
                element = $(me.element);

            me.element = element;

            element.on('click', function() {
                

                var content = me.element.attr('title');

                me.element.toggleClass('is-open');

                if (me.element.hasClass('is-open')) {

                    var abbr = $('<span class="toggle-content">' + content + '</span>');
                    me.abbr = abbr;
                    me.element.after(abbr);

                } else {
                    me.abbr.remove();
                }

                return false;

            });

        }

    });

})(jQuery);
