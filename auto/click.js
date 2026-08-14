const robot = require("robotjs");

setTimeout (() => {
    robot.moveMouse(500,300);
    while(true)robot.mouseClick();

}, 2000);