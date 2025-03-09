if (draw_back)
{
	draw_sprite_stretched(sButton, bimg, x, y, width, height);
}

// Draw image (e.g. an icon)
if (image != -1)
{
	draw_sprite_stretched(image, index, x, y, width, height);
}

// Draw bar image (e.g. for health bars)
if (bar_image != -1)
{
	draw_sprite_stretched_ext(bar_image, 0, x, y, width * bar_level, height, bar_colour, 1);
}

// Draw text, can optionally be centred
if (text != "" and element == undefined)
{
	if (center_text)
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
	}
	draw_set_color(c_black);
	draw_text(x + (width / 2) * center_text, y + (height / 2) * center_text, text);
	draw_set_color(c_black);
	if (center_text)
	{
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
	}
}

if (element != undefined) {
	if (type == "listbox" and element.open) {
	    depth = -9000;
	} else {
		depth = original_depth;
	}
    element.draw();
}

if (data.owner == oUI.ui) {
	if (mouse_in_area_gui([x, y, x + width, y + height])) {
		if (edit_node != name and type == "panel") {
			edit_node = name;
        }
	}
	var can_drag_panel = false;
    var panel = undefined;
    if (edit_node != undefined) {
    	panel = flexpanel_node_get_child(oUI.ui.root , edit_node);
		if (panel != undefined and !string_contains(name, "ignore")) {
		    can_drag_panel = flexpanel_node_get_num_children(panel) == 0;
		}
    }
	
	if (mouse_in_area_gui([x, y, x + width, y + height]) and device_mouse_check_button_pressed(0, mb_left) and string_contains(name, "draggable")) {
        dragging = true;
        if (type == "panel" and !can_drag_panel) {
        	dragging = false;
        }
	}

	if (dragging) {
	    draw_text(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), type);
	}
	
	if (dragging and device_mouse_check_button_released(0, mb_left) and global.edit_node != undefined) {
		dragging = false;
		oEditableUI.edit_node = edit_node;
	    oEditableUI.node = type;
	}
}

