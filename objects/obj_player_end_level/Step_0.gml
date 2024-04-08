// This runs the parent's Step event.
event_inherited();



// This checks if the current X position is not equal to the end gate's X position, meaning the
// player is not standing in the center of the gate.
// In that case we want to move it there before fading it.

// This else part runs when the player is standing at the center of the gate, meaning it can fade now.

	// This changes the sprite to the idle sprite as the player is now standing.
	sprite_index = spr_player_idle;

	// This reduces the alpha of the instance, making it fade away.
	image_alpha += -0.02;

	// This sets the animation speed back to normal (as it was changed during the walking state).
	image_speed = 1;

	// This checks if the alpha is at or below 0, meaning the instance is invisible now.
	if (image_alpha <= 0)
	{
		// In that case we move to the next room.
		room_goto_next();
	}