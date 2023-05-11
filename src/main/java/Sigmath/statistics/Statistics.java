package sigmath;

import com.aspose.ms.System.IDisposable;
import java.util.Iterator;
import com.aspose.ms.lang.Operators;
import com.aspose.ms.System.Collections.Generic.IGenericEnumerable;
import com.aspose.ms.System.ArgumentException;
import com.aspose.ms.System.Collections.Generic.Dictionary;
import com.aspose.ms.System.InvalidOperationException;
import com.aspose.ms.System.Collections.Generic.IGenericEnumerator;

public class Statistics {
    public static double mean(IGenericEnumerable<Double> values) {
        if (values == null || !values.Any()) {
            throw new ArgumentException("Cannot calculate mean of empty sequence");
        }

        int count = 0;
        double sum = 0.0;

        //foreach to while statements conversion
        Iterator<Double> tmp0 = values.iterator();
        try {
            while (tmp0.hasNext()) {
                double value = tmp0.next();
                count++;
                sum += value;
            }
        } finally {
            if (tmp0 instanceof IDisposable)
                ((IDisposable) tmp0).dispose();
        }

        return sum / count;
    }

    public static double median(IGenericEnumerable<Double> values) {
        if (values == null || !values.Any()) {
            throw new ArgumentException("Cannot calculate median of empty sequence");
        }

        Double[] sortedValues = values.OrderBy((v) -> v).ToArray();
        int middleIndex = sortedValues.length / 2;

        if (sortedValues.length % 2 == 0) {
            return (sortedValues[middleIndex - 1] + sortedValues[middleIndex]) / 2.0;
        } else {
            return sortedValues[middleIndex];
        }
    }

    public static double mode(IGenericEnumerable<Double> values) {
        if (values == null || !values.Any()) {
            throw new ArgumentException("Cannot calculate mode of empty sequence");
        }

        Dictionary<Double, Integer> valueCounts = new Dictionary<Double, Integer>();

        //foreach to while statements conversion
        Iterator<Double> tmp0 = values.iterator();
        try {
            while (tmp0.hasNext()) {
                double value = tmp0.next();
                if (!valueCounts.containsKey(value)) {
                    valueCounts.put(value, 0);
                }

                valueCounts.put(value, valueCounts.get(value) + 1);
            }
        } finally {
            if (tmp0 instanceof IDisposable)
                ((IDisposable) tmp0).dispose();
        }

        int maxCount = valueCounts.getValues().Max();
        Iterable<Double> modes = valueCounts.Where((pair) -> pair.Value == maxCount).Select((pair) -> pair.Key);

        if (modes.Count() == 1) {
            return modes.First();
        } else {
            throw new InvalidOperationException("Sequence has multiple modes");
        }
    }

    public static double variance(IGenericEnumerable<Double> values) {
        if (values == null || !values.Any()) {
            throw new ArgumentException("Cannot calculate variance of empty sequence");
        }

        double mean = mean(values);
        int count = 0;
        double sumOfSquaredDifferences = 0.0;

        //foreach to while statements conversion
        Iterator<Double> tmp0 = values.iterator();
        try {
            while (tmp0.hasNext()) {
                double value = tmp0.next();
                count++;
                double difference = value - mean;
                sumOfSquaredDifferences += difference * difference;
            }
        } finally {
            if (tmp0 instanceof IDisposable)
                ((IDisposable) tmp0).dispose();
        }

        return sumOfSquaredDifferences / count;
    }
    public static double standardDeviation(IGenericEnumerable<Double> values)
    {
        return Basic.squareRoot(variance(values));
    }

    public static double correlation(IGenericEnumerable<Double> valuesX, IGenericEnumerable<Double> valuesY)
    {
        if (valuesX == null || valuesY == null || !valuesX.Any() || !valuesY.Any())
        {
            throw new ArgumentException("Cannot calculate correlation coefficient of empty sequences");
        }

        int count = 0;
        double sumX = 0.0;
        double sumY = 0.0;
        double sumXY = 0.0;
        double sumXSquared = 0.0;
        double sumYSquared = 0.0;

        final IGenericEnumerator<Double> enumX = valuesX.iterator();
        try /*JAVA: was using*/
        {
        final IGenericEnumerator<Double> enumY = valuesY.iterator();
        try /*JAVA: was using*/
        {
            while (enumX.hasNext() && enumY.hasNext())
            {
                double valueX = enumX.next();
                double valueY = enumY.next();
                count++;
                sumX += valueX;
                sumY += valueY;
                sumXY += valueX * valueY;
                sumXSquared += valueX * valueX;
                sumYSquared += valueY * valueY;
            }
        }
        finally { if (enumY != null) ((IDisposable)enumY).dispose(); }
        }
        finally { if (enumX != null) ((IDisposable)enumX).dispose(); }

        double numerator = count * sumXY - sumX * sumY;
        double denominator = Basic.squareRoot((count * sumXSquared - sumX * sumX) * (count * sumYSquared - sumY * sumY));

        return numerator / denominator;
    }

}

