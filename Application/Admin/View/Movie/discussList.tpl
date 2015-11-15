
<include file="./Application/Admin/View/Something/header.tpl"  />
<div class="container">

    <form id="searchForm" class="form-horizontal">
        <div class="row">
            <div class="control-group span8">
                <label class="control-label">评论编号：</label>
                <div class="controls">
                    <input type="text" class="control-text" name="comment_id">
                </div>
            </div>
            <div class="control-group span8">
                <label class="control-label">评论人编号：</label>
                <div class="controls">
                    <input type="text" class="control-text" name="user_id">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="control-group span9">
                <label class="control-label">评论时间：</label>
                <div class="controls">
                    <input type="text" class=" calendar" name="startDate"><span> - </span><input name="endDate" type="text" class=" calendar">
                </div>
            </div>
            <div class="span3 offset2">
                <button  type="submit" id="btnSearch" class="button button-primary">搜索</button>
            </div>
        </div>
    </form>

    <div class="search-grid-container">
        <div id="grid"></div>
    </div>
</div>
<script type="text/javascript">
   var Grid = BUI.Grid,
            Store = BUI.Data.Store,
            columns = [
                { title: '评论编号',width: 100,  sortable: false, dataIndex: 'comment_id'},
                { title: '评论内容', width: 100, sortable: true, dataIndex: 'content', selectable: true },
                { title: '评论电影', width: 150, sortable: false, dataIndex: 'name', selectable: true ,renderer:function(value,obj){
                    return value;
                }},
                { title: '会员编号',width: 100, sortable: true,  dataIndex: 'user_id',  showTip: true },
                { title: '会员昵称', width: 100,sortable: true,  dataIndex: 'nickname'},
                { title: '评论时间',width: 100, sortable: true,  dataIndex: 'adddate'},
               // { title: '操作', width: 300, dataIndex: 'g',renderer:function(value,obj){

               //     return '<span class="grid-command btn-del">删除</span><span class="grid-command btn-edit">编辑</span>';
               // }}
            ];

    var store = new Store({
                url : '{$select}',
                autoLoad:true,
                pageSize:10
            }),
            grid = new Grid.Grid({
                render:'#grid',
                loadMask: true,
                forceFit:true,
                columns : columns,
                store: store,
                plugins : [Grid.Plugins.CheckSelection,Grid.Plugins.AutoFit], //勾选插件、自适应宽度插件
                // 底部工具栏
                tbar:{
                    // items:[{
                    //     btnCls : 'button button-primary button-small',
                    //     text:'删除',
                    //     handler : function(){
                    //         delFunction();

                    //     }
                    // },{
                    //     btnCls : 'button button-primary button-small',
                    //     text:'新增',
                    //     handler : function(){
                            

                    //     }
                    // }]
                },
                // 顶部工具栏
                bbar : {
                    //items 也可以在此配置
                    // pagingBar:表明包含分页栏
                    pagingBar:true
                }
            });

    grid.render();

    //创建表单，表单中的日历，不需要单独初始化
    var form = new BUI.Form.HForm({
        srcNode : '#searchForm'
    }).render();

    form.on('beforesubmit',function(ev) {
        //序列化成对象
        var obj = form.serializeToObject();
        obj.start = 0; //返回第一页
        store.load(obj);
        return false;
    });


    function delFunction(){
        var selections = grid.getSelection();
        delItems(selections);
    }

    function delItems(items){
        var ids = [];
        BUI.each(items,function(item){
            ids.push(item.user_id);
        });
        alert(ids);
        if(ids.length){
            BUI.Message.Confirm('确认要删除选中的记录么？',function(){
                $.ajax({
                    url : 'data.php',
                    dataType : 'json',
                    data : {ids : ids},
                    success : function(data){
                        if(data.success){ //删除成功
                            alert('删除成功');
                            search.load();

                        }else{ //删除失败
                            BUI.Message.Alert('删除失败！');
                        }
                    }
                });
            },'question');
        }
    }
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
                url:  '{$update}',
                dataType : 'json',
                data: $editForm.serialize(),
                success: function(data){
                    alert(data);
                    if(data.success){ //修改成功
                        alert(data);
                        alert('修改成功');
                        that.close();
                        search.load();
                    }else{ //修改失败
                        BUI.Message.Alert('修改失败！');
                    }
                }
            })
        }
    });
    function editItem(item) {
        var $input;
        for(key in item) {
            if($input = $editForm.find('input[name="'+ key +'"]')){
                $input.val(item[key]);
            }
        }
        editDialog.show();
    }
    //监听事件，编辑
    grid.on('cellclick',function(ev){
        //alert(1);
        var sender = $(ev.domTarget); //点击的Dom
        if(sender.hasClass('btn-edit')){
            var record = ev.record;
            editItem(record);
        }
    });

    //监听事件，删除一条记录
    grid.on('cellclick',function(ev){
        var sender = $(ev.domTarget); //点击的Dom
        if(sender.hasClass('btn-del')){
            var record = ev.record;
            delItems([record]);
        }
    });

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

<include file="./Application/Admin/View/Something/footer.tpl"  />