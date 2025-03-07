/// @description Insert description here
// You can write your code in this editor

switch (node) {
    case "panel":
        node = flexpanel_create_node({padding : 10, width : 60, height : 60, name : $"panel_{irandom(99999)}" });
        break;
    case "button":
        node = flexpanel_create_node({ width : 60, height : 60, name : $"button_{irandom(99999)}"});
        break;
    case "textbox":
        node = flexpanel_create_node({flex : 1, name : $"textbox__{irandom(99999)}"});
        break;
    //case "panel":
    //    node = flexpanel_create_node({padding : 10, flexDirection : "row", flex : 1, name : $"panel_{irandom(99999)}" });
    //    break;
	default:
		node = undefined;
		break;
}

if (keyboard_check_released(vk_numpad5)) {
	creating = true;
	node = flexpanel_create_node({padding : 10, height : 10, flex : 1, name : $"draggable_label_{irandom(99999)}" });
}

if (global.edit_node != undefined and node != undefined and !is_string(node)) {
	//creating = false;
	var panel = flexpanel_node_get_child(n_root, global.edit_node);
	show_message($"{edit_node} : {panel}");
    if (panel == undefined) {
    	exit;
    }
	flexpanel_node_insert_child(panel, node, 0);
    flexpanel_calculate_layout(n_root, target_w, target_h, flexpanel_direction.LTR);
	generate_instance(n_root, 0);
	node = undefined;
}
if (keyboard_check_released(vk_home)) {
    var f = file_text_open_write("test");
	file_text_write_string(f, json_stringify(flexpanel_node_get_struct(n_root), true));
	file_text_close(f);
}
if (keyboard_check_released(vk_end)) {
	with (oUIElement) {
	    if (data.owner != "editor_base") {
		    instance_destroy();
		}
	}
	n_root = flexpanel_create_node(buffer_read(buffer_load("test"), buffer_string));
    flexpanel_calculate_layout(n_root, target_w, target_h, flexpanel_direction.LTR);
	generate_instance(n_root, 0);
}

