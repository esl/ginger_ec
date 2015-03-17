{% extends "base.tpl" %}

{% block title %}Home{% endblock %}

{% block body_class %}home{% endblock %}

{% block content %}
    <div class="page--home__content-wrapper">
        {% with m.rsc.home_article as home %}
            {% with home.header as header %}
                {% if header %}
                    <div class="page__masthead" style="background-image: url({% image_url header.id mediaclass='img-header' crop %});">
                {% else %}
                    <div class="page__masthead--no-image">
                {% endif %}
                    </div>
            {% endwith %}

            <main role="main" class="page__main-content">
                <header class="page--home__header">
                    <h1>
                        <span class="page--home__header__title page__header__title">{{ home.title }}</span>
                        <span class="page--home__header__tagline page__header_tagline">{{ home.title }}</span>
                    </h1>
                </header>

                <article class="page__content">
                    {% if home.summary %}
                        <div class="page__content__intro">
                            {{ home.summary }}
                        </div>
                    {% endif %}

                    <div class="page__content__body">
                        {{ home.body|show_media }}
                    </div>

                    {% with m.rsc.home_links as home_links %}
                        {% if home_links.haspart %}
                            <ul class="page--home__links">
                                {% for link in home_links.haspart %}
                                    <li><a href="{{ link.page_url }}" class="ginger-btn-pill--secondary">{{ link.title }}</a></li>
                                {% endfor %}
                            </ul>
                        {% endif %}
                    {% endwith %}
                </article>
            </main>

            {% with m.search.paged[{query query_id=m.rsc.agenda.id pagelen=10 page=q.page}] as agenda %}
                {% if agenda %}
                    {% include "_correlated-items.tpl" items=agenda showMetaData="date" %}
                {% endif %}
            {% endwith %}

        {% endwith %}
    </div>
{% endblock %}
