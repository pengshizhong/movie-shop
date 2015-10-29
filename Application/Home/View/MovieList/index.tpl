<include file="./Application/Home/View/Something/header.tpl"  />
<div class="container">
    <div class="row">
        <div class="col-xs-8">
            <div class="page-header">
                <h3>电影票 - 成都
                    <!-- <small><a href="">[切换城市]</a></small> -->
                </h3>
            </div>
            <div class="header-ad">
                <img src="__PUBLIC__/img/6.jpg" alt="">
            </div>
            <div class="page-header">
                <h4>正在热映</h5>
            </div>
            <div class="row palying">
                <?php foreach($movie as $mv){ ?>
                <div class="col-xs-3">
                    <div class="item text-center movieitemup">
                        <img class='movieitem' src="__PUBLIC__/img/{$mv['coverurl']}" alt="" />
                        <h4 class="title">{$mv['name']}</h4>
                        <h5>{$mv['remark']}</h5>
                        <div>
                            <a href="movie.html"><button type="button" class="btn btn-primary btn-sm">影片详情</button></a>
                        </div>
                    </div>
                </div>
                <?php } ?>
            </div>

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
                    <h4>电影票房榜
                        <small>7月30日 - 8月7日</small>
                    </h4>
                </div>
                <ol>
                    <?php for($i=0;$i<8;$i++){ ?>
                    <li><a href="">{$movie[$i]['name']}</a></li>
                    <?php } ?>
                </ol>
            </div>

            <div class="ad">
                <img class='movieitem' src="__PUBLIC__/img/4.jpg" alt="" class="">
            </div>
        </div>
    </div>

    <include file="./Application/Home/View/Something/footer.tpl"  />