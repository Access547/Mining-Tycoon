extends Node

var player
var playerCanMove = true
var playerStartPoint

func use_slot_data(slot_data: SlotData):
	slot_data.item_data.use(player)

func place_player(location: Vector2, player):
	player.position = location
	
