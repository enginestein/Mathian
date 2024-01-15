from System import *
from System.Collections.Generic import *
from System.Linq import *

class Statgorithm(object):
	def Skewness(values):
		if values == None or not values.Any():
			raise ArgumentException("Cannot calculate skewness of empty sequence")
		count = 0
		sum = 0.0
		sumOfSquaredDifferences = 0.0
		sumOfCubedDifferences = 0.0
		enumerator = values.GetEnumerator()
		while enumerator.MoveNext():
			value = enumerator.Current
			count += 1
			sum += value
			difference = value - Statistics.Mean(values)
			sumOfSquaredDifferences += difference * difference
			sumOfCubedDifferences += difference * difference * difference
		variance = Statistics.Variance(values)
		skewness = sumOfCubedDifferences / (count * Basic.CubeRoot(variance))
		return skewness

	Skewness = staticmethod(Skewness)

	def Kurtosis(values):
		if values == None or not values.Any():
			raise ArgumentException("Cannot calculate kurtosis of empty sequence")
		mean = Statistics.Mean(values)
		count = 0
		sumOfSquaredDifferences = 0.0
		sumOfFourthPowersOfDifferences = 0.0
		enumerator = values.GetEnumerator()
		while enumerator.MoveNext():
			value = enumerator.Current
			count += 1
			difference = value - mean
			sumOfSquaredDifferences += difference * difference
			sumOfFourthPowersOfDifferences += difference * difference * difference * difference
		variance = sumOfSquaredDifferences / count
		fourthMoment = sumOfFourthPowersOfDifferences / count
		kurtosis = fourthMoment / (variance * variance) - 3
		return kurtosis

	Kurtosis = staticmethod(Kurtosis)

	def Covariance(xValues, yValues):
		if xValues == None or not xValues.Any() or yValues == None or not yValues.Any() or xValues.Count() != yValues.Count():
			raise ArgumentException("Invalid input")
		xMean = Statistics.Mean(xValues)
		yMean = Statistics.Mean(yValues)
		count = 0
		sumOfProductsOfDifferences = 0.0
		covariance = sumOfProductsOfDifferences / count
		return covariance

	Covariance = staticmethod(Covariance)

	def Percentile(values, percentile):
		if values == None or not values.Any():
			raise ArgumentException("Cannot calculate percentile of empty sequence")
		if percentile < 0 or percentile > 100:
			raise ArgumentOutOfRangeException("percentile", "Percentile must be between 0 and 100")
		sortedValues = values.OrderBy().ToArray()
		index = Math.Ceiling((percentile / 100.0) * sortedValues.Length) - 1
		return sortedValues[index]

	Percentile = staticmethod(Percentile)

	def RemoveOutliers(values):
		if values == None or not values.Any():
			raise ArgumentException("Cannot remove outliers from empty sequence")
		sortedValues = values.OrderBy().ToArray()
		q1 = Statgorithm.Percentile(sortedValues, 25)
		q3 = Statgorithm.Percentile(sortedValues, 75)
		iqr = q3 - q1
		lowerBound = q1 - (1.5 * iqr)
		upperBound = q3 + (1.5 * iqr)
		return sortedValues.Where()

	RemoveOutliers = staticmethod(RemoveOutliers)