surf = surface_recreate(surf, 720, 523);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);
battleui.foreach(function(name, pos, data) {
	var spr = undefined;
	if (data[$ "image"] != undefined) { spr = asset_get_index(data.image); }
	if (spr == undefined or spr == -1) { spr = sBlank; }
	
	switch (name) {
	    case "enemy_hp_bar":
	        draw_sprite_stretched(spr, 0, pos.left, pos.top, pos.width, pos.height);
	        break;
	    case "hp_bar":
	        draw_sprite_stretched(spr, 0, pos.left, pos.top, pos.width, pos.height);
	        break;
	    case "poke_name":
	        scribble("[c_black]Gardevoir").fit_to_box(pos.width, pos.height).draw(pos.left, pos.top);
	        break;
	    case "poke_level":
	        scribble("[c_black]10").fit_to_box(pos.width, pos.height).draw(pos.left, pos.top);
	        break;
	    default:
	        draw_sprite_stretched(spr, 0, pos.left, pos.top, pos.width, pos.height);
	        break;
	}
});
surface_reset_target();
draw_surface(surf, 10, 10);
if (keyboard_check_released(ord("A"))) {
    battleui.set_data("enemy_poke_life", {left_offset : -800});
    battleui.set_data("own_poke_life", {left_offset : 800});
}