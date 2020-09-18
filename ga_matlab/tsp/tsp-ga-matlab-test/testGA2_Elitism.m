clc;
clear;
close all;
%%

M = 10;  %number of chromosomes (candidate solutions)

N = 8; %Number of genes (variables)

Pc = 0.5 %Probability of crosssover

Pm = 0.1; %Probability of mutation

Er = 0.1; % Elitism ratio

Noe = round(10*Er); %Number of elitism

CrossoverType = 'double';  

for k=1:M
   population.Chromosomes(k).Gene(:) = [round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand())];
   population.Chromosomes(k).fitness=sphere(population.Chromosomes(k).Gene(:));
end

for k = 1 : 2 : M
    
    %Selection
    [parent1, parent2] = selection(population);
    
    %Crossover
    [child1, child2] = crossover(parent1, parent2, Pc, CrossoverType)
    
    %Mutation
    [child1] = mutation(child1, Pm);
    [child2] = mutation(child2, Pm);
    
    
    newPopulation.Chromosome(k).Gene = child1.Gene;
    newPopulation.Chromosome(k+1).Gene = child2.Gene;

end


    % Elitism

    
[max_val, idx] = sort([population.Chromosomes().fitness], 'descend');
    
for k = 1 : 2 : Noe
   
    
    newPopulation.Chromosome(k).Gene = population.Chromosomes(idx(k)).Gene;
    
end