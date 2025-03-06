str = {
  "name":"editor_base",
  "flex":1.0,
  "padding":0.0,
  "width":1920.0,
  "data":{
    "inst":"@ref instance(100002)"
  },
  "height":1080.0,
    flexDirection : "row",
  "nodes":[
    {
    name : "panel_side",
    flex : 0.15,
nodes : [
    {
      "padding":10.0,
      "data":{
        "inst":"@ref instance(100007)"
      },
      "height":5.0,
      "name":"draggable_button",
      "flex":1.0
    },
    {
      "padding":10.0,
      "data":{
        "inst":"@ref instance(100006)"
      },
      "height":5.0,
      "name":"draggable_textbox",
      "flex":1.0
    },
    {
      "padding":10.0,
      "data":{
        "inst":"@ref instance(100005)"
      },
      "height":10.0,
      "name":"draggable_panel",
      "flex":1.0
    },
    {
      "padding":10.0,
      "data":{
        "inst":"@ref instance(100004)"
      },
      "height":10.0,
      "name":"draggable_label_7549",
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
    },
    {flex : 1, flexGrow: 1},

  ]
}
/**/
n_root = flexpanel_create_node(str);
target_w = display_get_gui_width();
target_h = display_get_gui_height();
flexpanel_calculate_layout(n_root, target_w, target_h, flexpanel_direction.RTL);
generate_instance(n_root, 0, str[$ "name"]);