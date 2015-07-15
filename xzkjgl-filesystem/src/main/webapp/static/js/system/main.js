var ctx = $('base').attr('href');
$(function() {
	$('#userModule_tree').treegrid({//用户模块菜单 
		url: 		ctx + '/module/showUserModules.json', 
		idField: 	'resourceId', 
		treeField:	'resourceName',
	    height: 	'auto', 
	    fitColumns: true,
	    fit: 		true, 
	    nowrap: 	false, 
	    striped: 	false, 
	    border: 	false, 
	    collapsible: true, 
	    singleSelect: true,
	    onLoadSuccess: loadSuccessFun, 
	    onClickRow:  function(row){
	    	var node = $('#userModule_tree').treegrid('getChildren', row.resourceId);
	    	if(node.length > 0){
	    		return false;
	    	}
	    	
	    	$('#mainContent_tab').tabs('close', 0);//删除之前打开的tab
			$('#mainContent_tab').tabs('add', {
				index: 0,
				title : module_name,
				href :  ctx + '/' + row.path
				//closable : true
			});
			
	    }
}); 
	
	/**
	 * 加载成功后最后3个节点收缩,展开页面不让滚动条显示
	 */
	function loadSuccessFun(row, data){
		var len = data.rows.length;
		if(len > 20){
			var count = 0;
			for(var i = len - 1; i > 0;i--){
				if(data.rows[i].children && count < 3){
					$(this).treegrid('collapse', data.rows[i].resourceId);
					count++;
				}
				if(count > 2){
					break;
				}
			}
		}
	};
	
});

var MainHandler = {
		
	/**加载子模块树*/
	loadSubMenu: function(nodeId){
		$("#userModule_tree").treegrid("select",nodeId);
		$("#userModule_tree").treegrid("expandAll",nodeId);
	},

	/* 弹出修改密码窗口 */
	updatePassword : function() {
		$("#passwordModal").modal({
			show : true
		});
	}

};
