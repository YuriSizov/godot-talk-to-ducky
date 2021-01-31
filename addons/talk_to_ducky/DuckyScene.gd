tool
extends Node

enum State {
	IDLE,
	FIDGETY,
	NODDING,
}

# Private properties
var _animation_state : int = 0
var _animation_map : Dictionary = {
	State.IDLE: "",
	State.FIDGETY: "idle_fidgety",
	State.NODDING: "idle_nod",
}

var _rng : RandomNumberGenerator

# Node references
onready var animation_player : AnimationPlayer = $Ducky/AnimationPlayer

func _ready() -> void:
	_rng = RandomNumberGenerator.new()
	_rng.randomize()
	_rng.randomize()
	
	animation_player.connect("animation_finished", self, "_on_animation_finished")
	_play_state_animation()

func _process(delta: float) -> void:
	if (_animation_state != State.IDLE):
		return
	
	var rand = _rng.randf()
	if (rand < 0.01):
		set_state(State.FIDGETY)
	elif (rand > 0.02 && rand < 0.05):
		set_state(State.NODDING)

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
		animation_player.stop(true)
		return
	
	var animation_name = _animation_map[_animation_state]
	if (animation_name != "" && animation_player.has_animation(animation_name)):
		animation_player.play(animation_name)

# Handlers
func _on_animation_finished(animation_name : String) -> void:
	set_state(State.IDLE)
