package sigmath;

import com.aspose.ms.System.ArgumentException;



public class Trig
    {
        private static final int numTerms = 10; 
        public static double sin(double x)
        {
            while (x < 0)
            {
                x += 2 * Constants.Pi;
            }

            while (x > 2 * Constants.Pi)
            {
                x -= 2 * Constants.Pi;
            }

            double sum = 0;

            for (int i = 0; i < numTerms; i++)
            {
                sum += ((i % 2 == 0 ? 1 : -1) * Basic.power(x, 2 * i + 1)) / factorial(2 * i + 1);
            }

            return sum;
        }

        public static double cos(double x)
        {
            while (x < 0)
            {
                x += 2 * Constants.Pi;
            }

            while (x > 2 * Constants.Pi)
            {
                x -= 2 * Constants.Pi;
            }

            double sum = 0;

            for (int i = 0; i < numTerms; i++)
            {
                sum += ((i % 2 == 0 ? 1 : -1) * Basic.power(x, 2 * i)) / factorial(2 * i);
            }

            return sum;
        }

        public static double tan(double x)
        {
            return sin(x) / cos(x);
        }

        public static double asin(double x)
        {
            if (x < -1 || x > 1)
            {
                throw new ArgumentException("Input to arcsine function must be between -1 and 1");
            }

            double sum = 0;

            for (int i = 0; i < numTerms; i++)
            {
                sum += (factorial(2 * i) * Basic.power(x, 2 * i + 1)) / (Basic.power(4, i) * Basic.power(factorial(i), 2) * (2 * i + 1));
            }

            return sum;
        }

        public static double acos(double x)
        {
            if (x < -1 || x > 1)
            {
                throw new ArgumentException("Input to arccosine function must be between -1 and 1");
            }

            return Constants.Pi / 2 - asin(x);
        }

        public static double atan(double x)
        {
            double sum = 0;

            for (int i = 0; i < numTerms; i++)
            {
                sum += ((i % 2 == 0 ? 1 : -1) * Basic.power(x, 2 * i + 1)) / (2 * i + 1);
            }

            return sum;
        }

        private static double factorial(int n)
        {
            double result = 1;

            for (int i = 1; i <= n; i++)
            {
                result *= i;
            }

            return result;
        }
    }

