extends Node3D

const SHIELD := preload("res://scenes/powerups/shield.tscn")

@export var count := 3
@export var radius := 1.5

@export var height := 0.6

@export var turn_time := 2.0

var angle := 0.0
var _fox: Node
var _shields: Array[Node3D] = []


func _ready() -> void:
	_fox = get_parent()
	for i in count:
		var shield: Node3D = SHIELD.instantiate()
		add_child(shield)
		_shields.append(shield)
	_place_shields()


func _physics_process(delta: float) -> void:
	angle = wrapf(angle + TAU / turn_time * delta, 0.0, TAU)
	while _shields.size() > _fox.shield_charges:
		var shield: Node3D = _shields.pop_back()
		shield.pop()
	_place_shields()


func _place_shields() -> void:
	for i in _shields.size():
		var a := angle + i * TAU / count
		_shields[i].position = Vector3(cos(a), 0.0, sin(a)) * radius + Vector3(0.0, height, 0.0)
