if (keyboard_check_released(vk_f5)) {
	add_to_list(oEditableUI.ui.root);
}
if (keyboard_check_released(vk_f4)) {
    ui.node_visible("panel_side_ignore");
	ui.node_visible("panel_side");
}