if (editable) {
	if (mouse_in_area_gui([x, y, x + width, y + height])) {
		if (global.edit_node != name and type == "panel") {
			global.edit_node = name;
			global.edit_node_owner = data.owner;
        }
	}
	//	if (global.edit_element != name and type != "panel") {
	//		global.edit_element = name;
    //    }
	//	if (resizing == noone and (edit_node == undefined or edit_node != name and type == "panel")) {
	//		edit_node = name;
    //    }
	//	if (resizing == noone and data.owner != "editor_base" and (edit_element == undefined or edit_element != name)) {
	//		if (type == "panel") {
	//			if (keyboard_check(vk_insert)) {
	//			    edit_element = name;
	//			}			    
	//		}
	//		else {
	//			edit_element = name;
	//		}			
    //    }
	//}
    
    
	
	//if ((global.edit_node != undefined or global.edit_element != undefined) and data.owner != "editor_base") {
	//	var v = global.edit_node;
	//	if (global.edit_node == undefined) {
	//	    v = global.edit_element;
	//	}
	//    var ele = flexpanel_node_get_child(oEditableUI.n_root, v);
	//	if (device_mouse_check_button_released(0, mb_middle) and ele != undefined and mouse_in_area_gui([x, y, x + width, y + height]) and deltimer == 0) {
	//		deltimer = 60;
	//		flexpanel_node_style_set_flex(ele, !flexpanel_node_style_get_flex(ele));
	//		if (type == "panel") {
	//			show_message_async(flexpanel_node_style_get_flex_direction(ele));
	//			switch (flexpanel_node_style_get_flex_direction(ele)) {
	//			    case "row":
	//			        flexpanel_node_style_set_flex_direction(ele, "column");
	//			        break;
	//			    case "column":
	//			        flexpanel_node_style_set_flex_direction(ele, "row");
	//			        break;
	//			}
			    
	//		}
	//		oEditableUI.recalculate();
	//	}
	//}
	
    //if (edit_element != undefined and data.owner != "editor_base") {
    //	var ele = flexpanel_node_get_child(oEditableUI.n_root, edit_element);
	//	#region delete
	//	if (keyboard_check_released(vk_delete) and ele != undefined and mouse_in_area_gui([x, y, x + width, y + height]) and deltimer == 0) {
	//		deltimer = 60;
	//	    flexpanel_node_remove_child(oEditableUI.n_root, ele);
	//		ele = undefined;
	//		with (oUIElement) {
	//			if (data.owner != "editor_base") {
	//			    instance_destroy();
	//			}
	//		}
	//		oEditableUI.recalculate();
	//	}
	//	#endregion
		#region resize
		#region left
		if (mouse_in_area_gui([x - 2, y, x + 2, y + height])) {
			draw_line_width_color(x, y, x, y + height, 3, c_purple, c_purple);
			if (device_mouse_check_button_pressed(0, mb_left)) {
				resizing = "left";
			}
		}
		#endregion
		#region right
		if (mouse_in_area_gui([x + width - 2, y, x  + width + 2, y + height])) {
			draw_line_width_color(x + width, y, x  + width, y + height, 3, c_purple, c_purple);
			if (device_mouse_check_button_pressed(0, mb_left)) {
				resizing = "right";
			}
		}
		#endregion
		#region up
		if (mouse_in_area_gui([x, y - 2, x + width, y + 2])) {
			draw_line_width_color(x, y, x + width, y, 3, c_purple, c_purple);
			if (device_mouse_check_button_pressed(0, mb_left)) {
				resizing = "up";
			}
		}
		#endregion
		#region down
		if (mouse_in_area_gui([x, y + height - 2, x + width, y + height + 2])) {
			draw_line_width_color(x, y + height, x + width, y + height, 3, c_purple, c_purple);
			if (device_mouse_check_button_pressed(0, mb_left)) {
				resizing = "down";
			}
		}
			#endregion
			if (resizing != noone and device_mouse_check_button(0, mb_left) and name != undefined) {
				var ele = data.owner.get_child(name);
				var w = flexpanel_node_style_get_width(ele);
				w = w.value;
				var h = flexpanel_node_style_get_height(ele);
				h = h.value;
				switch (resizing) {
				    case "right":
				        flexpanel_node_style_set_width(ele, mouse_x - x, flexpanel_unit.point);
						var w = flexpanel_node_style_get_width(ele);
						w = w.value;
				        break;
				    case "left":
				        flexpanel_node_style_set_width(ele, w - mouse_x, flexpanel_unit.point);
						var w = flexpanel_node_style_get_width(ele);
						w = w.value;
				        break;
				    case "up":
				        flexpanel_node_style_set_height(ele, h - mouse_y, flexpanel_unit.point);
						var h = flexpanel_node_style_get_height(ele);
						h = h.value;
				        break;
				    case "down":
				        flexpanel_node_style_set_height(ele, mouse_y - y, flexpanel_unit.point);
						var h = flexpanel_node_style_get_height(ele);
						h = h.value;
				        break;
				}
				draw_set_color(c_orange);
				draw_rectangle(x, y, x + w, y + h, true);
				draw_set_color(c_white);
			}
			if (resizing != noone and device_mouse_check_button_released(0, mb_left)) {
				edit_element = undefined;
				resizing = noone;
				data.owner.recalculate();
			}
	//		//resizing = true;
	//		//with (oUIElement) {
	//		//	if (data.owner != "editor_base") {
	//		//	    instance_destroy();
	//		//	}
	//		//}
	//		//oEditableUI.recalculate();
	//	}
	//	#endregion
	//	draw_text(mouse_x, mouse_y, ele);
    //}
    
    //if (panel != undefined and type == "panel" and flexpanel_node_get_num_children(panel) == 0) {
    //	can_drag_panel = true;
    //}
    
	var _color = "[c_blue]";
	if (global.edit_node == name ) {
	    _color = "[c_red]";
	}
    draw_rectangle(x, y, x + width, y + height, 1);
	scribble($"{_color}[fa_center][fa_middle]{name}").draw(x + (width / 2), y + (height / 2));
	draw_set_color(c_white);
}
scribble($"[c_blue][fa_center][fa_middle]{type}").draw(x + (width / 2), y + (height / 2));