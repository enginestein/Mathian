from System import *
from System.Collections.Generic import *
from System.Linq import *

class Statistics(object):
	def Mean(values):
		if values == None or not values.Any():
			raise ArgumentException("Cannot calculate mean of empty sequence")
		count = 0
		sum = 0.0
		enumerator = values.GetEnumerator()
		while enumerator.MoveNext():
			value = enumerator.Current
			count += 1
			sum += value
		return sum / count

	Mean = staticmethod(Mean)

	def Median(values):
		if values == None or not values.Any():
			raise ArgumentException("Cannot calculate median of empty sequence")
		sortedValues = values.OrderBy().ToArray()
		middleIndex = sortedValues.Length / 2
		if sortedValues.Length % 2 == 0:
			return (sortedValues[middleIndex - 1] + sortedValues[middleIndex]) / 2.0
		else:
			return sortedValues[middleIndex]

	Median = staticmethod(Median)

	def Mode(values):
		if values == None or not values.Any():
			raise ArgumentException("Cannot calculate mode of empty sequence")
		valueCounts = Dictionary[Double, int]()
		enumerator = values.GetEnumerator()
		while enumerator.MoveNext():
			value = enumerator.Current
			if not valueCounts.ContainsKey(value):
				valueCounts.Add(value, 0)
			valueCounts[value] += 1
		maxCount = valueCounts.Values.Max()
		modes = valueCounts.Where().Select()
		if modes.Count() == 1:
			return modes.First()
		else:
			raise InvalidOperationException("Sequence has multiple modes")

	Mode = staticmethod(Mode)

	def Variance(values):
		if values == None or not values.Any():
			raise ArgumentException("Cannot calculate variance of empty sequence")
		mean = Statistics.Mean(values)
		count = 0
		sumOfSquaredDifferences = 0.0
		enumerator = values.GetEnumerator()
		while enumerator.MoveNext():
			value = enumerator.Current
			count += 1
			difference = value - mean
			sumOfSquaredDifferences += difference * difference
		return sumOfSquaredDifferences / count

	Variance = staticmethod(Variance)

	def StandardDeviation(values):
		return Basic.SquareRoot(Statistics.Variance(values))

	StandardDeviation = staticmethod(StandardDeviation)

	def Correlation(valuesX, valuesY):
		if valuesX == None or valuesY == None or not valuesX.Any() or not valuesY.Any():
			raise ArgumentException("Cannot calculate correlation coefficient of empty sequences")
		count = 0
		sumX = 0.0
		sumY = 0.0
		sumXY = 0.0
		sumXSquared = 0.0
		sumYSquared = 0.0
		numerator = count * sumXY - sumX * sumY
		denominator = Basic.SquareRoot((count * sumXSquared - sumX * sumX) * (count * sumYSquared - sumY * sumY))
		return numerator / denominator

	Correlation = staticmethod(Correlation)