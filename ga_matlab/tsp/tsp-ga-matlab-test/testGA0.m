clc;
clear;
close all;
%%

M = 10;  %number of chromosomes (candidate solutions)

N = 2; %Number of genes (variables)

for k=1:M
   population.Chromosomes(k).Gene(:) = [round(rand()), round(rand())];
   population.Chromosomes(k).fitness=fitnessFunction(population.Chromosomes(k).Gene(:));
end

[parent1, parent2] = selection(population)