<?php
return array(
    //'配置项'=>'配置值'
    /* 数据库设置 */
        'DB_TYPE'               =>  'MYSQL',     // 数据库类型
        'DB_HOST'               =>  'localhost', // 服务器地址
        'DB_NAME'               =>  'movie',          // 数据库名
        'DB_USER'               =>  'root',      // 用户名
        'DB_PWD'                =>  '123456',          // 密码
        'DB_PORT'               =>  '3306',        // 端口
        'DB_PREFIX'             =>  '',    // 数据库表前缀
        'DB_CHARSET'			=>  'utf8',
        'TMPL_TEMPLATE_SUFFIX'  =>  '.tpl',
        'TMPL_L_DELIM'          =>  '{',
        'TMPL_R_DELIM'          =>  '}',
        'TMPL_CACHE_ON'         =>  false,
        'TMPL_CACHE_ON'         =>  false,
        'ACTION_CACHE_ON'       =>  false,  // 默认关闭Action 缓存
        'HTML_CACHE_ON'         =>  false,   // 默认关闭静态缓存
        'STORAGE'               =>  './Public/',
        'BASE_HREF'             =>  'http://localhost/movie-shop/',
        'TPL_PATH'              =>  'Application/Admin/View/',
        'TMPL_CACHE_ON' => false,
        'TMPL_CACHE_ON' => false,
        'DATA_CACHE_PREFIX' => 'Redis_',//缓存前缀
        'DATA_CACHE_TYPE'=>'Redis',//默认动态缓存为Redis
        'REDIS_RW_SEPARATE' => true, //Redis读写分离 true 开启
        'REDIS_HOST'=>'127.0.0.1', //redis服务器ip，多台用逗号隔开；读写分离开启时，第一台负责写，其它[随机]负责读；
        'REDIS_PORT'=>'6379',//端口号
        'REDIS_TIMEOUT'=>'300',//超时时间
        'REDIS_PERSISTENT'=>false,//是否长连接 false=短连接
        'REDIS_AUTH'=>'',//AUTH认证密码
);