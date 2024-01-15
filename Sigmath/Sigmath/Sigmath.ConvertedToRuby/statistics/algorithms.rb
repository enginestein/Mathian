require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module Sigmath
	class Statgorithm
		def Statgorithm.Skewness(values)
			if values == nil or not values.Any() then
				raise ArgumentException.new("Cannot calculate skewness of empty sequence")
			end
			count = 0
			sum = 0.0
			sumOfSquaredDifferences = 0.0
			sumOfCubedDifferences = 0.0
			enumerator = values.GetEnumerator()
			while enumerator.MoveNext()
				value = enumerator.Current
				count += 1
				sum += value
				difference = value - Statistics.Mean(values)
				sumOfSquaredDifferences += difference * difference
				sumOfCubedDifferences += difference * difference * difference
			end
			variance = Statistics.Variance(values)
			skewness = sumOfCubedDifferences / (count * Basic.CubeRoot(variance))
			return skewness
		end

		def Statgorithm.Kurtosis(values)
			if values == nil or not values.Any() then
				raise ArgumentException.new("Cannot calculate kurtosis of empty sequence")
			end
			mean = Statistics.Mean(values)
			count = 0
			sumOfSquaredDifferences = 0.0
			sumOfFourthPowersOfDifferences = 0.0
			enumerator = values.GetEnumerator()
			while enumerator.MoveNext()
				value = enumerator.Current
				count += 1
				difference = value - mean
				sumOfSquaredDifferences += difference * difference
				sumOfFourthPowersOfDifferences += difference * difference * difference * difference
			end
			variance = sumOfSquaredDifferences / count
			fourthMoment = sumOfFourthPowersOfDifferences / count
			kurtosis = fourthMoment / (variance * variance) - 3
			return kurtosis
		end

		def Statgorithm.Covariance(xValues, yValues)
			if xValues == nil or not xValues.Any() or yValues == nil or not yValues.Any() or xValues.Count() != yValues.Count() then
				raise ArgumentException.new("Invalid input")
			end
			xMean = Statistics.Mean(xValues)
			yMean = Statistics.Mean(yValues)
			count = 0
			sumOfProductsOfDifferences = 0.0
			xEnumerator = xValues.GetEnumerator()
			yEnumerator = yValues.GetEnumerator()
			while xEnumerator.MoveNext() and yEnumerator.MoveNext()
				count += 1
				xDifference = xEnumerator.Current - xMean
				yDifference = yEnumerator.Current - yMean
				sumOfProductsOfDifferences += xDifference * yDifference
			end
			covariance = sumOfProductsOfDifferences / count
			return covariance
		end

		def Statgorithm.Percentile(values, percentile)
			if values == nil or not values.Any() then
				raise ArgumentException.new("Cannot calculate percentile of empty sequence")
			end
			if percentile < 0 or percentile > 100 then
				raise ArgumentOutOfRangeException.new("percentile", "Percentile must be between 0 and 100")
			end
			sortedValues = values.OrderBy(v).ToArray()
			index = Math.Ceiling((percentile / 100.0) * sortedValues.Length) - 1
			return sortedValues[index]
		end

		def Statgorithm.RemoveOutliers(values)
			if values == nil or not values.Any() then
				raise ArgumentException.new("Cannot remove outliers from empty sequence")
			end
			sortedValues = values.OrderBy(v).ToArray()
			q1 = Statgorithm.Percentile(sortedValues, 25)
			q3 = Statgorithm.Percentile(sortedValues, 75)
			iqr = q3 - q1
			lowerBound = q1 - (1.5 * iqr)
			upperBound = q3 + (1.5 * iqr)
			return sortedValues.Where(v >= lowerBound and v <= upperBound)
		end
	end
end