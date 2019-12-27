{% extends '_layout.swig' %}
{% import '_macro/sidebar.swig' as sidebar_template with context %}

  {% block title %}
    {%- set page_title_suffix = ' | ' + title %}

    {%- if page.type === 'categories' and not page.title %}
      {{- __('title.category') + page_title_suffix }}
    {%- elif page.type === 'tags' and not page.title %}
      {{- __('title.tag') + page_title_suffix }}
    {%- elif page.type === 'schedule' and not page.title %}
      {{- __('title.schedule') + page_title_suffix }}
    <!-- 友情链接-->
	{% elif page.type === 'links' and not page.title %}
  		{{ __('title.links') + page_title_suffix }}
    {%- else %}
      {{- page.title + page_title_suffix }}
    {%- endif %}
  {% endblock %}

{% block content %}

  <div class="posts-expand">
    {##################}
    {### PAGE BLOCK ###}
    {##################}
    <div class="post-block" lang="{{ page.lang or page.language or config.language }}">
      {% include '_partials/page/page-header.swig' %}
      {#################}
      {### PAGE BODY ###}
      {#################}
      <div class="post-body{%- if page.direction and page.direction.toLowerCase() === 'rtl' %} rtl{%- endif %}">
        {# tagcloud page support #}
        {%- if page.type === 'tags' %}
          <div class="tag-cloud">
            <div class="tag-cloud-title">
              {{ _p('counter.tag_cloud', site.tags.length) }}
            </div>
            <div class="tag-cloud-tags">
              {{ tagcloud({min_font: theme.tagcloud.min, max_font: theme.tagcloud.max, amount: theme.tagcloud.amount, color: true, start_color: theme.tagcloud.start, end_color: theme.tagcloud.end}) }}
            </div>
          </div>
          {% if site.tags.length > 1 %}
            <script type="text/javascript" charset="utf-8" src="/js/tagcloud.js"></script>
            <script type="text/javascript" charset="utf-8" src="/js/tagcanvas.js"></script>
            <div class="widget-wrap">
              <div id="myCanvasContainer" class="widget tagcloud">
                <center>
                  <canvas width="500" height="500" id="resCanvas" style="width=100%">
                    {{ list_tags() }}
                  </canvas>
                </center>
              </div>
            </div>
          {% endif %}
          
        {% elif page.type === 'categories' %}
          <div class="category-all-page">
            <div class="category-all-title">
              {{ _p('counter.categories', site.categories.length) }}
            </div>
            <div class="category-all">
              {{ list_categories() }}
            </div>
          </div>
        {% elif page.type === 'schedule' %}
          <div class="event-list">
          </div>
          {% include '_scripts/pages/schedule.swig' %}
        <!-- 友情链接-->
        {% elif page.type === 'links' %}
    	  {% include 'links.swig' %}
        {% else %}
          {{ page.content }}
        {%- endif %}
      </div>
      {#####################}
      {### END PAGE BODY ###}
      {#####################}
    </div>
    {% include '_partials/page/breadcrumb.swig' %}
    {######################}
    {### END PAGE BLOCK ###}
    {######################}
  </div>

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(true) }}
{% endblock %}
