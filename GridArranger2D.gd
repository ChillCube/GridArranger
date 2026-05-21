@tool
extends NodeArranger
class_name GridArranger2D

@export var slot_class_name : String = "Node2D": ## Class name of the node to instantiate for each grid cell (override in subclass via override_slot_class)
	set(val):
		slot_class_name = override_slot_class(val)

@export var grid_length : int: ## Number of columns; also sets NodeArranger.max_horizontal and rebuilds cells
	set(val):
		grid_length = val;
		max_horizontal = grid_length;
		_createItemFrames()

@export var grid_height : int: ## Number of rows; also sets NodeArranger.max_vertical and rebuilds cells
	set(val):
		grid_height = val;
		max_vertical = grid_height;
		_createItemFrames()

func _createItemFrames() -> void: ## Syncs child count to grid_length × grid_height, adding or removing slot nodes as needed
	var target := grid_length * grid_height
	while get_children().size() > target:
		get_child(get_children().size() - 1).free()
	while get_children().size() < target:
		var new_frame = _instantiate_slot(override_slot_class(slot_class_name))
		if new_frame == null:
			push_error("GridArranger2D: could not instantiate class '" + slot_class_name + "'")
			break
		adding_child(new_frame, get_children().size())
		add_child(child_modifyer(new_frame));
		new_frame = child_modifyer_after_creation(new_frame)

func _instantiate_slot(class_str: String) -> Object:
	if ClassDB.class_exists(class_str):
		return ClassDB.instantiate(class_str)
	for entry in ProjectSettings.get_global_class_list():
		if entry["class"] == class_str:
			return load(entry["path"]).new()
	return null

func child_modifyer(child : Node2D) -> Node2D: ## stub to add your own child modification logic
	return child

func child_modifyer_after_creation(child : Node2D) -> Node2D:
	return child

func adding_child(child, id : int) -> void: ## Stub called before each slot child is added; override to initialise cells by index
	pass

func override_slot_class(val : String) -> String: ## Stub: override to force a different class name regardless of what the inspector sets
	return val
