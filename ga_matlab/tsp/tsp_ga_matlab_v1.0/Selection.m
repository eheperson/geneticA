function [Parent1, Parent2] = SSelection(pop)

    M = length(pop.Chromosomes);

    [sorted_fitness, sortedx] = sort([pop.Chromosomes(:).normalized_fitness], 'descend');
    
    for i =  1 : M
        temppop.Chromosomes(i).Gene = pop.Chromosomes(sortedx(i)).Gene;
        temppop.Chromosomes(i).fitness = pop.Chromosomes(sortedx(i)).fitness;
        temppop.Chromosomes(i).normalized_fitness = pop.Chromosomes(sortedx(i)).normalized_fitness;
    end
    
    cumsum = zeros(1,M);
    
    for i = 1 : M
       for j = i : M
           cumsum(i) = cumsum(i) + temppop.Chromosomes(j).normalized_fitness;
       end 
    end
    cumsum
    R = rand()
    
    for i = 1 : M
       if R > cumsum(i)
           p1x = i - 1;
           break
       end
    end
    p1x
   
    p2x = p1x;
    
    while p1x == p2x
        R = rand();
        for i = 1 : M
            if R > cumsum(i)
                p2x = i - 1;
                break
            end
        end
    end
    p2x
    
    sortedx(p1x)
    sortedx(p2x)
    
    Parent1 = temppop.Chromosomes(sortedx(p1x));
    Parent2 = temppop.Chromosomes(sortedx(p2x));
 
    
    
end