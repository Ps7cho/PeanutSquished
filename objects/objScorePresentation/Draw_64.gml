/// @description Insert description here
// You can write your code in this editor

var scoresSpacing = 30;
var startDrawPositionX = 1800;
var startDrawPositionY = 20

draw_set_color(c_white);
draw_set_halign(fa_right);

// Draw scoreboard title
draw_text(startDrawPositionX, startDrawPositionY, "Void Sandwiches Made");
startDrawPositionY += 30;

// Draw Scores
if highScoreList == noone {
	draw_text(startDrawPositionX, startDrawPositionY, "None");
} else {
	var scoresCount = ds_list_size(highScoreList);
		
	// Only grab the top five results
	var scoresToDisplay = scoresCount;
	if scoresToDisplay > 5 {
		scoresToDisplay = 5;	
	}
		
	for (var i = 0; i < scoresToDisplay; i++) {
		var playerInfo = ds_list_find_value(highScoreList, i);
		
		debug_event(playerInfo);
		
		var playerName = noone;
		var playerScore = noone;
		if playerInfo != undefined {
			var playerName = ds_map_find_value(playerInfo, "name");
			var playerScore = ds_map_find_value(playerInfo, "score");
		}
		
			
		if playerName != undefined && playerScore != undefined {
			draw_text(startDrawPositionX, startDrawPositionY, string(playerName) + " - " + string(playerScore));
			startDrawPositionY += scoresSpacing;
		} else {
			// If for some reason, we couldn't display the client's score, increment the scores to display to 
			// look for the next client who we can display
			if scoresCount > scoresToDisplay {
				scoresToDisplay++;	
			}
		}
	}
}
