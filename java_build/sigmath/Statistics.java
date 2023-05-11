package sigmath;

import java.util.*;

public class Statistics
{
	public static double Mean(java.lang.Iterable<Double> values)
	{
		if (values == null || !values.Any())
		{
			throw new IllegalArgumentException("Cannot calculate mean of empty sequence");
		}

		var count = 0;
		var sum = 0.0;

		for (var value : values)
		{
			count++;
			sum += value;
		}

		return sum / count;
	}

	public static double Median(java.lang.Iterable<Double> values)
	{
		if (values == null || !values.Any())
		{
			throw new IllegalArgumentException("Cannot calculate median of empty sequence");
		}

		var sortedValues = values.stream()(v -> v).toArray();
		var middleIndex = sortedValues.length / 2;

		if (sortedValues.length % 2 == 0)
		{
			return (sortedValues[middleIndex - 1] + sortedValues[middleIndex]) / 2.0;
		}
		else
		{
			return sortedValues[middleIndex];
		}
	}

	public static double Mode(java.lang.Iterable<Double> values)
	{
		if (values == null || !values.Any())
		{
			throw new IllegalArgumentException("Cannot calculate mode of empty sequence");
		}

		var valueCounts = new HashMap<Double, Integer>();

		for (var value : values)
		{
			if (!valueCounts.containsKey(value))
			{
				valueCounts.put(value, 0);
			}

			valueCounts.get(value)++;
		}

		var maxCount = valueCounts.values().Max();
		var modes = valueCounts.stream().filter(pair -> pair.Value == maxCount).map(pair -> pair.Key);

		if (modes.Count() == 1)
		{
			return modes.First();
		}
		else
		{
			throw new IllegalStateException("Sequence has multiple modes");
		}
	}

	public static double Variance(java.lang.Iterable<Double> values)
	{
		if (values == null || !values.Any())
		{
			throw new IllegalArgumentException("Cannot calculate variance of empty sequence");
		}

		var mean = Mean(values);
		var count = 0;
		var sumOfSquaredDifferences = 0.0;

		for (var value : values)
		{
			count++;
			var difference = value - mean;
			sumOfSquaredDifferences += difference * difference;
		}

		return sumOfSquaredDifferences / count;
	}

	public static double StandardDeviation(java.lang.Iterable<Double> values)
	{
		return Basic.SquareRoot(Variance(values));
	}

	public static double Correlation(java.lang.Iterable<Double> valuesX, java.lang.Iterable<Double> valuesY)
	{
		if (valuesX == null || valuesY == null || !valuesX.Any() || !valuesY.Any())
		{
			throw new IllegalArgumentException("Cannot calculate correlation coefficient of empty sequences");
		}

		var count = 0;
		var sumX = 0.0;
		var sumY = 0.0;
		var sumXY = 0.0;
		var sumXSquared = 0.0;
		var sumYSquared = 0.0;

		try (var enumX = valuesX.iterator())
		{
		try (var enumY = valuesY.iterator())
		{
			while (enumX.hasNext() && enumY.hasNext())
			{
				var valueX = enumX.next();
//C# TO JAVA CONVERTER TASK: .NET iterators are only converted within the context of 'while' and 'for' loops:
				var valueY = enumY.Current;
				count++;
				sumX += valueX;
				sumY += valueY;
				sumXY += valueX * valueY;
				sumXSquared += valueX * valueX;
				sumYSquared += valueY * valueY;
			}
		}
		}

		var numerator = count * sumXY - sumX * sumY;
		var denominator = Basic.SquareRoot((count * sumXSquared - sumX * sumX) * (count * sumYSquared - sumY * sumY));

		return numerator / denominator;
	}

}
