{% extends "_basepage.swig" %}

{% block content-wrapper %}
<div class="panel-group">
  <div class="panel panel-default">
    <div class="panel-heading">
        <h1 class="panel-title"><i class="fa fa-file-text-o"></i> Posts</h1>
    </div>

    <div class="panel-body">

      <ul>
        {%- for post in site.posts %}
        <li {% if loop.first %}class="first-article"{% endif %}>
          <small>{{ full_date(post.date, 'D-MM-YYYY, h:mm') }}</small>
          <a href="{{ url_for(post.path) }}">
            {{ post.title }} dsds
          </a>
          <br>
          <small>{{ post.summary }}</small>
        </li>
        {% endfor -%}
      </ul>

    </div>

  </div>
</div>
{% endblock %}
