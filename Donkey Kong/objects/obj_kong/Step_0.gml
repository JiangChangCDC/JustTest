if (place_meeting(x,y,obj_player))
{
	global.score = obj_player.player_score;
	
	if (global.score > global.highest_score)
	{
		global.highest_score = global.score;
	}
	
	room_goto(rm_win);
}
