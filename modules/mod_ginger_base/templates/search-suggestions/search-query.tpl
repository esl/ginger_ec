{# Search suggestions query #}

{%
    with
        results_template,
        cat|default:'',
        paged|default:true,
        cat_exclude|default:['meta', 'menu', 'admin_content_query'],
        search_text|default:q.value|default:q.qs,
        cg_name,
        pagelen|default:10,
        unfinished_or_nodate|default:"true",
        authoritative|default:1
    as
        results_template,
        cat,
        paged,
        cat_exclude,
        search_text,
        content_group,
        pagelen,
        unfinished_or_nodate,
        authoritative
%}

    {% if paged %}
        {% with m.search.paged[{ginger_search cat=cat cat_exclude=cat_exclude authoritative=authoritative unfinished_or_nodate=unfinished_or_nodate content_group=content_group text=search_text pagelen=pagelen}] as result %}
            {% include results_template %}
        {% endwith %}
    {% else %}
        {% with m.search[{ginger_search cat=cat cat_exclude=cat_exclude authoritative=authoritative unfinished_or_nodate=unfinished_or_nodate content_group=content_group text=search_text pagelen=pagelen page=q.page}] as result %}
            {% include results_template result=result %}
        {% endwith %}
    {% endif %}

{% endwith %}
