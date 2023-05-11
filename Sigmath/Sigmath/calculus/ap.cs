using System;

namespace Sigmath
{
    public class ArithmeticProgression
    {

        public static double[] Arithmetic(double firstTerm, double commonDifference, int numTerms)
        {
            double[] terms = new double[numTerms];
            for (int i = 0; i < numTerms; i++)
            {
                terms[i] = firstTerm + i * commonDifference;
            }
            return terms;
        }

        public static double ArithmeticSum(double firstTerm, double commonDifference, int numTerms)
        {
            return numTerms * (2 * firstTerm + (numTerms - 1) * commonDifference) / 2;
        }

        public static double NthTerm(int n, double a1, double d)
        {
            return a1 + (n - 1) * d;
        }

        public static int TermNumber(double an, double a1, double d)
        {
            double n = (an - a1) / d + 1;
            return Convert.ToInt32(n);
        }

        public static int TermNumber(double an, int n, double a1)
        {
            double d = (an - a1) / (n - 1);
            return Convert.ToInt32(d);
        }

        public static double CommonDifference(double an, double a1, int n)
        {
            return (an - a1) / (n - 1);
        }

        public static double FirstTerm(double an, int n, double d)
        {
            return an - (n - 1) * d;
        }

        public static double LastTerm(double a1, int n, double d)
        {
            return a1 + (n - 1) * d;
        }
    }
}