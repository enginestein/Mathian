
namespace Sigmath

import System
import System.Collections.Generic
import System.Linq
import System.Text
import System.Threading.Tasks

internal class Vectors:

	public static def Magnitude(vector as (double)) as double:
		sumOfSquares as double = 0
		
		for component as double in vector:
			sumOfSquares += (component * component)
		
		return Basic.SquareRoot(sumOfSquares)

	
	public static def DotProduct(vector1 as (double), vector2 as (double)) as double:
		if vector1.Length != vector2.Length:
			raise ArgumentException('Vectors must have the same length')
		
		result as double = 0
		for i in range(0, vector1.Length):
		
			result += (vector1[i] * vector2[i])
		
		return result

	
	// Function to calculate the cross product of two 3D vectors
	public static def CrossProduct(vector1 as (double), vector2 as (double)) as (double):
		if (vector1.Length != 3) or (vector2.Length != 3):
			raise ArgumentException('Cross product is only defined for 3D vectors')
		
		result as (double) = array(double, 3)
		
		result[0] = ((vector1[1] * vector2[2]) - (vector1[2] * vector2[1]))
		result[1] = ((vector1[2] * vector2[0]) - (vector1[0] * vector2[2]))
		result[2] = ((vector1[0] * vector2[1]) - (vector1[1] * vector2[0]))
		
		return result

	
	// Function to normalize a vector
	public static def Normalize(vector as (double)) as (double):
		magnitude as double = Magnitude(vector)
		
		result as (double) = array(double, vector.Length)
		for i in range(0, vector.Length):
		
			result[i] = (vector[i] / magnitude)
		
		return result

	
	// Function to print a vector
	public static def PrintVector(vector as (double)):
		Console.Write('[ ')
		
		for component as double in vector:
			Console.Write((component + ' '))
		
		Console.WriteLine(']')

	
	public static def Add(vector1 as (double), vector2 as (double)) as (double):
		if vector1.Length != vector2.Length:
			raise ArgumentException('Vectors must have the same length')
		
		result as (double) = array(double, vector1.Length)
		for i in range(0, vector1.Length):
		
			result[i] = (vector1[i] + vector2[i])
		
		return result

	
	// Function to subtract one vector from another
	public static def Subtract(vector1 as (double), vector2 as (double)) as (double):
		if vector1.Length != vector2.Length:
			raise ArgumentException('Vectors must have the same length')
		
		result as (double) = array(double, vector1.Length)
		for i in range(0, vector1.Length):
		
			result[i] = (vector1[i] - vector2[i])
		
		return result

	
	// Function to multiply a vector by a scalar
	public static def ScalarMultiply(vector as (double), scalar as double) as (double):
		result as (double) = array(double, vector.Length)
		for i in range(0, vector.Length):
		
			result[i] = (vector[i] * scalar)
		
		return result

	
	// Function to find the angle (in radians) between two vectors
	public static def AngleBetweenVectors(vector1 as (double), vector2 as (double)) as double:
		dotProduct as double = DotProduct(vector1, vector2)
		magnitudeProduct as double = (Magnitude(vector1) * Magnitude(vector2))
		
		return Math.Acos((dotProduct / magnitudeProduct))
	
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


