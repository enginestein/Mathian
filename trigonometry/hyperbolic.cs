using System;

namespace Sigmath
{
    public class Hyperbolic
    {
        public static double Sinh(double x)
        {
            return (Basic.Exp(x) - Basic.Exp(-x)) / 2;
        }

        public static double Cosh(double x)
        {
            return (Basic.Exp(x) + Basic.Exp(-x)) / 2;
        }

        public static double Tanh(double x)
        {
            return Sinh(x) / Cosh(x);
        }

        public static double Sech(double x)
        {
            return 1 / Cosh(x);
        }

        public static double Csch(double x)
        {
            return 1 / Sinh(x);
        }

        public static double Coth(double x)
        {
            return 1 / Tanh(x);
        }

        public static double Asinh(double x)
        {
            return Logarithm.Log(x + Basic.SquareRoot(Basic.Power(x, 2) + 1));
        }

        public static double Acosh(double x)
        {
            if (x < 1)
            {
                throw new ArgumentException("Input to inverse hyperbolic cosine function must be greater than or equal to 1");
            }
            return Logarithm.Log(x + Basic.SquareRoot(Basic.Power(x, 2) - 1));
        }

        public static double Atanh(double x)
        {
            if (x <= -1 || x >= 1)
            {
                throw new ArgumentException("Input to inverse hyperbolic tangent function must be between -1 and 1 (exclusive)");
            }
            return 0.5 * Logarithm.Log((1 + x) / (1 - x));
        }

        public static double Asech(double x)
        {
            if (x <= 0 || x >= 1)
            {
                throw new ArgumentException("Input to inverse hyperbolic secant function must be between 0 and 1 (exclusive)");
            }
            return Acosh(1 / x);
        }

        public static double Acsch(double x)
        {
            if (x <= 0)
            {
                throw new ArgumentException("Input to inverse hyperbolic cosecant function must be greater than 0");
            }
            return Asinh(1 / x);
        }

        public static double Acoth(double x)
        {
            if (x <= -1 || x >= 1)
            {
                throw new ArgumentException("Input to inverse hyperbolic cotangent function must be between -1 and 1 (exclusive)");
            }
            return 0.5 * Logarithm.Log((x + 1) / (x - 1));
        }
    }
}
