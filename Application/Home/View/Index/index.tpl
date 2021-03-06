<include file="./Application/Home/View/Something/header.tpl"  />
<div class="container-fluid">
    <div class="container">
        <div class="banner">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="__PUBLIC__/img/1.jpg" alt="...">
                        <div class="carousel-caption">
                            <h3>路飞大战猪八戒</h3>
                            <p>最史诗战役</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="__PUBLIC__/img/2.jpg" alt="...">
                        <div class="carousel-caption">
                            <h3>路飞大战猪八戒</h3>
                            <p>最史诗战役</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="__PUBLIC__/img/3.jpg" alt="...">
                        <div class="carousel-caption">
                            <h3>路飞大战猪八戒</h3>
                            <p>最史诗战役</p>
                        </div>
                    </div>
                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-xs-8">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#palying" aria-controls="home" role="tab" data-toggle="tab">正在热映</a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="palying">
                    <div class="row">

                        <?php for($i=0;$i<8;$i++){ ?>
                        <div class="col-xs-3">
                            <div class="item text-center">
                                <img src="__PUBLIC__/{$allmovie[$i]['coverurl']}" alt="" />
                                <h4 class="title">{$allmovie[$i]['name']}</h4>
                                <h5>{$allmovie[$i]['remark']}</h5>
                                <div>
                                    <?php $tmp = U('Movie/index',[ 'movie_id' => $allmovie[$i]['movie_id'], ]); ?>
                                    <a href="{$tmp}"><button type="button" class="btn btn-primary btn-sm">影片详情</button></a>
                                </div>
                            </div>
                        </div>
                        <?php } ?>
                    </div>
                </div>

            </div>
        </div>

        <div class="col-xs-4 aside">
            <div class="search">
                <form class="form-inline" action="{$searchurl}" method="post">
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

            <div class="ad">
                <img src="__PUBLIC__/img/4.jpg" alt="" class="">
            </div>

            <!-- 口碑榜 -->
            <div class="rank">
                <div class="page-header">
                    <h4>本周口碑榜 <a href=""><small>更多榜单</small></a></h4>
                </div>
                <ol>
                    <?php for($i=0;$i<8;$i++){
                        $tmp = U('Movie/index',[ 'movie_id' => $allmovie[$i]['movie_id']]);
                    ?>
                    <li><a href="{$tmp}">{$allmovie[$i]['name']}</a></li>

                    <?php } ?>
                </ol>
            </div>
        </div>
    </div>


</div>

<script>
    $(function(){
        $('.carousel').carousel();
    })
</script>
<include file="./Application/Home/View/Something/footer.tpl"  />