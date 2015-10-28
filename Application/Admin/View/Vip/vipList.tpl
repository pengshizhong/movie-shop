
<include file="./Application/Admin/View/Something/header.tpl"  />

<!-- 编辑表单 -->
<div id="content" class="hidden">
    <form id="form" class="form-horizontal">
        <input type="hidden" name="userId">
        <div class="row">
            <div class="control-group span8">
                <label class="control-label">会员名：</label>
                <div class="controls">
                    <input type="text" name="nikename" class="input-normal control-text" data-rules="{required : true}">
                </div>
            </div>
            <div class="control-group span8">
                <label class="control-label">会员头像：</label>
                <div class="controls">
                    <input type="text" name="headurl" class="input-normal control-text" data-rules="{required : true}">
                </div>
            </div>
            <div class="control-group span8">
                <label class="control-label">email：</label>
                <div class="controls">
                    <input type="text" name="email" class="input-normal control-text" data-rules="{required : true}">
                </div>
            </div>
            <div class="control-group span8">
                <label class="control-label">电话：</label>
                <div class="controls">
                    <input type="text" name="phone" class="input-normal control-text" data-rules="{required : true}">
                </div>
            </div>
        </div>
    </form>
</div>

<div class="container">

    <form id="searchForm" class="form-horizontal">
        <div class="row">
            <div class="control-group span8">
                <label class="control-label">会员编号：</label>
                <div class="controls">
                    <input type="text" class="control-text" name="userId">
                </div>
            </div>
            <div class="control-group span8">
                <label class="control-label">会员名：</label>
                <div class="controls">
                    <input type="text" class="control-text" name="nikename">
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
<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="../assets/js/bui-min.js"></script>
<script type="text/javascript" src="../assets/js/config-min.js"></script>
<script type="text/javascript">
    var host = 'http://192.168.253.1:8080/'


    BUI.use(['common/search','common/page'],function (Search) {
                //弹出表单
                var $form = $('#form');
                //编辑弹出框
                var dialog = new BUI.Overlay.Dialog({
                    title:'配置DOM',
                    width:500,
                    height:320,
                    //配置DOM容器的编号
                    contentId:'content',
                    success:function () {
                        var that = this;
                        $.ajax({
                            type: 'POST',
                            url: host + '/admin/user/submitedit',
                            dataType : 'json',
                            data: $form.serialize(),
                            success: function(data){
                                if(data.success){ //修改成功
                                    that.close();
                                    search.load();

                                }else{ //修改失败
                                    BUI.Message.Alert('修改失败！');
                                }
                            }
                        })
                    }
                })

                var enumObj = {"1":"男","0":"女"},
                        columns = [
                            {title:'会员编号',dataIndex:'userId',width:80},
                            {title:'会员名',dataIndex:'nikename',width:100},
                {title:'会员头像',dataIndex:'headurl',width:200,renderer: function(value, obj){
                      return '<img src="'+ value +'" class="user-head-img" ></img>'
                }},
            {title:'email',dataIndex:'email',width:200},
            {title:'电话',dataIndex:'phone',width:150},
    {title:'操作',dataIndex:'',width:200,renderer : function(value,obj){
      var
        delStr = '<span class="grid-command btn-del" title="删除学生信息">删除</span>',//页面操作不需要使用Search.createLink
        editStr = '<span class="grid-command btn-edit" title="编辑学生信息">编辑</span>';//页面操作不需要使用Search.createLink
      return editStr + delStr;
    }}
    ],
    store = Search.createStore(host + 'admin/user/list'),
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
            ids.push(item.userId);
        });

        if(ids.length){
            BUI.Message.Confirm('确认要删除选中的记录么？',function(){
                $.ajax({
                    type:'POST',
                    url : host + '/admin/user/delete',
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


    function editItem(item) {
        var $input;
        for(key in item) {
            if($input = $form.find('input[name="'+ key +'"]')){
                $input.val(item[key]);
            }
        }
        dialog.show();
    }

    //监听事件，删除一条记录
    grid.on('cellclick',function(ev){
        var sender = $(ev.domTarget); //点击的Dom
        if(sender.hasClass('btn-del')){
            var record = ev.record;
            delItems([record]);
        }
    });

    //监听事件，编辑
    grid.on('cellclick',function(ev){
        var sender = $(ev.domTarget); //点击的Dom
        if(sender.hasClass('btn-edit')){

            var record = ev.record;
            editItem(record);
        }
    });


    });
</script>

<include file="./Application/Admin/View/Something/footer.tpl"  />