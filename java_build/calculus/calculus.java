//====================================================================================================
//The Free Edition of C# to Java Converter limits conversion output to 100 lines per file.

//To purchase the Premium Edition, visit our website:
//https://www.tangiblesoftwaresolutions.com/order/order-csharp-to-java.html
//====================================================================================================

package sigmath;

import java.util.*;

public class Calculus
{
	public static double Derivative(tangible.Func1Param<Double, Double> f, double x)
	{
		final double dx = 1e-9; // small increment to find the derivative
		double y1 = f.invoke(x);
		double y2 = f.invoke(x + dx);
		double derivative = (y2 - y1) / dx;
		return derivative;
	}

	public static double Integral(tangible.Func1Param<Double, Double> f, double a, double b, int n)
	{
		double h = (b - a) / n;
		double integral = 0;
		for (int i = 1; i < n; i++)
		{
			double x = a + i * h;
			integral += f.invoke(x);
		}
		integral += (f.invoke(a) + f.invoke(b)) / 2;
		integral *= h;
		return integral;
	}

	public static double Limit(tangible.Func1Param<Double, Double> f, tangible.Func1Param<Double, Double> g, double x)
	{
		final int maxIterations = 1000;
		final double tolerance = 1e-9;
		double fx = f.invoke(x);
		double gx = g.invoke(x);
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
		throw new RuntimeException("Limit does not exist or cannot be computed with L'Hopital's Rule.");
	}


	public static double FindRoot(Func<Double, Double> f, double a, double b)
	{
		return FindRoot(f, a, b, 1e-6);
	}

//C# TO JAVA CONVERTER NOTE: Java does not support optional parameters. Overloaded method(s) are created above:
//ORIGINAL LINE: public static double FindRoot(Func<double, double> f, double a, double b, double epsilon = 1e-6)
	public static double FindRoot(tangible.Func1Param<Double, Double> f, double a, double b, double epsilon)
	{
		if (f.invoke(a) * f.invoke(b) > 0)
		{
			throw new IllegalArgumentException("Function must have opposite signs at interval endpoints");
		}

		double c = (a + b) / 2;

		while (Math.abs(f.invoke(c)) > epsilon)
		{
			if (f.invoke(a) * f.invoke(c) < 0)
			{
				b = c;
			}
			else
			{
				a = c;
			}

			c = (a + b) / 2;
		}

		return c;
	}

	private static int Factorial(int n)
	{
		int result = 1;

		for (int i = 2; i <= n; i++)
		{
			result *= i;
		}

		return result;
	}


	public static Func<double[], Double> PartialDerivative(Func<double[], Double> f, int index)
	{
		return PartialDerivative(f, index, 1e-6);
	}

//C# TO JAVA CONVERTER NOTE: Java does not support optional parameters. Overloaded method(s) are created above:
//ORIGINAL LINE: public static Func<double[], double> PartialDerivative(Func<double[], double> f, int index, double h = 1e-6)
	public static tangible.Func1Param<double[], Double> PartialDerivative(tangible.Func1Param<double[], Double> f, int index, double h)
	{
		return x ->
		{
				var xPlus = (double[])x.Clone();
				xPlus[index] += h;

				var xMinus = (double[])x.Clone();
				xMinus[index] -= h;

				return (f.invoke(xPlus) - f.invoke(xMinus)) / (2 * h);
		};
	}


	public static Func<double[], double[]> Gradient(Func<double[], Double> f)
	{
		return Gradient(f, 1e-6);
	}

//C# TO JAVA CONVERTER NOTE: Java does not support optional parameters. Overloaded method(s) are created above:
//ORIGINAL LINE: public static Func<double[], double[]> Gradient(Func<double[], double> f, double h = 1e-6)
	public static tangible.Func1Param<double[], double[]> Gradient(tangible.Func1Param<double[], Double> f, double h)
	{
		return x ->
		{
				var gradient = new double[x.Length];

				for (int i = 0; i < x.Length; i++)
				{
					gradient[i] = PartialDerivative(f, i, h)(x);
				}

				return gradient;
		};
	}


	public static Func<double[], double[][]> Hessian(Func<double[], Double> f)
	{
		return Hessian(f, 1e-6);
	}

//C# TO JAVA CONVERTER NOTE: Java does not support optional parameters. Overloaded method(s) are created above:
//ORIGINAL LINE: public static Func<double[], double[,]> Hessian(Func<double[], double> f, double h = 1e-6)
	public static tangible.Func1Param<double[], double[][]> Hessian(tangible.Func1Param<double[], Double> f, double h)
	{
		return x ->
		{
				int n = x.Length;
				var hessian = new double[n][n];

				for (int i = 0; i < n; i++)
				{
					for (int j = 0; j < n; j++)
					{
						var fxx = PartialDerivative(PartialDerivative(f, i, h), j, h)(x);
						hessian[i][j] = fxx;
					}
				}

				return hessian;
		};
	}


	public static double[] FindCriticalPoints(Func<Double, Double> f, double a, double b)
	{
		return FindCriticalPoints(f, a, b, 1e-6);
	}

//C# TO JAVA CONVERTER NOTE: Java does not support optional parameters. Overloaded method(s) are created above:
//ORIGINAL LINE: public static double[] FindCriticalPoints(Func<double, double> f, double a, double b, double epsilon = 1e-6)
	public static double[] FindCriticalPoints(tangible.Func1Param<Double, Double> f, double a, double b, double epsilon)
	{
		var criticalPoints = new ArrayList<Double>();

		// Evaluate function at endpoints of interval
		double fa = f.invoke(a);
		double fb = f.invoke(b);

		// Check if endpoints are critical points
		if (Math.abs(fa) < epsilon)
		{
			criticalPoints.add(a);
		}
		if (Math.abs(fb) < epsilon)
		{
			criticalPoints.add(b);
		}

		// Find critical points in the interval
		double x = a;
		double fx = f.invoke(a);

		while (x < b)
		{
			double xNext = x + epsilon;
			double fxNext = f.invoke(xNext);

			// Check if the current point is a critical point
			if (Math.abs(fx) < epsilon && x > a && x < b)
			{
				criticalPoints.add(x);
			}

			// Check if the function changes sign between x and xNext
			if (fx * fxNext < 0)
			{
				// Use bisection method to find a root

//====================================================================================================
//End of the allowed output for the Free Edition of C# to Java Converter.

//To purchase the Premium Edition, visit our website:
//https://www.tangiblesoftwaresolutions.com/order/order-csharp-to-java.html
//====================================================================================================
