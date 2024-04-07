/// @description Insert description here
// You can write your code in this editor


// Mouse Left Pressed Event in task_1
if (instance_exists(obj_gameControllerLevel2) && obj_gameControllerLevel2.currentTask2 == Tasks2.Task2) {
    with (obj_gameControllerLevel2) {
        event_user(0); // Call User Defined 0 to advance to the next task
    }
}