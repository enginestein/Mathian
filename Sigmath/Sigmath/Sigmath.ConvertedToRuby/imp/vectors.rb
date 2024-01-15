require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Threading.Tasks, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module Sigmath
	class Vectors
		def Vectors.Magnitude(vector)
			sumOfSquares = 0
			enumerator = vector.GetEnumerator()
			while enumerator.MoveNext()
				component = enumerator.Current
				sumOfSquares += component * component
			end
			return Basic.SquareRoot(sumOfSquares)
		end

		def Vectors.DotProduct(vector1, vector2)
			if vector1.Length != vector2.Length then
				raise ArgumentException.new("Vectors must have the same length")
			end
			result = 0
			i = 0
			while i < vector1.Length
				result += vector1[i] * vector2[i]
				i += 1
			end
			return result
		end

		# Function to calculate the cross product of two 3D vectors
		def Vectors.CrossProduct(vector1, vector2)
			if vector1.Length != 3 or vector2.Length != 3 then
				raise ArgumentException.new("Cross product is only defined for 3D vectors")
			end
			result = Array.CreateInstance(System::Double, 3)
			result[0] = vector1[1] * vector2[2] - vector1[2] * vector2[1]
			result[1] = vector1[2] * vector2[0] - vector1[0] * vector2[2]
			result[2] = vector1[0] * vector2[1] - vector1[1] * vector2[0]
			return result
		end

		# Function to normalize a vector
		def Vectors.Normalize(vector)
			magnitude = Vectors.Magnitude(vector)
			result = Array.CreateInstance(System::Double, vector.Length)
			i = 0
			while i < vector.Length
				result[i] = vector[i] / magnitude
				i += 1
			end
			return result
		end

		# Function to print a vector
		def Vectors.PrintVector(vector)
			Console.Write("[ ")
			enumerator = vector.GetEnumerator()
			while enumerator.MoveNext()
				component = enumerator.Current
				Console.Write(component + " ")
			end
			Console.WriteLine("]")
		end

		def Vectors.Add(vector1, vector2)
			if vector1.Length != vector2.Length then
				raise ArgumentException.new("Vectors must have the same length")
			end
			result = Array.CreateInstance(System::Double, vector1.Length)
			i = 0
			while i < vector1.Length
				result[i] = vector1[i] + vector2[i]
				i += 1
			end
			return result
		end

		# Function to subtract one vector from another
		def Vectors.Subtract(vector1, vector2)
			if vector1.Length != vector2.Length then
				raise ArgumentException.new("Vectors must have the same length")
			end
			result = Array.CreateInstance(System::Double, vector1.Length)
			i = 0
			while i < vector1.Length
				result[i] = vector1[i] - vector2[i]
				i += 1
			end
			return result
		end

		# Function to multiply a vector by a scalar
		def Vectors.ScalarMultiply(vector, scalar)
			result = Array.CreateInstance(System::Double, vector.Length)
			i = 0
			while i < vector.Length
				result[i] = vector[i] * scalar
				i += 1
			end
			return result
		end

		# Function to find the angle (in radians) between two vectors
		def Vectors.AngleBetweenVectors(vector1, vector2)
			dotProduct = Vectors.DotProduct(vector1, vector2)
			magnitudeProduct = Vectors.Magnitude(vector1) * Vectors.Magnitude(vector2)
			return Math.Acos(dotProduct / magnitudeProduct)
		end
	end
end