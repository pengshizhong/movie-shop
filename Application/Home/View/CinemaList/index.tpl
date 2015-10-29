<include file="./Application/Home/View/Something/header.tpl"  />

<div class="container">
    <div class="row cinema-list">
        <div class="col-xs-8">
            <div class="page-header">
                <h3>电影院 - 成都
                    <small></small>
                </h3>
            </div>

            <ul class="list-group">
                <?php foreach($result['list'] as $cinema) { ?>
                <li class="list-group-item search-item cinema-item">
                    <h3>大地电影城
                        <span class="label label-default">{$cinema['name']}</span>
                    </h3>
                    <div class="row">
                        <div class="col-xs-4">
                            <img src="__PUBLIC__/{$cinema['coverurl']}" alt="" class="cover">
                        </div>
                        <div class="col-xs-8">
                            <div>
                                <strong>地址：</strong>{$cinema['address']}</div>
                            <div>
                                <strong>电话：</strong>{$cinema['phone']}</div>
                            <div>
                                <strong>类型：</strong>豪华 市区</div>
                            <div>
                                <strong>价格：</strong>25元起</div>
                            <p>
                                <strong>电影院简介：</strong>
                                {$cinema['description']}</p>
                            <div>
                                <a href="{$url}?cinema_id={$cinema['cinema_id']}"><button type="button" class="btn btn-default btn-sm">影院详情</button></a>
                            </div>

                        </div>
                    </div>
                </li>
                <?php } ?>

            </ul>
            <nav>
                <ul class="pager">
                    <li><a href="{$front}">上一页</a></li>
                    <li><a href="{$next}">下一页</a></li>
                </ul>
            </nav>
        </div>
        <div class="col-xs-4 aside">
            <div class="search">
                <form class="form-inline" action="{$searchurl}" method="get">
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
            <!-- 口碑榜 -->
            <div class="rank">
                <div class="page-header">
                    <h4>电影票房榜
                       <!-- <small>7月30日 - 8月7日</small> -->
                    </h4>
                </div>
                <ol>
                    <?php for($i=0;$i<8;$i++){ ?>
                    <li><a href="{$movieurl}?movie_id={$allmovie[$i]['movie_id']}">{$allmovie[$i]['name']}</a></li>

                    <?php } ?>
                </ol>
            </div>

            <div class="ad">
                <img src="__PUBLIC__/img/4.jpg" alt="" class="">
            </div>
        </div>
    </div>

<include file="./Application/Home/View/Something/footer.tpl"  />