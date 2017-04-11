{% extends "base.tpl" %}

{% block body_class %}t--article-sided{% endblock %}

{% block content %}
    <main  class="page--sided">

        <article class="main-content--sided">

            {% block published %}
                {% catinclude "published/published.tpl" id %}
            {% endblock %}

            {% block category_of %}
                {% catinclude "category-of/category-of.tpl" id class="category-of--sided" %}
            {% endblock %}

            {% include "page-title/page-title.tpl" id=id %}

            {% include "subtitle/subtitle.tpl" id=id %}

            {% block page_actions %}
                {% catinclude "page-actions/page-actions.tpl" id %}
            {% endblock %}

            {% catinclude "media/media.tpl" id %}

            {% include "summary/summary.tpl" id=id %}

            {% include "body/body.tpl" id=id %}

            {% include "blocks/blocks.tpl" id=id %}

            {% catinclude "list/list-simple.tpl" id items=id.o.actor header=_"Actors: " %}

            {% block copyrights %}
                {% include "copyrights/copyrights.tpl" id=id %}
            {% endblock %}

            {% include "comments/comments.tpl" id=id %}

        </article>

        <aside class="main-aside--sided">

            {% catinclude "main-aside/main-aside.tpl" id %}

        </aside>
    </main>
{% endblock %}
