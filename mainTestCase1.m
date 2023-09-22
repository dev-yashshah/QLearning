%TestCase 1
clear;

% reading and parsing a map
map = buildMap('map1.bmp', 20,20);

% plotting the map abstraction
plotMap(map);

% defining the target position
target = [12, 15];
plotCircle(target(1),target(2),'b');

%numIter=1000;
numIter=450;

% performing the Q learning algorithm
q_table = q_learning(map, target, numIter);

pause(2);

%Run TestCase 1
simulate(q_table, [5,4], target, 'b');
