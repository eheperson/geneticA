from simpleGA import simpleGA

cities76 = simpleGA()

cities76.loadData("76_cities.txt")

cities76.setMutationProbability(0.1)
cities76.setElitismRatio(0.17)
cities76.setCrossoverProbability(0.85)
cities76.setPopulationSize(50)

itermax = 1000

cities76.initialize()

cities76.fitnessFcn()

for k in range(0,itermax ):
    for i in range(0,cities76.popSize,2):
        cities76.selection()

        cities76.crossOver()


        cities76.mutationFcn()


        cities76.finalPopulation.pop(i)
        cities76.finalPopulation.insert(i,cities76.offspring1Mutation)
        cities76.finalPopulation.pop(i+1)
        cities76.finalPopulation.insert(i+1,cities76.offspring1Mutation)


    
    for j in range(0,cities76.popSize):
        gene = cities76.finalPopulation[j].copy()
        cities76.finalFitness[j] = cities76.fitnessCalc(gene)

    cities76.elitism()
    
    cities76.initialFitness = cities76.eliteFitness.copy()
    cities76.initialPopulation = cities76.elitePopulation.copy()

    cities76.findBestIndividual()
    
    print("iteration : {0}%".format(int((k/itermax)*100)))

print("Best Individual : {0}".format(cities76.bestIndividual["population"]))
print("Fitness Of Best Individual : {0}".format(cities76.bestIndividual["fitness"]))    
