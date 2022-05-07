Skip to content
Search or jump to…
Pull requests
Issues
Marketplace
Explore
 
@wsbb741 
blinkfox
/
hexo-theme-matery
Public
Code
Issues
199
Pull requests
3
Actions
Projects
Wiki
Security
Insights
单独的音乐页面和单独的视频页面
 develop (#775)
@appotry
appotry committed on 13 Mar 
1 parent b105d61 commit 0d9cb682c8e01a9b7fc49864ce1761c6789e6518
Showing  with 227 additions and 0 deletions.
  20  
_config.yml
@@ -97,6 +97,26 @@ music:
  listFolded: true  # 列表默认折叠
  hideLrc: true     # 隐藏歌词

# Whether to display the musics.
# 单独的音乐页面.
musics:
  enable: false
  title:          #非吸底模式有效
    enable: true
    show: 听听音乐
  server: tencent   #require music platform: netease, tencent, kugou, xiami, baidu
  type: playlist    #require song, playlist, album, search, artist
  id: 1776127550     #require song id / playlist id / album id / search keyword
  fixed: false      # 开启吸底模式
  autoplay: true   # 是否自动播放
  theme: '#42b983'
  loop: 'all'       # 音频循环播放, 可选值: 'all', 'one', 'none'
  order: 'random'   # 音频循环顺序, 可选值: 'list', 'random'
  preload: 'auto'   # 预加载，可选值: 'none', 'metadata', 'auto'
  volume: 0.7       # 默认音量，请注意播放器会记忆用户设置，用户手动设置音量后默认音量即失效
  listFolded: false  # 列表默认折叠
  listMaxHeight: "525px" #列表最大高度

# Whether to display the videos.
# 是否在首页显示视频.
video:
 58  
layout/_widget/musics.ejs
@@ -0,0 +1,58 @@
<link rel="stylesheet" href="<%- theme.libs.css.aplayer %>">
<style>
    .aplayer .aplayer-lrc p {
        <%if(theme.musics.hideLrc){%>
        display: none;
        <%}%>
        font-size: 12px;
        font-weight: 700;
        line-height: 16px !important;
    }
    .aplayer .aplayer-lrc p.aplayer-lrc-current {
        <%if(theme.musics.hideLrc){%>
        display: none;
        <%}%>
        font-size: 15px;
        color: <%- theme.musics.theme %>;
    }
    <%if(theme.musics.autoHide){%>
    .aplayer.aplayer-fixed.aplayer-narrow .aplayer-body {
        left: -66px !important;
    }
    .aplayer.aplayer-fixed.aplayer-narrow .aplayer-body:hover {
        left: 0px !important;
    }
    <%}%>
</style>
<div class="<% if(!theme.musics.fixed) { %>music-player<% } %>">
    <% if (!theme.musics.fixed && theme.musics.title.enable) { %>
        <div class="title center-align">
            <i class="fa fa-music"></i>&nbsp;&nbsp;<%- theme.musics.title.show %>
        </div>
    <% } %>
    <div class="row">
        <meting-js class="col l8 offset-l2 m10 offset-m1 s12"
                   server="<%- theme.musics.server %>"
                   type="<%- theme.musics.type %>"
                   id="<%- theme.musics.id %>"
                   fixed='<%- theme.musics.fixed ? 'true' : 'false' %>'
                   autoplay='<%- theme.musics.autoplay === true %>'
                   theme='<%- theme.musics.theme %>'
                   loop='<%- theme.musics.loop %>'
                   order='<%- theme.musics.order %>'
                   preload='<%- theme.musics.preload %>'
                   volume='<%- Number(theme.musics.volume) %>'
                   listMaxHeight='<%- theme.musics.listMaxHeight %>'
                   list-folded='<%- theme.musics.listFolded ? 'true' : 'false' %>'
        >
        </meting-js>
    </div>
</div>


<script src="<%- theme.libs.js.aplayer %>"></script>
<script src="https://cdn.jsdelivr.net/npm/meting@2/dist/Meting.min.js"></script>
 72  
layout/movies.ejs
@@ -0,0 +1,72 @@
<%- partial('_partial/bg-cover') %>
<!-- 视频页面 -->

<style>
@media only screen and (max-width: 601px) {
    .movies-w {
        width: 90%;
        margin: 0 auto;
    }
    .movies-h {
        height: 90%;
        padding-top: 5%;
        padding-bottom: 5%;
    }
}
/*中等屏幕下(平板类)的样式*/
@media only screen and (min-width: 600px) and (max-width: 992px) {
    .movies-w {
        width: 95%;
        margin: 0 auto;
    }
    .movies-h {
        height: 95%;
        padding-top: 5%;
        padding-bottom: 5%;
    }
}
@media only screen and (min-width: 993px) {
    .movies-w {
        width: 80%;
        margin: 0 auto;
    }
    .movies-h {
        height: 80%;
        padding-top: 5%;
        padding-bottom: 5%;
    }
}
</style>

<main class="content">
<div id="category-cloud" class="container chip-container">
    <div class="card">
        <div class="card-content">
			<div>
				<h1 style="text-align:center;">
					📺
					<span style="color:red;">励</span> 
					<span style="color:yellow;">志</span> 
					<span style="color:blue;">短</span>
					<span style="color:green;">片</span>
				</h1>
			<div>
				<div  class="movies-w" style="position: relative; padding-bottom: 75%;">
				    <iframe class="movies-h" style=" 
				    position: absolute; 
				        width: 100%;
					    left: 0; 
					    top: 0;" 
					    src="//player.bilibili.com/player.html?aid=2979186&cid=4667585&page=1" scrolling="no" border="0" 
					    frameborder="no" 
					    framespacing="0" 
					    allowfullscreen="true"> 
				    </iframe> 

				</div>
			</div>
		</div>
    </div>
</div>
</main> 
 77  
layout/musics.ejs
@@ -0,0 +1,77 @@
<style type="text/css">
    /* don't remove. */
    .about-cover {
        height: 75vh;
    }
</style>

<%- partial('_partial/bg-cover') %>

<main class="content">
    <div id="aboutme" class="container about-container">
        <div class="card">
            <div class="card-content">
                <div class="music-player">
                    <% if (theme.musics && theme.musics.enable) { %>
                        <%- partial('_widget/musics') %>
                        <style>
                        .bubbles > .particle {
                            /*初始透明度为0*/
                            opacity: 0;
                            position: absolute;
                            /*初始颜色为荧光色，透明度为0.7*/
                            background-color: rgba(128,255,0,0.7);
                            /*使用bubbles动画，持续时间18秒，缓慢进入，无限循环*/
                            animation: bubbles 18s ease-in infinite;
                            border-radius: 100%;
                        }
                        /*css keyframes 动画*/
                        @keyframes bubbles {
                            0% {
                                opacity: 0;
                            }
                            5% {
                                opacity: 1;
                                transform: translate(0, -20%);
                            }
                            /*这里-8000%表示是气泡的8000%*/
                            100% {
                                opacity: 0;
                                transform: translate(0, -8000%);
                            }
                        }
                        </style>
                        <!-- 这里让元素宽度100%（和页面等宽） -->
                        <div style="width: 100%; height: 100%; position: relative; bottom: 0px;" class="particletext bubbles">
                        </div>
                        <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
                        <script>
                          function bubbles() {
                             $.each($(".particletext.bubbles"), function(){
                                var bubblecount = ($(this).width()/50)*10;
                                for(var i = 0; i <= bubblecount; i++) {
                                   var size = ($.rnd(40,80)/10);
                                   //这里的animation-delay很重要，关系到你的特效是否看上去是连续无断层的，上一步中css是18秒，所以这一步中延迟时间就设置成$.rnd(0,180)/10)
                                   $(this).append('<span class="particle" style="top:' + $.rnd(20,80) + '%; left:' + $.rnd(0,95) + '%;width:' + size + 'px; height:' + size + 'px;animation-delay: ' + ($.rnd(0,180)/10) + 's;"></span>');
                                }
                             });
                          }
                          jQuery.rnd = function(m,n) {
                              m = parseInt(m);
                              n = parseInt(n);
                              return Math.floor( Math.random() * (n - m + 1) ) + m;
                          }
                          bubbles();
                        </script>
                        
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</main> 
0 comments on commit 0d9cb68
@wsbb741
 
 
Leave a comment
未选择文件
Attach files by dragging & dropping, selecting or pasting them.
 You’re not receiving notifications from this thread.
© 2022 GitHub, Inc.
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
Loading complete
