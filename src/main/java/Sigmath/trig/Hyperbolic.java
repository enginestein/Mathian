package sigmath;

import com.aspose.ms.System.ArgumentException;



public class Hyperbolic
{
    public static double sinh(double x)
    {
        return (Basic.exp(x) - Basic.exp(-x)) / 2;
    }

    public static double cosh(double x)
    {
        return (Basic.exp(x) + Basic.exp(-x)) / 2;
    }

    public static double tanh(double x)
    {
        return sinh(x) / cosh(x);
    }
    
    public static double sech(double x)
{
return 1 / cosh(x);
}

public static double csch(double x)
{
return 1 / sinh(x);
}

public static double coth(double x)
{
return 1 / tanh(x);
}

public static double asinh(double x)
{
return Logarithm.log(x + Basic.squareRoot(Basic.power(x, 2) + 1));
}

public static double acosh(double x)
{
if (x < 1)
{
    throw new ArgumentException("Input to inverse hyperbolic cosine function must be greater than or equal to 1");
}
return Logarithm.log(x + Basic.squareRoot(Basic.power(x, 2) - 1));
}

public static double atanh(double x)
{
if (x <= -1 || x >= 1)
{
    throw new ArgumentException("Input to inverse hyperbolic tangent function must be between -1 and 1 (exclusive)");
}
return 0.5 * Logarithm.log((1 + x) / (1 - x));
}

public static double asech(double x)
{
if (x <= 0 || x >= 1)
{
    throw new ArgumentException("Input to inverse hyperbolic secant function must be between 0 and 1 (exclusive)");
}
return acosh(1 / x);
}

public static double acsch(double x)
{
if (x <= 0)
{
    throw new ArgumentException("Input to inverse hyperbolic cosecant function must be greater than 0");
}
return asinh(1 / x);
}

public static double acoth(double x)
{
if (x <= -1 || x >= 1)
{
    throw new ArgumentException("Input to inverse hyperbolic cotangent function must be between -1 and 1 (exclusive)");
}
return 0.5 * Logarithm.log((x + 1) / (x - 1));
}
}

