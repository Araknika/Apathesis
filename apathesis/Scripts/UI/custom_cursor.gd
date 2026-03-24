extends Node

const POINT: Texture2D = preload("res://Assets/Cursors/point.png")
const HAND_POINT: Texture2D = preload("res://Assets/Cursors/hand_point.png")

func make_scaled_cursor(texture: Texture2D, scale: int) -> Texture2D:
	var img: Image = texture.get_image()
	
	var new_size: Vector2i = img.get_size() * scale
	img.resize(new_size.x, new_size.y, Image.INTERPOLATE_NEAREST)
	
	var new_texture := ImageTexture.create_from_image(img)
	return new_texture

func _ready() -> void:
	var point_scaled = make_scaled_cursor(POINT, 4)
	var hand_scaled = make_scaled_cursor(HAND_POINT, 4)

	Input.set_custom_mouse_cursor(point_scaled, Input.CURSOR_ARROW, Vector2(8, 0))
	Input.set_custom_mouse_cursor(hand_scaled, Input.CURSOR_FORBIDDEN, Vector2(16, 0))
	Input.set_custom_mouse_cursor(hand_scaled, Input.CURSOR_DRAG, Vector2(16, 0))
	Input.set_custom_mouse_cursor(hand_scaled, Input.CURSOR_CAN_DROP, Vector2(16, 0))
