var lastsel;
jQuery("#rowed3").jqGrid(
		{
			url : 'server.php?q=2',
			datatype : "json",
			colNames : [ 'Ref', 'Designation', 'Nombre', 'Prix HT', 'Total HT'],
			colModel : [ {
				name : 'Ref',
				index : 'Ref',
				width : 55
			}, {
				name : 'Designation',
				index : 'Designation',
				width : 90,
				editable : true
			}, {
				name : 'Nombre',
				index : 'Nombre',
				width : 100,
				editable : true
			}, {
				name : 'Prix HT',
				index : 'Prix HT',
				width : 80,
				align : "right",
				editable : true
			}, {
				name : 'Total HT',
				index : 'Total HT',
				width : 80,
				align : "right",
				editable : true
			}],
			rowNum : 10,
			rowList : [ 10, 20, 30 ],
			pager : '#prowed3',
			sortname : 'id',
			viewrecords : true,
			sortorder : "desc",
			onSelectRow : function(id) {
				if (id && id !== lastsel) {
					jQuery('#rowed3').jqGrid('restoreRow', lastsel);
					jQuery('#rowed3').jqGrid('editRow', id, true);
					lastsel = id;
				}
			},
			editurl : "server.php",
			caption : "Using events example"
		});
jQuery("#rowed3").jqGrid('navGrid', "#prowed3", {
	edit : false,
	add : false,
	del : false
});