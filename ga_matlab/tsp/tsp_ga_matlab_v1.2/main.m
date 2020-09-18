  clc;
  clear all;
  close all;

%% INITIALIZATION PARAMETERS
iterations = 1000;

M = 6;                           % Population Size (Number of Chromosomes)
K = 5;                           % Number of Genes

pc = 0.85;                       % Probability of Crossover
crossoverType = "double";        % single or double point crossover?

pm = 0.1;                        % Probability of Mutation

er = 0.17;                       % Elitism Ratio

bestIndividual.Chromosomes.fitness = Inf;
%% INITIALIZATION 

population = Initialization(6,5);


%% GENETIC ALGORITHM IMPLEMENTATION 

generation = 0;

while generation < iterations
    
    for k = 1 : 2 : M

    % Selection
    [parent1, parent2] = Selection(population);

    
    % Crossover
    [offspring1, offspring2] = Crossover(parent1, parent2, crossoverType,  pc);
    
    
    % Mutation
    [mutant1] = Mutation(offspring1.Chromosomes.Gene, pm);
    [mutant2] = Mutation(offspring2.Chromosomes.Gene, pm);
    
    % Transferring genes to next generation
    nextPopulation.Chromosomes(k).Gene = mutant1.Gene;
    nextPopulation.Chromosomes(k+1).Gene = mutant2.Gene;
    
end


%% CALCULATIONS FOR NEW GENERATION
for k = 1 : M
  
    % Fitness Calculation
    nextPopulation.Chromosomes(k).fitness = fitnessFcn(nextPopulation.Chromosomes(k).Gene(:));
    
end

for k = 1 : M
        nextPopulation.Chromosomes(k).normalized_fitness = [nextPopulation.Chromosomes(k).fitness] ./ sum([nextPopulation.Chromosomes(:).fitness]);
end
%% ELITISM SECTION

elitePopulation = Elitism(nextPopulation, er);



population = elitePopulation;

[nfu , idx] = min([population.Chromosomes(:).fitness]);

if bestIndividual.Chromosomes.fitness >= population.Chromosomes(idx).fitness
    
    bestIndividual.Chromosomes.Gene = population.Chromosomes(idx).Gene;
    bestIndividual.Chromosomes.fitness = population.Chromosomes(idx).fitness;
    
end



generation = generation  + 1;
end
fprintf('THE NUMBER OF GENERATIONS : %d#\n\n', iterations);

fprintf('THE BEST INDIVIDUAL IN THE HISTORY OF ALL POPULATIONS  : \n\n ');
fprintf('   GENE : ');
disp(bestIndividual.Chromosomes.Gene );
fprintf('    FITNESS : ');
disp(bestIndividual.Chromosomes.fitness );

fprintf('\n\n');

[nfu, idx] = min([population.Chromosomes(:).fitness]);

fprintf('THE BEST INDIVIDUAL IN THE LAST POPULATION  : \n\n ');
fprintf('   GENE : ');
disp(population.Chromosomes(idx).Gene );
fprintf('    FITNESS : ');
disp(population.Chromosomes(idx).fitness);


