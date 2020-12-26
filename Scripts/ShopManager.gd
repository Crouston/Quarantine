extends Node

var ItemName
var Quantity = 1

func buy_item():
	PlayerInventory.add_item(ItemName,Quantity)
	Quantity = 1
