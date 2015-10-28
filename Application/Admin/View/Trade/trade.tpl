
<include file="./Application/Admin/View/Something/header.tpl"  />
<div class="container">

    <form id="searchForm" class="form-horizontal">
        <div class="row">
            <div class="control-group span8">
                <label class="control-label">账单编号：</label>
                <div class="controls">
                    <input type="text" class="control-text" name="accountId">
                </div>
            </div>
            <div class="control-group span8">
                <label class="control-label">会员编号：</label>
                <div class="controls">
                    <input type="text" class="control-text" name="userId">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="control-group span9">
                <label class="control-label">购买时间：</label>
                <div class="controls">
                    <input type="text" class=" calendar" name="startDate"><span> - </span><input name="endDate" type="text" class=" calendar">
                </div>
            </div>
            <div class="span3 offset2">
                <button  type="button" id="btnSearch" class="button button-primary">搜索</button>
            </div>
        </div>
    </form>

    <div class="search-grid-container">
        <div id="grid"></div>
    </div>
</div>
<script type="text/javascript">
    BUI.use(['common/search','common/page'],function (Search) {
        var host = 'http://192.168.253.1:8080/';

        var enumObj = {"1":"男","0":"女"},
                columns = [
                    {title:'账单编号',dataIndex:'accountId',width:80},
                    {title:'下单时间',dataIndex:'buyTime',width:100, renderer: BUI.Grid.Format.dateRenderer},
        {title:'座位号',dataIndex:'num',width:100, renderer: function(value, obj){
            return obj.col + '行' + obj.cow + '列';
        }},
    {title:'会员编号',dataIndex:'userId',width:100, renderer: function(value, obj){
        return obj.user.userId;
    }},
    {title:'会员昵称',dataIndex:'nikename',width:100, renderer: function(value, obj){
        return obj.user.nikename;
    }},
    {title:'排期编号',dataIndex:'schedule',width:100,renderer: function(value, obj){
        return obj.schedule.scheduleId;
    }},
    {title:'操作',dataIndex:'',width:200,renderer : function(value,obj){
      var delStr = '<span class="grid-command btn-del" title="删除学生信息">删除</span>';//页面操作不需要使用Search.createLink
      return delStr;
    }}
    ],
    store = Search.createStore(host + '/admin/account/list'),
            gridCfg = Search.createGridCfg(columns,{
                tbar : {
                    items : [
                        {text : '<i class="icon-remove"></i>删除',btnCls : 'button button-small',handler : delFunction}
                    ]
                },
                plugins : [BUI.Grid.Plugins.CheckSelection] // 插件形式引入多选表格
            });

    var  search = new Search({
                store : store,
                gridCfg : gridCfg
            }),
            grid = search.get('grid');
    //删除操作
    function delFunction(){
        var selections = grid.getSelection();
        delItems(selections);
    }

    function delItems(items){
        var ids = [];
        BUI.each(items,function(item){
            ids.push(item.accountId);
        });

        if(ids.length){
            BUI.Message.Confirm('确认要删除选中的记录么？',function(){
                $.ajax({
                    url : host + '/admin/account/delete',
                    dataType : 'json',
                    data : {ids : ids},
                    success : function(data){
                        if(data.success){ //删除成功
                            search.load();
                        }else{ //删除失败
                            BUI.Message.Alert('删除失败！');
                        }
                    }
                });
            },'question');
        }
    }

    //监听事件，删除一条记录
    grid.on('cellclick',function(ev){
        var sender = $(ev.domTarget); //点击的Dom
        if(sender.hasClass('btn-del')){
            var record = ev.record;
            delItems([record]);
        }
    });
    });
</script>

<body>
</html>
