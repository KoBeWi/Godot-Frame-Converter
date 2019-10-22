tool
extends EditorScript

enum {SUCCESS, ERR_NO_FRAMES, ERR_NO_SPRITE}

func _run() -> void:
	var player := get_editor_interface().get_selection().get_selected_nodes().front() as AnimationPlayer
	var result := ERR_NO_FRAMES
	
	if player:
		for anim_name in player.get_animation_list():
			var animation := player.get_animation(anim_name)
			
			for i in animation.get_track_count():
				var path := animation.track_get_path(i)
				
				if path.get_subname(path.get_subname_count() - 1) == "frame":
					var sprite: Sprite = player.get_node_or_null(str(player.root_node, "/", path))
					
					if sprite:
						var new_path := NodePath(str(player.get_node(player.root_node).get_path_to(sprite), ":frame_coords"))
						if result != ERR_NO_SPRITE:
							result = SUCCESS
						
						animation.track_set_path(i, new_path)
						for j in animation.track_get_key_count(i):
							var old_value: int = animation.track_get_key_value(i, j)
							var new_value := Vector2(old_value % sprite.hframes, old_value / sprite.hframes)
							
							animation.track_set_key_value(i, j, new_value)
					else:
						result = ERR_NO_SPRITE
		
		match result:
			SUCCESS:
				print("Animations updated sucessfully.")
			ERR_NO_FRAMES:
				printerr("No 'frame' animation tracks found.")
			ERR_NO_SPRITE:
				printerr("Some Sprite nodes were invalid.")
	else:
		printerr("Please select an AnimationPlayer node.")
