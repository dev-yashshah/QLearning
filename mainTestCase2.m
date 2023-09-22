%TestCase 2
clear;

% reading and parsing a map
map = buildMap('map2.bmp', 30,30);

% plotting the map abstraction
plotMap(map);

% defining the target position
target = [5, 30];
plotCircle(target(1),target(2),'b');

numIter=2000;

% performing the Q learning algorithm
q_table = q_learning(map, target, numIter);

pause(2);

%Run TestCase 2
simulate(q_table, [25,10], target, 'b');
