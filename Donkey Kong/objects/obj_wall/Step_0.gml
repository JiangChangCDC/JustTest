if (place_meeting(x,y,obj_player))
{
	obj_player.falling = true;
	obj_player.vertical_velocity = 0;
	obj_player.y += 5;
}