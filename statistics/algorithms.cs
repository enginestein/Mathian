using System;
using System.Collections.Generic;
using System.Linq;

namespace Mathian
{
    public class Statgorithm
    {
        public static double Skewness(IEnumerable<double> values)
        {
            if (values == null || !values.Any())
            {
                throw new ArgumentException("Cannot calculate skewness of empty sequence");
            }

            var count = 0;
            var sum = 0.0;
            var sumOfSquaredDifferences = 0.0;
            var sumOfCubedDifferences = 0.0;

            foreach (var value in values)
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

        public static double Kurtosis(IEnumerable<double> values)
        {
            if (values == null || !values.Any())
            {
                throw new ArgumentException("Cannot calculate kurtosis of empty sequence");
            }

            var mean = Statistics.Mean(values);
            var count = 0;
            var sumOfSquaredDifferences = 0.0;
            var sumOfFourthPowersOfDifferences = 0.0;

            foreach (var value in values)
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

        public static double Covariance(IEnumerable<double> xValues, IEnumerable<double> yValues)
        {
            if (xValues == null || !xValues.Any() || yValues == null || !yValues.Any() || xValues.Count() != yValues.Count())
            {
                throw new ArgumentException("Invalid input");
            }

            var xMean = Statistics.Mean(xValues);
            var yMean = Statistics.Mean(yValues);
            var count = 0;
            var sumOfProductsOfDifferences = 0.0;

            using (var xEnumerator = xValues.GetEnumerator())
            using (var yEnumerator = yValues.GetEnumerator())
            {
                while (xEnumerator.MoveNext() && yEnumerator.MoveNext())
                {
                    count++;
                    var xDifference = xEnumerator.Current - xMean;
                    var yDifference = yEnumerator.Current - yMean;
                    sumOfProductsOfDifferences += xDifference * yDifference;
                }
            }

            var covariance = sumOfProductsOfDifferences / count;

            return covariance;
        }

    

        public static double Percentile(IEnumerable<double> values, int percentile)
        {
            if (values == null || !values.Any())
            {
                throw new ArgumentException("Cannot calculate percentile of empty sequence");
            }

            if (percentile < 0 || percentile > 100)
            {
                throw new ArgumentOutOfRangeException("percentile", "Percentile must be between 0 and 100");
            }

            var sortedValues = values.OrderBy(v => v).ToArray();
            var index = (int)Math.Ceiling((percentile / 100.0) * sortedValues.Length) - 1;

            return sortedValues[index];
        }

        public static IEnumerable<double> RemoveOutliers(IEnumerable<double> values)
        {
            if (values == null || !values.Any())
            {
                throw new ArgumentException("Cannot remove outliers from empty sequence");
            }

            var sortedValues = values.OrderBy(v => v).ToArray();
            var q1 = Percentile(sortedValues, 25);
            var q3 = Percentile(sortedValues, 75);
            var iqr = q3 - q1;
            var lowerBound = q1 - (1.5 * iqr);
            var upperBound = q3 + (1.5 * iqr);

            return sortedValues.Where(v => v >= lowerBound && v <= upperBound);
        }

    }

}