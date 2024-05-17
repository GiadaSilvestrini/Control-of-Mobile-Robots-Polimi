clear all
close all

% Load map and create occupancy grid object
load exampleMaps.mat
map = binaryOccupancyMap(simpleMap,2);
show(map)

pause;

% Create planner object
prmSimple = mobileRobotPRM;
prmSimple.Map = map;
prmSimple.NumNodes = 250;
prmSimple.ConnectionDistance = 2;

% Create the roadmap
update(prmSimple);
show(prmSimple)

pause;

% Set start and goal for planning
startLocation = [2 1];
endLocation = [12 10];

% Compute a path
path = findpath(prmSimple,startLocation,endLocation);
show(prmSimple)
