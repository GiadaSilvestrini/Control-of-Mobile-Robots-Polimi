clear all
close all

% Load map and create occupancy grid object
load exampleMaps.mat
map = binaryOccupancyMap(simpleMap,2);

% Create planner object
prmSimple = mobileRobotPRM;
prmSimple.Map = map;
prmSimple.ConnectionDistance = 2;

% Set start and goal for planning
startLocation = [2 1];
endLocation = [12 10];

% Explore different number of sampled nodes
Nvect = [25, 50, 100, 150, 250, 500, 1000, 2500, 5000, 7500, 10000];

results(length(Nvect))=struct('NumNodes', [], 'Troadmap', [], 'Tplan', [], 'length', []);
for idx = 1:length(Nvect)
    % Initialize the random number generator
    rng(100,'twister');

    % Set number of nodes
    prmSimple.NumNodes = Nvect(idx);
    results(idx).NumNodes = Nvect(idx);
    
    % Create the roadmap
    tic;
    update(prmSimple);
    results(idx).Troadmap = toc;

    % Compute a path
    tic;
    path = findpath(prmSimple,startLocation,endLocation);
    results(idx).Tplan = toc;
    
    if (~isempty(path))
        results(idx).length = sum(sqrt(diff(path(:,1)).^2+diff(path(:,2)).^2));
    else
        results(idx).length = nan;
        results(idx).Tplan = nan;
        results(idx).Troadmap = nan;
    end
end

% Plot results
figure,plot(Nvect,[results.length], Nvect,[results.length],'x'),grid,...
    xlabel('Number of nodes'),ylabel('Path length [m]')
figure,plot(Nvect,[results.Troadmap], Nvect,[results.Troadmap],'x'),grid,...
    xlabel('Number of nodes'),ylabel('Roadmap construction time [s]')
figure,plot(Nvect,[results.Tplan], Nvect,[results.Tplan],'x'),grid,...
    xlabel('Number of nodes'),ylabel('Planning time [s]')
