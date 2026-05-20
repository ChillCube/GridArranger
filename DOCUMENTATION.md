# GridArranger API Reference
Generated: 2026-05-20

Arranges and creates nodes in a grid

## Class: GridArranger2D
@export
		slot_=
		var
			push_error("GridArranger2D:
**Inherits:** [NodeArranger](git@github.com:ChillCube/2d_node_arranger/blob/main/DOCUMENTATION.md)


### ⚙️ Inspector Variables (Exported)
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| **slot_class_name** | `String` | `"Node2D"` | Class name of the node to instantiate for each grid cell (override in subclass via override_slot_class) |
| **grid_length** | `int:` | `-` | Number of columns; also sets NodeArranger.max_horizontal and rebuilds cells |
| **grid_height** | `int:` | `-` | Number of rows; also sets NodeArranger.max_vertical and rebuilds cells |

### 🛠️ Methods
| Method | Arguments | Returns | Description |
| :--- | :--- | :--- | :--- |
| **child_modifyer()** | `child : Node2D` | `Node2D` |  stub to add your own child modification logic |
| **adding_child()** | `child`<br>`id : int` | `void` |  Stub called before each slot child is added; override to initialise cells by index |
| **override_slot_class()** | `val : String` | `String` |  Stub: override to force a different class name regardless of what the inspector sets |

---

