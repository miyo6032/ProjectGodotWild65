extends HBoxContainer

var health = 3
@onready var health_icon_scene: PackedScene = load("res://health_icon.tscn")

func _ready():
    for i in health:
        add_child(health_icon_scene.instantiate())

func _on_player_player_damaged(damage_params):
    if health > 0:
        health -= 1
        get_child(0).queue_free()
