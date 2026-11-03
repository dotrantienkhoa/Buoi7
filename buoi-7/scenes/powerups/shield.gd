extends Node3D

## One shield of the ring. pop() is called by the ring once this shield has blocked a hit.

func pop() -> void:
	var tween := create_tween()
	tween.tween_property(self, "scale", Vector3.ONE * 1.6, 0.15)
	tween.tween_callback(queue_free)
