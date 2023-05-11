package sigmath;

import java.time.*;

public class Random
{
	public static double RandUniform(double min, double max)
	{
		Rand rand = new Rand();
		return rand.NextDouble() * (max - min) + min;
	}

	public static double RandNormal(double mean, double stdDev)
	{
		Rand rand = new Rand();
		double u1 = rand.NextDouble();
		double u2 = rand.NextDouble();
		double z0 = Basic.SquareRoot(-2 * Logarithm.Log(u1)) * Trig.Cos(2 * Constants.Pi * u2);
		return z0 * stdDev + mean;
	}

	public static int RandPoisson(double lambda)
	{
		Rand rand = new Rand();
		double L = Basic.Exp(-lambda);
		double p = 1;
		int k = 0;
		do
		{
			k++;
			p *= rand.NextDouble();
		} while (p > L);
		return k - 1;
	}
}
