extends Node2D

func _ready() -> void:
	var etage = get_parent().get_parent()
	$Path.From = etage.Level
	$Path.To = etage.etageSuivant.Level
	$Path.playerRenderingLayer = etage.etageSuivant.playerRenderingLayer
	$Path.renderingLayer = etage.playerRenderingLayer
	$Path.numberOfLayers = etage.etageSuivant.numberOfLayers
