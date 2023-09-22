function reward = environment(pos, action, map, target)

max_x = size(map, 2);
max_y = size(map, 1);

switch action
    case 1      % going left
        % computing the immediate reward of performing the action
        % "going left" in the current position.
        if pos(1)==1
            reward=-100;
        else
            next_pos=[pos(1)-1, pos(2)];
            if map(next_pos(1),next_pos(2))==0
                reward=-100;
            elseif next_pos(1)==target(1) && next_pos(2)==target(2)
                reward=100;
            else
                reward=0;
            end
        end
    case 2      % going right
        % computing the immediate reward of performing the action
        % "going right" in the current position.
        if pos(1)==max_x
            reward=-100;
        else
            next_pos=[pos(1)+1, pos(2)];
            if map(next_pos(1),next_pos(2))==0
                reward=-100;
            elseif next_pos(1)==target(1) && next_pos(2)==target(2)
                reward=100;
            else
                reward=0;
            end
        end
    case 3      % going up
        % computing the immediate reward of performing the action
        % "going up" in the current position.
        if pos(2)==max_y
            reward=-100;
        else
            next_pos=[pos(1), pos(2)+1];
            if map(next_pos(1),next_pos(2))==0
                reward=-100;
            elseif next_pos(1)==target(1) && next_pos(2)==target(2)
                reward=100;
            else
                reward=0;
            end
        end
        
    case 4      % going down
        % computing the immediate reward of performing the action
        % "going down" in the current position.
        if pos(2)==1
            reward=-100;
        else
            next_pos=[pos(1), pos(2)-1];
            if map(next_pos(1),next_pos(2))==0
                reward=-100;
            elseif next_pos(1)==target(1) && next_pos(2)==target(2)
                reward=100;
            else
                reward=0;
            end
        end
end

end