resizing = noone;
deltimer = 10;
draw_back = false;
bimg = 0;
image = -1;
index = irandom(10);
bar_image = -1;
bar_colour = -1;
bar_level = random_range(0, 1);
center_text = false;
draggable = false;
dragging = false;
if (data[$ "text"] != undefined) {
    text = data[$ "text"];
}

if (string_contains(name, "root")) {
    draw_back = true;
}

if (string_contains(name, "label")) {
	type = "label";
}

if (string_contains(name, "draggable")) {
    draggable = true;
}

if (string_contains(name, "panel")) {
	type = "panel";
    draw_back = true;
	bimg = 1;
}

if (string_contains(name, "center")) {
    center_text = true;
}

element = undefined;
if (string_contains(name, "textbox")) {
	type = "textbox";
    element = new textbox();
}
if (string_contains(name, "button")) {
	type = "button";
    element = new button(text);
}
if (element != undefined) {
    if (data[$ "f"] != undefined) {
        element.set_function(data.f);
    }
    element.position(x, y, x + width, y + height);
}