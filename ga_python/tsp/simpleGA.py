import subprocess
import platform
import os
from random import randint
from random import shuffle
from random import uniform

class population:
    def __init__(self):
        self.populationSize = 0
        self.geneNumber = 0
        self.chromosomes = list()
        fitnessValues = list()
        

class simpleGA:

    def __init__(self, popSize = 0, geneNum = 0,pC = 0.5, pM = 0.5, eR=0.5):
        self.popSize = popSize               
        self.geneNum = geneNum             
        self.pC = pC                      
        self.pM = pM                      
        self.eR = eR                    
        #self.crossoverType = crossoverType
        
        self.crossoverPoints = list()
        
        self.initialPopulation = list()
        self.initialFitness = list()

        self.finalPopulation = list()
        self.finalFitness = list()

        self.elitePopulation = list()
        self.eliteFitness= list()

        self.txtData = ""
        self.dataSet = list()
        
        self.parent1 = list()
        self.parent2 = list()
        self.offspring1 = list()
        self.offspring2 = list()

        self.offspring1Mutation = list()
        self.offspring2Mutation = list()

        self.chromosomeShape = list()

        self.bestIndividual = {"population":list(), "fitness":0}

################################################################################

    def fitnessCalc(self, gene):
        fitness = 0
        geneSize = len(gene)
        for i in range (0,geneSize):
            if i<geneSize-1:
                
                lower = gene[i]-1
                upper = gene[i+1]-1
                fitness = fitness + int(self.dataSet[lower][upper])

            if i==geneSize-1:
                lower = gene[i]-1
                upper = gene[0]-1
                fitness = fitness + int(self.dataSet[lower][upper])
                break

        return fitness
################################################################################

    def fitnessFcn(self):
      
        
        for i in range(0,self.popSize):
                self.initialFitness.append(self.fitnessCalc(self.initialPopulation[i]))

################################################################################

    def loadData(self, strName):
        self.txtData = strName

        f = open (strName , 'r')

        self.dataSet = [ line.split() for line in f]
        self.geneNum = len(self.dataSet[0])
        print("' Dataset is loaded '")

################################################################################
    def initialize(self):

        for i in range(1,self.geneNum+1 ):
                self.chromosomeShape.append(i)

        
        for j in range(0, self.popSize):
            tempShape = list(self.chromosomeShape)
            shuffle(tempShape)
            self.initialPopulation.append(tempShape)

        for i in range(0, self.popSize):
            self.finalPopulation.append(0)
            self.finalFitness.append(0)
            self.elitePopulation.append(0)
            self.eliteFitness.append(0)
            
            

################################################################################
    def setElitismRatio(self, eR):
        self.eR = eR
        
################################################################################
    def setCrossoverProbability(self, pC):
        self.pC = pC
        
################################################################################
    def setMutationProbability(self, pM):
        self.pM= pM
        
################################################################################
    def setPopulationSize(self, popSize):
        self.popSize = popSize
        
################################################################################

    def selection(self):
        
        total_fit = float(sum(self.initialFitness))
        
        sortedFitness = self.initialFitness.copy()
        sortedFitness.sort()
        
        relativeFitness = [f/total_fit for f in self.initialFitness]
        relativeFitnessSorted = [f/total_fit for f in sortedFitness]

        probabilities = [sum(relativeFitnessSorted[:i+1]) for i in range(len(relativeFitnessSorted))]

        R1 = float(uniform(0,1))
        
        for i in range(0,self.popSize):
            if R1 < probabilities[i]:
                index = relativeFitness.index(relativeFitnessSorted[i])
                p1 = self.initialPopulation[index].copy()
                break
                

        while True:
            R2 = float(uniform(0,1))
            for j in range(0,self.popSize):
                if R2 < probabilities[j]:
                    index = relativeFitness.index(relativeFitnessSorted[j])
                    p2 = self.initialPopulation[index].copy()
                    break
                    
            if p1 != p2:
                break


        
        self.parent1 = p1
        self.parent2 = p2
        



################################################################################

    def crossOver(self):
        upperB = self.geneNum-1
        lowerB = 0
        cP =  round(uniform(0,1)*(upperB-lowerB))
        
        self.crossoverPoints.append(cP)
        
        part1 = self.parent1[:cP]
        part2 = self.parent2[cP:]
        os1 = part1 + part2

        part1 = self.parent2[:cP]
        part2 = self.parent1[cP:]
        os2 = part1 + part2


        missing = list()
        doubled = list()
        
        for i in range(1,self.geneNum + 1):
            
            if os1.count(i) == 0:
                missing.append(i)
            elif os1.count(i) >1 :
                doubled.append(i)
                
        for i in range(0, len(doubled)):
            index = os1.index(doubled[i])
            os1[index] = missing[i]
                

        missing = list()
        doubled = list()
        
        for i in range(1,self.geneNum + 1):
            
            if os2.count(i) == 0:
                missing.append(i)
            elif os2.count(i) >1 :
                doubled.append(i)
                
        for i in range(0, len(doubled)):
            index = os2.index(doubled[i])
            os2[index] = missing[i]

        
        R = uniform(0,1)

        if R<self.pC:
            self.offspring1 = os1
        else:
            self.offspring1 = self.parent1

        R = uniform(0,1)

        if R < self.pC:
            self.offspring2 = os2
        else:
            self.offspring2 = self.parent2
            
################################################################################

    def mutation(self, oldGene):
        gene =oldGene.copy()
        for i in range(0, self.geneNum):
            
            R = uniform(0,1)

            if R<self.pM:

                if i<self.geneNum-1:
                    tmp = gene[i]
                    gene[i] = gene[i+1]
                    gene[i+1] = tmp
                elif i == self.geneNum-1:
                    tmp = gene[i]
                    gene[i] = gene[i-1]
                    gene[i-1] = tmp
        mutant = gene.copy()
        return mutant
    
################################################################################
    
    def mutationFcn(self):
        self.offspring1Mutation =  self.mutation(self.offspring1)
        self.offspring2Mutation =  self.mutation(self.offspring2)

################################################################################

    def elitism(self):
        eliteNum = round(uniform(0,1)*self.eR)

        oldFitness = self.finalFitness.copy()
        oldFitness.sort()
        
        for i in range(0,eliteNum):
            self.elitePopulation[i] = self.finalPopulation[finalPopulation.index(oldFitness[i])]
            self.elitePopulation[i] = self.finalFitness[finalFitness.index(oldFitness[i])]

        for i in range(eliteNum, self.popSize):
            self.elitePopulation[i] = self.finalPopulation[i]
            self.eliteFitness[i] = self.finalFitness[i]            


    def findBestIndividual(self):
        fit = min(self.initialFitness)
        pop = self.initialPopulation[self.initialFitness.index(fit)]

        self.bestIndividual["fitness"]=fit
        self.bestIndividual["population"]=pop
################################################################################
