﻿using System;

namespace Mathian
{
    public class Trig
    {
        private const int numTerms = 10;
        public static double Sin(double x)
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
                sum += ((i % 2 == 0 ? 1 : -1) * Basic.Power(x, 2 * i + 1)) / Factorial(2 * i + 1);
            }

            return sum;
        }

        public static double Cos(double x)
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
                sum += ((i % 2 == 0 ? 1 : -1) * Basic.Power(x, 2 * i)) / Factorial(2 * i);
            }

            return sum;
        }

        public static double Tan(double x)
        {
            return Sin(x) / Cos(x);
        }

        public static double Asin(double x)
        {
            if (x < -1 || x > 1)
            {
                throw new ArgumentException("Input to arcsine function must be between -1 and 1");
            }

            double sum = 0;

            for (int i = 0; i < numTerms; i++)
            {
                sum += (Factorial(2 * i) * Basic.Power(x, 2 * i + 1)) / (Basic.Power(4, i) * Basic.Power(Factorial(i), 2) * (2 * i + 1));
            }

            return sum;
        }

        public static double Acos(double x)
        {
            if (x < -1 || x > 1)
            {
                throw new ArgumentException("Input to arccosine function must be between -1 and 1");
            }

            return Constants.Pi / 2 - Asin(x);
        }

        public static double Atan(double x)
        {
            double sum = 0;

            for (int i = 0; i < numTerms; i++)
            {
                sum += ((i % 2 == 0 ? 1 : -1) * Basic.Power(x, 2 * i + 1)) / (2 * i + 1);
            }

            return sum;
        }

        private static double Factorial(int n)
        {
            double result = 1;

            for (int i = 1; i <= n; i++)
            {
                result *= i;
            }

            return result;
        }
    }
}
