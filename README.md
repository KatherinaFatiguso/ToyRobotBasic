# README

ToyRobot is a project to practice and hone my coding skills, especially focusing on TDD.

## To get started

Checkout Repo
Ensure you are using Ruby version ruby 2.2.1p85 (2015-02-26 revision 49769) [x86_64-darwin14]. Recommend using RVM for this.
Run bundle install
Run the following to create a database user (where localuser is a local account with sufficient priveleges to create a user with CREATEDB privilege:

psql -U localuser -d postgres -a -f db/scripts/create_default_user_account.sql

Run the following to create the databases (dev/test)

rake db:create

Run rake to run the build and tests

rake

=========
This ToyRobot app is based on the exercise found in RedWolf GitHub Repository:
https://github.com/DiscoverRedwolf/toyrobot.git

Toy Robot Simulator challenge

Description:

The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units
There are no other obstructions on the table surface
The robot is free to roam around the surface of the table, but must be prevented from falling to destruction
Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed
Create an application that can read in commands of the following form -

PLACE X,Y,F

MOVE

LEFT

RIGHT

REPORT

PLACE will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST.

The origin (0,0) can be considered to be the SOUTH WEST most corner.

The first valid command to the robot is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command. The application should discard all commands in the sequence until a valid PLACE command has been executed.

MOVE will move the toy robot one unit forward in the direction it is currently facing.

LEFT and RIGHT will rotate the robot 90 degrees in the specified direction without changing the position of the robot.

REPORT will announce the X,Y and F of the robot. This can be in any form, but standard output is sufficient.

A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT and REPORT commands.

Input can be from a file, or from standard input, as the developer chooses.

Provide test data to exercise the application.

Constraints: The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot. Any move that would cause the robot to fall must be ignored.



Example Input and Output:

a) PLACE 0,0,NORTH MOVE REPORT Output: 0,1,NORTH

b) PLACE 0,0,NORTH LEFT REPORT Output: 0,0,WEST

c) PLACE 1,2,EAST MOVE MOVE LEFT MOVE REPORT Output: 3,3,NORTH

Deliverables: The Ruby source files, the test data and any test code. It is not required to provide any graphical output showing the movement of the toy robot.

There are 2 tables: robots and movements.
Robots table is to store the current coordinate (x,y,f) of the robot and the Movement table is to store the name of the actions that have been performed on the robot.
A robot can have many movements.
These list of actions will be destroyed if the player pressed the 'Place to Origin' button and it will start again by positioning the robot on the origin (0,0, EAST).
