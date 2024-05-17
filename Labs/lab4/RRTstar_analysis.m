clear all
close all

% Load map and create occupancy grid object
load exampleMaps.mat
map = binaryOccupancyMap(simpleMap,2);

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
planner.ContinueAfterGoalReached = true;
planner.MaxIterations = 50000;
planner.MaxNumTreeNodes = 10000;
planner.MaxConnectionDistance = 0.1;
planner.GoalBias = 0.05;
planner.GoalReachedFcn = @isGoalReached;

% Select start and goal, and plan a path
start = [2, 1, 0];
goal = [12, 10, pi/2];

% Explore different goal biases
MaxNodevect = [1000, 2000, 5000, 10000, 20000, 30000, 40000];

results(length(MaxNodevect))=struct('NumNodes', [], 'Tplan', [], 'length', []);
for idx = 1:length(MaxNodevect)
    % Initialize the random number generator
    rng(100,'twister');

    % Set RRT* number of nodes
    planner.MaxNumTreeNodes = MaxNodevect(idx);

    % Compute a path
    tic;
    [pthObj, solnInfo] = plan(planner, start, goal);
    results(idx).Tplan = toc;
    
    if (solnInfo.IsPathFound)
        results(idx).length = solnInfo.PathCosts(end);
    else
        results(idx).length = nan;
        results(idx).Tplan = nan;    
    end
    
    results(idx).NumNodes = solnInfo.NumNodes;
end

% Plot results
figure,plot([results.NumNodes],[results.length],'x'),grid,...
    xlabel('Number of nodes'),ylabel('Path length [m]')
figure,plot([results.NumNodes],[results.Tplan],'x'),grid,...
    xlabel('Number of nodes'),ylabel('Planning time [s]')


% GoalReached function
function isReached = isGoalReached(planner, goalState, newState)
    isReached = false;
    threshold = 0.05;
    if planner.StateSpace.distance(newState, goalState) < threshold
        isReached = true;
    end
end