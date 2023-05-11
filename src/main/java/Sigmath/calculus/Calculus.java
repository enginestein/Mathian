package sigmath;

import com.aspose.ms.System.Enum;
import com.aspose.ms.System.Exception;
import com.aspose.ms.System.ArgumentException;
import com.aspose.ms.System.msMath;
import com.aspose.ms.System.Collections.Generic.List;

  
public class Calculus {
    public static double integral(Func<Double, Double> f, double a, double b, int n) {
        double h = (b - a) / n;
        double integral = 0;
        for (int i = 1; i <= n; i++) {
            double x = a + i * h;
            integral += f.apply(x);
        }
        integral += (f.apply(a) + f.apply(b)) / 2;
        integral *= h;
        return integral;
    }
    
    public static double limit(Func<Double, Double> f, Func<Double, Double> g, double x) {
        final int maxIterations = 1000;
        final double tolerance = 1e-9;
        double fx = f.apply(x);
        double gx = g.apply(x);
        double limit = fx / gx;
        for (int i = 0; i < maxIterations; i++) {
            double fx1 = derivative(f, x);
            double gx1 = derivative(g, x);
            double newLimit = fx1 / gx1;
            if (Math.abs(newLimit - limit) < tolerance) {
                return newLimit;
            }
            limit = newLimit;
            x += 1e-9;
        }
        throw new RuntimeException("Limit does not exist or cannot be computed with L'Hopital's Rule.");
    }
    
    public static double findRoot(Func<Double, Double> f, double a, double b, double epsilon) {
        if (f.apply(a) * f.apply(b) > 0)
            throw new IllegalArgumentException("Function must have opposite signs at interval endpoints");
    
        double c = (a + b) / 2;
    
        while (Math.abs(f.apply(c)) > epsilon) {
            if (f.apply(a) * f.apply(c) < 0)
                b = c;
            else
                a = c;
    
            c = (a + b) / 2;
        }
    
        return c;
    }
    
    private static double derivative(Func<Double, Double> f, double x) {
        final double h = 1e-6;
        return (f.apply(x + h) - f.apply(x - h)) / (2 * h);
    }
    
    private static int factorial(int n) {
        int result = 1;
        for (int i = 2; i <= n; i++)
            result *= i;
        return result;
    }
    
    public static Func<Double[], Double> partialDerivative(Func<Double[], Double> f, int index, double h) {
        return (x) -> {
            Double[] xPlus = x.clone();
            xPlus[index] += h;
    
            Double[] xMinus = x.clone();
            xMinus[index] -= h;
    
            return (f.apply(xPlus) - f.apply(xMinus)) / (2 * h);
        };
    }
    
    public static Func<Double[], Double[]> gradient(Func<Double[], Double> f, double h) {
        return (x) -> {
            Double[] gradient = new Double[x.length];
    
            for (int i = 0; i < x.length; i++)
                gradient[i] = partialDerivative(f, i, h).apply(x);
    
            return gradient;
        };
    }
    

    public static Function<double[], double[][]> hessian(Function<double[], Double> f, double h) {
        return x -> {
            int n = x.length;
            double[][] hessian = new double[n][n];

            for (int i = 0; i < n; i++) {
                for (int j = 0; j < n; j++) {
                    Function<double[], Double> fxx = partialDerivative(partialDerivative(f, i, h), j, h);
                    hessian[i][j] = fxx.apply(x);
                }
            }

            return hessian;
        };
    }
    
    public static double[] findCriticalPoints(Function<Double, Double> f, double a, double b, double epsilon) {
        List<Double> criticalPoints = new ArrayList<>();

        // Evaluate function at endpoints of interval
        double fa = f.apply(a);
        double fb = f.apply(b);

        // Check if endpoints are critical points
        if (Math.abs(fa) < epsilon) {
            criticalPoints.add(a);
        }
        if (Math.abs(fb) < epsilon) {
            criticalPoints.add(b);
        }

        // Find critical points in the interval
        double x = a;
        double fx = f.apply(a);

        while (x < b) {
            double xNext = x + epsilon;
            double fxNext = f.apply(xNext);

            // Check if the current point is a critical point
            if (Math.abs(fx) < epsilon && x > a && x < b) {
                criticalPoints.add(x);
            }

            // Check if the function changes sign between x and xNext
            if (fx * fxNext < 0) {
                // Use bisection method to find a root
                double xLeft = x;
                double xRight = xNext;

                while (xRight - xLeft > epsilon) {
                    double xMid = (xLeft + xRight) / 2;
                    double fxMid = f.apply(xMid);

                    if (Math.abs(fxMid) < epsilon) {
                        criticalPoints.add(xMid);
                        break;
                    }

                    if (fx * fxMid < 0) {
                        xRight = xMid;
                    } else {
                        xLeft = xMid;
                    }
                }
            }

            x = xNext;
            fx = fxNext;
        }

        double[] result = new double[criticalPoints.size()];
        for (int i = 0; i < criticalPoints.size(); i++) {
            result[i] = criticalPoints.get(i);
        }

        return result;
    }
    


    public static /*enum*/ final class RiemannSumType extends Enum
    {
	private RiemannSumType(){}	
        public static final int Left = 0;
        public static final int Right = 1;
        public static final int Midpoint = 2;
        public static final int Trapezoidal = 3;

	static {
		Enum.register(new Enum.SimpleEnum(RiemannSumType.class, Integer.class) {{
		addConstant("Left", Left);
		addConstant("Right", Right);
		addConstant("Midpoint", Midpoint);
		addConstant("Trapezoidal", Trapezoidal);
		}});
	}}

    public static double riemannSum(Function<Double, Double> f, double a, double b, int n, RiemannSumType type)
    {
        double dx = (b - a) / n;
        double sum = 0;
    
        for (int i = 0; i < n; i++)
        {
            double x = a + i * dx;
            double fx = f.apply(x);
    
            switch (type)
            {
                case Left:
                    sum += fx * dx;
                    break;
                case Right:
                    sum += f.apply(x + dx) * dx;
                    break;
                case Midpoint:
                    sum += f.apply(x + dx / 2) * dx;
                    break;
                case Trapezoidal:
                    sum += (fx + f.apply(x + dx)) * dx / 2;
                    break;
            }
        }
    
        return sum;
    }
    
    public static double definiteIntegral(Function<Double, Double> f, double a, double b, int n)
    {
        return riemannSum(f, a, b, n, RiemannSumType.Midpoint);
    }
    
    public static double definiteIntegral(Function<Double, Double> f, double a, double b)
    {
        return riemannSum(f, a, b, 1000, RiemannSumType.Midpoint);
    }
}