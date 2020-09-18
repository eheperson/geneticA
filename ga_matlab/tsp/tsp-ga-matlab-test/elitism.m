function  [newpopulation] = elitism(population, Er)
    
    Noe = round(length(population.Chromosomes)*Er); %Number of elitism
    
    [max_val, idx] = sort([population.Chromosomes().fitness], 'descend');
    
    for k = 1 : 2 : Noe


        newPopulation.Chromosome(k).Gene = population.Chromosomes(idx(k)).Gene;

    end

end