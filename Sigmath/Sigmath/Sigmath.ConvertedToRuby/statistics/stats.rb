require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module Sigmath
	class Statistics
		def Statistics.Mean(values)
			if values == nil or not values.Any() then
				raise ArgumentException.new("Cannot calculate mean of empty sequence")
			end
			count = 0
			sum = 0.0
			enumerator = values.GetEnumerator()
			while enumerator.MoveNext()
				value = enumerator.Current
				count += 1
				sum += value
			end
			return sum / count
		end

		def Statistics.Median(values)
			if values == nil or not values.Any() then
				raise ArgumentException.new("Cannot calculate median of empty sequence")
			end
			sortedValues = values.OrderBy(v).ToArray()
			middleIndex = sortedValues.Length / 2
			if sortedValues.Length % 2 == 0 then
				return (sortedValues[middleIndex - 1] + sortedValues[middleIndex]) / 2.0
			else
				return sortedValues[middleIndex]
			end
		end

		def Statistics.Mode(values)
			if values == nil or not values.Any() then
				raise ArgumentException.new("Cannot calculate mode of empty sequence")
			end
			valueCounts = Dictionary[System::Double, System::Int32].new()
			enumerator = values.GetEnumerator()
			while enumerator.MoveNext()
				value = enumerator.Current
				if not valueCounts.ContainsKey(value) then
					valueCounts.Add(value, 0)
				end
				valueCounts[value] += 1
			end
			maxCount = valueCounts.Values.Max()
			modes = valueCounts.Where(pair.Value == maxCount).Select(pair.Key)
			if modes.Count() == 1 then
				return modes.First()
			else
				raise InvalidOperationException.new("Sequence has multiple modes")
			end
		end

		def Statistics.Variance(values)
			if values == nil or not values.Any() then
				raise ArgumentException.new("Cannot calculate variance of empty sequence")
			end
			mean = Statistics.Mean(values)
			count = 0
			sumOfSquaredDifferences = 0.0
			enumerator = values.GetEnumerator()
			while enumerator.MoveNext()
				value = enumerator.Current
				count += 1
				difference = value - mean
				sumOfSquaredDifferences += difference * difference
			end
			return sumOfSquaredDifferences / count
		end

		def Statistics.StandardDeviation(values)
			return Basic.SquareRoot(Statistics.Variance(values))
		end

		def Statistics.Correlation(valuesX, valuesY)
			if valuesX == nil or valuesY == nil or not valuesX.Any() or not valuesY.Any() then
				raise ArgumentException.new("Cannot calculate correlation coefficient of empty sequences")
			end
			count = 0
			sumX = 0.0
			sumY = 0.0
			sumXY = 0.0
			sumXSquared = 0.0
			sumYSquared = 0.0
			enumX = valuesX.GetEnumerator()
			enumY = valuesY.GetEnumerator()
			while enumX.MoveNext() and enumY.MoveNext()
				valueX = enumX.Current
				valueY = enumY.Current
				count += 1
				sumX += valueX
				sumY += valueY
				sumXY += valueX * valueY
				sumXSquared += valueX * valueX
				sumYSquared += valueY * valueY
			end
			numerator = count * sumXY - sumX * sumY
			denominator = Basic.SquareRoot((count * sumXSquared - sumX * sumX) * (count * sumYSquared - sumY * sumY))
			return numerator / denominator
		end
	end
end