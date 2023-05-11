using System;
using System.Collections.Generic;
using System.Linq;

namespace Sigmath
{
    public class Statistics
    {
        public static double Mean(IEnumerable<double> values)
        {
            if (values == null || !values.Any())
            {
                throw new ArgumentException("Cannot calculate mean of empty sequence");
            }

            var count = 0;
            var sum = 0.0;

            foreach (var value in values)
            {
                count++;
                sum += value;
            }

            return sum / count;
        }

        public static double Median(IEnumerable<double> values)
        {
            if (values == null || !values.Any())
            {
                throw new ArgumentException("Cannot calculate median of empty sequence");
            }

            var sortedValues = values.OrderBy(v => v).ToArray();
            var middleIndex = sortedValues.Length / 2;

            if (sortedValues.Length % 2 == 0)
            {
                return (sortedValues[middleIndex - 1] + sortedValues[middleIndex]) / 2.0;
            }
            else
            {
                return sortedValues[middleIndex];
            }
        }

        public static double Mode(IEnumerable<double> values)
        {
            if (values == null || !values.Any())
            {
                throw new ArgumentException("Cannot calculate mode of empty sequence");
            }

            var valueCounts = new Dictionary<double, int>();

            foreach (var value in values)
            {
                if (!valueCounts.ContainsKey(value))
                {
                    valueCounts.Add(value, 0);
                }

                valueCounts[value]++;
            }

            var maxCount = valueCounts.Values.Max();
            var modes = valueCounts.Where(pair => pair.Value == maxCount).Select(pair => pair.Key);

            if (modes.Count() == 1)
            {
                return modes.First();
            }
            else
            {
                throw new InvalidOperationException("Sequence has multiple modes");
            }
        }

        public static double Variance(IEnumerable<double> values)
        {
            if (values == null || !values.Any())
            {
                throw new ArgumentException("Cannot calculate variance of empty sequence");
            }

            var mean = Mean(values);
            var count = 0;
            var sumOfSquaredDifferences = 0.0;

            foreach (var value in values)
            {
                count++;
                var difference = value - mean;
                sumOfSquaredDifferences += difference * difference;
            }

            return sumOfSquaredDifferences / count;
        }

        public static double StandardDeviation(IEnumerable<double> values)
        {
            return Basic.SquareRoot(Variance(values));
        }

        public static double Correlation(IEnumerable<double> valuesX, IEnumerable<double> valuesY)
        {
            if (valuesX == null || valuesY == null || !valuesX.Any() || !valuesY.Any())
            {
                throw new ArgumentException("Cannot calculate correlation coefficient of empty sequences");
            }

            var count = 0;
            var sumX = 0.0;
            var sumY = 0.0;
            var sumXY = 0.0;
            var sumXSquared = 0.0;
            var sumYSquared = 0.0;

            using (var enumX = valuesX.GetEnumerator())
            using (var enumY = valuesY.GetEnumerator())
            {
                while (enumX.MoveNext() && enumY.MoveNext())
                {
                    var valueX = enumX.Current;
                    var valueY = enumY.Current;
                    count++;
                    sumX += valueX;
                    sumY += valueY;
                    sumXY += valueX * valueY;
                    sumXSquared += valueX * valueX;
                    sumYSquared += valueY * valueY;
                }
            }

            var numerator = count * sumXY - sumX * sumY;
            var denominator = Basic.SquareRoot((count * sumXSquared - sumX * sumX) * (count * sumYSquared - sumY * sumY));

            return numerator / denominator;
        }

    }
}
