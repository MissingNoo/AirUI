editing = noone;
last_edit = noone;
editingdepth = 999999;
saveui = undefined;
save = {
  "name":"base",
  "nodes":[
    {
      "name":"panel_base",
      "left":0.0,
      "nodes":[
        {
          "flex":0.10000000149011612,
          "data":{
			  text : "Save",
            "owner":{
              "target_w":1920.0,
              "target_h":1080.0,
              "editing":false,
              "instances":[
                "@ref instance(100129)",
                "@ref instance(100130)",
                "@ref instance(100131)",
                "@ref instance(100132)",
                "@ref instance(100133)",
                "@ref instance(100134)",
                "@ref instance(100135)",
                "@ref instance(100136)",
                "@ref instance(100142)"
              ],
              "root":"@ref flexpanel(654)",
              "ownername":"base",
              "lastdepth":0.0
            },
            "inst":"@ref instance(100131)"
          },
          "name":"label_center_62297"
        },
        {
          "margin":10.0,
          "border":0.0,
          "name":"transparent_panel_55029",
          "nodes":[
            {
              "name":"panel_82435",
              "nodes":[
                {
                  "flex":1.0,
                  "data":{
					  text : "Are you sure?",
                    "owner":{
                      "target_w":1920.0,
                      "target_h":1080.0,
                      "editing":false,
                      "instances":[
                        "@ref instance(100129)",
                        "@ref instance(100130)",
                        "@ref instance(100131)",
                        "@ref instance(100132)",
                        "@ref instance(100133)",
                        "@ref instance(100134)",
                        "@ref instance(100135)",
                        "@ref instance(100136)",
                        "@ref instance(100142)"
                      ],
                      "root":"@ref flexpanel(654)",
                      "ownername":"base",
                      "lastdepth":0.0
                    },
                    "inst":"@ref instance(100142)"
                  },
                  "name":"center_label_98113"
                }
              ],
              "flex":1.0,
              "padding":10.0,
              "data":{
                "owner":{
                  "target_w":1920.0,
                  "target_h":1080.0,
                  "editing":false,
                  "instances":[
                    "@ref instance(100129)",
                    "@ref instance(100130)",
                    "@ref instance(100131)",
                    "@ref instance(100132)",
                    "@ref instance(100133)",
                    "@ref instance(100134)",
                    "@ref instance(100135)",
                    "@ref instance(100136)",
                    "@ref instance(100142)"
                  ],
                  "root":"@ref flexpanel(654)",
                  "ownername":"base",
                  "lastdepth":0.0
                },
                "inst":"@ref instance(100133)"
              },
              "height":60.0
            },
            {
              "alignSelf":"center",
              "flexDirection":"row",
              "name":"transparent_panel_28819",
              "nodes":[
                {
                  "flex":1.0,
                  "width":60.0,
                  "data":{
					  text : "Yes",
					  f : function() {
						  oEditableUI.save();
						  oUI.saveui.dispose();
					  },
                    "owner":{
                      "target_w":1920.0,
                      "target_h":1080.0,
                      "editing":false,
                      "instances":[
                        "@ref instance(100129)",
                        "@ref instance(100130)",
                        "@ref instance(100131)",
                        "@ref instance(100132)",
                        "@ref instance(100133)",
                        "@ref instance(100134)",
                        "@ref instance(100135)",
                        "@ref instance(100136)",
                        "@ref instance(100142)"
                      ],
                      "root":"@ref flexpanel(654)",
                      "ownername":"base",
                      "lastdepth":0.0
                    },
                    "inst":"@ref instance(100135)"
                  },
                  "height":30.0,
                  "name":"button_save_ok"
                },
                {
                  "flex":1.0,
                  "width":192.0,
                  "data":{
					  text : "Cancel",
					  f : function() {
						  oUI.saveui.dispose();
					  },
                    "owner":{
                      "target_w":1920.0,
                      "target_h":1080.0,
                      "editing":false,
                      "instances":[
                        "@ref instance(100129)",
                        "@ref instance(100130)",
                        "@ref instance(100131)",
                        "@ref instance(100132)",
                        "@ref instance(100133)",
                        "@ref instance(100134)",
                        "@ref instance(100135)",
                        "@ref instance(100136)",
                        "@ref instance(100142)"
                      ],
                      "root":"@ref flexpanel(654)",
                      "ownername":"base",
                      "lastdepth":0.0
                    },
                    "inst":"@ref instance(100136)"
                  },
                  "height":30.0,
                  "name":"button_save_cancel"
                }
              ],
              "flex":0.20000000298023224,
              "padding":10.0,
              "width":200.0,
              "data":{
                "owner":{
                  "target_w":1920.0,
                  "target_h":1080.0,
                  "editing":false,
                  "instances":[
                    "@ref instance(100129)",
                    "@ref instance(100130)",
                    "@ref instance(100131)",
                    "@ref instance(100132)",
                    "@ref instance(100133)",
                    "@ref instance(100134)",
                    "@ref instance(100135)",
                    "@ref instance(100136)",
                    "@ref instance(100142)"
                  ],
                  "root":"@ref flexpanel(654)",
                  "ownername":"base",
                  "lastdepth":0.0
                },
                "inst":"@ref instance(100134)"
              },
              "height":60.0,
              "alignItems":"center"
            }
          ],
          "flex":1.0,
          "padding":0.0,
          "data":{
            "owner":{
              "target_w":1920.0,
              "target_h":1080.0,
              "editing":false,
              "instances":[
                "@ref instance(100129)",
                "@ref instance(100130)",
                "@ref instance(100131)",
                "@ref instance(100132)",
                "@ref instance(100133)",
                "@ref instance(100134)",
                "@ref instance(100135)",
                "@ref instance(100136)",
                "@ref instance(100142)"
              ],
              "root":"@ref flexpanel(654)",
              "ownername":"base",
              "lastdepth":0.0
            },
            "inst":"@ref instance(100132)"
          },
          "height":304.0
        }
      ],
      "padding":0.0,
      "top":500.0,
      "width":249.0,
      "data":{
        "inst":"@ref instance(100130)",
        "owner":{
          "target_w":1920.0,
          "target_h":1080.0,
          "editing":false,
          "instances":[
            "@ref instance(100129)",
            "@ref instance(100130)",
            "@ref instance(100131)",
            "@ref instance(100132)",
            "@ref instance(100133)",
            "@ref instance(100134)",
            "@ref instance(100135)",
            "@ref instance(100136)",
            "@ref instance(100142)"
          ],
          "root":"@ref flexpanel(654)",
          "ownername":"base",
          "lastdepth":0.0
        }
      },
      "height":127.0
    }
  ],
  "width":1920.0,
  "data":{
    "owner":{
      "target_w":1920.0,
      "target_h":1080.0,
      "editing":false,
      "instances":[
        "@ref instance(100129)",
        "@ref instance(100130)",
        "@ref instance(100131)",
        "@ref instance(100132)",
        "@ref instance(100133)",
        "@ref instance(100134)",
        "@ref instance(100135)",
        "@ref instance(100136)",
        "@ref instance(100142)"
      ],
      "root":"@ref flexpanel(654)",
      "ownername":"base",
      "lastdepth":0.0
    },
    "inst":"@ref instance(100129)"
  },
  "height":1080.0,
  "alignItems":"center"
}
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
				oUI.saveui = new window(oUI.save);
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
  "height":1080 - 35,
    flexDirection : "row",
  "nodes":[
  //{
  //  name : "panel_side_ignore",
  //  flex : 0.2,
  //  },
  {flex : 1, flexGrow: 1},
    {
    name : "panel_side",
	maxWidth : 30,
    flex : 0.15,
nodes : [
    {
      "padding":10.0,
      "data":{
        "inst":"@ref instance(100007)"
      },
      "height":5.0,
      "name":"draggable_button",
	  maxWidth : 30,
	  maxHeight: 30,
      "flex":1.0
    },
    {
      "padding":10.0,
      "data":{
        "inst":"@ref instance(100006)"
      },
      "height":5.0,
      "name":"draggable_textbox",
	  maxWidth : 30,
	  maxHeight: 30,
      "flex":1.0
    },
    {
      "padding":10.0,
      "data":{
        "inst":"@ref instance(100005)"
      },
      "height":10.0,
      "name":"draggable_panel",
	  maxWidth : 30,
	  maxHeight: 30,
      "flex":1.0
    },
    {
      "padding":10.0,
      "data":{
        "inst":"@ref instance(100004)"
      },
      "height":10.0,
      "name":"draggable_label_7549",
	  maxWidth : 30,
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
	//show_debug_message(flexpanel_node_get_data(flexpanel_node_get_child(ui.root, "inspector-label-center")));
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

list_base = {
      "flex":1.0,
      "name":"panel_list_base",
      "padding":0.0,
      "width":200.0,
	  minWidth : 200,
	  maxWidth : 200,
      "nodes":[
        ]
    }
flexpanel_node_insert_child(flexpanel_node_get_child(ui.root, "editor"), flexpanel_create_node(list_base), 2);
ui.recalculate();

get_children = function(list, node) {
	list[$ flexpanel_node_get_name(node)] = {};
	var childs = flexpanel_node_get_num_children(node);
	if (childs > 0) {
		var l = list[$ flexpanel_node_get_name(node)];
		if (string_contains(flexpanel_node_get_name(node), "panel")) {
			    l[$ "childs"] = [];
		}		
		for (var j = 0; j < childs; ++j) {
			var c = flexpanel_node_get_child(node, j);
			var n = flexpanel_node_get_name(c);
			if (string_contains(n, "panel")) {
			    get_children(l, c);
			} else {
				array_push(l[$ "childs"], n);
			}
		}
	}
	//var _add = {
    //    "margin":5.0,
    //    "name":$"panel_parent_{flexpanel_node_get_name(node)}",
    //    "padding":0.0,
    //    "height":60.0,
    //    "nodes":[
    //    {
    //        "name":"label_center_parent_name",
    //        "padding":0.0,
    //        "height":60.0,
    //        "flex":0.20000000298023224,
	//		data : {text : flexpanel_node_get_name(node)}
    //    }
    //    ],
    //    "flex":1.0
    //}
	//var to_add = flexpanel_create_node(_add);
	//for (var i = 0; i < flexpanel_node_get_num_children(node); ++i) {
	//		var child_name = flexpanel_node_get_name(flexpanel_node_get_child(node, i));
	//	    var child = {
    //          "margin":10.0,
    //          "name":"panel_child_list",
    //          "flexDirection":"row",
    //          "padding":2.0,
    //          "height":60.0,
    //          "nodes":[
    //            {
    //              "name":"spacer",
    //              "padding":0.0,
    //              "maxWidth":20.0,
    //              "width":60.0,
    //              "height":60.0
    //            },
    //            {
    //              "name":"panel_29296_transparent",
    //              "padding":0.0,
    //              "width":60.0,
    //              "height":30.0,
    //              "nodes":[
    //                {
    //                  "name":"label_center_child_name",
    //                  "flex":1.0,
	//				  maxHeight : 20,
	//				  data : {text : child_name}
    //                }
    //              ],
    //              "flex":1.0
    //            }
    //          ],
    //          "flex":1.0
    //        }
	//		var childs = flexpanel_node_get_num_children(node);
	//		try {
	//			flexpanel_node_insert_child(to_add, childs, 0);
	//		}
	//		catch (err) {}
	//		if (childs > 0) {
	//		    for (var j = 0; j < flexpanel_node_get_num_children(node); ++j) {
	//				if (flexpanel_node_get_child(oUI.ui.root, $"panel_parent_{flexpanel_node_get_name(node)}") == undefined) {
	//				    flexpanel_node_insert_child(flexpanel_node_get_child(oUI.ui.root, "panel_list_base"), get_children(flexpanel_node_get_child(node, j)), 0);
	//				}
	//			}
	//		}
	//}
	//return to_add;
}

add_to_list = function() {
	//var base = flexpanel_node_get_child(ui.root, "panel_list_base");
	//flexpanel_node_remove_all_children(base);
	//with (oUIElement) {
	//    if (data.owner == oUI.ui) {
	//	    instance_destroy();
	//	}
	//}
	var node = oEditableUI.ui.root;
	//var _name = flexpanel_node_get_name(node);
	//for (var i = 0; i < flexpanel_node_get_num_children(node); ++i) {
	//    flexpanel_node_insert_child(flexpanel_node_get_child(ui.root, "panel_list_base"), get_children(flexpanel_node_get_child(node, i)), 0);
	//}
	var list = {};
	for (var i = 0; i < flexpanel_node_get_num_children(node); ++i) {
		get_children(list, node);
	    //flexpanel_node_insert_child(flexpanel_node_get_child(ui.root, "panel_list_base"), get_children(flexpanel_node_get_child(node, i)), 0);
	}
	show_message(list);
	

	
			
		// Call for children (recursive)
		//var _children_count = flexpanel_node_get_num_children(_node);
		//for (var i = 0; i < _children_count; i++)
		//{
		//	var _child = flexpanel_node_get_child(_node, i);
		//	generate_instance(_child, _depth - 1);
		//}
	ui.recalculate();
}


      