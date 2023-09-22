function q_table = q_learning(map, target, numIter)

m = size(map, 2);
n = size(map, 1);

% initializing the Q table, it is a 3-D matrix
q_table = zeros(m, n, 4);


discount = 0.9;
learning_rate = 0.1;

for i = 1:numIter
    
    init_pos = [randi([1,m]), randi([1,n])]; % picking a random initial position
    
    current_pos = init_pos;

    while true
        action=randi([1,4]);
        if action==1 && current_pos(1)~=1
            next_pos=[current_pos(1)-1, current_pos(2)];
        elseif action==2 && current_pos(1)~=m
            next_pos=[current_pos(1)+1, current_pos(2)];
        elseif action==3 && current_pos(2)~=n
            next_pos=[current_pos(1), current_pos(2)+1];
        elseif action==4 && current_pos(2)~=1
            next_pos=[current_pos(1), current_pos(2)-1];
        end

        if map(current_pos(1),current_pos(2))==0
            break
        elseif current_pos==target
            break
        end

        q_table(current_pos(1),current_pos(2),action)=q_table(current_pos(1),current_pos(2),action) + learning_rate * (environment(current_pos,action,map,target)...
            + discount * max(q_table(next_pos(1),next_pos(2),:)) - q_table(current_pos(1),current_pos(2),action));

        current_pos=next_pos;
        % Iteratively expanding the path by randomly selecting an action
        % and updating the corresponding entry in the Q table using the
        % Bellman equation.
        % The loop terminates when an obstacle or the target is reached. 
    end
end