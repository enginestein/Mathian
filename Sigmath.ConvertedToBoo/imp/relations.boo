
namespace Sigmath

import System
import System.Collections.Generic
import System.Linq
import System.Text
import System.Threading.Tasks

internal class Relations:

	// Function to check if a relation is reflexive
	public static def IsReflexive(relation as (int, 2), setSize as int) as bool:
		for i in range(0, setSize):
			if not RelationContainsPair(relation, i, i):
				return false
		
		return true

	
	// Function to check if a relation is symmetric
	public static def IsSymmetric(relation as (int, 2), setSize as int) as bool:
		for i in range(0, setSize):
			for j in range(0, setSize):
				if RelationContainsPair(relation, i, j) != RelationContainsPair(relation, j, i):
					return false
		
		return true

	
	// Function to check if a relation is transitive
	public static def IsTransitive(relation as (int, 2), setSize as int) as bool:
		for i in range(0, setSize):
			for j in range(0, setSize):
				if RelationContainsPair(relation, i, j):
					for k in range(0, setSize):
						if RelationContainsPair(relation, j, k) and (not RelationContainsPair(relation, i, k)):
							return false
		
		return true

	
	// Function to check if a relation contains a specific pair
	private static def RelationContainsPair(relation as (int, 2), element1 as int, element2 as int) as bool:
		return (relation[element1, element2] == 1)

	
	// Function to print a relation
	public static def PrintRelation(relation as (int, 2), setSize as int):
		for i in range(0, setSize):
			for j in range(0, setSize):
				Console.Write((relation[i, j] + ' '))
			Console.WriteLine()

	
	public static def IsAntisymmetric(relation as (int, 2), setSize as int) as bool:
		for i in range(0, setSize):
			for j in range(0, setSize):
				if ((i != j) and RelationContainsPair(relation, i, j)) and RelationContainsPair(relation, j, i):
					return false
		
		return true

	
	// Function to find the composition of two relations
	public static def Composition(relation1 as (int, 2), relation2 as (int, 2), setSize as int) as (int, 2):
		result as (int, 2) = matrix(int, setSize, setSize)
		for i in range(0, setSize):
		
			for j in range(0, setSize):
				for k in range(0, setSize):
					if RelationContainsPair(relation1, i, k) and RelationContainsPair(relation2, k, j):
						result[i, j] = 1
						break 
		
		return result

	
	// Function to find the closure of a relation
	public static def Closure(relation as (int, 2), setSize as int) as (int, 2):
		closure = (relation.Clone() cast (int, 2))
		for k in range(0, setSize):
		
			for i in range(0, setSize):
				for j in range(0, setSize):
					if (closure[i, k] == 1) and (closure[k, j] == 1):
						closure[i, j] = 1
		
		return closure
	
	// Example usage
	//static void Main()
	//{
	//int setSize = 3;
	//int[,] reflexiveRelation = { { 1, 0, 0 }, { 0, 1, 0 }, { 0, 0, 1 } };
	//int[,] symmetricRelation = { { 1, 1, 0 }, { 1, 0, 1 }, { 0, 1, 0 } };
	//int[,] transitiveRelation = { { 1, 1, 1 }, { 0, 1, 1 }, { 0, 0, 1 } };
	
	//Console.WriteLine("Reflexive Relation: ");
	//PrintRelation(reflexiveRelation, setSize);
	//Console.WriteLine("Is Reflexive: " + IsReflexive(reflexiveRelation, setSize));
	
	//Console.WriteLine("\nSymmetric Relation: ");
	//PrintRelation(symmetricRelation, setSize);
	//Console.WriteLine("Is Symmetric: " + IsSymmetric(symmetricRelation, setSize));
	
	//Console.WriteLine("\nTransitive Relation: ");
	//PrintRelation(transitiveRelation, setSize);
	//Console.WriteLine("Is Transitive: " + IsTransitive(transitiveRelation, setSize));
	//int[,] antisymmetricRelation = { { 0, 1, 1 }, { 0, 0, 1 }, { 0, 0, 0 } };
	//int[,] relation1 = { { 1, 0, 0 }, { 1, 1, 0 }, { 0, 1, 1 } };
	//int[,] relation2 = { { 1, 1, 0 }, { 0, 1, 1 }, { 1, 0, 1 } };
	
	//Console.WriteLine("\nAntisymmetric Relation: ");
	//PrintRelation(antisymmetricRelation, setSize);
	//Console.WriteLine("Is Antisymmetric: " + IsAntisymmetric(antisymmetricRelation, setSize));
	
	//Console.WriteLine("\nComposition of Relation 1 and Relation 2: ");
	//int[,] compositionResult = Composition(relation1, relation2, setSize);
	//PrintRelation(compositionResult, setSize);
	
	//Console.WriteLine("\nClosure of Relation 1: ");
	//int[,] closureResult = Closure(relation1, setSize);
	//PrintRelation(closureResult, setSize);
	//}


