using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mathian
{
    class Relations
    {
        // Function to check if a relation is reflexive
        public static bool IsReflexive(int[,] relation, int setSize)
        {
            for (int i = 0; i < setSize; i++)
            {
                if (!RelationContainsPair(relation, i, i))
                {
                    return false;
                }
            }

            return true;
        }

        // Function to check if a relation is symmetric
        public static bool IsSymmetric(int[,] relation, int setSize)
        {
            for (int i = 0; i < setSize; i++)
            {
                for (int j = 0; j < setSize; j++)
                {
                    if (RelationContainsPair(relation, i, j) != RelationContainsPair(relation, j, i))
                    {
                        return false;
                    }
                }
            }

            return true;
        }

        // Function to check if a relation is transitive
        public static bool IsTransitive(int[,] relation, int setSize)
        {
            for (int i = 0; i < setSize; i++)
            {
                for (int j = 0; j < setSize; j++)
                {
                    if (RelationContainsPair(relation, i, j))
                    {
                        for (int k = 0; k < setSize; k++)
                        {
                            if (RelationContainsPair(relation, j, k) && !RelationContainsPair(relation, i, k))
                            {
                                return false;
                            }
                        }
                    }
                }
            }

            return true;
        }

        // Function to check if a relation contains a specific pair
        private static bool RelationContainsPair(int[,] relation, int element1, int element2)
        {
            return relation[element1, element2] == 1;
        }

        // Function to print a relation
        public static void PrintRelation(int[,] relation, int setSize)
        {
            for (int i = 0; i < setSize; i++)
            {
                for (int j = 0; j < setSize; j++)
                {
                    Console.Write(relation[i, j] + " ");
                }
                Console.WriteLine();
            }
        }

        public static bool IsAntisymmetric(int[,] relation, int setSize)
        {
            for (int i = 0; i < setSize; i++)
            {
                for (int j = 0; j < setSize; j++)
                {
                    if (i != j && RelationContainsPair(relation, i, j) && RelationContainsPair(relation, j, i))
                    {
                        return false;
                    }
                }
            }

            return true;
        }

        // Function to find the composition of two relations
        public static int[,] Composition(int[,] relation1, int[,] relation2, int setSize)
        {
            int[,] result = new int[setSize, setSize];

            for (int i = 0; i < setSize; i++)
            {
                for (int j = 0; j < setSize; j++)
                {
                    for (int k = 0; k < setSize; k++)
                    {
                        if (RelationContainsPair(relation1, i, k) && RelationContainsPair(relation2, k, j))
                        {
                            result[i, j] = 1;
                            break;
                        }
                    }
                }
            }

            return result;
        }

        // Function to find the closure of a relation
        public static int[,] Closure(int[,] relation, int setSize)
        {
            int[,] closure = (int[,])relation.Clone();

            for (int k = 0; k < setSize; k++)
            {
                for (int i = 0; i < setSize; i++)
                {
                    for (int j = 0; j < setSize; j++)
                    {
                        if (closure[i, k] == 1 && closure[k, j] == 1)
                        {
                            closure[i, j] = 1;
                        }
                    }
                }
            }

            return closure;
        }

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
    }

}
