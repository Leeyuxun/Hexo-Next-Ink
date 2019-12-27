<div class="post-copyright">
     <script src="//cdn.bootcss.com/clipboard.js/1.5.10/clipboard.min.js"></script>
     <p><span>本文标题: </span><a href="{{ url_for(page.path) }}">{{ page.title }}</a></p>
     <p><span>文章作者: </span><a href="/" title="访问 {{ theme.author }} 的个人博客">{{ theme.author }}</a></p>
     <p><span>发布时间: </span>{{ page.date.format("YYYY年MM月DD日 - HH:mm") }}</p>
     <p><span>最后更新: </span>{{ page.updated.format("YYYY年MM月DD日 - HH:mm") }}</p>
     <p><span>原始链接: </span><a href="{{ url_for(page.path) }}" title="{{ page.title }}">{{ next_url(page.permalink, page.permalink, {title: page.title}) }}</a></p>
     <p><span>许可协议: </span>本博客所有文章除特别声明外，均采用<a rel="license" href="https://creativecommons.org/licenses/by-nc-nd/4.0/" target="_blank" title="Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)"> <i class="fa fa-creative-commons"></i>BY-NC-SA </a>许可协议，转载请注明出处！</p>
</div>
