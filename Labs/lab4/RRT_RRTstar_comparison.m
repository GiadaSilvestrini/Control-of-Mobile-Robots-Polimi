clear all
close all

% Load map and create occupancy grid object
load exampleMaps.mat
map = binaryOccupancyMap(complexMap,2);

% Set state space type and bound
bounds = [map.XWorldLimits; map.YWorldLimits; [-pi pi]]; % Bounds on configuration variables
space = stateSpaceSE2(bounds);

% Create collision checker
stateValidator = validatorOccupancyMap(space); 
stateValidator.Map = map;
stateValidator.ValidationDistance = 0.01; % Distance for path discretization

% Create RRTstar planner
RRTstar = plannerRRTStar(space, stateValidator);
RRTstar.BallRadiusConstant = 200;
RRTstar.ContinueAfterGoalReached = true;
RRTstar.MaxIterations = 50000;
RRTstar.MaxNumTreeNodes = 20000;
RRTstar.MaxConnectionDistance = 0.2;
RRTstar.GoalBias = 0.05;
RRTstar.GoalReachedFcn = @isGoalReached;

% Create RRT planner
RRT = plannerRRT(space, stateValidator);
RRT.MaxIterations = 50000;
RRT.MaxNumTreeNodes = 20000;
RRT.MaxConnectionDistance = 0.2;
RRT.GoalBias = 0.05;
RRT.GoalReachedFcn = @isGoalReached;

% Select start and goal, and plan a path
start = [1, 1, 0];
goal = [20, 20, pi/2];

% Initialize the random number generator
rng(100,'twister');

% Compute a path
tic;
[pthObj, solnInfo] = plan(RRT, start, goal);
RRT_Tplan = toc;
RRT_path = pthObj;
RRT_solution = solnInfo;
RRT_length = sum(sqrt(diff(RRT_path.States(:,1)).^2+diff(RRT_path.States(:,2)).^2));

% Initialize the random number generator
rng(100,'twister');

% Compute a path
tic;
[pthObj, solnInfo] = plan(RRTstar, start, goal);
RRTstar_Tplan = toc;
RRTstar_path = pthObj;
RRTstar_solution = solnInfo;
RRTstar_length = sum(sqrt(diff(RRTstar_path.States(:,1)).^2+diff(RRTstar_path.States(:,2)).^2));

% Plot results
figure,show(map),hold on
plot(RRTstar_solution.TreeData(:,1), RRTstar_solution.TreeData(:,2), '.-')

plot(RRTstar_path.States(:,1), RRTstar_path.States(:,2), 'r-', 'LineWidth', 2),hold off

figure,show(map),hold on
plot(RRT_solution.TreeData(:,1), RRT_solution.TreeData(:,2), '.-')

plot(RRT_path.States(:,1), RRT_path.States(:,2), 'r-', 'LineWidth', 2),hold off

disp(['RRT planning time: ', mat2str(RRT_Tplan)]);
disp(['RRT path length: ', mat2str(RRT_length)]);
disp(['RRT* planning time: ', mat2str(RRTstar_Tplan)]);
disp(['RRT* path length: ', mat2str(RRTstar_length)]);


% GoalReached function
function isReached = isGoalReached(planner, goalState, newState)
    isReached = false;
    threshold = 0.05;
    if planner.StateSpace.distance(newState, goalState) < threshold
        isReached = true;
    end
end