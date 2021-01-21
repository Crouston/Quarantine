extends Node

var ItemName
var Quantity = 1
var Price = 0

func buy_item():
	PlayerInventory.add_item(ItemName,Quantity)
	GameManager.money -= get_price()
	Quantity = 1

func get_price() -> int:
	return Quantity * Price

