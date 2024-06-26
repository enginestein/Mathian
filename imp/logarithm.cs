﻿using System;

namespace Mathian
{
    public class Logarithm
    {
        private const double EPSILON = 1e-14;

        public static double Log(double x)
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

        public static double Log10(double x)
        {
            if (x <= 0)
            {
                throw new ArgumentException("Invalid argument: x must be positive");
            }
            return Log(x) / Log(10);
        }


        public static double Logn(double n, double x)
        {
            return Log(x) / Log(n);
        }
    }
}
