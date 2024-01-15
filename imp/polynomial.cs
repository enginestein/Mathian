using System;
using System.Linq;

namespace Sigmath
{
    public class Polynomial
    {
        public readonly double[] _coefficients;

        public Polynomial(params double[] coefficients)
        {
            _coefficients = coefficients;
        }

        public int Degree => _coefficients.Length - 1;

        public double Evaluate(double x)
        {
            double result = 0;
            for (int i = Degree; i >= 0; i--)
            {
                result = result * x + _coefficients[i];
            }
            return result;
        }

        public static Polynomial Divide(Polynomial dividend, Polynomial divisor)
        {
            if (dividend.Degree < divisor.Degree)
            {
                return new Polynomial(0);
            }

            double[] quotientCoefficients = new double[dividend.Degree - divisor.Degree + 1];
            double[] remainderCoefficients = (double[])dividend._coefficients.Clone();

            for (int i = dividend.Degree - divisor.Degree; i >= 0; i--)
            {
                double quotientCoefficient = remainderCoefficients[i + divisor.Degree] / divisor._coefficients[divisor.Degree];
                quotientCoefficients[i] = quotientCoefficient;

                for (int j = 0; j <= divisor.Degree; j++)
                {
                    remainderCoefficients[i + j] -= quotientCoefficient * divisor._coefficients[j];
                }
            }

            return new Polynomial(quotientCoefficients.Reverse().ToArray());
        }
        public Polynomial Divide(Polynomial divisor)
        {
            if (divisor.Degree > Degree)
            {
                return new Polynomial(0);
            }

            var remainder = new Polynomial(_coefficients);
            var quotientCoefficients = new double[Degree - divisor.Degree + 1];

            for (int i = Degree - divisor.Degree; i >= 0; i--)
            {
                double quotientCoefficient = remainder._coefficients[i + divisor.Degree] / divisor._coefficients[divisor.Degree];
                quotientCoefficients[i] = quotientCoefficient;

                for (int j = 0; j <= divisor.Degree; j++)
                {
                    remainder._coefficients[i + j] -= quotientCoefficient * divisor._coefficients[j];
                }
            }

            return new Polynomial(quotientCoefficients.Reverse().ToArray());
        }


    }

    internal static class PolynomialExtensions
    {
        public static Polynomial Derivative(this Polynomial polynomial)
        {
            if (polynomial.Degree == 0)
            {
                return new Polynomial(0);
            }

            var derivativeCoefficients = new double[polynomial.Degree];
            for (int i = 0; i < polynomial.Degree; i++)
            {
                derivativeCoefficients[i] = (polynomial.Degree - i) * polynomial._coefficients[i];
            }
            return new Polynomial(derivativeCoefficients);
        }
    }
}
