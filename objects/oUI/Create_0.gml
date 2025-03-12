editing = noone;
last_edit = noone;
editingdepth = 999999;
top = {
  "width":1920.0,
  "data":{
    "owner":{
      "target_w":1920.0,
      "target_h":1080.0,
      "editing":false,
      "instances":[
        "@ref instance(100085)",
        "@ref instance(100086)",
        "@ref instance(100087)",
        "@ref instance(100088)",
        "@ref instance(100089)"
      ],
      "root":"@ref flexpanel(82)",
      "ownername":"base",
      "lastdepth":0.0
    },
    "inst":"@ref instance(100085)"
  },
  "height":1080.0,
  "name":"base",
  "nodes":[
    {
      "flexDirection":"row",
      "name":"panel_base",
      "left":0.0,
      "nodes":[
        {
          "width":60.0,
          "data":{
            text : "Save",
			f : function() {
				oEditableUI.save();
			}
          },
          "name":"button_save"
        },
        {
          "width":60.0,
          "data":{
            text : "Load",
			f : function() {
				oEditableUI.load();
			}
          },
          "name":"button_load"
        },
        {
          "width":60.0,
          "data":{
			  text : "New",
			  f : function() {
				oEditableUI.new_window();
			}
          },
          "name":"button_new"
        }
      ],
      "padding":0.0,
      "top":0.0,
      "data":{
      },
      "height":35.0
    }
  ]
};
str = {
  "name":"editor",
  "flex":1.0,
  "padding":0.0,
  "width":1920.0,
  "top" : 35,
  "data":{
    "inst":"@ref instance(100002)"
  },
  "height":1080.0,
    flexDirection : "row",
  "nodes":[
  //{
  //  name : "panel_side_ignore",
  //  flex : 0.2,
  //  },
  {flex : 1, flexGrow: 1},
    {
    name : "panel_side",
    flex : 0.15,
nodes : [
    {
      "padding":10.0,
      "data":{
        "inst":"@ref instance(100007)"
      },
      "height":5.0,
      "name":"draggable_button",
      "flex":1.0
    },
    {
      "padding":10.0,
      "data":{
        "inst":"@ref instance(100006)"
      },
      "height":5.0,
      "name":"draggable_textbox",
      "flex":1.0
    },
    {
      "padding":10.0,
      "data":{
        "inst":"@ref instance(100005)"
      },
      "height":10.0,
      "name":"draggable_panel",
      "flex":1.0
    },
    {
      "padding":10.0,
      "data":{
        "inst":"@ref instance(100004)"
      },
      "height":10.0,
      "name":"draggable_label_7549",
      "flex":1.0
    },
    {
      "padding":10.0,
      "data":{
        "inst":"@ref instance(100003)"
      },
      "height":10.0,
      "name":"draggable_label_61489",
      "flex":1.0
    }
    ]
    }
  ]
}
ui = new window(str);
top = new window(top);
//show_message(flexpanel_node_get_struct(global.inspector));
load_info = function(n) {
	//show_message(editing);
	var _node = flexpanel_node_get_child(oEditableUI.ui.root, editing); //node to edit
	if (_node == undefined) {
	    exit;
	}
	last_edit = editing;
	flexpanel_node_set_data(flexpanel_node_get_child(ui.root, "inspector-label-center"), {text : $"Inspector - {editing}"});
	with (oUIElement) {
	    if (name == "inspector-label-center") {
		    instance_destroy();
		}
	}
	show_debug_message(flexpanel_node_get_data(flexpanel_node_get_child(ui.root, "inspector-label-center")));
	//show_message("");
	for (var i = 0; i < array_length(global.options); ++i) {
		o = global.options[i];
		var editnode = flexpanel_node_get_child(ui.root, o[0]);
		editnode = flexpanel_node_get_child(editnode, 1);
		var editnodestruct = flexpanel_node_get_struct(editnode);
		var onode = flexpanel_node_get_struct(_node);
		editnodestruct.data.selected = onode[$ o[0]];
		var parent = flexpanel_node_get_parent(editnode);
		flexpanel_node_remove_child(parent, editnode);
		flexpanel_node_insert_child(parent, flexpanel_create_node(editnodestruct), 1);
	}
	ui.recalculate();
	//var _children_count = flexpanel_node_get_num_children(flexpanel_node_get_child(ui.root, ));
	//for (var i = 0; i < _children_count; i++)
	//{
	//	var _child = flexpanel_node_get_child(_node, i);
		
	//}
}
flexpanel_node_insert_child(flexpanel_node_get_child(ui.root, "editor"), global.inspector, 0);
ui.recalculate();