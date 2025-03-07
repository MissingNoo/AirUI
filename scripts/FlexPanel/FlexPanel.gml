global.edit_mode = false;
function window(struct) constructor {
	root = flexpanel_create_node(struct);
	instances = [];
	recalculate();
	
	static edit_mode = function(boolean) {
		for (var i = 0; i < array_length(instances); ++i) {
		    instances[i].editable = boolean;
		}
	}
	
	static get_child = function(node) {
		return flexpanel_node_get_child(root, node)
	}
	
	static generate_instance = function(_node, _depth) {
		// Get layout data
		var _pos = flexpanel_node_layout_get_position(_node, false);
		var _name = flexpanel_node_get_name(_node);
	
		// Update instance
		var _data = flexpanel_node_get_data(_node);
		_data.owner = self;
		if ((struct_exists(_data, "inst") and (is_string(_data.inst) or !instance_exists(_data.inst))) or !struct_exists(_data, "inst"))
		{
			// Create instance
			var _inst = instance_create_depth(_pos.left, _pos.top, _depth, oUIElement,
			{
				name: _name,
				width: _pos.width,
				height: _pos.height,
	            data: _data
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