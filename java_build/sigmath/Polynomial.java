package sigmath;

public class Polynomial
{
	public final double[] _coefficients;

	public Polynomial(double... coefficients)
	{
		_coefficients = coefficients;
	}

	public final int getDegree()
	{
		return _coefficients.length - 1;
	}

	public final double Evaluate(double x)
	{
		double result = 0;
		for (int i = getDegree(); i >= 0; i--)
		{
			result = result * x + _coefficients[i];
		}
		return result;
	}

	public static Polynomial Divide(Polynomial dividend, Polynomial divisor)
	{
		if (dividend.getDegree() < divisor.getDegree())
		{
			return new Polynomial(0);
		}

		double[] quotientCoefficients = new double[dividend.getDegree() - divisor.getDegree() + 1];
		double[] remainderCoefficients = (double[])dividend._coefficients.clone();

		for (int i = dividend.getDegree() - divisor.getDegree(); i >= 0; i--)
		{
			double quotientCoefficient = remainderCoefficients[i + divisor.getDegree()] / divisor._coefficients[divisor.getDegree()];
			quotientCoefficients[i] = quotientCoefficient;

			for (int j = 0; j <= divisor.getDegree(); j++)
			{
				remainderCoefficients[i + j] -= quotientCoefficient * divisor._coefficients[j];
			}
		}

		return new Polynomial(quotientCoefficients.Reverse().ToArray());
	}
	public final Polynomial Divide(Polynomial divisor)
	{
		if (divisor.getDegree() > getDegree())
		{
			return new Polynomial(0);
		}

		var remainder = new Polynomial(_coefficients);
		var quotientCoefficients = new double[getDegree() - divisor.getDegree() + 1];

		for (int i = getDegree() - divisor.getDegree(); i >= 0; i--)
		{
			double quotientCoefficient = remainder._coefficients[i + divisor.getDegree()] / divisor._coefficients[divisor.getDegree()];
			quotientCoefficients[i] = quotientCoefficient;

			for (int j = 0; j <= divisor.getDegree(); j++)
			{
				remainder._coefficients[i + j] -= quotientCoefficient * divisor._coefficients[j];
			}
		}

		return new Polynomial(quotientCoefficients.Reverse().ToArray());
	}


}
