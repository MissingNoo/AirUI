if (mouse_in_area_gui([x, y, x + width, y + height]) and device_mouse_check_button_released(0, mb_left) and data.owner != oUI.ui and oUI.editingdepth >= depth and name != undefined) {
	oUI.load_info();
	oUI.editingdepth = 999999;
	//oUI.last_edit = oUI.editing;
}