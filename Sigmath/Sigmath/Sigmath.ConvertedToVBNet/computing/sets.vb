Imports System.Collections.Generic
Imports System.Linq

Public Class Sets
	Public Shared Function Union(Of T)(set1 As List(Of T), set2 As List(Of T)) As List(Of T)
		Dim unionSet = New List(Of T)(set1)
		unionSet.AddRange(set2.Except(set1))
		Return unionSet
	End Function

	Public Shared Function Intersection(Of T)(set1 As List(Of T), set2 As List(Of T)) As List(Of T)
		Dim intersectionSet = New List(Of T)(set1)
		intersectionSet.RemoveAll(Function(x) Not set2.Contains(x))
		Return intersectionSet
	End Function

	Public Shared Function Difference(Of T)(set1 As List(Of T), set2 As List(Of T)) As List(Of T)
		Dim differenceSet = New List(Of T)(set1)
		differenceSet.RemoveAll(Function(x) set2.Contains(x))
		Return differenceSet
	End Function

	Public Shared Function SymmetricDifference(Of T)(set1 As List(Of T), set2 As List(Of T)) As List(Of T)
		Dim symmetricDifferenceSet = New List(Of T)()
		Dim unionSet = Union(set1, set2)

		For Each item As var In unionSet
			If (set1.Contains(item) AndAlso Not set2.Contains(item)) OrElse (Not set1.Contains(item) AndAlso set2.Contains(item)) Then
				symmetricDifferenceSet.Add(item)
			End If
		Next

		Return symmetricDifferenceSet
	End Function

	Public Shared Function IsSubset(Of T)(subset As List(Of T), [set] As List(Of T)) As Boolean
		Return subset.All(AddressOf [set].Contains)
	End Function

	Public Shared Function IsSuperset(Of T)(superset As List(Of T), [set] As List(Of T)) As Boolean
		Return [set].All(AddressOf superset.Contains)
	End Function
End Class
