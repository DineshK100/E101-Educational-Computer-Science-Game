if (showText && mouse_check_button_pressed(mb_left))
{
    // Re-calculate the button's position based on the same logic as in the Draw event
    var text_margin = 10;
    var button_padding = 10;
    var button_text = "OK";
    var displayText = "Welcome to the Game! This is an example message that adjusts dynamically.";

    // Text dimensions
    var text_width = string_width(displayText) + (text_margin);
    var text_height = string_height(displayText) + (2 * text_margin);

    // Button dimensions
    var button_height = string_height(button_text) + 20; // Add padding
    var button_width = string_width(button_text) + 40; // Add padding

    // Ensure text box is wide enough for the button
    if (text_width < button_width + (2 * button_padding)) {
        text_width = button_width + (2 * button_padding);
    }

    // Adjust text box height for the button
    text_height += button_height + button_padding;

    // Text box position
    var box_x = camera_get_view_x(view_camera[0]) + 50; // Adjust as needed
    var box_y = camera_get_view_y(view_camera[0]) + 300; // Adjust as needed

    // Button's dynamic position
    var button_x = box_x + text_width - button_width - button_padding;
    var button_y = box_y + text_height - button_height - button_padding;

    // Check if the mouse click is within the button's bounds
    if (mouse_x >= button_x && mouse_x <= button_x + button_width && mouse_y >= button_y && mouse_y <= button_y + button_height)
    {
        // Increment and check if there's a next message
    currentTextIndex += 1;
    if (currentTextIndex < array_length_1d(messages)) {
        displayText = messages[currentTextIndex]; // Update to next message
        showText = true; // Make sure to show the next message
    } else {
        // No more messages, or handle differently
        showText = false; // Hide text box if this was the last message
        currentTextIndex = 0; // Optionally reset the index or handle as needed
    }
    }
}