package sigmath;

import com.aspose.ms.System.DateTime;
import com.aspose.ms.System.ArgumentException;
import com.aspose.ms.System.Int32Extensions;
import com.aspose.ms.lang.Operators;
import com.aspose.ms.System.TypeCode;




public class Rand
{
    private static final long a = 6364136223846793005L;
    private static final long c = 1442695040888963407L;
    private static final long m = 9223372036854775783L;
    private long seed;

    public Rand()
    {
        seed = DateTime.getNow().getTicks();
    }

    public Rand(long seed)
    {
        this.seed = seed;
    }

    public final long nextLong()
    {
        seed = (a * seed + c) % m;
        return seed;
    }

    public final double nextDouble()
    {
        return (double)nextLong() / m;
    }

    public final int next(int minValue, int maxValue)
    {
        if (minValue >= maxValue)
            throw new ArgumentException("minValue must be less than maxValue");

        long range = (long)maxValue - minValue;
        return Operators.castToInt32((nextDouble() * range), TypeCode.Double) + minValue;
    }

    public final int next(int maxValue)
    {
        return next(0, maxValue);
    }

    public final int next()
    {
        return next(Int32Extensions.MinValue, Int32Extensions.MaxValue);
    }
}
class Random
{
    public static double randUniform(double min, double max)
    {
        Rand rand = new Rand();
        return rand.nextDouble() * (max - min) + min;
    }

    public static double randNormal(double mean, double stdDev)
    {
        Rand rand = new Rand();
        double u1 = rand.nextDouble();
        double u2 = rand.nextDouble();
        double z0 = Basic.squareRoot(-2 * Logarithm.log(u1)) * Trig.cos(2 * Constants.Pi * u2);
        return z0 * stdDev + mean;
    }

    public static int randPoisson(double lambda)
    {
        Rand rand = new Rand();
        double L = Basic.exp(-lambda);
        double p = 1;
        int k = 0;
        do
        {
            k++;
            p *= rand.nextDouble();
        } while (p > L);
        return k - 1;
    }
}

