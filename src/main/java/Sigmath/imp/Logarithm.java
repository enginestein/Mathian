package sigmath;

import com.aspose.ms.System.ArgumentException;



public class Logarithm
{
    private static final double EPSILON = 1e-14;

    public static double log(double x)
    {
        if (x <= 0)
        {
            throw new ArgumentException("Invalid argument: x must be positive");
        }

        double y = 0;
        int k = 0;
        while (x >= 2)
        {
            x /= 2;
            k++;
        }
        while (x < 1)
        {
            x *= 2;
            k--;
        }
        double z = x - 1;
        double z2 = z * z;
        double z3 = z * z2;
        y = 2 * z / (1 + z) + 0.5 * z2 / (1 + z) - 0.25 * z3 / ((1 + z) * (1 + z)) + z3 / (3 * (1 + z) * (1 + z) * (1 + z));
        return y + k;
    }

    public static double log10(double x)
    {
        if (x <= 0)
        {
            throw new ArgumentException("Invalid argument: x must be positive");
        }
        return log(x) / log(10);
    }

    public static double ln(double x)
    {
        return log(x);
    }

    public static double logn(double n, double x)
    {
        return log(x) / log(n);
    }
}

