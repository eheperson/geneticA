function [Population] = Initialization(M,K)
    
    for k = 1 : M
        Population.Chromosomes(k).Gene(:) = randperm(K , K);
        Population.Chromosomes(k).fitness = fitnessFcn(Population.Chromosomes(k).Gene(:));
        
    end
    
    if any([Population.Chromosomes(:).fitness] < 0)
       a = 1;
       b = min([Population.Chromosomes(:).fitness]);
       b = abs(b);
       Population.Chromosomes(:).fitness = a*[Population.Chromosomes(:).fitness] + b +1;
    else
    
        
    for k = 1 : M
        Population.Chromosomes(k).normalized_fitness = [Population.Chromosomes(k).fitness] ./ sum([Population.Chromosomes(:).fitness]);
    end
         
end