extends Node


@export var trace_level := 5

func trace(level, text):
	if level >= trace_level:
		print(text)
