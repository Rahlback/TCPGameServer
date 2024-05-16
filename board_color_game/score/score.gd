extends Node
class_name Score

static var max_score_change := 10.0
static var deviation_percent := 0.1

## Calculates score based on expected outcome and the actual outcome. [br]
## Players are not competing with each other directly, but instead compete with
## themselves. [br]
## [param players] = {player_id(int): [score (int), mmr(int)]} [br]
## [param possible_tiles] = The number of tiles that could have been 
## taken by any player [br]
## Scoring system: [br]
## 	awef
static func calculate_score(players: Dictionary, possible_tiles: int) -> Dictionary:
	var total_mmr = 0
	for player in players:
		total_mmr += players[player][1]
		
	var return_scores : Dictionary = {}
	
	for player in players:
		var p_mmr = players[player][1] / float(total_mmr)
		var p_score = players[player][0] / float(possible_tiles)
		# 0.2 - 0.3 = -0.1
		# -0.1 / 0.1 = -1
		# 
		var deviation = (p_score - p_mmr) / deviation_percent
		return_scores[player] = players[player][1] + clamp(max_score_change * deviation, -max_score_change, max_score_change)
	
	return return_scores
	
