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
                                <p class="form-control-static">破风</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">场次号</label>
                            <div class="col-sm-9">
                                <p class="form-control-static scheduleId" data-scheduleId="3434434">3434434</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">时间 </label>
                            <div class="col-sm-9">
                                <p class="form-control-static">08月07日 周五 16:50</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">票价</label>
                            <div class="col-sm-9">
                                <p class="form-control-static" ><span class="seat-price" data-price="43">43</span>元 / 张</p>
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
                    scheduleId = parseInt($('.scheduleId').html());
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
                submitData.scheduleId = scheduleId;
                submitData.seats=[];
                for(var key in seats) {
                    submitData.seats.push(seats[key]);
                }

                //提交订单ajax
                $.ajax({
                    type: 'POST',
                    data: submitData,
                    url: '/', //此处填写提交url
                    success: function(data){
                        if(data.success) {
                            alert('提交订单成功！！正跳转你的主页');
                            location.href= "/home/user.jsp"; //填写跳转url
                        }
                    }
                })

            });


        })
    </script>
<include file="./Application/Home/View/Something/footer.tpl"  />