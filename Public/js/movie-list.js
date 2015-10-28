require.config({
    baseUrl: 'js',
    paths: {
        banner: 'banner',
        jquery: 'lib/jquery',
        bootstrap: 'lib/bootstrap'
    },
    shim: {
        'bootstrap': {
            deps: ['jquery'],
            exports: 'Bootstrap'
        },
        'banner': {
            deps: ['jquery'],
            exports: 'Banner'
        }
    }
})

require(['bootstrap'], function(){
   // new Banner.init('.banner-inner');
})
