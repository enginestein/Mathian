Imports System.Collections.Generic
Imports System.Linq

Public Class Statgorithm
	Public Shared Function Skewness(values As IEnumerable(Of Double)) As Double
		If values Is Nothing OrElse Not values.Any() Then
			Throw New ArgumentException("Cannot calculate skewness of empty sequence")
		End If

		Dim count = 0
		Dim sum = 0.0
		Dim sumOfSquaredDifferences = 0.0
		Dim sumOfCubedDifferences = 0.0

		For Each value As var In values
			count += 1
			sum += value
			Dim difference = value - Statistics.Mean(values)
			sumOfSquaredDifferences += difference * difference
			sumOfCubedDifferences += difference * difference * difference
		Next

		Dim variance = Statistics.Variance(values)
		Dim skewness__1 = sumOfCubedDifferences / (count * Basic.CubeRoot(variance))

		Return skewness__1
	End Function

	Public Shared Function Kurtosis(values As IEnumerable(Of Double)) As Double
		If values Is Nothing OrElse Not values.Any() Then
			Throw New ArgumentException("Cannot calculate kurtosis of empty sequence")
		End If

		Dim mean = Statistics.Mean(values)
		Dim count = 0
		Dim sumOfSquaredDifferences = 0.0
		Dim sumOfFourthPowersOfDifferences = 0.0

		For Each value As var In values
			count += 1
			Dim difference = value - mean
			sumOfSquaredDifferences += difference * difference
			sumOfFourthPowersOfDifferences += difference * difference * difference * difference
		Next

		Dim variance = sumOfSquaredDifferences / count
		Dim fourthMoment = sumOfFourthPowersOfDifferences / count
		Dim kurtosis__1 = fourthMoment / (variance * variance) - 3

		Return kurtosis__1
	End Function

	Public Shared Function Covariance(xValues As IEnumerable(Of Double), yValues As IEnumerable(Of Double)) As Double
		If xValues Is Nothing OrElse Not xValues.Any() OrElse yValues Is Nothing OrElse Not yValues.Any() OrElse xValues.Count() <> yValues.Count() Then
			Throw New ArgumentException("Invalid input")
		End If

		Dim xMean = Statistics.Mean(xValues)
		Dim yMean = Statistics.Mean(yValues)
		Dim count = 0
		Dim sumOfProductsOfDifferences = 0.0

		Using xEnumerator = xValues.GetEnumerator()
			Using yEnumerator = yValues.GetEnumerator()
				While xEnumerator.MoveNext() AndAlso yEnumerator.MoveNext()
					count += 1
					Dim xDifference = xEnumerator.Current - xMean
					Dim yDifference = yEnumerator.Current - yMean
					sumOfProductsOfDifferences += xDifference * yDifference
				End While
			End Using
		End Using

		Dim covariance__1 = sumOfProductsOfDifferences / count

		Return covariance__1
	End Function



	Public Shared Function Percentile(values As IEnumerable(Of Double), percentile__1 As Integer) As Double
		If values Is Nothing OrElse Not values.Any() Then
			Throw New ArgumentException("Cannot calculate percentile of empty sequence")
		End If

		If percentile__1 < 0 OrElse percentile__1 > 100 Then
			Throw New ArgumentOutOfRangeException("percentile", "Percentile must be between 0 and 100")
		End If

		Dim sortedValues = values.OrderBy(Function(v) v).ToArray()
		Dim index = CInt(Math.Truncate(Math.Ceiling((percentile__1 / 100.0) * sortedValues.Length))) - 1

		Return sortedValues(index)
	End Function

	Public Shared Function RemoveOutliers(values As IEnumerable(Of Double)) As IEnumerable(Of Double)
		If values Is Nothing OrElse Not values.Any() Then
			Throw New ArgumentException("Cannot remove outliers from empty sequence")
		End If

		Dim sortedValues = values.OrderBy(Function(v) v).ToArray()
		Dim q1 = Percentile(sortedValues, 25)
		Dim q3 = Percentile(sortedValues, 75)
		Dim iqr = q3 - q1
		Dim lowerBound = q1 - (1.5 * iqr)
		Dim upperBound = q3 + (1.5 * iqr)

		Return sortedValues.Where(Function(v) v >= lowerBound AndAlso v <= upperBound)
	End Function

End Class

