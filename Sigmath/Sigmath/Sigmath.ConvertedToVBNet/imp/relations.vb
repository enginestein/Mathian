Imports System.Collections.Generic
Imports System.Linq
Imports System.Text
Imports System.Threading.Tasks

Class Relations
	' Function to check if a relation is reflexive
	Public Shared Function IsReflexive(relation As Integer(,), setSize As Integer) As Boolean
		For i As Integer = 0 To setSize - 1
			If Not RelationContainsPair(relation, i, i) Then
				Return False
			End If
		Next

		Return True
	End Function

	' Function to check if a relation is symmetric
	Public Shared Function IsSymmetric(relation As Integer(,), setSize As Integer) As Boolean
		For i As Integer = 0 To setSize - 1
			For j As Integer = 0 To setSize - 1
				If RelationContainsPair(relation, i, j) <> RelationContainsPair(relation, j, i) Then
					Return False
				End If
			Next
		Next

		Return True
	End Function

	' Function to check if a relation is transitive
	Public Shared Function IsTransitive(relation As Integer(,), setSize As Integer) As Boolean
		For i As Integer = 0 To setSize - 1
			For j As Integer = 0 To setSize - 1
				If RelationContainsPair(relation, i, j) Then
					For k As Integer = 0 To setSize - 1
						If RelationContainsPair(relation, j, k) AndAlso Not RelationContainsPair(relation, i, k) Then
							Return False
						End If
					Next
				End If
			Next
		Next

		Return True
	End Function

	' Function to check if a relation contains a specific pair
	Private Shared Function RelationContainsPair(relation As Integer(,), element1 As Integer, element2 As Integer) As Boolean
		Return relation(element1, element2) = 1
	End Function

	' Function to print a relation
	Public Shared Sub PrintRelation(relation As Integer(,), setSize As Integer)
		For i As Integer = 0 To setSize - 1
			For j As Integer = 0 To setSize - 1
				Console.Write(relation(i, j) & " ")
			Next
			Console.WriteLine()
		Next
	End Sub

	Public Shared Function IsAntisymmetric(relation As Integer(,), setSize As Integer) As Boolean
		For i As Integer = 0 To setSize - 1
			For j As Integer = 0 To setSize - 1
				If i <> j AndAlso RelationContainsPair(relation, i, j) AndAlso RelationContainsPair(relation, j, i) Then
					Return False
				End If
			Next
		Next

		Return True
	End Function

	' Function to find the composition of two relations
	Public Shared Function Composition(relation1 As Integer(,), relation2 As Integer(,), setSize As Integer) As Integer(,)
		Dim result As Integer(,) = New Integer(setSize - 1, setSize - 1) {}

		For i As Integer = 0 To setSize - 1
			For j As Integer = 0 To setSize - 1
				For k As Integer = 0 To setSize - 1
					If RelationContainsPair(relation1, i, k) AndAlso RelationContainsPair(relation2, k, j) Then
						result(i, j) = 1
						Exit For
					End If
				Next
			Next
		Next

		Return result
	End Function

	' Function to find the closure of a relation
	Public Shared Function Closure(relation As Integer(,), setSize As Integer) As Integer(,)
		Dim closure__1 As Integer(,) = DirectCast(relation.Clone(), Integer(,))

		For k As Integer = 0 To setSize - 1
			For i As Integer = 0 To setSize - 1
				For j As Integer = 0 To setSize - 1
					If closure__1(i, k) = 1 AndAlso closure__1(k, j) = 1 Then
						closure__1(i, j) = 1
					End If
				Next
			Next
		Next

		Return closure__1
	End Function

	' Example usage
	'static void Main()
	'{
	'int setSize = 3;
	'int[,] reflexiveRelation = { { 1, 0, 0 }, { 0, 1, 0 }, { 0, 0, 1 } };
	'int[,] symmetricRelation = { { 1, 1, 0 }, { 1, 0, 1 }, { 0, 1, 0 } };
	'int[,] transitiveRelation = { { 1, 1, 1 }, { 0, 1, 1 }, { 0, 0, 1 } };

	'Console.WriteLine("Reflexive Relation: ");
	'PrintRelation(reflexiveRelation, setSize);
	'Console.WriteLine("Is Reflexive: " + IsReflexive(reflexiveRelation, setSize));

	'Console.WriteLine("\nSymmetric Relation: ");
	'PrintRelation(symmetricRelation, setSize);
	'Console.WriteLine("Is Symmetric: " + IsSymmetric(symmetricRelation, setSize));

	'Console.WriteLine("\nTransitive Relation: ");
	'PrintRelation(transitiveRelation, setSize);
	'Console.WriteLine("Is Transitive: " + IsTransitive(transitiveRelation, setSize));
	'int[,] antisymmetricRelation = { { 0, 1, 1 }, { 0, 0, 1 }, { 0, 0, 0 } };
	'int[,] relation1 = { { 1, 0, 0 }, { 1, 1, 0 }, { 0, 1, 1 } };
	'int[,] relation2 = { { 1, 1, 0 }, { 0, 1, 1 }, { 1, 0, 1 } };

	'Console.WriteLine("\nAntisymmetric Relation: ");
	'PrintRelation(antisymmetricRelation, setSize);
	'Console.WriteLine("Is Antisymmetric: " + IsAntisymmetric(antisymmetricRelation, setSize));

	'Console.WriteLine("\nComposition of Relation 1 and Relation 2: ");
	'int[,] compositionResult = Composition(relation1, relation2, setSize);
	'PrintRelation(compositionResult, setSize);

	'Console.WriteLine("\nClosure of Relation 1: ");
	'int[,] closureResult = Closure(relation1, setSize);
	'PrintRelation(closureResult, setSize);
	'}
End Class

