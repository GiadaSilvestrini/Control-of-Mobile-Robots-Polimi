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

% Create RRT planner
planner = plannerRRT(space, stateValidator);
planner.MaxConnectionDistance = 0.3;
planner.MaxIterations = 50000;
planner.MaxNumTreeNodes = 30000;
planner.GoalBias = 0.05;
planner.GoalReachedFcn = @isGoalReached;

% Select start and goal, and plan a path
start = [2, 1, 0];
goal = [12, 10, pi/2];

% Explore different goal biases
goalBiasvect = [0.05, 0.01, 0.005, 0.001, 0.0005, 0.0001];

results(length(goalBiasvect))=struct('Tplan', [], 'length', [], 'NumNodes', [], 'GoalBias', []);
for idx = 1:length(goalBiasvect)
    % Initialize the random number generator
    rng(100,'twister');

    % Set goal bias
    planner.GoalBias = goalBiasvect(idx);
    results(idx).GoalBias = planner.GoalBias;

    % Compute a path
    tic;
    [pthObj, solnInfo] = plan(planner, start, goal);
    results(idx).Tplan = toc;
    
    results(idx).NumNodes = solnInfo.NumNodes;
    
    if (solnInfo.IsPathFound)
        results(idx).length = sum(sqrt(diff(pthObj.States(:,1)).^2+diff(pthObj.States(:,2)).^2));
    else
        results(idx).length = nan;
        results(idx).Tplan = nan;
        results(idx).NumNodes = nan;
    end
    
    
end

% Plot results
figure,plot([results.GoalBias],[results.length], [results.GoalBias],[results.length],'x'),grid,...
    xlabel('Goal bias'),ylabel('Path length [m]')
figure,plot([results.GoalBias],[results.Tplan], [results.GoalBias],[results.Tplan],'x'),grid,...
    xlabel('Goal bias'),ylabel('Planning time [s]')
figure,plot([results.GoalBias],[results.NumNodes], [results.GoalBias],[results.NumNodes],'x'),grid,...
    xlabel('Goal bias'),ylabel('Number of nodes')



% GoalReached function
function isReached = isGoalReached(planner, goalState, newState)
    isReached = false;
    threshold = 0.05;
    if planner.StateSpace.distance(newState, goalState) < threshold
        isReached = true;
    end
end
