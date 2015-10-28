define(['jquery'], function($){
    var init;

    init = function(container, config) {
        this.$container = $(container);
        this.bind(config);
    }

    init.prototype.bind = function(config) {
        var $banner = this.$container.find('.banner-imgs-wrap'),
            $spots = this.$container.find('.banner-spots-wrap>li');

        var t;
        var banner = (function(){
            var time = config && config.time || 4;
            var time_now = 0;
            return  {
                start: function(){
                    t = setTimeout(function(){
                        var nowfn = arguments.callee;
                        $banner.animate({
                            left: '-'+time_now+'00%'
                        }, 1500, 'linear', function(){
                            if(time_now >= time) {
                                time_now = 0;
                                $banner.css('left', '0');
                            }
                            $spots.eq(time_now).addClass('selected').siblings().removeClass('selected');
                            time_now++;
                            t = setTimeout(nowfn, 3000);
                        });

                    }, 0);
                    return this;
                },
                stop: function(){
                    $banner.stop();
                    return this;
                },
                clear: function(){
                    clearTimeout(t);
                    return this;
                },
                turn: function(i){
                    time_now = i;
                    return this;
                }
            }
        })()

        $spots.each(function(i, ele){
            var $this = $(this);
            $this.on('click', function(e){
                $this.addClass('selected').siblings().removeClass('selected');
                banner.stop().clear().turn(i).start();
            })
        })

        banner.start();

    }

    return {
        init: init
    }
})
