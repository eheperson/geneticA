from simpleGA import simpleGA

cities29 = simpleGA()
cities29.pM = 0.1
cities29.eR = 0.17
cities29.pC = 0.85
cities29.popSize = 200
cities29.geneNum = 29
itermax = 1000
cities29.loadData("29_cities.txt")

cities29.initialize()

cities29.fitnessFcn()

for k in range(0,itermax ):
    for i in range(0,cities29.popSize,2):
        cities29.selection()

        cities29.crossOver()


        cities29.mutationFcn()


        cities29.finalPopulation.pop(i)
        cities29.finalPopulation.insert(i,cities29.offspring1Mutation)
        cities29.finalPopulation.pop(i+1)
        cities29.finalPopulation.insert(i+1,cities29.offspring1Mutation)


    
    for j in range(0,cities29.popSize):
        gene = cities29.finalPopulation[j].copy()
        cities29.finalFitness[j] = cities29.fitnessCalc(gene)

    cities29.elitism()
    
    cities29.initialFitness = cities29.eliteFitness.copy()
    cities29.initialPopulation = cities29.elitePopulation.copy()

    cities29.findBestIndividual()
    
    print("iteration : {0}".format(k))

print("Best Individual : {0}".format(cities29.bestIndividual["population"]))
print("Fitness Of Best Individual : {0}".format(cities29.bestIndividual["fitness"]))

    
