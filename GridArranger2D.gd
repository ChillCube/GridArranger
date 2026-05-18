@tool
extends NodeArranger
class_name GridArranger2D

@export var slot_class_name : String = "Node2D":
	set(val):
		slot_class_name = override_slot_class(val)

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
	var target := grid_length * grid_height
	while get_children().size() > target:
		get_child(get_children().size() - 1).free()
	while get_children().size() < target:
		var new_frame = _instantiate_slot(slot_class_name)
		if new_frame == null:
			push_error("GridArranger2D: could not instantiate class '" + slot_class_name + "'")
			break
		adding_child(new_frame, get_children().size())
		add_child(child_modifyer(new_frame));

func _instantiate_slot(class_str: String) -> Object:
	if ClassDB.class_exists(class_str):
		return ClassDB.instantiate(class_str)
	for entry in ProjectSettings.get_global_class_list():
		if entry["class"] == class_str:
			return load(entry["path"]).new()
	return null

func child_modifyer(child : Node2D) -> Node2D: ## stub to add your own child modification logic
	return child

func adding_child(child, id : int) -> void:
	pass

func override_slot_class(val : String) -> String:
	return val
