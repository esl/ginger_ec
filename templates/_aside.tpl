<div class="well">
<aside class="main-aside">

{% with m.rsc[id] as r %}

	{% if r.location_lat and r.location_lng %}
		{% include "_map_single.tpl" %}
	{% endif %}

    {% with r.subject as keywords %} 
        {% if keywords %}
           {% include "_button_list.tpl" title="Keywords" class="keywords" items=r.subject %}
        {% endif %}
    {% endwith %}

    {% include "_ginger_edit_page_connections.tpl" %}

	{% include "_content_list.tpl" list=r.o.about title='About:'%}

    {% if r.o.fixed_context %}
        {% include "_fixed_context_list.tpl" list=r.o.fixed_context %}
    {% elif r.subject %}
        {% catinclude "_matched_context_list.tpl" id %}
    {% else %}
        {% catinclude "_default_context_list.tpl" id %}
    {% endif %}

{% endwith %}

</aside>
</div>