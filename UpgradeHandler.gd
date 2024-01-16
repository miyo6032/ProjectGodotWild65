extends Node

@onready var shoot_handler = %ShootHandler

var upgrades_by_type = {}

func _ready():
    Console.add_command("upgrade", func(upgrade_name): add_upgrade(load("res://data/%s.tres" % upgrade_name)), 1)

func add_upgrade(upgrade: Upgrade):
    if not upgrades_by_type.has(upgrade.upgrade_type):
        upgrades_by_type[upgrade.upgrade_type] = []
        
    upgrades_by_type[upgrade.upgrade_type].append(upgrade)
    recalculate_upgrade_type(upgrade.upgrade_type)
    
func recalculate_upgrade_type(upgrade_type):
    var fire_rate_upgrade = 0.0
    
    for upgrade in upgrades_by_type[upgrade_type]:
        fire_rate_upgrade += upgrade.fire_rate
        
    shoot_handler.shoot_interval = shoot_handler.base_shoot_interval / (1 + fire_rate_upgrade)