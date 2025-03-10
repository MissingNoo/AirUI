global.edit_mode = false;
global.edit_node = undefined;
global.edit_node_owner = undefined;
function window(struct) constructor {
	lastdepth = 0;
	ownername = struct[$ "name"];
	root = flexpanel_create_node(struct);
	instances = [];
	editing = false;
	recalculate();
	
	static edit_mode = function() {
		editing = !editing;
		for (var i = 0; i < array_length(instances); ++i) {
		    instances[i].editable = editing;
		}
	}
	
	static get_child = function(node) {
		return flexpanel_node_get_child(root, node)
	}
	
	static generate_instance = function(_node, _depth) {
		// Get layout data
		var _pos = flexpanel_node_layout_get_position(_node, false);
		var _name = flexpanel_node_get_name(_node);
		//show_message(_name);
		if (_name == "undefined") {
		    flexpanel_node_set_name(_node, irandom(999999));
		}
	
		// Update instance
		var _data = flexpanel_node_get_data(_node);
		_data.owner = self;
		if ((struct_exists(_data, "inst") and (is_string(_data.inst) or !instance_exists(_data.inst))) or !struct_exists(_data, "inst"))
		{
			// Create instance
			var _depth2 = _data[$ "options"] != undefined ? -100 + lastdepth : 0;
			if (_depth2 == -100) {
			    lastdepth++;
			}
			var _inst = instance_create_depth(_pos.left, _pos.top, _depth + _depth2, oUIElement,
			{
				name: _name,
				width: _pos.width,
				height: _pos.height,
	            data: _data,
				editable : editing
			});
	
			_data.inst = _inst;
			array_push(instances, _inst);
		}
		else
		{
			var _inst = _data.inst;
			_inst.x = _pos.left;
			_inst.y = _pos.top;
			_inst.width = _pos.width;
			_inst.height = _pos.height;
			_inst.editable = editing;
	        _inst.data = _data;
			with (_inst) {
				event_perform(ev_create, 0);
			}
		}
	
		// Call for children (recursive)
		var _children_count = flexpanel_node_get_num_children(_node);
		for (var i = 0; i < _children_count; i++)
		{
			var _child = flexpanel_node_get_child(_node, i);
			generate_instance(_child, _depth - 1);
		}
	}
	
	static recalculate = function() {
		target_w = display_get_gui_width();
		target_h = display_get_gui_height();
		flexpanel_calculate_layout(root, target_w, target_h, flexpanel_direction.LTR);
		generate_instance(root, 0);
	}
	
	static dispose = function() {
		var f = function(e, i) {
			if (instance_exists(e)) {
			    instance_destroy(e);
			}
		}
		array_foreach(instances, f);
	}
	
	static get_element_data = function(element, variable) {
		var el = flexpanel_node_get_child(root, element);
		var data = flexpanel_node_get_data(el);
		return data.inst.element[$ variable];
	}	
}

