clear all
close all

% Load map and create occupancy grid object
load exampleMaps.mat
map = binaryOccupancyMap(simpleMap,2);

% Create planner object
prmSimple = mobileRobotPRM;
prmSimple.Map = map;
prmSimple.NumNodes = 2500;

% Set start and goal for planning
startLocation = [2 1];
endLocation = [12 10];

% Explore different connection distances
connDistvect = [1, 2, 3, 5, 7, 9, 12];

results(length(connDistvect))=struct('NumNodes', [], 'ConnectionDistance', [], 'Troadmap', [], 'Tplan', [], 'length', []);
for idx = 1:length(connDistvect)
    % Initialize the random number generator
    rng(100,'twister');
    
    % Set PRM connection distance
    prmSimple.ConnectionDistance = connDistvect(idx);
    results(idx).NumNodes = prmSimple.NumNodes;
    results(idx).ConnectionDistance = connDistvect(idx);
    
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
figure,plot(connDistvect,[results.length], connDistvect,[results.length],'x'),grid,...
    xlabel('Connection distance'),ylabel('Path length [m]'),xticks(connDistvect)
figure,plot(connDistvect,[results.Troadmap], connDistvect,[results.Troadmap],'x'),grid,...
    xlabel('Connection distance'),ylabel('Roadmap construction time [s]'),xticks(connDistvect)
figure,plot(connDistvect,[results.Tplan], connDistvect,[results.Tplan],'x'),grid,...
    xlabel('Connection distance'),ylabel('Planning time [s]'),xticks(connDistvect)
