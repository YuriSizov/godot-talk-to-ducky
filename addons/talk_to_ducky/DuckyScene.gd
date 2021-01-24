tool
extends Node

enum State {
	IDLE,
	LOOKING_AROUND,
	LISTENING,
}

# Private properties
var _animation_state : int = 0
var _animation_map : Dictionary = {
	State.IDLE: "idle",
	State.LOOKING_AROUND: "looking",
	State.LISTENING: "listening",
}

# Node references
onready var animation_player : AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	_play_state_animation()

# Public methods
func set_state(state : int) -> void:
	_animation_state = state
	_play_state_animation()

func clear_state() -> void:
	_animation_state = 0
	_play_state_animation()

# Helpers
func _play_state_animation() -> void:
	if (!_animation_map.has(_animation_state)):
		return
	
	var animation_name = _animation_map[_animation_state]
	animation_player.play(animation_name)
