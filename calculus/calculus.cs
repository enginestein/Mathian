using System;
using System.Collections.Generic;

namespace Sigmath
{
    public class Calculus
    {
        public static double Derivative(Func<double, double> f, double x)
        {
            const double dx = 1e-9; // small increment to find the derivative
            double y1 = f(x);
            double y2 = f(x + dx);
            double derivative = (y2 - y1) / dx;
            return derivative;
        }

        public static double Integral(Func<double, double> f, double a, double b, int n)
        {
            double h = (b - a) / n;
            double integral = 0;
            for (int i = 1; i < n; i++)
            {
                double x = a + i * h;
                integral += f(x);
            }
            integral += (f(a) + f(b)) / 2;
            integral *= h;
            return integral;
        }

        public static double Limit(Func<double, double> f, Func<double, double> g, double x)
        {
            const int maxIterations = 1000;
            const double tolerance = 1e-9;
            double fx = f(x);
            double gx = g(x);
            double limit = fx / gx;
            for (int i = 0; i < maxIterations; i++)
            {
                double fx1 = Derivative(f, x);
                double gx1 = Derivative(g, x);
                double newLimit = fx1 / gx1;
                if (Basic.Abs(newLimit - limit) < tolerance)
                {
                    return newLimit;
                }
                limit = newLimit;
                x += 1e-9;
            }
            throw new Exception("Limit does not exist or cannot be computed with L'Hopital's Rule.");
        }

        public static double FindRoot(Func<double, double> f, double a, double b, double epsilon = 1e-6)
        {
            if (f(a) * f(b) > 0)
                throw new ArgumentException("Function must have opposite signs at interval endpoints");

            double c = (a + b) / 2;

            while (Math.Abs(f(c)) > epsilon)
            {
                if (f(a) * f(c) < 0)
                    b = c;
                else
                    a = c;

                c = (a + b) / 2;
            }

            return c;
        }

        private static int Factorial(int n)
        {
            int result = 1;

            for (int i = 2; i <= n; i++)
                result *= i;

            return result;
        }

        public static Func<double[], double> PartialDerivative(Func<double[], double> f, int index, double h = 1e-6)
        {
            return x =>
            {
                var xPlus = (double[])x.Clone();
                xPlus[index] += h;

                var xMinus = (double[])x.Clone();
                xMinus[index] -= h;

                return (f(xPlus) - f(xMinus)) / (2 * h);
            };
        }

        public static Func<double[], double[]> Gradient(Func<double[], double> f, double h = 1e-6)
        {
            return x =>
            {
                var gradient = new double[x.Length];

                for (int i = 0; i < x.Length; i++)
                    gradient[i] = PartialDerivative(f, i, h)(x);

                return gradient;
            };
        }

        public static Func<double[], double[,]> Hessian(Func<double[], double> f, double h = 1e-6)
        {
            return x =>
            {
                int n = x.Length;
                var hessian = new double[n, n];

                for (int i = 0; i < n; i++)
                {
                    for (int j = 0; j < n; j++)
                    {
                        var fxx = PartialDerivative(PartialDerivative(f, i, h), j, h)(x);
                        hessian[i, j] = fxx;
                    }
                }

                return hessian;
            };
        }

        public static double[] FindCriticalPoints(Func<double, double> f, double a, double b, double epsilon = 1e-6)
        {
            var criticalPoints = new List<double>();

            // Evaluate function at endpoints of interval
            double fa = f(a);
            double fb = f(b);

            // Check if endpoints are critical points
            if (Math.Abs(fa) < epsilon) criticalPoints.Add(a);
            if (Math.Abs(fb) < epsilon) criticalPoints.Add(b);

            // Find critical points in the interval
            double x = a;
            double fx = f(a);

            while (x < b)
            {
                double xNext = x + epsilon;
                double fxNext = f(xNext);

                // Check if the current point is a critical point
                if (Math.Abs(fx) < epsilon && x > a && x < b)
                    criticalPoints.Add(x);

                // Check if the function changes sign between x and xNext
                if (fx * fxNext < 0)
                {
                    // Use bisection method to find a root
                    double xLeft = x;
                    double xRight = xNext;

                    while (xRight - xLeft > epsilon)
                    {
                        double xMid = (xLeft + xRight) / 2;
                        double fxMid = f(xMid);

                        if (Math.Abs(fxMid) < epsilon)
                        {
                            criticalPoints.Add(xMid);
                            break;
                        }

                        if (fx * fxMid < 0)
                            xRight = xMid;
                        else
                            xLeft = xMid;
                    }
                }

                x = xNext;
                fx = fxNext;
            }

            return criticalPoints.ToArray();
        }

        public enum RiemannSumType
        {
            Left,
            Right,
            Midpoint,
            Trapezoidal
        }

        public static double RiemannSum(Func<double, double> f, double a, double b, int n, RiemannSumType type = RiemannSumType.Left)
        {
            double dx = (b - a) / n;
            double sum = 0;

            for (int i = 0; i < n; i++)
            {
                double x = a + i * dx;
                double fx = f(x);

                switch (type)
                {
                    case RiemannSumType.Left:
                        sum += fx * dx;
                        break;
                    case RiemannSumType.Right:
                        sum += f(x + dx) * dx;
                        break;
                    case RiemannSumType.Midpoint:
                        sum += f(x + dx / 2) * dx;
                        break;
                    case RiemannSumType.Trapezoidal:
                        sum += (fx + f(x + dx)) * dx / 2;
                        break;
                }
            }

            return sum;
        }

        public static double DefiniteIntegral(Func<double, double> f, double a, double b, int n = 1000)
        {
            return RiemannSum(f, a, b, n, RiemannSumType.Midpoint);
        }
    }
}
