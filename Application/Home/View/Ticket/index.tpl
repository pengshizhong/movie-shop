<include file="./Application/Home/View/Something/header.tpl"  />
<div class="container">
    <div class="page-header">
        <h3>北京百老汇电影中心-1号厅
            <small></small>
        </h3>
    </div>
    <div class="row">
        <div class="col-xs-8">
            <div class="panel panel-default">
                <div class="panel-heading text-center">银幕位置</div>
                <div class="panel-body">
                    <table class="table table-bordered seat">
                        <?php for($i=1;$i<15;$i++){ ?>
                     <tr>
                           <?php  for($j=1;$j<15;$j++){         ?>

                            <td data-col="<?php echo $j; ?>" data-row="<?php echo $i; ?>" class="
                            <?php
                                foreach($seat as $ticket){
                                    if($ticket['row']==$i&&$ticket['col']==$j)
                                        echo 'other-selected';
                                }

                            ?>


                            "></td>


                        <?php } ?>
                            </tr>
                        <?php } ?>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-xs-4">
            <div class="panel panel-default">
                <div class="panel-heading">我的订单</div>
                <div class="panel-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">影片</label>
                            <div class="col-sm-9">
                                <p class="form-control-static">{$movieInfo['name']}</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">{$movieInfo['schedule_id']}</label>
                            <div class="col-sm-9">
                                <p class="form-control-static schedule_id" data-schedule_id="{$schedule_id}">{$schedule_id}</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">时间 </label>
                            <div class="col-sm-9">
                                <p class="form-control-static">{$movieInfo['date']}</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">票价</label>
                            <div class="col-sm-9">
                                <p class="form-control-static" ><span class="seat-price" data-price="43">{$movieInfo['price']}</span>元 / 张</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">座位</label>
                            <div class="col-sm-9 seat-info">
                                <p class="form-control-static">尚未选座</p>
                            </div>
                        </div>
                        <hr>
                        <div class="form-group ">
                            <label class="col-sm-offset-1 col-sm-5  text-left">票数：<span class="seats-sum-info">0</span></label>
                            <label class="col-sm-5 text-left">总计：￥<span class="seats-sum-price-info">0</span></label>
                        </div>
                    </form>
                </div>
            </div>

            <button type="button" class="btn btn-success btn-lg btn-block submit-ticket">提交订单</button>
        </div>
    </div>
    <script>
        $(function (){
            var seats = {},
                    $seatsDom = $('.seat-info'),
                    $sumDom = $('.seats-sum-info'),
                    $sumPriceDom = $('.seats-sum-price-info'),
                    schedule_id = parseInt($('.schedule_id').html());
            seatSum = 0,
                    price = parseInt($('.seat-price').data('price'));

            $('.seat').on('click', 'td:not(.other-selected)', function (){
                var $this = $(this), row = $this.data('row'), col = $this.data('col');

                if(!$this.hasClass('selected')){
                    seats['' + row + col] = {
                        col: col,
                        row: row
                    }
                    seatSum++;
                    $this.addClass('selected');
                } else {
                    delete seats['' + row + col];
                    seatSum--;
                    $this.removeClass('selected');
                }
                domUpdate();
            });

            function domUpdate(){
                var str = '';
                for(var key in seats) {
                    str += '<p class="form-control-static">'+ seats[key].row +'行' + seats[key].col + '列</p>'
                }
                $seatsDom.html(str);
                $sumDom.html(seatSum);
                $sumPriceDom.html(seatSum * price);
            }

            $('.submit-ticket').on('click', function(){
                if(seatSum <= 0) {
                    return alert('座位还未选定，不能提交')
                }

                //构造提交数据
                var submitData = {};
                submitData.schedule_id = schedule_id;
                submitData.seats=[];
                for(var key in seats) {
                    submitData.seats.push(seats[key]);
                }

                //提交订单ajax
                $.ajax({
                    type: 'POST',
                    data: submitData,
                    dataType : 'json',
                    url: '{$buy}', //此处填写提交url
                    success: function(data){
                        //var_dump(data);
                        //alert(data);
                        if(data.success==1) {
                            alert('提交订单成功！！正跳转你的主页');
                            location.href= "{$user}"; //填写跳转url
                        }
                        else{
                            alert('提交订单失败！');
                        }
                    }
                })

            });


        })

        function var_dump( objElement, intLimit, intDepth )
        {
            intDepth = intDepth?intDepth:0;
            intLimit = intLimit?intLimit:1;

            strReturn = '<ol>';

            for( property in objElement )
            {
                // Property domConfig isn't accesible
                if( property != 'domConfig' )
                {
                    strReturn += '<li><strong>' + property + '</strong> <small>(' + ( typeof objElement[property] ) + ')</small>';

                    if ( typeof objElement[property] == 'number' || typeof objElement[property] == 'boolean' ) {
                        strReturn += ' : <em>' + objElement[property] + '</em>';
                    }

                    if ( typeof objElement[property] == 'string' && objElement[property] ) {
                        strReturn += ': <div style="background:#C9C9C9; border:1px solid black; overflow:auto;"><code>' +
                                objElement[property].replace(/</g, '<').replace(/>/g, '>') + '</code></div>';
                    }

                    if ( typeof objElement[property] == 'object' && ( intDepth < intLimit ) ) {
                        strReturn += var_dump( objElement[property], intLimit, ( intDepth + 1 ) );
                    }

                    strReturn += '</li>';
                }
            }

            strReturn += '</ol>';

            if ( intDepth == 0 )
            {
                winpop = window.open( "", "", "width=800, height=600, scrollbars, resizable" );
                winpop.document.write( '<pre>' + strReturn + '</pre>' );
                winpop.document.close();
            }

            return strReturn;
        }
    </script>
<include file="./Application/Home/View/Something/footer.tpl"  />