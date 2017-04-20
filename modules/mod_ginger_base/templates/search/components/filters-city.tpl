
{% with m.search[{ginger_distinct_cities}] as result %}

<div class="search__filters__section">
    <h3 class="search__filters__title">{_ City _}</h3>

        <input class="do_search_cmp_filters_city" type="text" name="qs" value=""
        data-cities='[

        {% for r in result %}
          {"label":"{{ r }}", "value":"{{ r }}"}
          {% if not forloop.last %},{% endif %}

        {% endfor %}

        ]'
        />

        <input type="hidden" name="city-id" id="city-id" value="" />

</div>
<div id="cities-foldout"></div>

{% endwith %}
