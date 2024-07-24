// barrels created after delay
timer ++;
if (timer >= delay)
{
	var new_instance;
	new_instance = instance_create_layer(x, y, "Instances", obj_barrel);
	
	timer = 0;
}



// move
x += move_speed;
if (place_meeting(x,y,obj_direction_turner))
{
	move_speed = move_speed * -1;
	image_speed = image_speed * -1;
}


// fall
if (!place_meeting(x,y,obj_floor))
{
	y += fall_gravity;
}




// die when player jumps on the barrel

if (instance_place(x, y-30, obj_player) && !is_destroyed)
{
    is_destroyed = true; 
    
    // add scores
    show_debug_message("clear");
    obj_player.player_score += 100;
    
    instance_deactivate_object(self);
    instance_destroy(); 
}


// instance destroy
if (x < 10 || x > room_width)
{
	instance_destroy();
}


