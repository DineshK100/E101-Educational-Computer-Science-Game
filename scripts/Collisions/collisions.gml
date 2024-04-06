function check_collision(_move_x, _move_y) {
    // Early exit if neither collision tilemap is initialized
    if (!variable_instance_exists(obj_game_manager, "collision_tilemap") && !variable_instance_exists(obj_game_manager, "collision_tilemap2")) {
        // Attempt to initialize or log a warning/error
        return false;
    }

    // Object collision check
    if (place_meeting(x + _move_x, y + _move_y, obj_collision)) {
        return true;
    }

    // Slope tile indices
    var slopeRight = 30; // Rightward 45-degree slope
    var slopeLeft = 2;  // Leftward 45-degree slope

    // Improved slope detection
    var tileCheck = max(tilemap_get_at_pixel(obj_game_manager.collision_tilemap, x + _move_x, y + _move_y + 1), tilemap_get_at_pixel(obj_game_manager.collision_tilemap2, x + _move_x, y + _move_y + 1));

    // Adjust for slopes
    if (tileCheck == slopeRight || tileCheck == slopeLeft) {
        // Adjust movement based on slope
        _move_y += expectedYOnSlope(_move_x, tileCheck);
        // Apply the movement adjustments without returning, allowing movement along the slope
    } else {
        // Tile collision checks at character's bounding box corners for non-slope tiles
        var collisionPoints = [bbox_left + _move_x, bbox_right + _move_x];
        var hasCollision = false;

        for (var i = 0; i < array_length(collisionPoints); i++) {
            var pointX = collisionPoints[i];
            // Check at both top and bottom of bounding box to ensure solid tile collisions are caught, for both tilemaps
            if (tilemap_get_at_pixel(obj_game_manager.collision_tilemap, pointX, bbox_top + _move_y) ||
                tilemap_get_at_pixel(obj_game_manager.collision_tilemap, pointX, bbox_bottom + _move_y) ||
                tilemap_get_at_pixel(obj_game_manager.collision_tilemap2, pointX, bbox_top + _move_y) ||
                tilemap_get_at_pixel(obj_game_manager.collision_tilemap2, pointX, bbox_bottom + _move_y)) {
                hasCollision = true;
                break; // Exit loop if any collision is found
            }
        }

        if (hasCollision) {
            return true; // Collision with a non-slope tile
        }
    }

    // No collision detected
    return false;
}
