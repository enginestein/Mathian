package sigmath;

import com.aspose.ms.System.NotImplementedException;
import com.aspose.ms.lang.Operators;



public class Polynomial
{
    public final double[] _coefficients;

    public Polynomial(/*params*/ double... coefficients)
    {
        _coefficients = coefficients;
    }

          

    public final double evaluate(double x)
    {
        double result = 0;
        for (int i = Degree; i >= 0; i--)
        {
            result = result * x + _coefficients[i];
        }
        return result;
    }

    public static Polynomial divide(Polynomial dividend, Polynomial divisor)
    {
        if (dividend.Degree < divisor.Degree)
        {
            return new Polynomial(0);
        }

        double[] quotientCoefficients = new double[dividend.Degree - divisor.Degree + 1];
        double[] remainderCoefficients = Operators.cast(com.aspose.ms.System.Array.boxing(dividend._coefficients).deepClone(), double[].class);

        for (int i = dividend.Degree - divisor.Degree; i >= 0; i--)
        {
            double quotientCoefficient = remainderCoefficients[i + divisor.Degree] / divisor._coefficients[divisor.Degree];
            quotientCoefficients[i] = quotientCoefficient;

            for (int j = 0; j <= divisor.Degree; j++)
            {
                remainderCoefficients[i + j] -= quotientCoefficient * divisor._coefficients[j];
            }
        }

        return new Polynomial(com.aspose.ms.System.Array.boxing(quotientCoefficients).Reverse().ToArray());
    }
    public final Polynomial divide(Polynomial divisor)
    {
        if (divisor.Degree > Degree)
        {
            return new Polynomial(0);
        }

        Polynomial remainder = new Polynomial(_coefficients);
        double[] quotientCoefficients = new double[Degree - divisor.Degree + 1];

        for (int i = Degree - divisor.Degree; i >= 0; i--)
        {
            double quotientCoefficient = remainder._coefficients[i + divisor.Degree] / divisor._coefficients[divisor.Degree];
            quotientCoefficients[i] = quotientCoefficient;

            for (int j = 0; j <= divisor.Degree; j++)
            {
                remainder._coefficients[i + j] -= quotientCoefficient * divisor._coefficients[j];
            }
        }

        return new Polynomial(com.aspose.ms.System.Array.boxing(quotientCoefficients).Reverse().ToArray());
    }

    final Compl.Complex evaluate(Compl.Complex complex)
    {
        throw new NotImplementedException();
    }
}

class PolynomialExtensions
{
    public static Polynomial derivative(/*this*/ Polynomial polynomial)
    {
        if (polynomial.Degree == 0)
        {
            return new Polynomial(0);
        }

        double[] derivativeCoefficients = new double[polynomial.Degree];
        for (int i = 0; i < polynomial.Degree; i++)
        {
            derivativeCoefficients[i] = (polynomial.Degree - i) * polynomial._coefficients[i];
        }
        return new Polynomial(derivativeCoefficients);
    }
}

