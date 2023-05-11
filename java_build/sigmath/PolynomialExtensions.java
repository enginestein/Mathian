package sigmath;

public final class PolynomialExtensions
{
	public static Polynomial Derivative(Polynomial polynomial)
	{
		if (polynomial.getDegree() == 0)
		{
			return new Polynomial(0);
		}

		var derivativeCoefficients = new double[polynomial.getDegree()];
		for (int i = 0; i < polynomial.getDegree(); i++)
		{
			derivativeCoefficients[i] = (polynomial.getDegree() - i) * polynomial._coefficients[i];
		}
		return new Polynomial(derivativeCoefficients);
	}
}
