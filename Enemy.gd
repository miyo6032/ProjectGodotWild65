extends Node3D

func _ready():
    await get_tree().create_timer(0.5).timeout
    queue_free()

func init(player):
    pass
