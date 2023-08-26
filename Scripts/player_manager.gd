extends Node

var player
var playerCanMove = true
var playerSpawnPos

func use_slot_data(slot_data: SlotData):
	slot_data.item_data.use(player)

	
