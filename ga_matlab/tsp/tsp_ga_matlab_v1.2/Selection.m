function [Parent1, Parent2] = Selection(pop)

    M = length(pop.Chromosomes);
    
    cumsum = zeros(1,M);
    
    [sorted_fitness, sortedx] = sort([pop.Chromosomes(:).normalized_fitness], 'descend');
    
    for i = 1 : M
       for j = i : M
           cumsum(i) = cumsum(i) + sorted_fitness(j);
           
       end 
       
    end
    

    R = rand();
    
    if cumsum(2) < R && R <= cumsum(1)
        p1x = sortedx(1);
    end
    if cumsum(3) < R && R <= cumsum(2)
        p1x = sortedx(2);
    end
    if cumsum(4) < R && R <= cumsum(3)
        p1x = sortedx(3);
    end
    if cumsum(5) < R && R <= cumsum(4)
        p1x = sortedx(4);
    end
    if cumsum(6) < R && R <= cumsum(5)
        p1x = sortedx(5);
    end
    if 0 <= R && R <= cumsum(6)
        p1x = sortedx(6);
    end
    
    p2x = p1x;
    
    while p1x == p2x
        
        R = rand();
        
        if cumsum(2) < R && R <= cumsum(1)
            p2x = sortedx(1);
        end
        if cumsum(3) < R && R <= cumsum(2)
            p2x = sortedx(2);
        end
        if cumsum(4) < R && R <= cumsum(3)
            p2x = sortedx(3);
        end
        if cumsum(5) < R && R <= cumsum(4)
            p2x = sortedx(4);
        end
        if cumsum(6) < R && R <= cumsum(5)
            p2x = sortedx(5);
        end
        if 0 < R && R <= cumsum(6)
            p2x = sortedx(6);
        end
        
    end
    
    Parent1 = pop.Chromosomes(sortedx(p1x));
    Parent2 = pop.Chromosomes(sortedx(p2x));
    
end