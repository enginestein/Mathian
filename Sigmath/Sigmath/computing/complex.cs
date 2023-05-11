using System;

namespace Sigmath
{
    public class Compl
    {
        internal static double Abs(double v)
        {
            throw new NotImplementedException();
        }

        public struct Complex
        {
            public double Real { get; }
            public double Imaginary { get; }

            public Complex(double real, double imaginary)
            {
                Real = real;
                Imaginary = imaginary;
            }

            public static Complex operator +(Complex a, Complex b)
            {
                return new Complex(a.Real + b.Real, a.Imaginary + b.Imaginary);
            }

            public static Complex operator -(Complex a, Complex b)
            {
                return new Complex(a.Real - b.Real, a.Imaginary - b.Imaginary);
            }

            public static Complex operator *(Complex a, Complex b)
            {
                return new Complex(a.Real * b.Real - a.Imaginary * b.Imaginary, a.Real * b.Imaginary + a.Imaginary * b.Real);
            }

            public static Complex operator /(Complex a, Complex b)
            {
                var denominator = b.Real * b.Real + b.Imaginary * b.Imaginary;
                var numeratorReal = a.Real * b.Real + a.Imaginary * b.Imaginary;
                var numeratorImaginary = a.Imaginary * b.Real - a.Real * b.Imaginary;

                return new Complex(numeratorReal / denominator, numeratorImaginary / denominator);
            }

            public static implicit operator Complex(int v)
            {
                throw new NotImplementedException();
            }

            public static double Abs(Complex a)
            {
                return Basic.SquareRoot(a.Real * a.Real + a.Imaginary * a.Imaginary);
            }

            public static double Magnitude(Complex number)
            {
                return Basic.SquareRoot(number.Real * number.Real + number.Imaginary * number.Imaginary);
            }
        }
    }
}
