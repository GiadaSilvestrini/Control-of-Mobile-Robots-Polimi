clear all
close all

% Load map and create occupancy grid object
load exampleMaps.mat
map = binaryOccupancyMap(simpleMap,2);
show(map)

pause;

% Set state space type and bound
bounds = [map.XWorldLimits; map.YWorldLimits; [-pi pi]]; % Bounds on configuration variables
space = stateSpaceSE2(bounds);

% Create collision checker
stateValidator = validatorOccupancyMap(space); 
stateValidator.Map = map;
stateValidator.ValidationDistance = 0.01; % Distance for path discretization

% Create RRTstar planner
planner = plannerRRTStar(space, stateValidator);
planner.BallRadiusConstant = 100;
planner.ContinueAfterGoalReached = false;
planner.MaxIterations = 30000;
planner.MaxNumTreeNodes = 10000;
planner.MaxConnectionDistance = 0.3;
planner.GoalBias = 0.05;
planner.GoalReachedFcn = @isGoalReached;

% Select start and goal, and plan a path
start = [2, 1, 0];
goal = [12, 10, pi/2];
[pthObj, solnInfo] = plan(planner, start, goal);

% Plot results
show(map),hold on
plot(solnInfo.TreeData(:,1), solnInfo.TreeData(:,2), '.-')

interpolate(pthObj,max(300,size(pthObj.States,1)));
plot(pthObj.States(:,1), pthObj.States(:,2), 'r-', 'LineWidth', 2),hold off

% GoalReached function
function isReached = isGoalReached(planner, goalState, newState)
    isReached = false;
    threshold = 0.05;
    if planner.StateSpace.distance(newState, goalState) < threshold
        isReached = true;
    end
end