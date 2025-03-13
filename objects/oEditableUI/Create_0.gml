randomize();
edit_node = undefined;
node = undefined;
creating = false;
str = {
	//{ 
		name : "base",
		width : display_get_gui_width(),
		height : display_get_gui_height(),
		nodes : [
			{
				  "name":"panel_base",
				  "left" :300,
				  "top" :150,
				  "padding":0.0,
				  "width":400.0,
				  "data":{
				    "inst":"@ref instance(100002)"
				  },
				  "height":300.0,
			},
			{
				  "name":"panel_base2",
				  "left" :800,
				  "top" :150,
				  "padding":0.0,
				  "width":400.0,
				  "data":{
				    "inst":"@ref instance(100002)"
				  },
				  "height":300.0,
			}
		]
	//}
}
global.player_info_ui.left = 300;
global.player_info_ui.top = 150;
//ui = new window(global.player_info_ui);
ui = new window(str);

new_window = function() {
	ui.dispose();
	ui = new window(str);
	ui.edit_mode(true);
}

save = function() {
	var f = file_text_open_write("test");
	var str = flexpanel_node_get_struct(ui.root);
	file_text_write_string(f, json_stringify(str, true));
	file_text_close(f);
}

load = function() {
	ui.dispose();
	ui = new window(json_parse(buffer_read(buffer_load("test"), buffer_text)));
	ui.edit_mode(true);
}

