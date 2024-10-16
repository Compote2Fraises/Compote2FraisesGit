extends Node2D


func _ready() -> void:
	var etage = get_parent().get_parent()
	$Path.From = etage.etageSuivant.Level
	$Path.To = etage.Level
	$Path.playerRenderingLayer = etage.playerRenderingLayer
	$Path.renderingLayer = etage.playerRenderingLayer
	$Path.numberOfLayers = etage.numberOfLayers
