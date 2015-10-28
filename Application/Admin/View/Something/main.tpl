<!DOCTYPE HTML>
<html>
<head>
    <title>紫荆电影网</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="__PUBLIC__/assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="__PUBLIC__/assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="__PUBLIC__/assets/css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="header">
    <div class="dl-title">
        <a href="http://www.builive.com" title="文档库地址" target="_blank"><!-- 仅仅为了提供文档的快速入口，项目中请删除链接 -->
            <span class="lp-title-port"></span><span class="dl-title-text">紫荆电影网后台管理系统</span>
        </a>
    </div>
    <div class="dl-log">欢迎您，<span class="dl-log-user">管理员</span><a href="###" title="退出系统" class="dl-log-quit">[退出]</a><a href="http://http://www.builive.com/" title="文档库" class="dl-log-quit">文档库</a>
    </div>
</div>
<div class="content">
    <div class="dl-main-nav">
        <div class="dl-inform"><div class="dl-inform-title">贴心小秘书<s class="dl-inform-icon dl-up"></s></div></div>
        <ul id="J_Nav"  class="nav-list ks-clear">
            <li class="nav-item dl-selected"><div class="nav-item-inner nav-marketing">交易统计</div></li>
            <li class="nav-item"><div class="nav-item-inner nav-order">电影管理</div></li>
            <li class="nav-item"><div class="nav-item-inner nav-inventory">影城管理</div></li>
            <li class="nav-item"><div class="nav-item-inner nav-supplier">会员管理</div></li>

        </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">

    </ul>
</div>
<script type="text/javascript" src="__PUBLIC__/assets/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="__PUBLIC__//assets/js/bui.js"></script>
<script type="text/javascript" src="__PUBLIC__//assets/js/config.js"></script>

<script>
    BUI.use('common/main',function(){
        var config = [{
            id : 'trade',
            menu : [{
                text : '交易信息',
                items:[
                    {id:'tradeLine',text:'统计图',href:'trade/tradeLine.html'},
                    {id:'tradeLine',text:'账单列表',href:'trade/trade.html'}
                ]
            }]
        },{
            id:'movie',
            menu:[{
                text:'影片管理',
                items:[
                    {id:'movie',text:'影片列表',href:'movie/movieList.html'},
                ]
            },{
                text:'评论管理',
                items:[
                    {id:'discuss',text:'评论列表',href:'movie/discussList.html'},

                ]
            }]
        },{
            id:'cinema',
            menu:[{
                text:'影城管理',
                items:[
                    {id:'cinema',text:'影城列表',href:'cinema/cinemaList.html'}
                ]
            }]
        },{
            id:'vip',
            menu:[{
                text:'会员管理',
                items:[
                    {id:'vip',text:'会员列表',href:'vip/vipList.html'}
                ]
            }]
        }];
        new PageUtil.MainPage({
            modulesConfig : config
        });
    });
</script>
</body>
</html>
