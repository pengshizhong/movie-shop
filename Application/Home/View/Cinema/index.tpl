<include file="./Application/Home/View/Something/header.tpl"  />
<div class="container">
    <div class="row">
        <div class="col-xs-8">
            <div class="page-header">
                <h2>{$cinema['name']} <small></small></h2>
            </div>
            <div class="row">
                <div class="col-xs-4">
                    <img class='movieitem' src="__PUBLIC__/{$cinema['coverurl']}" alt="" class="cover img-thumbnail" >
                </div>
                <div class="col-xs-8">
                    <p><strong>地址：</strong>{$cinema['address']}</p>
                    <p><strong>联系电话：</strong>{$cinema['phone']}</p>
                    <p>
                        <strong>影院简介:</strong> <br>
                        {$cinema['description']}
                    </p>
                </div>
            </div>
            <div class="page-header">
                <h4>最近影讯  ·  ·  ·  ·  ·  ·</h4>
                <div class="row movie-list">
                    <?php foreach($allmovie as $movie){ ?>
                    <div class="col-xs-3">
                        <div class="item text-center movieitemup">
                            <img class='movieitem' src="__PUBLIC__/{$movie['coverurl']}" alt="" />
                            <h4 class="title">{$movie['name']}</h4>
                            <h5>{$movie['remark']}</h5>
                            <div>
                                <a href="movie.html"><button type="button" class="btn btn-primary btn-sm">查看详情</button></a>
                            </div>
                        </div>
                    </div>
                    <?php } ?>
                </div>
            </div>
            <p>

            </p>



        </div>
        <div class="col-xs-4 aside">
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
            <!-- 口碑榜 -->
            <div class="rank">
                <div class="page-header">
                    <h4>电影票房榜 <small>7月30日 - 8月7日</small></h4>
                </div>
                <ol>
                    <?php for($i=0;$i<8;$i++){ ?>
                    <li><a href="">{$allmovie[$i]['name']}</a></li>
                    <?php } ?>
                </ol>
            </div>

            <div class="ad">
                <img class='movieitem' src="__PUBLIC__/img/4.jpg" alt="" class="">
            </div>
        </div>
    </div>
<include file="./Application/Home/View/Something/footer.tpl"  />