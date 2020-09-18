function [osprng1, osprng2] = Crossover(parent1, parent2, crossoverType,  pc)

    geneSize = length(parent1.Gene);
    upperB = geneSize - 1;
    lowerB = 1;
    
    switch crossoverType
        
        case 'single'
            
            crossP = round((upperB - lowerB)*rand() + lowerB);
            
            part1 = parent1.Gene(1:crossP);
            part2 = parent2.Gene(crossP + 1: end);
            os1 = [part1, part2];
            
            part1 = parent2.Gene(1:crossP);
            part2 = parent1.Gene(crossP + 1: end);
            os2 = [part1, part2];
            
        case 'double'
            
            crossP1 = round((upperB - lowerB)*rand() + lowerB);
            crossP2 = crossP1;
            
            while crossP1 == crossP2
                crossP2 = round((upperB - lowerB)*rand() + lowerB);
            end
            
            if crossP1 > crossP2
               temp = crossP1;
               crossP1 = crossP2;
               crossP2 = temp;
            end
            
            part1 = parent1.Gene(1:crossP1);
            part2 = parent2.Gene(crossP1 + 1: crossP2);
            part3 = parent1.Gene(crossP2 + 1:end);
            os1 = [part1, part2, part3];
            
            part1 = parent2.Gene(1:crossP1);
            part2 = parent1.Gene(crossP1 + 1: crossP2);
            part3 = parent2.Gene(crossP2 + 1:end);
            os2 = [part1, part2, part3];
    end
    
    [sortedOs1, os1x] = sort(os1);
    
    for i = 1 : geneSize
       
        if os1(os1x(i)) ~= i
            
            os1(os1x(i)) = i;
            
        end
        
    end
    
    
    [sortedOs2, os2x] = sort(os2);
    
    for i = 1 : geneSize
       
        if os2(os2x(i)) ~= i
            
            os2(os2x(i)) = i;
            
        end
        
    end
    
    
    
    R = rand();
    
    if R <= pc
        osprng1.Chromosomes.Gene = os1;
    else
        osprng1.Chromosomes.Gene = parent1.Gene;
    end
    
    R = rand();
    
    if R <= pc
        osprng2.Chromosomes.Gene = os2;
    else
        osprng2.Chromosomes.Gene = parent2.Gene;
    end

end