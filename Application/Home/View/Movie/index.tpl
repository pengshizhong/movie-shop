<include file="./Application/Home/View/Something/header.tpl"  />
<div class="modal fade bs-example-modal-lg select-ticket" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">《抓妖记》选座购票</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-xs-3 movie">
                        <div class="panel panel-default">
                            <div class="panel-heading text-center">影片</div>
                            <div class="panel-body">
                                <img src="img/1.jpg" alt="" class="cover" />
                                <p>118分钟 暂无评分</p>
                                <p>喜剧/奇幻/古装 中国大陆</p>
                                <p>导演：许诚毅</p>
                                <p>导演：许诚毅</p>
                                <p>主演：白百何/井柏然/姜武</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-5 cinema">
                        <div class="panel panel-default">
                            <div class="panel-heading text-center">选择影院</div>
                            <div class="panel-body">
                                <ul class="list-group">
                                    <?php foreach($allSchedule as $schedule){ ?>
                                    <a href="{$ticketUrl}?schedule_id={$schedule['schedule_id']}"><li class="list-group-item">
                                        <div class="up">{$schedule['name']} <small>可购票</small> <small>{$schedule['price']}元起</small></div>
                                        <div class="down">{$schedule['address']}</div>
                                    </li></a>
                                    <?php } ?>
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary">确定</button>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-xs-8">
            <div class="page-header">
                <h2>{$movie['name']}</h2>
            </div>
            <div class="row">
                <div class="col-xs-4">
                    <img src="__PUBLIC__/{$movie['coverurl']}" alt="" class="cover img-thumbnail" >
                </div>
                <div class="col-xs-8">
                    <div><strong>导演：</strong>{$movie['name']}</div>
                    <div><strong>主演：</strong>{$movie['director']}</div>
                    <div><strong>类型：</strong>{$movie['type']}</div>
                    <div><strong>片长：</strong>90分钟</div>
                    <div><strong>上映时间：</strong>{$movie['showtime']}</div>
                    <div><strong>语言: </strong>{$movie['area']}</div>
                    <p>
                    <div>
                        <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">选座购票</button>
                    </div>

                </div>
            </div>
            <div class="page-header">
                <h4>{$movie['name']}的剧情简介  ·  ·  ·  ·  ·  ·</h4>
            </div>
            <p>
                {$movie['description']}
            </p>
            <div class="page-header">
                <h4>{$movie['name']}的影评  ·  ·  ·  ·  ·  ·</h4>
            </div>
            <ul class="list-group comment">


                <?php foreach($allComments as $comment){ ?>
                <li class="list-group-item">
                    <div class="title"></div>
                    <div class="author"><strong>{$comment['nikename']}</strong> {$comment['adddate']}</div>
                    <p>
                        {$comment['content']}
                    </p>
                </li>
                <?php } ?>
            </ul>
            <div class="page-header">
                <h4>你的评论·</h4>
                <textarea class="form-control" rows="3"></textarea>
                <div class="your-comment">
                    <button type="button" class="btn btn-primary btn-sm">评论</button>
                </div>

            </div>




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