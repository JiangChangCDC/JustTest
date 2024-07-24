
if (!climbing_ladder)

// falling
if (!jumping && !place_meeting(x,y+10,obj_floor) && !place_meeting(x,y,obj_ladder))
{
	falling = true;
}

if (falling)
{
	vertical_velocity += fall_gravity;
	if (vertical_velocity > falling_max_velocity) vertical_velocity = falling_max_velocity;
	var vertical_check = 10;
	y += vertical_velocity;
	
	if (place_meeting(x,y+vertical_check,obj_floor))
	{
		var floor_instance = instance_place(x,y+vertical_check,obj_floor);
		y = floor_instance.y - sprite_height;
		
		vertical_velocity = 0;
		falling = false;
		on_floor = true;
	}
}


// jumping
if (jumping)
{
	if (keyboard_check(vk_space))
	{
		vertical_velocity -= jump_acceleration;
		y += vertical_velocity;
	}
		else 
	{
		jumping = false;
	}
	
	if (vertical_velocity < -jump_max_velocity) vertical_velocity = -jump_max_velocity;
	
	jump_timer ++;
	if(jump_timer > jump_duration)
	{
		jumping = false;
		jump_timer = 0;
	}
}

if (on_floor)
{
	if (keyboard_check_pressed(vk_space))
	{
		on_floor = false;
		jumping = true;
		
		vertical_velocity -= jump_initial_impulse;
	}
}



// moving
if (keyboard_check(ord("A")))
{
	x -= move_speed;
}

if (keyboard_check(ord("D")))
{
	x += move_speed;
}


// climbing ladder
if (place_meeting(x,y,obj_ladder))
{
	if (keyboard_check(ord("W")))
	{
		y -= climb_speed;
		on_floor = false;
		climbing_ladder = true;
	}
	
	if (keyboard_check(ord("S")))
	{
		y += climb_speed;
		on_floor = false;
		climbing_ladder = true;
	}
	else if (!keyboard_check(ord("W")) && !keyboard_check(ord("S")) && place_meeting(x,y+20,obj_floor))
    {
        climbing_ladder = false;
		on_floor = true;
    }
}
else
{
	climbing_ladder = false;
}


if (climbing_ladder)
{
	vertical_velocity = 0;
}





// fail by losing all hp
var barrel = instance_place(x, y, obj_barrel);

if (barrel != noone && !invincible && y > barrel.y - 30)
{
    hp--;
    
    invincible = true;
    show_debug_message(hp);
}


if (hp <= 0)
{
	room_goto(rm_fail);
}

if (invincible)
{
	invincible_timer ++;
	if (invincible_timer > invincible_duration)
	{
		invincible = false;
		invincible_timer = 0;
	}
}


// room boundary
if (x < sprite_width)
{
	x = sprite_width;
}

if (x > room_width - sprite_width)
{
	x = room_width - sprite_width;
}



