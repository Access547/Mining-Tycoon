extends Node

var player
var playerCanMove = true
var playerSpawnPos
var pickLevel = 1
var interacting

func use_slot_data(slot_data: SlotData):
	slot_data.item_data.use(player)

	
