function [elitepop] = Elitism(pop, er)
    
    M = length([pop.Chromosomes]);
    eliteNum = round(M*er);
    
    [maxV, minIdx] = sort([ pop.Chromosomes(:).fitness]);

    for k = 1 : eliteNum 
       
            newpop.Chromosomes(k).Gene = pop.Chromosomes(minIdx(k)).Gene;
            newpop.Chromosomes(k).fitness = pop.Chromosomes(minIdx(k)).fitness;


    end
    
   for k = eliteNum + 1 : length([pop.Chromosomes])
       
        newpop.Chromosomes(k).Gene = pop.Chromosomes(k).Gene;
        newpop.Chromosomes(k).fitness = pop.Chromosomes(k).fitness;

   end
   
   for k = 1 : length(pop.Chromosomes(:))
       
   newpop.Chromosomes(k).normalized_fitness =  [newpop.Chromosomes(k).fitness] ./ sum([newpop.Chromosomes(:).fitness]);
   
   end
   
   elitepop = newpop;
   
end