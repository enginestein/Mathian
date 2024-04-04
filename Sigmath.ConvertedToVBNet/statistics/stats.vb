Imports System.Collections.Generic
Imports System.Linq

Public Class Statistics
	Public Shared Function Mean(values As IEnumerable(Of Double)) As Double
		If values Is Nothing OrElse Not values.Any() Then
			Throw New ArgumentException("Cannot calculate mean of empty sequence")
		End If

		Dim count = 0
		Dim sum = 0.0

		For Each value As var In values
			count += 1
			sum += value
		Next

		Return sum / count
	End Function

	Public Shared Function Median(values As IEnumerable(Of Double)) As Double
		If values Is Nothing OrElse Not values.Any() Then
			Throw New ArgumentException("Cannot calculate median of empty sequence")
		End If

		Dim sortedValues = values.OrderBy(Function(v) v).ToArray()
		Dim middleIndex = sortedValues.Length \ 2

		If sortedValues.Length Mod 2 = 0 Then
			Return (sortedValues(middleIndex - 1) + sortedValues(middleIndex)) / 2.0
		Else
			Return sortedValues(middleIndex)
		End If
	End Function

	Public Shared Function Mode(values As IEnumerable(Of Double)) As Double
		If values Is Nothing OrElse Not values.Any() Then
			Throw New ArgumentException("Cannot calculate mode of empty sequence")
		End If

		Dim valueCounts = New Dictionary(Of Double, Integer)()

		For Each value As var In values
			If Not valueCounts.ContainsKey(value) Then
				valueCounts.Add(value, 0)
			End If

			valueCounts(value) += 1
		Next

		Dim maxCount = valueCounts.Values.Max()
		Dim modes = valueCounts.Where(Function(pair) pair.Value = maxCount).[Select](Function(pair) pair.Key)

		If modes.Count() = 1 Then
			Return modes.First()
		Else
			Throw New InvalidOperationException("Sequence has multiple modes")
		End If
	End Function

	Public Shared Function Variance(values As IEnumerable(Of Double)) As Double
		If values Is Nothing OrElse Not values.Any() Then
			Throw New ArgumentException("Cannot calculate variance of empty sequence")
		End If

		Dim mean__1 = Mean(values)
		Dim count = 0
		Dim sumOfSquaredDifferences = 0.0

		For Each value As var In values
			count += 1
			Dim difference = value - mean__1
			sumOfSquaredDifferences += difference * difference
		Next

		Return sumOfSquaredDifferences / count
	End Function

	Public Shared Function StandardDeviation(values As IEnumerable(Of Double)) As Double
		Return Basic.SquareRoot(Variance(values))
	End Function

	Public Shared Function Correlation(valuesX As IEnumerable(Of Double), valuesY As IEnumerable(Of Double)) As Double
		If valuesX Is Nothing OrElse valuesY Is Nothing OrElse Not valuesX.Any() OrElse Not valuesY.Any() Then
			Throw New ArgumentException("Cannot calculate correlation coefficient of empty sequences")
		End If

		Dim count = 0
		Dim sumX = 0.0
		Dim sumY = 0.0
		Dim sumXY = 0.0
		Dim sumXSquared = 0.0
		Dim sumYSquared = 0.0

		Using enumX = valuesX.GetEnumerator()
			Using enumY = valuesY.GetEnumerator()
				While enumX.MoveNext() AndAlso enumY.MoveNext()
					Dim valueX = enumX.Current
					Dim valueY = enumY.Current
					count += 1
					sumX += valueX
					sumY += valueY
					sumXY += valueX * valueY
					sumXSquared += valueX * valueX
					sumYSquared += valueY * valueY
				End While
			End Using
		End Using

		Dim numerator = count * sumXY - sumX * sumY
		Dim denominator = Basic.SquareRoot((count * sumXSquared - sumX * sumX) * (count * sumYSquared - sumY * sumY))

		Return numerator / denominator
	End Function

End Class
