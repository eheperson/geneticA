from simpleGA import simpleGA
import subprocess
import platform
import os

cities5 = simpleGA()

cities5.loadData("5_cities.txt")

cities5.setMutationProbability(0.1)
cities5.setElitismRatio(0.17)
cities5.setCrossoverProbability(0.85)
cities5.setPopulationSize(50)

itermax = 1000


cities5.initialize()


cities5.fitnessFcn()

for k in range(0,itermax+1 ):
    for i in range(0,cities5.popSize,2):
        cities5.selection()

        cities5.crossOver()


        cities5.mutationFcn()


        cities5.finalPopulation.pop(i)
        cities5.finalPopulation.insert(i,cities5.offspring1Mutation)
        cities5.finalPopulation.pop(i+1)
        cities5.finalPopulation.insert(i+1,cities5.offspring1Mutation)


    
    for j in range(0,cities5.popSize):
        gene = cities5.finalPopulation[j].copy()
        cities5.finalFitness[j] = cities5.fitnessCalc(gene)

    cities5.elitism()
    
    cities5.initialFitness = cities5.eliteFitness.copy()
    cities5.initialPopulation = cities5.elitePopulation.copy()

    cities5.findBestIndividual()


    print("iteration : {0}%".format(int((k/itermax)*100)))

print("Best Individual : {0}".format(cities5.bestIndividual["population"]))
print("Fitness Of Best Individual : {0}".format(cities5.bestIndividual["fitness"]))

    
