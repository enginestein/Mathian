package sigmath;

import com.aspose.ms.System.Convert;



public class ArithmeticProgression
{

    public static double[] arithmetic(double firstTerm, double commonDifference, int numTerms)
    {
        double[] terms = new double[numTerms];
        for (int i = 0; i < numTerms; i++)
        {
            terms[i] = firstTerm + i * commonDifference;
        }
        return terms;
    }

    public static double arithmeticSum(double firstTerm, double commonDifference, int numTerms)
    {
        return numTerms * (2 * firstTerm + (numTerms - 1) * commonDifference) / 2;
    }
    public static double sum(int n, double a1, double d)
    {
        return n * (2 * a1 + (n - 1) * d) / 2;
    }

    public static double nthTerm(int n, double a1, double d)
    {
        return a1 + (n - 1) * d;
    }

    public static int termNumber(double an, double a1, double d)
    {
        double n = (an - a1) / d + 1;
        return Convert.toInt32(n);
    }

    public static int termNumber(double an, int n, double a1)
    {
        double d = (an - a1) / (n - 1);
        return Convert.toInt32(d);
    }

    public static double commonDifference(double an, double a1, int n)
    {
        return (an - a1) / (n - 1);
    }

    public static double firstTerm(double an, int n, double d)
    {
        return an - (n - 1) * d;
    }

    public static double lastTerm(double a1, int n, double d)
    {
        return a1 + (n - 1) * d;
    }
}
