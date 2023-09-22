%TestCase 4
clear;

% reading and parsing a map
map = buildMap('map4.bmp', 40,40);

% plotting the map abstraction
plotMap(map);

% defining the target position
target = [40, 40];
plotCircle(target(1),target(2),'b');

numIter=6000;

% performing the Q learning algorithm
q_table = q_learning(map, target, numIter);

pause(2);

%Run TestCase 4
simulate(q_table, [40,1], target, 'b');