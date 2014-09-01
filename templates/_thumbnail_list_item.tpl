{% if id.is_visible and id.is_published %}
<li class="span3 thumbnail">
	<a href="{{ id.page_url }}" class="thumbnail"><img src="{% image_url id mediaclass="thumb-frontend" %}" alt="{{ id.title }}" title="{{id.title}}"/></a>
	<p class="caption2"><span class="icon icon-camera"></span> <a href="{{ id.page_url }}">{{ id.summary|default:id.title|truncate:60 }}</a></p>
</li>
{% endif %}
