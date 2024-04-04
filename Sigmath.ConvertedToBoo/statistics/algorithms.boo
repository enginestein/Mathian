
namespace Sigmath

import System
import System.Collections.Generic
import System.Linq

public class Statgorithm:

	public static def Skewness(values as IEnumerable[of double]) as double:
		if (values is null) or (not values.Any()):
			raise ArgumentException('Cannot calculate skewness of empty sequence')
		
		count as var = 0
		sum as var = 0.0
		sumOfSquaredDifferences as var = 0.0
		sumOfCubedDifferences as var = 0.0
		
		for value as var in values:
			count += 1
			sum += value
			difference as var = (value - Statistics.Mean(values))
			sumOfSquaredDifferences += (difference * difference)
			sumOfCubedDifferences += ((difference * difference) * difference)
		
		variance as var = Statistics.Variance(values)
		skewness as var = (sumOfCubedDifferences / (count * Basic.CubeRoot(variance)))
		
		return skewness

	
	public static def Kurtosis(values as IEnumerable[of double]) as double:
		if (values is null) or (not values.Any()):
			raise ArgumentException('Cannot calculate kurtosis of empty sequence')
		
		mean as var = Statistics.Mean(values)
		count as var = 0
		sumOfSquaredDifferences as var = 0.0
		sumOfFourthPowersOfDifferences as var = 0.0
		
		for value as var in values:
			count += 1
			difference as var = (value - mean)
			sumOfSquaredDifferences += (difference * difference)
			sumOfFourthPowersOfDifferences += (((difference * difference) * difference) * difference)
		
		variance as var = (sumOfSquaredDifferences / count)
		fourthMoment as var = (sumOfFourthPowersOfDifferences / count)
		kurtosis as var = ((fourthMoment / (variance * variance)) - 3)
		
		return kurtosis

	
	public static def Covariance(xValues as IEnumerable[of double], yValues as IEnumerable[of double]) as double:
		if ((((xValues is null) or (not xValues.Any())) or (yValues is null)) or (not yValues.Any())) or (xValues.Count() != yValues.Count()):
			raise ArgumentException('Invalid input')
		
		xMean as var = Statistics.Mean(xValues)
		yMean as var = Statistics.Mean(yValues)
		count as var = 0
		sumOfProductsOfDifferences as var = 0.0
		
		using xEnumerator = xValues.GetEnumerator():
			using yEnumerator = yValues.GetEnumerator():
				while xEnumerator.MoveNext() and yEnumerator.MoveNext():
					count += 1
					xDifference as var = (xEnumerator.Current - xMean)
					yDifference as var = (yEnumerator.Current - yMean)
					sumOfProductsOfDifferences += (xDifference * yDifference)
		
		covariance as var = (sumOfProductsOfDifferences / count)
		
		return covariance

	
	
	
	public static def Percentile(values as IEnumerable[of double], percentile as int) as double:
		if (values is null) or (not values.Any()):
			raise ArgumentException('Cannot calculate percentile of empty sequence')
		
		if (percentile < 0) or (percentile > 100):
			raise ArgumentOutOfRangeException('percentile', 'Percentile must be between 0 and 100')
		
		sortedValues as var = values.OrderBy({ v | return v }).ToArray()
		index as var = ((Math.Ceiling(((percentile / 100.0) * sortedValues.Length)) cast int) - 1)
		
		return sortedValues[index]

	
	public static def RemoveOutliers(values as IEnumerable[of double]) as IEnumerable[of double]:
		if (values is null) or (not values.Any()):
			raise ArgumentException('Cannot remove outliers from empty sequence')
		
		sortedValues as var = values.OrderBy({ v | return v }).ToArray()
		q1 as var = Percentile(sortedValues, 25)
		q3 as var = Percentile(sortedValues, 75)
		iqr as var = (q3 - q1)
		lowerBound as var = (q1 - (1.5 * iqr))
		upperBound as var = (q3 + (1.5 * iqr))
		
		return sortedValues.Where({ v | return ((v >= lowerBound) and (v <= upperBound)) })
	


