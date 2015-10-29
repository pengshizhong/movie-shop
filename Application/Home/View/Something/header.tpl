<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <base href="<?php echo C('BASE_HREF') ?>">
    <title>紫荆电影网</title>
    <link rel="stylesheet" href="__PUBLIC__/css/lib/bootstrap.css">
    <link rel="stylesheet" href="__PUBLIC__/css/index.css" media="screen" title="no title" charset="utf-8"> </head>
    <script src="__PUBLIC__/js/lib/jquery.min.js"></script>
    <script src="__PUBLIC__/js/lib/bootstrap.js"></script>
<body>
<nav class="navbar navbar-default header">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button> <a class="navbar-brand" href="#">紫荆电影网</a> </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="index.php/Home/Index.html">首页<span class="sr-only">(current)</span></a></li>
                <li><a href="index.php/Home/MovieList.html">看电影</a></li>
                <li><a href="index.php/Home/CinemaList.html">电影院</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">我在：成都 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">广州</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">香港</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">北京</a></li>
                    </ul>
                </li>
                <li><a href="index.php/Home/Sign.html">登陆</a></li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>