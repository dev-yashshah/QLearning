%TestCase 3
clear;

% reading and parsing a map
map = buildMap('map3.bmp', 50,50);

% plotting the map abstraction
plotMap(map);

% defining the target position
target = [29, 10];
plotCircle(target(1),target(2),'b');

numIter=3000;

% performing the Q learning algorithm
q_table = q_learning(map, target, numIter);

pause(2);

%Run TestCase 3
simulate(q_table, [1,50], target, 'b');
