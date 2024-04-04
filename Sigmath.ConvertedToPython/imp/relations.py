from System import *
from System.Collections.Generic import *
from System.Linq import *
from System.Text import *
from System.Threading.Tasks import *

class Relations(object):
	# Function to check if a relation is reflexive
	def IsReflexive(relation, setSize):
		i = 0
		while i < setSize:
			if not Relations.RelationContainsPair(relation, i, i):
				return False
			i += 1
		return True

	IsReflexive = staticmethod(IsReflexive)

	# Function to check if a relation is symmetric
	def IsSymmetric(relation, setSize):
		i = 0
		while i < setSize:
			j = 0
			while j < setSize:
				if Relations.RelationContainsPair(relation, i, j) != Relations.RelationContainsPair(relation, j, i):
					return False
				j += 1
			i += 1
		return True

	IsSymmetric = staticmethod(IsSymmetric)

	# Function to check if a relation is transitive
	def IsTransitive(relation, setSize):
		i = 0
		while i < setSize:
			j = 0
			while j < setSize:
				if Relations.RelationContainsPair(relation, i, j):
					k = 0
					while k < setSize:
						if Relations.RelationContainsPair(relation, j, k) and not Relations.RelationContainsPair(relation, i, k):
							return False
						k += 1
				j += 1
			i += 1
		return True

	IsTransitive = staticmethod(IsTransitive)

	# Function to check if a relation contains a specific pair
	def RelationContainsPair(relation, element1, element2):
		return relation[element1][element2] == 1

	RelationContainsPair = staticmethod(RelationContainsPair)

	# Function to print a relation
	def PrintRelation(relation, setSize):
		i = 0
		while i < setSize:
			j = 0
			while j < setSize:
				Console.Write(relation[i][j] + " ")
				j += 1
			Console.WriteLine()
			i += 1

	PrintRelation = staticmethod(PrintRelation)

	def IsAntisymmetric(relation, setSize):
		i = 0
		while i < setSize:
			j = 0
			while j < setSize:
				if i != j and Relations.RelationContainsPair(relation, i, j) and Relations.RelationContainsPair(relation, j, i):
					return False
				j += 1
			i += 1
		return True

	IsAntisymmetric = staticmethod(IsAntisymmetric)

	# Function to find the composition of two relations
	def Composition(relation1, relation2, setSize):
		result = Array.CreateInstance(int, setSize, setSize)
		i = 0
		while i < setSize:
			j = 0
			while j < setSize:
				k = 0
				while k < setSize:
					if Relations.RelationContainsPair(relation1, i, k) and Relations.RelationContainsPair(relation2, k, j):
						result[i][j] = 1
						break
					k += 1
				j += 1
			i += 1
		return result

	Composition = staticmethod(Composition)

	# Function to find the closure of a relation
	def Closure(relation, setSize):
		closure = relation.Clone()
		k = 0
		while k < setSize:
			i = 0
			while i < setSize:
				j = 0
				while j < setSize:
					if closure[i][k] == 1 and closure[k][j] == 1:
						closure[i][j] = 1
					j += 1
				i += 1
			k += 1
		return closure

	Closure = staticmethod(Closure)