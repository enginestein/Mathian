package sigmath;

public class Statgorithm
{
	public static double Skewness(java.lang.Iterable<Double> values)
	{
		if (values == null || !values.Any())
		{
			throw new IllegalArgumentException("Cannot calculate skewness of empty sequence");
		}

		var count = 0;
		var sum = 0.0;
		var sumOfSquaredDifferences = 0.0;
		var sumOfCubedDifferences = 0.0;

		for (var value : values)
		{
			count++;
			sum += value;
			var difference = value - Statistics.Mean(values);
			sumOfSquaredDifferences += difference * difference;
			sumOfCubedDifferences += difference * difference * difference;
		}

		var variance = Statistics.Variance(values);
		var skewness = sumOfCubedDifferences / (count * Basic.CubeRoot(variance));

		return skewness;
	}

	public static double Kurtosis(java.lang.Iterable<Double> values)
	{
		if (values == null || !values.Any())
		{
			throw new IllegalArgumentException("Cannot calculate kurtosis of empty sequence");
		}

		var mean = Statistics.Mean(values);
		var count = 0;
		var sumOfSquaredDifferences = 0.0;
		var sumOfFourthPowersOfDifferences = 0.0;

		for (var value : values)
		{
			count++;
			var difference = value - mean;
			sumOfSquaredDifferences += difference * difference;
			sumOfFourthPowersOfDifferences += difference * difference * difference * difference;
		}

		var variance = sumOfSquaredDifferences / count;
		var fourthMoment = sumOfFourthPowersOfDifferences / count;
		var kurtosis = fourthMoment / (variance * variance) - 3;

		return kurtosis;
	}

	public static double Covariance(java.lang.Iterable<Double> xValues, java.lang.Iterable<Double> yValues)
	{
		if (xValues == null || !xValues.Any() || yValues == null || !yValues.Any() || xValues.size() != yValues.size())
		{
			throw new IllegalArgumentException("Invalid input");
		}

		var xMean = Statistics.Mean(xValues);
		var yMean = Statistics.Mean(yValues);
		var count = 0;
		var sumOfProductsOfDifferences = 0.0;

		try (var xEnumerator = xValues.iterator())
		{
		try (var yEnumerator = yValues.iterator())
		{
			while (xEnumerator.hasNext() && yEnumerator.hasNext())
			{
				count++;
				var xDifference = xEnumerator.next() - xMean;
//C# TO JAVA CONVERTER TASK: .NET iterators are only converted within the context of 'while' and 'for' loops:
				var yDifference = yEnumerator.Current - yMean;
				sumOfProductsOfDifferences += xDifference * yDifference;
			}
		}
		}

		var covariance = sumOfProductsOfDifferences / count;

		return covariance;
	}



	public static double Percentile(java.lang.Iterable<Double> values, int percentile)
	{
		if (values == null || !values.Any())
		{
			throw new IllegalArgumentException("Cannot calculate percentile of empty sequence");
		}

		if (percentile < 0 || percentile > 100)
		{
			throw new IndexOutOfBoundsException("percentile", "Percentile must be between 0 and 100");
		}

		var sortedValues = values.stream()(v -> v).toArray();
		var index = (int)Math.ceil((percentile / 100.0) * sortedValues.length) - 1;

		return sortedValues[index];
	}

	public static java.lang.Iterable<Double> RemoveOutliers(java.lang.Iterable<Double> values)
	{
		if (values == null || !values.Any())
		{
			throw new IllegalArgumentException("Cannot remove outliers from empty sequence");
		}

		var sortedValues = values.stream()(v -> v).toArray();
		var q1 = Percentile(sortedValues, 25);
		var q3 = Percentile(sortedValues, 75);
		var iqr = q3 - q1;
		var lowerBound = q1 - (1.5 * iqr);
		var upperBound = q3 + (1.5 * iqr);

		return sortedValues.Where(v -> v >= lowerBound && v <= upperBound);
	}

}
