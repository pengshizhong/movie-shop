
<include file="./Application/Admin/View/Something/header.tpl"  />
<!-- 编辑表单 -->
<div id="editDialog" class="hidden">
    <form id="editForm" class="form-horizontal">
        <input type="hidden" name="movieId">
        <div class="row">
            <div class="control-group span8">
                <label class="control-label">影片名字：</label>
                <div class="controls">
                    <input type="text" name="name" class="input-normal control-text" data-rules="{required : true}">
                </div>
            </div>
            <div class="control-group span8">
                <label class="control-label">导演：</label>
                <div class="controls">
                    <input type="text" name="director" class="input-normal control-text" data-rules="{required : true}">
                </div>
            </div>
            <div class="control-group span8">
                <label class="control-label">封面图片：</label>
                <div class="controls">
                    <input type="text" name="coverurl" class="input-normal control-text" data-rules="{required : true}">
                </div>
            </div>
            <div class="control-group span8">
                <label class="control-label">类型：</label>
                <div class="controls" >
                    <select  id="" name="type">
                        <option value="3D">3D</option>
                        <option value="2D">2D</option>
                    </select>
                </div>

            </div>
        </div>
    </form>
</div>
<!-- 编辑表单 end -->
<!-- 新建表单 -->
<div id="addDialog" class="hidden">
    <form id="addForm" class="form-horizontal">
        <div class="row">
            <div class="control-group span8">
                <label class="control-label">影片名字：</label>
                <div class="controls">
                    <input type="text" name="name" class="input-normal control-text" data-rules="{required : true}">
                </div>
            </div>
            <div class="control-group span8">
                <label class="control-label">导演：</label>
                <div class="controls">
                    <input type="text" name="director" class="input-normal control-text" data-rules="{required : true}">
                </div>
            </div>
            <div class="control-group span8">
                <label class="control-label">封面图片：</label>
                <div class="controls">
                    <input type="text" name="coverurl" class="input-normal control-text" data-rules="{required : true}">
                </div>
            </div>
            <div class="control-group span8">
                <label class="control-label">类型：</label>
                <div class="controls" >
                    <select  id="" name="type">
                        <option value="3D">3D</option>
                        <option value="2D">2D</option>
                    </select>
                </div>
            </div>

        </div>
    </form>
</div>
<!-- 新建表单 end -->

<div class="container">

    <form id="searchForm" class="form-horizontal">
        <div class="row">
            <div class="control-group span8">
                <label class="control-label">影片编号：</label>
                <div class="controls">
                    <input type="text" class="control-text" name="movieId">
                </div>
            </div>
            <div class="control-group span8">
                <label class="control-label">影片名：</label>
                <div class="controls">
                    <input type="text" class="control-text" name="name">
                </div>
            </div>
            <div class="control-group span8">
                <label class="control-label">类型：</label>
                <div class="controls" >
                    <select  id="" name="">
                        <option value="3D">3D</option>
                        <option value="2D">2D</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="control-group span9">
                <label class="control-label">上映时间：</label>
                <div class="controls">
                    <input type="text" class="calendar" name="showtime"><span> - </span><input name="endtime" type="text" class=" calendar">
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
    BUI.use(['common/search','common/page'],function (Search) {
                var host = 'http://192.168.253.1:8080/';
                //弹出表单
                var $editForm = $('#editForm');
                //编辑弹出框
                var editDialog = new BUI.Overlay.Dialog({
                    title:'编辑影片',
                    width:500,
                    height:320,
                    //配置DOM容器的编号
                    contentId:'editDialog',
                    success:function () {
                        var that = this;
                        $.ajax({
                            type: 'POST',
                            url: host + '/admin/movie/submitedit',
                            dataType : 'json',
                            data: $editForm.serialize(),
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
                });
                //新建表单
                var $addForm = $('#addForm');
                //编辑弹出框
                var addDialog = new BUI.Overlay.Dialog({
                    title:'新建影片',
                    width:500,
                    height:320,
                    //配置DOM容器的编号
                    contentId:'addDialog',
                    success:function () {
                        var that = this;
                        $.ajax({
                            type: 'POST',
                            url: host + '/admin/movie/add',
                            dataType : 'json',
                            data: $addForm.serialize(),
                            success: function(data){
                                if(data.success){ //添加成功
                                    that.close();
                                    search.load();

                                }else{ //添加失败
                                    BUI.Message.Alert('添加失败！');
                                }
                            }
                        })
                    }
                });
                var enumObj = {"1":"男","0":"女"},
                        columns = [
                            {title:'影片编号',dataIndex:'movieId',width:80},
                            {title:'影片名字',dataIndex:'name',width:100},
                            {title:'导演',dataIndex:'director',width:70},
                {title:'封面图片',dataIndex:'coverurl',width:300,renderer: function(value, obj){
                      return '<img src="'+ value +'" class="user-head-img" ></img>'
                }},
            {title:'类型',dataIndex:'type',width:60 },
            {title:'上映日期',dataIndex:'showtime',width:100, renderer: BUI.Grid.Format.dateRenderer},
            {title:'评分',dataIndex:'remark',width:100},
    {title:'操作',dataIndex:'',width:200,renderer : function(value,obj){
        var editStr = '<span class="grid-command btn-edit" title="编辑学生信息">编辑</span>';
        var delStr = '<span class="grid-command btn-del" title="删除学生信息">删除</span>';
        return editStr + delStr;
    }}
    ],
    store = Search.createStore(host + '/admin/movie/list'),
            gridCfg = Search.createGridCfg(columns,{
                tbar : {
                    items : [
                        {text : '<i class="icon-plus"></i>新建',btnCls : 'button button-small',handler:function(){addDialog.show()}},
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
            ids.push(item.movieId);
        });

        if(ids.length){
            BUI.Message.Confirm('确认要删除选中的记录么？',function(){
                $.ajax({
                    url : host + '/admin/movie/delete',
                    type : 'POST',
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
            if($input = $editForm.find('input[name="'+ key +'"]')){
                $input.val(item[key]);
            }
        }
        editDialog.show();
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