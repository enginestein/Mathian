using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mathian
{
    class Vectors
    {
        public static double Magnitude(double[] vector)
        {
            double sumOfSquares = 0;

            foreach (double component in vector)
            {
                sumOfSquares += component * component;
            }

            return Basic.SquareRoot(sumOfSquares);
        }

        public static double DotProduct(double[] vector1, double[] vector2)
        {
            if (vector1.Length != vector2.Length)
            {
                throw new ArgumentException("Vectors must have the same length");
            }

            double result = 0;

            for (int i = 0; i < vector1.Length; i++)
            {
                result += vector1[i] * vector2[i];
            }

            return result;
        }

        // Function to calculate the cross product of two 3D vectors
        public static double[] CrossProduct(double[] vector1, double[] vector2)
        {
            if (vector1.Length != 3 || vector2.Length != 3)
            {
                throw new ArgumentException("Cross product is only defined for 3D vectors");
            }

            double[] result = new double[3];

            result[0] = vector1[1] * vector2[2] - vector1[2] * vector2[1];
            result[1] = vector1[2] * vector2[0] - vector1[0] * vector2[2];
            result[2] = vector1[0] * vector2[1] - vector1[1] * vector2[0];

            return result;
        }

        // Function to normalize a vector
        public static double[] Normalize(double[] vector)
        {
            double magnitude = Magnitude(vector);

            double[] result = new double[vector.Length];

            for (int i = 0; i < vector.Length; i++)
            {
                result[i] = vector[i] / magnitude;
            }

            return result;
        }

        // Function to print a vector
        public static void PrintVector(double[] vector)
        {
            Console.Write("[ ");

            foreach (double component in vector)
            {
                Console.Write(component + " ");
            }

            Console.WriteLine("]");
        }

        public static double[] Add(double[] vector1, double[] vector2)
        {
            if (vector1.Length != vector2.Length)
            {
                throw new ArgumentException("Vectors must have the same length");
            }

            double[] result = new double[vector1.Length];

            for (int i = 0; i < vector1.Length; i++)
            {
                result[i] = vector1[i] + vector2[i];
            }

            return result;
        }

        // Function to subtract one vector from another
        public static double[] Subtract(double[] vector1, double[] vector2)
        {
            if (vector1.Length != vector2.Length)
            {
                throw new ArgumentException("Vectors must have the same length");
            }

            double[] result = new double[vector1.Length];

            for (int i = 0; i < vector1.Length; i++)
            {
                result[i] = vector1[i] - vector2[i];
            }

            return result;
        }

        // Function to multiply a vector by a scalar
        public static double[] ScalarMultiply(double[] vector, double scalar)
        {
            double[] result = new double[vector.Length];

            for (int i = 0; i < vector.Length; i++)
            {
                result[i] = vector[i] * scalar;
            }

            return result;
        }

        // Function to find the angle (in radians) between two vectors
        public static double AngleBetweenVectors(double[] vector1, double[] vector2)
        {
            double dotProduct = DotProduct(vector1, vector2);
            double magnitudeProduct = Magnitude(vector1) * Magnitude(vector2);

            return Math.Acos(dotProduct / magnitudeProduct);
        }

        //static void Main()
        //{
        // double[] vector1 = { 1, 2, 3 };
        //double[] vector2 = { 4, 5, 6 };

        //Console.WriteLine("Vector 1: ");
        //PrintVector(vector1);

        //Console.WriteLine("Vector 2: ");
        //PrintVector(vector2);

        //Console.WriteLine("Magnitude of Vector 1: " + Magnitude(vector1));
        //Console.WriteLine("Dot Product of Vector 1 and Vector 2: " + DotProduct(vector1, vector2));

        //Console.WriteLine("Cross Product of Vector 1 and Vector 2: ");
        //PrintVector(CrossProduct(vector1, vector2));

        //Console.WriteLine("Normalized Vector 1: ");
        //PrintVector(Normalize(vector1));
        //}

        //static void Main()
        //{
            // ... (previous example)

            //double[] sum = Add(vector1, vector2);
            //Console.WriteLine("Vector 1 + Vector 2: ");
            //PrintVector(sum);

            //double[] difference = Subtract(vector1, vector2);
            //Console.WriteLine("Vector 1 - Vector 2: ");
            //PrintVector(difference);

            //double scalar = 2.5;
            //double[] scaledVector = ScalarMultiply(vector1, scalar);
            //Console.WriteLine($"Vector 1 * {scalar}: ");
            //PrintVector(scaledVector);

            //Console.WriteLine("Angle between Vector 1 and Vector 2: " + AngleBetweenVectors(vector1, vector2));
        //}
    }

}
