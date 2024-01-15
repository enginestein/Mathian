from System import *
from System.Collections.Generic import *
from System.Linq import *
from System.Text import *
from System.Threading.Tasks import *

class Vectors(object):
	def Magnitude(vector):
		sumOfSquares = 0
		enumerator = vector.GetEnumerator()
		while enumerator.MoveNext():
			component = enumerator.Current
			sumOfSquares += component * component
		return Basic.SquareRoot(sumOfSquares)

	Magnitude = staticmethod(Magnitude)

	def DotProduct(vector1, vector2):
		if vector1.Length != vector2.Length:
			raise ArgumentException("Vectors must have the same length")
		result = 0
		i = 0
		while i < vector1.Length:
			result += vector1[i] * vector2[i]
			i += 1
		return result

	DotProduct = staticmethod(DotProduct)

	# Function to calculate the cross product of two 3D vectors
	def CrossProduct(vector1, vector2):
		if vector1.Length != 3 or vector2.Length != 3:
			raise ArgumentException("Cross product is only defined for 3D vectors")
		result = Array.CreateInstance(Double, 3)
		result[0] = vector1[1] * vector2[2] - vector1[2] * vector2[1]
		result[1] = vector1[2] * vector2[0] - vector1[0] * vector2[2]
		result[2] = vector1[0] * vector2[1] - vector1[1] * vector2[0]
		return result

	CrossProduct = staticmethod(CrossProduct)

	# Function to normalize a vector
	def Normalize(vector):
		magnitude = Vectors.Magnitude(vector)
		result = Array.CreateInstance(Double, vector.Length)
		i = 0
		while i < vector.Length:
			result[i] = vector[i] / magnitude
			i += 1
		return result

	Normalize = staticmethod(Normalize)

	# Function to print a vector
	def PrintVector(vector):
		Console.Write("[ ")
		enumerator = vector.GetEnumerator()
		while enumerator.MoveNext():
			component = enumerator.Current
			Console.Write(component + " ")
		Console.WriteLine("]")

	PrintVector = staticmethod(PrintVector)

	def Add(vector1, vector2):
		if vector1.Length != vector2.Length:
			raise ArgumentException("Vectors must have the same length")
		result = Array.CreateInstance(Double, vector1.Length)
		i = 0
		while i < vector1.Length:
			result[i] = vector1[i] + vector2[i]
			i += 1
		return result

	Add = staticmethod(Add)

	# Function to subtract one vector from another
	def Subtract(vector1, vector2):
		if vector1.Length != vector2.Length:
			raise ArgumentException("Vectors must have the same length")
		result = Array.CreateInstance(Double, vector1.Length)
		i = 0
		while i < vector1.Length:
			result[i] = vector1[i] - vector2[i]
			i += 1
		return result

	Subtract = staticmethod(Subtract)

	# Function to multiply a vector by a scalar
	def ScalarMultiply(vector, scalar):
		result = Array.CreateInstance(Double, vector.Length)
		i = 0
		while i < vector.Length:
			result[i] = vector[i] * scalar
			i += 1
		return result

	ScalarMultiply = staticmethod(ScalarMultiply)

	# Function to find the angle (in radians) between two vectors
	def AngleBetweenVectors(vector1, vector2):
		dotProduct = Vectors.DotProduct(vector1, vector2)
		magnitudeProduct = Vectors.Magnitude(vector1) * Vectors.Magnitude(vector2)
		return Math.Acos(dotProduct / magnitudeProduct)

	AngleBetweenVectors = staticmethod(AngleBetweenVectors)