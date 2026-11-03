class_name OrbitBladeDecorator
extends PowerupDecorator

const ORBIT_BLADES := preload("res://scenes/powerups/orbit_blades.tscn")

var _ring: Node3D

func on_apply() -> void:
	_ring = ORBIT_BLADES. instantiate()
	fox.add_child(_ring)

func on_remove() -> void:
	if is_instance_valid(_ring):
		_ring. queue_free()
