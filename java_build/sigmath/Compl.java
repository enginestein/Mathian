package sigmath;

public class Compl
{
	public static double Abs(double v)
	{
		throw new UnsupportedOperationException();
	}

//C# TO JAVA CONVERTER WARNING: Java does not allow user-defined value types. The behavior of this class may differ from the original:
//ORIGINAL LINE: public struct Complex
	public final static class Complex
	{
		private double Real;
		public double getReal()
		{
			return Real;
		}
		private double Imaginary;
		public double getImaginary()
		{
			return Imaginary;
		}

		public Complex()
		{
		}

		public Complex(double real, double imaginary)
		{
			Real = real;
			Imaginary = imaginary;
		}

		public static Complex opAdd(Complex a, Complex b)
		{
			return new Complex(a.getReal() + b.getReal(), a.getImaginary() + b.getImaginary());
		}

		public static Complex opSubtract(Complex a, Complex b)
		{
			return new Complex(a.getReal() - b.getReal(), a.getImaginary() - b.getImaginary());
		}

		public static Complex opMultiply(Complex a, Complex b)
		{
			return new Complex(a.getReal() * b.getReal() - a.getImaginary() * b.getImaginary(), a.getReal() * b.getImaginary() + a.getImaginary() * b.getReal());
		}

		public static Complex opDivide(Complex a, Complex b)
		{
			var denominator = b.getReal() * b.getReal() + b.getImaginary() * b.getImaginary();
			var numeratorReal = a.getReal() * b.getReal() + a.getImaginary() * b.getImaginary();
			var numeratorImaginary = a.getImaginary() * b.getReal() - a.getReal() * b.getImaginary();

			return new Complex(numeratorReal / denominator, numeratorImaginary / denominator);
		}

//C# TO JAVA CONVERTER TASK: The following operator overload is not converted by C# to Java Converter:
//		public static implicit operator Complex(int v)
//			{
//				throw new NotImplementedException();
//			}

		public static double Abs(Complex a)
		{
			return Basic.SquareRoot(a.getReal() * a.getReal() + a.getImaginary() * a.getImaginary());
		}

		public static double Magnitude(Complex number)
		{
			return Basic.SquareRoot(number.getReal() * number.getReal() + number.getImaginary() * number.getImaginary());
		}
	}
}
