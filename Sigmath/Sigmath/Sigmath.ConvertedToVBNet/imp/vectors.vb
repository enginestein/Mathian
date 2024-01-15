Imports System.Collections.Generic
Imports System.Linq
Imports System.Text
Imports System.Threading.Tasks

Class Vectors
	Public Shared Function Magnitude(vector As Double()) As Double
		Dim sumOfSquares As Double = 0

		For Each component As Double In vector
			sumOfSquares += component * component
		Next

		Return Basic.SquareRoot(sumOfSquares)
	End Function

	Public Shared Function DotProduct(vector1 As Double(), vector2 As Double()) As Double
		If vector1.Length <> vector2.Length Then
			Throw New ArgumentException("Vectors must have the same length")
		End If

		Dim result As Double = 0

		For i As Integer = 0 To vector1.Length - 1
			result += vector1(i) * vector2(i)
		Next

		Return result
	End Function

	' Function to calculate the cross product of two 3D vectors
	Public Shared Function CrossProduct(vector1 As Double(), vector2 As Double()) As Double()
		If vector1.Length <> 3 OrElse vector2.Length <> 3 Then
			Throw New ArgumentException("Cross product is only defined for 3D vectors")
		End If

		Dim result As Double() = New Double(2) {}

		result(0) = vector1(1) * vector2(2) - vector1(2) * vector2(1)
		result(1) = vector1(2) * vector2(0) - vector1(0) * vector2(2)
		result(2) = vector1(0) * vector2(1) - vector1(1) * vector2(0)

		Return result
	End Function

	' Function to normalize a vector
	Public Shared Function Normalize(vector As Double()) As Double()
		Dim magnitude__1 As Double = Magnitude(vector)

		Dim result As Double() = New Double(vector.Length - 1) {}

		For i As Integer = 0 To vector.Length - 1
			result(i) = vector(i) / magnitude__1
		Next

		Return result
	End Function

	' Function to print a vector
	Public Shared Sub PrintVector(vector As Double())
		Console.Write("[ ")

		For Each component As Double In vector
			Console.Write(component & " ")
		Next

		Console.WriteLine("]")
	End Sub

	Public Shared Function Add(vector1 As Double(), vector2 As Double()) As Double()
		If vector1.Length <> vector2.Length Then
			Throw New ArgumentException("Vectors must have the same length")
		End If

		Dim result As Double() = New Double(vector1.Length - 1) {}

		For i As Integer = 0 To vector1.Length - 1
			result(i) = vector1(i) + vector2(i)
		Next

		Return result
	End Function

	' Function to subtract one vector from another
	Public Shared Function Subtract(vector1 As Double(), vector2 As Double()) As Double()
		If vector1.Length <> vector2.Length Then
			Throw New ArgumentException("Vectors must have the same length")
		End If

		Dim result As Double() = New Double(vector1.Length - 1) {}

		For i As Integer = 0 To vector1.Length - 1
			result(i) = vector1(i) - vector2(i)
		Next

		Return result
	End Function

	' Function to multiply a vector by a scalar
	Public Shared Function ScalarMultiply(vector As Double(), scalar As Double) As Double()
		Dim result As Double() = New Double(vector.Length - 1) {}

		For i As Integer = 0 To vector.Length - 1
			result(i) = vector(i) * scalar
		Next

		Return result
	End Function

	' Function to find the angle (in radians) between two vectors
	Public Shared Function AngleBetweenVectors(vector1 As Double(), vector2 As Double()) As Double
		Dim dotProduct__1 As Double = DotProduct(vector1, vector2)
		Dim magnitudeProduct As Double = Magnitude(vector1) * Magnitude(vector2)

		Return Math.Acos(dotProduct__1 / magnitudeProduct)
	End Function

	'static void Main()
	'{
	' double[] vector1 = { 1, 2, 3 };
	'double[] vector2 = { 4, 5, 6 };

	'Console.WriteLine("Vector 1: ");
	'PrintVector(vector1);

	'Console.WriteLine("Vector 2: ");
	'PrintVector(vector2);

	'Console.WriteLine("Magnitude of Vector 1: " + Magnitude(vector1));
	'Console.WriteLine("Dot Product of Vector 1 and Vector 2: " + DotProduct(vector1, vector2));

	'Console.WriteLine("Cross Product of Vector 1 and Vector 2: ");
	'PrintVector(CrossProduct(vector1, vector2));

	'Console.WriteLine("Normalized Vector 1: ");
	'PrintVector(Normalize(vector1));
	'}

	'static void Main()
	'{
	' ... (previous example)

	'double[] sum = Add(vector1, vector2);
	'Console.WriteLine("Vector 1 + Vector 2: ");
	'PrintVector(sum);

	'double[] difference = Subtract(vector1, vector2);
	'Console.WriteLine("Vector 1 - Vector 2: ");
	'PrintVector(difference);

	'double scalar = 2.5;
	'double[] scaledVector = ScalarMultiply(vector1, scalar);
	'Console.WriteLine($"Vector 1 * {scalar}: ");
	'PrintVector(scaledVector);

	'Console.WriteLine("Angle between Vector 1 and Vector 2: " + AngleBetweenVectors(vector1, vector2));
	'}
End Class

