from simpleGA import simpleGA

cities42 = simpleGA()

cities42.loadData("42_cities.txt")

cities42.setMutationProbability(0.1)
cities42.setElitismRatio(0.17)
cities42.setCrossoverProbability(0.85)
cities42.setPopulationSize(50)

itermax = 1000

cities42.initialize()

cities42.fitnessFcn()

for k in range(0,itermax ):
    for i in range(0,cities42.popSize,2):
        cities42.selection()

        cities42.crossOver()


        cities42.mutationFcn()


        cities42.finalPopulation.pop(i)
        cities42.finalPopulation.insert(i,cities42.offspring1Mutation)
        cities42.finalPopulation.pop(i+1)
        cities42.finalPopulation.insert(i+1,cities42.offspring1Mutation)


    
    for j in range(0,cities42.popSize):
        gene = cities42.finalPopulation[j].copy()
        cities42.finalFitness[j] = cities42.fitnessCalc(gene)

    cities42.elitism()
    
    cities42.initialFitness = cities42.eliteFitness.copy()
    cities42.initialPopulation = cities42.elitePopulation.copy()

    cities42.findBestIndividual()
    
    print("iteration : {0}%".format(int((k/itermax)*100)))

print("Best Individual : {0}".format(cities42.bestIndividual["population"]))
print("Fitness Of Best Individual : {0}".format(cities42.bestIndividual["fitness"]))

    
