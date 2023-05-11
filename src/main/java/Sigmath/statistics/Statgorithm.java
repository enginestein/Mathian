package sigmath;

import com.aspose.ms.System.IDisposable;
import java.util.Iterator;
import com.aspose.ms.lang.Operators;
import com.aspose.ms.System.Collections.Generic.IGenericEnumerable;
import com.aspose.ms.System.ArgumentException;
import com.aspose.ms.System.Collections.Generic.IGenericEnumerator;
import com.aspose.ms.System.ArgumentOutOfRangeException;
import com.aspose.ms.System.msMath;

public class Statgorithm
{
    public static double skewness(IGenericEnumerable<Double> values)
    {
        if (values == null || !values.Any())
        {
            throw new ArgumentException("Cannot calculate skewness of empty sequence");
        }

        int count = 0;
        double sum = 0.0;
        double sumOfSquaredDifferences = 0.0;
        double sumOfCubedDifferences = 0.0;

        //foreach to while statements conversion
        Iterator tmp0 = ( values).iterator();
        try
        {
          while (tmp0.hasNext())
          {
            double value = Operators.unboxing(tmp0.next(), double.class);
            count++;
            sum += value;
            double difference = value - Statistics.mean(values);
            sumOfSquaredDifferences += difference * difference;
            sumOfCubedDifferences += difference * difference * difference;
          }
        }
        finally
        {
          if (Operators.is(tmp0, IDisposable.class))
            ((IDisposable)tmp0).dispose();
        }

        double variance = Statistics.variance(values);
        double skewness = sumOfCubedDifferences / (count * Basic.cubeRoot(variance));

        return skewness;
    }

    public static double kurtosis(IGenericEnumerable<Double> values)
    {
        if (values == null || !values.Any())
        {
            throw new ArgumentException("Cannot calculate kurtosis of empty sequence");
        }

        double mean = Statistics.mean(values);
        int count = 0;
        double sumOfSquaredDifferences = 0.0;
        double sumOfFourthPowersOfDifferences = 0.0;

        //foreach to while statements conversion
        Iterator tmp0 = ( values).iterator();
        try
        {
          while (tmp0.hasNext())
          {
            double value = Operators.unboxing(tmp0.next(), double.class);
            count++;
            double difference = value - mean;
            sumOfSquaredDifferences += difference * difference;
            sumOfFourthPowersOfDifferences += difference * difference * difference * difference;
          }
        }
        finally
        {
          if (Operators.is(tmp0, IDisposable.class))
            ((IDisposable)tmp0).dispose();
        }

        double variance = sumOfSquaredDifferences / count;
        double fourthMoment = sumOfFourthPowersOfDifferences / count;
        double kurtosis = fourthMoment / (variance * variance) - 3;

        return kurtosis;
    }

    public static double covariance(IGenericEnumerable<Double> xValues, IGenericEnumerable<Double> yValues)
    {
        if (xValues == null || !xValues.Any() || yValues == null || !yValues.Any() || xValues.Count() != yValues.Count())
        {
            throw new ArgumentException("Invalid input");
        }

        double xMean = Statistics.mean(xValues);
        double yMean = Statistics.mean(yValues);
        int count = 0;
        double sumOfProductsOfDifferences = 0.0;

        final IGenericEnumerator<Double> xEnumerator = xValues.iterator();
        try /*JAVA: was using*/
        {
        final IGenericEnumerator<Double> yEnumerator = yValues.iterator();
        try /*JAVA: was using*/
        {
            while (xEnumerator.hasNext() && yEnumerator.hasNext())
            {
                count++;
                double xDifference = xEnumerator.next() - xMean;
                double yDifference = yEnumerator.next() - yMean;
                sumOfProductsOfDifferences += xDifference * yDifference;
            }
        }
        finally { if (yEnumerator != null) ((IDisposable)yEnumerator).dispose(); }
        }
        finally { if (xEnumerator != null) ((IDisposable)xEnumerator).dispose(); }

        double covariance = sumOfProductsOfDifferences / count;

        return covariance;
    }

    public static double correlation(IGenericEnumerable<Double> xValues, IGenericEnumerable<Double> yValues)
    {
        if (xValues == null || !xValues.Any() || yValues == null || !yValues.Any() || xValues.Count() != yValues.Count())
        {
            throw new ArgumentException("Invalid input");
        }

        double xMean = Statistics.mean(xValues);
        double yMean = Statistics.mean(yValues);
        int count = 0;
        double sumOfProductsOfDifferences = 0.0;
        double sumOfSquaredDifferencesOfX = 0.0;
        double sumOfSquaredDifferencesOfY = 0.0;

        final IGenericEnumerator<Double> xEnumerator = xValues.iterator();
        try /*JAVA: was using*/
        {
        final IGenericEnumerator<Double> yEnumerator = yValues.iterator();
        try /*JAVA: was using*/
        {
            while (xEnumerator.hasNext() && yEnumerator.hasNext())
            {
                count++;
                double xDifference = xEnumerator.next() - xMean;
                double yDifference = yEnumerator.next() - yMean;
                sumOfProductsOfDifferences += xDifference * yDifference;
                sumOfSquaredDifferencesOfX += xDifference * xDifference;
                sumOfSquaredDifferencesOfY += yDifference * yDifference;
            }
        }
        finally { if (yEnumerator != null) ((IDisposable)yEnumerator).dispose(); }
        }
        finally { if (xEnumerator != null) ((IDisposable)xEnumerator).dispose(); }

        double correlation = sumOfProductsOfDifferences / (Basic.squareRoot(sumOfSquaredDifferencesOfX) * Basic.squareRoot(sumOfSquaredDifferencesOfY));

        return correlation;
    }

    public static double percentile(IGenericEnumerable<Double> values, int percentile)
    {
        if (values == null || !values.Any())
        {
            throw new ArgumentException("Cannot calculate percentile of empty sequence");
        }

        if (percentile < 0 || percentile > 100)
        {
            throw new ArgumentOutOfRangeException("percentile", "Percentile must be between 0 and 100");
        }

         sortedValues = values.OrderBy((v)).ToArray();
         index = (int)msMath.Ceiling((percentile / 100.0) * sortedValues.Length) - 1;

        return sortedValues[index];
    }

    public static List<Double> removeOutliers(IGenericEnumerable<Double> values)
{
    Double[] sortedValues;
    Double q1, q3, iqr, lowerBound, upperBound;
        
    if (values == null || !values.Any())
    {
        throw new ArgumentException("Cannot remove outliers from empty sequence");
    }

    sortedValues = values.OrderBy((v -> v)).ToArray();
    q1 = Percentile(sortedValues, 25);
    q3 = Percentile(sortedValues, 75);
    iqr = q3 - q1;
    lowerBound = q1 - (1.5 * iqr);
    upperBound = q3 + (1.5 * iqr);

    return Arrays.stream(sortedValues)
                 .filter(v -> v >= lowerBound && v <= upperBound)
                 .collect(Collectors.toList());
}

}   

