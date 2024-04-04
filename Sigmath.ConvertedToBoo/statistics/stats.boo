
namespace Sigmath

import System
import System.Collections.Generic
import System.Linq

public class Statistics:

	public static def Mean(values as IEnumerable[of double]) as double:
		if (values is null) or (not values.Any()):
			raise ArgumentException('Cannot calculate mean of empty sequence')
		
		count as var = 0
		sum as var = 0.0
		
		for value as var in values:
			count += 1
			sum += value
		
		return (sum / count)

	
	public static def Median(values as IEnumerable[of double]) as double:
		if (values is null) or (not values.Any()):
			raise ArgumentException('Cannot calculate median of empty sequence')
		
		sortedValues as var = values.OrderBy({ v | return v }).ToArray()
		middleIndex as var = (sortedValues.Length / 2)
		
		if (sortedValues.Length % 2) == 0:
			return ((sortedValues[(middleIndex - 1)] + sortedValues[middleIndex]) / 2.0)
		else:
			return sortedValues[middleIndex]

	
	public static def Mode(values as IEnumerable[of double]) as double:
		if (values is null) or (not values.Any()):
			raise ArgumentException('Cannot calculate mode of empty sequence')
		
		valueCounts as var = Dictionary[of double, int]()
		
		for value as var in values:
			if not valueCounts.ContainsKey(value):
				valueCounts.Add(value, 0)
			
			valueCounts[value] += 1
		
		maxCount as var = valueCounts.Values.Max()
		modes as var = valueCounts.Where({ pair | return (pair.Value == maxCount) }).Select({ pair | return pair.Key })
		
		if modes.Count() == 1:
			return modes.First()
		else:
			raise InvalidOperationException('Sequence has multiple modes')

	
	public static def Variance(values as IEnumerable[of double]) as double:
		if (values is null) or (not values.Any()):
			raise ArgumentException('Cannot calculate variance of empty sequence')
		
		mean as var = Mean(values)
		count as var = 0
		sumOfSquaredDifferences as var = 0.0
		
		for value as var in values:
			count += 1
			difference as var = (value - mean)
			sumOfSquaredDifferences += (difference * difference)
		
		return (sumOfSquaredDifferences / count)

	
	public static def StandardDeviation(values as IEnumerable[of double]) as double:
		return Basic.SquareRoot(Variance(values))

	
	public static def Correlation(valuesX as IEnumerable[of double], valuesY as IEnumerable[of double]) as double:
		if (((valuesX is null) or (valuesY is null)) or (not valuesX.Any())) or (not valuesY.Any()):
			raise ArgumentException('Cannot calculate correlation coefficient of empty sequences')
		
		count as var = 0
		sumX as var = 0.0
		sumY as var = 0.0
		sumXY as var = 0.0
		sumXSquared as var = 0.0
		sumYSquared as var = 0.0
		
		using enumX = valuesX.GetEnumerator():
			using enumY = valuesY.GetEnumerator():
				while enumX.MoveNext() and enumY.MoveNext():
					valueX as var = enumX.Current
					valueY as var = enumY.Current
					count += 1
					sumX += valueX
					sumY += valueY
					sumXY += (valueX * valueY)
					sumXSquared += (valueX * valueX)
					sumYSquared += (valueY * valueY)
		
		numerator as var = ((count * sumXY) - (sumX * sumY))
		denominator as var = Basic.SquareRoot((((count * sumXSquared) - (sumX * sumX)) * ((count * sumYSquared) - (sumY * sumY))))
		
		return (numerator / denominator)
	

