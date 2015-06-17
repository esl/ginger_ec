{# A wrapper around the signup/login dialog that displays them in a tabbed view #}

<ul class="nav nav-pills">
    {% block tabs %}
        <li {% if tab == "logon" %}class="active"{% endif %}>
            {% wire id="tab-logon" action={replace target="z_logon_or_signup" template="_logon_modal.tpl" logon_state="logon" propagate } %}
            <a data-toggle="tab" id="tab-logon">{_ Log in _}</a>
        </li>

        <li {% if tab == "signup" %}class="active"{% endif %}>
            {% wire id="tab-signup" action={replace target="z_logon_or_signup" template="_logon_modal.tpl" logon_state="signup" propagate } %}
            <a data-toggle="tab" href="#{{ #tab }}-signup" id="tab-signup">{_ Sign up _}</a>
        </li>

        <li {% if tab == "forgot" %}class="active"{% endif %}>
            {% wire id="tab-forgot" action={replace target="z_logon_or_signup" template="_logon_modal.tpl" logon_state="reminder" propagate } %}
            <a data-toggle="tab" href="#{{ #tab }}-forgot" id="tab-forgot">{_ Forgot my password _}</a>
        </li>
	{% endblock %}
</ul>

<div id="tab-content" class="tab-content">
    {% include "_logon_modal.tpl" logon_state="logon" %}
</div>
