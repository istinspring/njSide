{% extends "_base.swig" %}

{% block navigation %}
  <div class="navbar-header">
    <a class="navbar-brand" href="/"><b>Ninjaside</b></a>
  </div>

  <div class="navbar-collapse collapse" id="navbar-main">
    <ul class="nav navbar-nav">
      {% for page in site.pages %}
      <li>
        <a href="{{ url_for(page.path) }}">{{ page.title }}</a>
      </li>
      {% endfor %}
    </ul>

    <ul class="nav navbar-nav navbar-right">
      <li><a href=""><b>Wiki</b></a></li>
      <li><a href=""><b>RSS</b></a></li>
    </ul>
  </div>
{% endblock %}

{% block sidebar %}
<div class="panel-body">
  <div class="btn-group btn-group-justified">
    <a href="" class="btn btn-info">Blog (programming)</a>
    <a href="" class="btn btn-success">Music</a>
  </div>
</div>

<div class="panel-body">
  <ul class="nav nav-pills nav-stacked">
    {% for cat in site.categories %}
    <li>
      {{ cat.title }}
    </li>
    {% endfor %}
  </ul>
</div>

<div class="list-group">
{% for cat in site.categories %}
  <a href="" class="list-group-item">{{ cat.title }} <span class="badge">2</span></a>
{% endfor %}
</div>

<div class="panel-body">
  <div class="tags">
    <p>{{ tagcloud(site.tags) }}</p>
  </div>
</div>
{% endblock %}


{% block footer %}
<div class="panel-body">
</div>
<div class="panel-footer">
  <p>
    &copy; Copyright 2013 Alex Istinspring
    <a class="pull-right" href="/sitemap.xml">sitemap.xml</a>
  </p>
</div>
{% endblock %}
