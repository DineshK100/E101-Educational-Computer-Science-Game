/// @description Insert description here
// You can write your code in this editor


// Mouse Left Pressed Event in task_1
if (instance_exists(obj_gameController) && obj_gameController.currentTask == Tasks.Task4) {
    with (obj_gameController) {
        event_user(0); // Call User Defined 0 to advance to the next task
    }
}