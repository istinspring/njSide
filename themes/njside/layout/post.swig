{% extends "_basepage.swig" %}

{% block title %}{{ article.title }}{% endblock %}
{% block meta_description %}{{ article.summary }}{% endblock %}
{% block meta_keywords %}{{ article.tags|join(", ") }}{% endblock %}
{% block page_language %}{{ article.language }}{% endblock %}

{% block content %}
<div itemscope itemtype="http://schema.org/BlogPosting">
    <div class="panel panel-default">

<div class="panel-heading">
    <h1 class="panel-title"><span itemprop="name">{{ page.title }}</span></h1>
</div>

<div class="panel-body">
    <p class="text-right"><small><span itemprop="datePublished">{{ page.date }}</span></small></p>

    <div itemprop="articleBody">
    {{ page.content|safe }}
    </div>

    <div class="comments-block" itemprop="comment">
        {%- if config.PAGES_ADDITIONAL_JS %}
        <div id="disqus_thread"></div>
        <script type="text/javascript">
            /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
            var disqus_shortname = 'ninjasideblog'; // required: replace example with your forum shortname

            /* * * DON'T EDIT BELOW THIS LINE * * */
            (function() {
                var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
                (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
            })();
        </script>
        <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
        <a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>
        {%- endif %}
    </div>
</div>

    </div>
</div>
{% endblock %}