global.player_info_ui = {
	name : "PlayerInfo",
    width : 720,
    height : 480,
    padding : 0,
    alignItems : "center",
    justifyContent : "center",
    nodes : [
	{
		name : "root",
		width : "60%",
		height : "40%",
		padding : 5,
		gap : 5,
		flexDirection : "column",
		nodes : [
		{ // Main Area
			name : "main_panel",
			flex : 1,
			flexDirection : "row",
			nodes : [
			{ // Character Info
				name : "panel",
				flex : .5,
				nodes : [ 
				{ // Character
					flex : 1,
					padding : .5
				},
				{ // Character name
					name : "center_label_player_name",
					width : 80,
					alignSelf : "center",
					flex : .1,
					padding : 5,
					data : {text : "Airgeadlamh"}
				},
				]
			},
			{ // Pokemon panel
				name : "panel-pokemons",
				flex : 1,
				nodes : [
				{ // First Row
					flex : 1,
					flexDirection : "row",
					padding: 3, 
					gap: 3,
					nodes : [
					{
						flex : 1,
						nodes : [
						{
							flex : 1
						},
						{
							flex : 0.25,
							borderWidth: 3,
							data : {text : "pokename1"}							
						}
						]
					},
					{
						flex : 1,
						nodes : [
						{
							flex : 1
						},
						{
							flex : 0.25,
							borderWidth: 3,
							data : {text : "pokename2"}
						}
						]
					},
					{
						flex : 1,
						nodes : [
						{
							flex : 1
						},
						{
							flex : 0.25,
							borderWidth: 3,
							data : {text : "pokename3"}
						}
						]
					},
					]
				},
				{ // Second Row
					flex : 1,
					flexDirection : "row",
					padding: 3, 
					gap: 3,
					nodes : [
					{
						flex : 1,
						nodes : [
						{
							flex : 1
						},
						{
							flex : 0.25,
							borderWidth: 3,
							data : {text : "pokename4"}
						}
						]
					},
					{
						flex : 1,
						nodes : [
						{
							flex : 1
						},
						{
							flex : 0.25,
							borderWidth: 3,
							data : {text : "pokename5"}
						}
						]
					},
					{
						flex : 1,
						nodes : [
						{
							flex : 1
						},
						{
							flex : 0.25,
							borderWidth: 3,
							data : {text : "pokename6"}
						}
						]
					},
					]
				},
				]
			}
			]
		},
		{ // Play Button
			alignSelf : "center", height: 20, flexDirection: "row", gap: 5, justifyContent: "space-between",
			nodes : [
			{
				name : "button_play",
				data : {text : "Play"},
				width : 60,
				height : 30
			},
			{
				name : "button_return",
				data : {text : "Cancel"},
				width : 60,
				height : 30
			},
			]
		},
		{height : 10}
		]
	},
    ],
}
global.options = [
	["width", "textbox", function(a) {
		var node = flexpanel_node_get_child(oEditableUI.ui.root, oUI.last_edit);
		flexpanel_node_style_set_width(node, real(a.text), flexpanel_unit.point);
		oEditableUI.ui.recalculate();
	}],
	["height", "textbox", function(a){
		var node = flexpanel_node_get_child(oEditableUI.ui.root, oUI.last_edit);
		flexpanel_node_style_set_height(node, real(a.text), flexpanel_unit.point);
		oEditableUI.ui.recalculate();
	}],
	["minHeight", "textbox", function(a){
		var node = flexpanel_node_get_child(oEditableUI.ui.root, oUI.last_edit);
		flexpanel_node_style_set_min_height(node, real(a.text), flexpanel_unit.point);
		oEditableUI.ui.recalculate();
	}],
	["maxHeight", "textbox", function(a){
		var node = flexpanel_node_get_child(oEditableUI.ui.root, oUI.last_edit);
		flexpanel_node_style_set_max_height(node, real(a.text), flexpanel_unit.point);
		oEditableUI.ui.recalculate();
	}],
	["minWidth", "textbox", function(a){
		var node = flexpanel_node_get_child(oEditableUI.ui.root, oUI.last_edit);
		flexpanel_node_style_set_min_width(node, real(a.text), flexpanel_unit.point);
		oEditableUI.ui.recalculate();
	}],
	["maxWidth", "textbox", function(a){
		var node = flexpanel_node_get_child(oEditableUI.ui.root, oUI.last_edit);
		flexpanel_node_style_set_max_width(node, real(a.text), flexpanel_unit.point);
		oEditableUI.ui.recalculate();
	}],
	["padding", "textbox", function(a){
		var node = flexpanel_node_get_child(oEditableUI.ui.root, oUI.last_edit);
		flexpanel_node_style_set_padding(node, real(a.text), flexpanel_unit.point);
		oEditableUI.ui.recalculate();
	}],
	["border", "textbox", function(a){
		var node = flexpanel_node_get_child(oEditableUI.ui.root, oUI.last_edit);
		flexpanel_node_style_set_border(node, real(a.text), flexpanel_unit.point);
		oEditableUI.ui.recalculate();
	}],
	["alignContent", "listbox", ["flex-start", "flex-end", "stretch", "center", "space-between", "space-around", "space-evenly"], function(a){
		var node = flexpanel_node_get_child(oEditableUI.ui.root, oUI.last_edit);
		flexpanel_node_style_set_align_content(node, a.text);
		oEditableUI.ui.recalculate();
	}],
	["flex", "textbox", function(a){
		var node = flexpanel_node_get_child(oEditableUI.ui.root, oUI.last_edit);
		flexpanel_node_style_set_flex(node, real(a.text));
		oEditableUI.ui.recalculate();
	}],
	["flexWrap", "listbox", ["no-wrap", "wrap", "wrap-reverse"], function(a){
		var node = flexpanel_node_get_child(oEditableUI.ui.root, oUI.last_edit);
		flexpanel_node_style_set_flex_wrap(node, a.text);
		oEditableUI.ui.recalculate();
	}],
	["flexDirection", "listbox", ["columns", "row", "row-reverse", "column-reverse"], function(a){
		var node = flexpanel_node_get_child(oEditableUI.ui.root, oUI.last_edit);
		flexpanel_node_style_set_flex_direction(node, a.text);
		oEditableUI.ui.recalculate();
	}],
	["flexBasis", "textbox", function(a){
		var node = flexpanel_node_get_child(oEditableUI.ui.root, oUI.last_edit);
		flexpanel_node_style_set_flex_basis(node, real(a.text), flexpanel_unit.point);
		oEditableUI.ui.recalculate();
	}],
	["margin", "textbox", function(a){
		var node = flexpanel_node_get_child(oEditableUI.ui.root, oUI.last_edit);
		flexpanel_node_style_set_margin(node, real(a.text), flexpanel_unit.point);
		oEditableUI.ui.recalculate();
	}],
	["alignItems", "listbox", ["flex-start", "flex-end", "center", "baseline"], function(a){
		var node = flexpanel_node_get_child(oEditableUI.ui.root, oUI.last_edit);
		flexpanel_node_style_set_align_items(node, a.text);
		oEditableUI.ui.recalculate();
	}],
	["alignSelf", "listbox", ["flex-start", "flex-end", "center", "baseline"], function(a){
		var node = flexpanel_node_get_child(oEditableUI.ui.root, oUI.last_edit);
		flexpanel_node_style_set_align_self(node, a.text);
		oEditableUI.ui.recalculate();
	}],
	["aspectRatio", "textbox", function(a){
		var node = flexpanel_node_get_child(oEditableUI.ui.root, oUI.last_edit);
		flexpanel_node_style_set_aspect_ratio(node, real(a.text));
		oEditableUI.ui.recalculate();
	}],
	["display", "listbox", ["none", "flex"], function(a){
		var node = flexpanel_node_get_child(oEditableUI.ui.root, oUI.last_edit);
		flexpanel_node_style_set_display(node, a.text);
		oEditableUI.ui.recalculate();
	}],
	["gap", "textbox", function(a){
		var node = flexpanel_node_get_child(oEditableUI.ui.root, oUI.last_edit);
		flexpanel_node_style_set_gap(node, real(a.text), flexpanel_unit.point);
		oEditableUI.ui.recalculate();
	}],
	["top", "textbox", function(a){
		var node = flexpanel_node_get_child(oEditableUI.ui.root, oUI.last_edit);
		flexpanel_node_style_set_position(node, flexpanel_edge.top, real(a.text), flexpanel_unit.point);
		oEditableUI.ui.recalculate();
	}],
	["left", "textbox", function(a){
		var node = flexpanel_node_get_child(oEditableUI.ui.root, oUI.last_edit);
		flexpanel_node_style_set_position(node, flexpanel_edge.left, real(a.text), flexpanel_unit.point);
		oEditableUI.ui.recalculate();
	}],
	["justifyContent", "listbox", ["flex-start", "flex-end", "center", "space-between", "space-around", "space-evenly"], function(a){
		var node = flexpanel_node_get_child(oEditableUI.ui.root, oUI.last_edit);
		flexpanel_node_style_set_justify_content(node, a.text);
		oEditableUI.ui.recalculate();
	}],
	["position", "listbox", ["relative", "absolute"], function(a){
		var node = flexpanel_node_get_child(oEditableUI.ui.root, oUI.last_edit);
		flexpanel_node_style_set_position_type(node, a.text);
		oEditableUI.ui.recalculate();
	}],
]

global.inspector = flexpanel_create_node({
    name : "panel_side_ignore",
    flex : 0.2,
	nodes : [
		{
			name : "inspector-label-center",
			height : 30,
			data : { text : "Inspector" }
		}
	],
 });
 
 for (var i = 0; i < array_length(global.options); ++i) {
	 var o = global.options[i];
	 var s = {
		 name : $"{o[0]}",
		 flex : 0.25,
		 flexDirection : "row",
		 nodes : [
			{
				name : "label-center",
				flex : 1,
				data : {text : $"{o[0]}"},
			},
			{
				name : $"{o[1]}-{o[0]}-ignore",
				flex : 1,
				data : {
					options : array_length(o) > 2 and is_array(o[2]) ? o[2] : [], 
					f : array_length(o) > 2 and is_callable(o[2]) ? method(self, o[2]) : method(self, o[3]),
				}
			}
		 ]
	 }
	 if (array_length(o) > 2) {
	     //s.data.options = o[2];
	 }
	 var node = flexpanel_create_node(s);	 
     flexpanel_node_insert_child(global.inspector, node, flexpanel_node_get_num_children(global.inspector));
 }

 //global.inspector = flexpanel_node_get_struct(global.inspector);
 
 
	