<include file="./Application/Home/View/Something/header.tpl"  />
<div class="container">

    <div class="row search-list">
        <div class="col-xs-8">
            <div class="page-header">
                <h3>全站搜索结果 <small>共找到<?php echo count($result); ?>条符合搜索条件</small></h3>
            </div>
            <ul class="list-group">

                <?php foreach($result as $movie){ ?>
                <li class="list-group-item search-item">
                    <h3>{$movie['name']}<span class="label label-default">电影</span></h3>
                    <div class="row">
                        <div class="col-xs-4">
                            <img src="__PUBLIC__/{$movie['coverurl']}" alt="" class="cover">
                        </div>
                        <div class="col-xs-8">
                            <div><strong>导演：</strong>{$movie['director']}</div>
                            <div><strong>主演：</strong>{$movie['actor']}</div>
                            <div><strong>类型：</strong>奇幻 喜剧</div>
                            <div><strong>片长：</strong>90分钟</div>
                            <div><strong>上映时间：</strong>{$movie['showtime']}</div>
                            <p><strong>剧情简介：</strong>
                                {$movie['description']}
                            </p>
                            <div>
                                <button type="button" class="btn btn-primary btn-sm">选座购票</button>
                            </div>

                        </div>
                    </div>
                </li>
                <?php }?>
            </ul>
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
                    <h4>电影票房榜 <small>7月30日 - 8月7日</small></h4>
                </div>
                <ol>
                    <?php for($i=0;$i<8;$i++){ ?>
                    <?php $tmp = U('Movie/index',[ 'movie_id' => $allmovie[$i]['movie_id']]); ?>
                    <li><a href="{$tmp}">{$allmovie[$i]['name']}</a></li>

                    <?php } ?>
                </ol>
            </div>

            <div class="ad">
                <img src="__PUBLIC__/img/4.jpg" alt="" class="">
            </div>
        </div>
    </div>

<include file="./Application/Home/View/Something/footer.tpl"  />