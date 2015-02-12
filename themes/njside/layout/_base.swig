<!doctype html>
<html class="no-js" lang="{{config.lang}}">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>{% block title %}Ninjaside Info{% endblock %}</title>
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="author" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="apple-touch-icon" href="apple-touch-icon.png">
  <!-- Place favicon.ico in the root directory -->

  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://rawgit.com/angular/bower-material/master/angular-material.css">

  {# css('assets/css/app.min.css') #}
  {# css('assets/css/material.min.css') #}
</head>

<body>
  <!--[if lt IE 8]>
    <p class="browserupgrade">
      You are using an <strong>outdated</strong> browser.
      Please <a href="http://browsehappy.com/">upgrade your browser</a>
      to improve your experience.
    </p>
  <![endif]-->

  {% block everything %}

  <div layout="column" flex>
    <md-toolbar class="md-default-theme">
      <div class="md-toolbar-tools">
        <span>My App's Title</span>
        <!-- fill up the space between left and right area -->
        <span flex></span>
        <md-button>
          Right Bar Button
        </md-button>
      </div>
    </md-toolbar>
    <md-content>
      Hello!
    </md-content>
  </div>

  <div class="container" id="app-container">
    <nav class="navbar navbar-default" role="navigation">
      {% block navigation %}{% endblock %}
    </nav>

    <div class="row" layout="row" layout-margin layout-fill layout-padding id="content-container">

      <main>
        <div flex="66" class="col col-lg-8">
          {% block content-wrapper %}
          <div class="panel panel-default">
            {% block content %}{% endblock %}
            <div class="panel-footer"></div>
          </div>
          {% endblock %}
        </div>
      </main>

      <aside>
        <div flex="33" layout-margin layout-fill layout-padding class="col col-lg-4">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h2 class="panel-title">Sidebar</h2>
            </div>
            {% block sidebar %}{% endblock %}
            <div class="panel-footer"></div>
          </div>
        </div>
      </aside>

    </div>

    <br>

    <footer>
      <div class="panel panel-default">
        {% block footer %}{% endblock %}
      </div>
    </footer>

  </div>
  {% endblock %}

  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.6/angular.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.6/angular-animate.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.6/angular-aria.min.js"></script>

  <!-- Angular Material Javascript using RawGit to load directly from `bower-material/master` -->
  <script src="https://rawgit.com/angular/bower-material/master/angular-material.js"></script>

  {# js('assets/js/vendors.min.js') #}
  {# js('assets/js/app.min.js') #}

  <script>
    document.write('<script src="http://' + (location.host || 'localhost').split(':')[0] + ':35729/livereload.js?snipver=1"></' + 'script>');
  </script>
</body>

</html>
