randomize();
edit_node = undefined;
node = undefined;
creating = false;
str = {
  "name":"panel_base",
  "flex":1.0,
  "padding":0.0,
  "width":400.0,
  "data":{
    "inst":"@ref instance(100002)"
  },
  "height":300.0,
}
n_root = flexpanel_create_node(str);
target_w = display_get_gui_width();
target_h = display_get_gui_height();
flexpanel_calculate_layout(n_root, target_w, target_h, flexpanel_direction.LTR);
generate_instance(n_root, 0, str[$ "name"]);

recalculate = function() {
	flexpanel_calculate_layout(n_root, target_w, target_h, flexpanel_direction.LTR);
	generate_instance(n_root, 0, str[$ "name"]);
}