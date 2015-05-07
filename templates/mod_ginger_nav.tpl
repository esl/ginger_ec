<div class="mod_ginger_nav do_mod_ginger_nav">

    <nav class="mod_ginger_nav__main-nav">

        <a href="/" class="mod_ginger_nav__main-nav__logo">
            <span>hart</span><span>amsterdam museum</span>
        </a>

        <a href="#" class="mod_ginger_nav__top-button mod_ginger_nav__main-nav__search-button">
            <span class="glyphicon glyphicon-search">&nbsp;</span>
        </a>

        {% include "mod_ginger_nav_login.tpl" %}
        {% include "mod_ginger_nav_edit.tpl" %}

        <a href="#" class="mod_ginger_nav__top-button mod_ginger_nav__main-nav__toggle-menu">
            <span class="glyphicon glyphicon-menu-hamburger">&nbsp;</span>
        </a>

        <div class="mod_ginger_nav__main-nav__container hidden">
            {% menu id=id class="mod_ginger_nav__main-nav__container__menu" %}
        </div>

        {% include "_search_form.tpl" identifier="am" extraClasses="" %}

    </nav>

    {% with m.rsc[id.content_group_id] as content_group %}
        {% if content_group and content_group.name != "system_content_group" and content_group.name != "default_content_group" %}
                {% if content_group.o.hasbanner %}
                    {% with content_group.o.hasbanner.depiction as banner_dep %}
                      <a href="#" class="mod_ginger_nav__theme-banner" style="background-image: url('{% image_url banner_dep mediaclass='theme-banner' %}');">
                        <h1 class="mod_ginger_nav__theme-banner__title">{{ content_group.title }} ^ </h1>
                      </a>
                    {% endwith %}
                {% endif %}
                {% if content_group.o.hassubnav %}
                    {% with content_group.o.hassubnav as subnav_ids %}
                        <nav class="mod_ginger_nav__theme-menu">
                             <ul>
                                <li><a href="{{ content_group.page_url }}"><i class="fa fa-home"></i>&nbsp; {{ content_group.title }}</a></li>
                                {% for subnav_id in subnav_ids %}
                                    {% if m.rsc[subnav_id].is_a.collection %}
                                        {% for part_id in m.rsc[subnav_id].o.haspart %}
                                            <li><a href="{{ m.rsc[part_id].page_url }}">{{ m.rsc[part_id].title }}</a></li>
                                        {% endfor %}
                                    {% else %}
                                         <li><a href="{{ m.rsc[subnav_id].page_url }}">{{ m.rsc[subnav_id].title }}</a></li>
                                    {% endif %}
                                {% endfor %}
                             </ul>
                        </nav>
                    {% endwith %}
                {% endif %}
        {% endif %}
    {% endwith %}
    
</div>