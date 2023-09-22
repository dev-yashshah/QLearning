function simulate(q_table, init_pos, target, color)

current_pos = init_pos;

% the loop terminates in two situations:
% a) the target position is reached;
% b) the path goes out of the map border (Matlab exception).
while current_pos(1) ~= target(1) || current_pos(2) ~= target(2)
   plotCircle(current_pos(1), current_pos(2), color);
   hold on;

   % finding the action which gives you the highest quality,
   % and keep this best action in the variable action
   action=1;
   quality=q_table(current_pos(1), current_pos(2), action);

   if quality<q_table(current_pos(1), current_pos(2), 2)
       action=2;
       quality=q_table(current_pos(1), current_pos(2), 2);
   end

   if quality<q_table(current_pos(1), current_pos(2), 3)
       action=3;
       quality=q_table(current_pos(1), current_pos(2), 3);
   end

   if quality<q_table(current_pos(1), current_pos(2), 4)
       action=4;
   end
   
   switch action
       case 1
           current_pos(1) = current_pos(1) - 1;
       case 2
           current_pos(1) = current_pos(1) + 1;
       case 3
           current_pos(2) = current_pos(2) + 1;
       case 4
           current_pos(2) = current_pos(2) - 1;
   end
   
   pause(0.1);
end

plotCircle(target(1), target(2), color);

end