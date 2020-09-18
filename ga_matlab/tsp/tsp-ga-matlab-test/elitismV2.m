function [ newPopulation2 ] = elitismV2(population, newPopulation, Er)

M = length(population.Chromosomes); % number of individuals 
Elite_no = round(M * Er);

[max_val , indx] = sort([ population.Chromosomes(:).fitness ] , 'descend');
    
for k = 1 : Elite_no

    newPopulation2.Chromosomes(k).Gene  = population.Chromosomes(indx(k)).Gene;
    newPopulation2.Chromosomes(k).fitness  = population.Chromosomes(indx(k)).fitness;
    
end

for k = Elite_no + 1 :  length(population.Chromosomes)
    newPopulation2.Chromosomes(k).Gene  = population.Chromosomes(k).Gene;
    newPopulation2.Chromosomes(k).fitness  = population.Chromosomes(k).fitness;
end

end