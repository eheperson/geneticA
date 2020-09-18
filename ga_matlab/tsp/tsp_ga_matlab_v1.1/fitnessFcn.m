function [fitness_val] = fitnessFcn(X)
    
    costMatrix = [ 0 490 940 900 550; ...
                   490 0 450 580 540; ...
                   940 450 0 570 730; ...
                   900 580 570 0 470; ...
                   550 540 730 470 0 ];
    cost = 0;
    
    for k = 1:5
        if k < 5
            cost = cost + costMatrix(X(k), X(k+1));
        elseif k == 5
            cost = cost + costMatrix(X(k), X(1));
        end
    end
    fitness_val = cost;
end