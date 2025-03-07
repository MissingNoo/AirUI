str = {
  "name":"editor",
  "flex":1.0,
  "padding":0.0,
  "width":1920.0,
  "data":{
    "inst":"@ref instance(100002)"
  },
  "height":1080.0,
    flexDirection : "row",
  "nodes":[
  {flex : 1, flexGrow: 1},
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
    

  ]
}
ui = new window(str);