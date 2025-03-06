global.edit_node = undefined;
global.edit_element = undefined;
global.edit_mode = true;

function generate_instance(_node, _depth, owner = undefined)
{
	// Get layout data
	var _pos = flexpanel_node_layout_get_position(_node, false);
	var _name = flexpanel_node_get_name(_node);
	
	// Update instance
	var _data = flexpanel_node_get_data(_node);
    _data.owner = owner;
	if ((struct_exists(_data, "inst") and (is_string(_data.inst) or !instance_exists(_data.inst))) or !struct_exists(_data, "inst"))
	{
		// Create instance
		var _inst = instance_create_depth(_pos.left, _pos.top, _depth, oUIElement,
		{
			name: _name,
			width: _pos.width,
			height: _pos.height,
            data: _data
		});
	
		_data.inst = _inst;
	}
	else
	{
		var _inst = _data.inst;
		_inst.x = _pos.left;
		_inst.y = _pos.top;
		_inst.width = _pos.width;
		_inst.height = _pos.height;
        _inst.data = _data;
		with (_inst) {
			event_perform(ev_create, 0);
		}
	}
	
	// Call for children (recursive)
	var _children_count = flexpanel_node_get_num_children(_node);
	for (var i = 0; i < _children_count; i++)
	{
		var _child = flexpanel_node_get_child(_node, i);
		generate_instance(_child, _depth - 1, _data.owner);
	}
}