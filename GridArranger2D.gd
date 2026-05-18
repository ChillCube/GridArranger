extends NodeArranger
class_name GridArranger2D

@export var grid_length : int:
	set(val):
		grid_length = val;
		max_horizontal = grid_length;
		_createItemFrames()

@export var grid_height : int:
	set(val):
		grid_height = val;
		max_vertical = grid_height;
		_createItemFrames()

func _createItemFrames() -> void:
	while get_children().size() > grid_length * grid_height:
		get_child(0).queue_free();
	while get_children().size() < grid_length * grid_height:
		var new_frame = ItemFrame2D.new();
		add_child(child_modifyer(new_frame));

func child_modifyer(child : Node2D) -> Node2D: ## stub to add your own child modification logic
	return child
