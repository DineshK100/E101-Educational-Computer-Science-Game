// Set horizontal and vertical alignment for text
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Set the color and alpha for the box
draw_set_color(c_yellow); // Set the color of the box to yellow
draw_set_alpha(0.5); // Set the transparency of the box. Adjust as needed.

// Calculate text width and height for the box size, add a little padding
var padding = 10;
var textWidth = string_width(taskTexts[currentTask]) + padding * 2;
var textHeight = string_height(taskTexts[currentTask]) + padding;

// Draw the box behind the text
draw_rectangle(10 - padding / 2, 10 - padding / 2, 10 + textWidth, 10 + textHeight, false);

// Reset alpha to fully opaque for the text and set the text color
draw_set_alpha(1); // Reset alpha so the text is not transparent
draw_set_color(c_black); // Assuming you want the text in black or choose any color

// Draw the text on top of the box
draw_text(10, 10, taskTexts[currentTask]);