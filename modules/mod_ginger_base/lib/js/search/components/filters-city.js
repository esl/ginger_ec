$.widget("ui.search_cmp_filters_city", {

    _create: function() {

        var me = this,
            widgetElement = $(me.element);

        me.widgetElement = widgetElement;
        me.type = 'filters';

        widgetElement.on('change', function() {
            $(document).trigger('search:inputChanged');
        });

        widgetElement.on('keyup', function() {
          $('#city-name').val('');
        });

        var cities = me.widgetElement.data('cities');

        if (cities.length > 0) {
          widgetElement.autocomplete({
            source: cities,
            appendTo: "#cities-foldout",
            select: function (event, ui) {

              this.value = ui.item.label;
              $('#city-name').val(ui.item.value);
              $(document).trigger('search:inputChanged');
              return false;

           }
          });
        }

    },

    getValues: function() {

        var me = this,
            input = me.widgetElement,
            textVal = input.val();

        if (textVal) {
          return [
            {
                'type': 'filters',
                'values': [['pivot_city', textVal]]
            }
          ];

        } else {
          return [];
        }
    },


    setValues: function(values) {

        var me = this,
            widgetValues,
            mName,
            input = me.widgetElement.find('input');

        me.widgetElement.val('');
        $('#city-name').val('');

        try {
           widgetValues = values[me.type][0];
        } catch(e) {}
        

        if (widgetValues) {
            $('#city-id').val(widgetValues[1]);
            me.widgetElement.val(widgetValues[1]);
        }

    }

});
