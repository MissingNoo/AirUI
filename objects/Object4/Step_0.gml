/// @description Insert description here
// You can write your code in this editor
if (keyboard_check(vk_home)) {
    ui.dispose();
}
if (keyboard_check(vk_end)) {
    show_message(ui.get_element_data("button_play", "text"));
}