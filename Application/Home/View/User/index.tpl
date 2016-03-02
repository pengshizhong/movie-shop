<include file="./Application/Home/View/Something/header.tpl"  />
<div class="container">
    <div class="page-header">
        <h1 class="text-center">
            <img  class="usericon" src="__PUBLIC__/{$userinfo['headurl']}" alt="..." class="headimg img-thumbnail">
            {$userinfo['nickname']}! <small>我为自己代言</small></h1>
    </div>
    <div class="row">
        <div class="col-xs-8">
            <div class="panel panel-default">
                <div class="panel-heading">历史记录</div>
                <div class="panel-body list-group">
                    <?php foreach($records as $record){ ?>
                    <li class="list-group-item">
                        <div class="row">
                            <div class="col-xs-3">
                                <img class="useritem" src="__PUBLIC__/{$record['coverurl']}" alt="" >
                            </div>
                            <div class="col-xs-8">
                                <h4>{$record['name']} <small>{$record['date']}场次</small></h4>
                                <h5>价格：<strong>￥{$record['price']}</strong>  <small>购于{$record['buy_time']}</small></h5>
                            </div>
                        </div>
                    </li>
                    <?php } ?>
                </div>
                <!--<nav>
                    <ul class="pager">
                        <li><a href="#">上一页</a></li>
                        <li><a href="#">下一页</a></li>
                    </ul>
                </nav>-->
            </div>
        </div>
        <div class="col-xs-4">
            <div class="search">
                <form class="form-inline" action="search.html" method="get">
                    <div class="form-group">
                        <label class="sr-only" for="exampleInputAmount">Amount (in dollars)</label>
                        <div class="input-group">
                            <div class="input-group-addon">影片</div>
                            <input type="text" name="word" class="form-control" id="exampleInputAmount" placeholder="猫王">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">搜索</button>
                </form>
            </div>
            <div class="panel panel-default">

                <div class="panel-heading">我的账户</div>
                <div class="panel-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">手机</label>
                            <div class="col-sm-9">
                                <p class="form-control-static">{$userinfo['phone']}</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">邮箱</label>
                            <div class="col-sm-9">
                                <p class="form-control-static">{$userinfo['email']}</p>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
<include file="./Application/Home/View/Something/footer.tpl"  />