class_name OrbitShieldDecorator
extends PowerupDecorator

const ORBIT_SHIELDS := preload("res://scenes/powerups/orbit_shields.tscn")

var _ring: Node3D

func on_apply() -> void:
	_ring = ORBIT_SHIELDS.instantiate()
	fox.shield_charges = _ring.count
	fox.add_child(_ring)

func on_remove() -> void:
	fox.shield_charges = 0
	if is_instance_valid(_ring):
		_ring.queue_free()
