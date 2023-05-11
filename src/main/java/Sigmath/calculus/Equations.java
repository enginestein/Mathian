package sigmath;

import com.aspose.ms.lang.Operators;
import com.aspose.ms.System.DoubleExtensions;
import com.aspose.ms.System.StringExtensions;
import com.aspose.ms.System.Text.RegularExpressions.MatchCollection;
import com.aspose.ms.System.Text.RegularExpressions.Regex;
import com.aspose.ms.System.Text.RegularExpressions.Match;
import com.aspose.ms.System.StringSplitOptions;
import com.aspose.ms.System.ArgumentException;
import com.aspose.ms.System.msMath;



public class Equations
{

    public static double exponentialEquationSolver(String equation, double value)
    {
        String equifiedEquation = DoubleExtensions.toString(Equif.equify(equation, value));

        if (!StringExtensions.contains(equifiedEquation, "x"))
        {
            return DoubleExtensions.NaN;
        }

        double a = 0;
        double c = 0;

        MatchCollection matches = Regex.matches(equifiedEquation, "(\\d+\\.?\\d*)([eE]\\^\\(\\d+\\.?\\d*\\*x\\))(\\+?-?\\d+\\.?\\d*)?");
        if (matches.getCount() == 1)
        {
            Match match = matches.get(0);
            double[] referenceToA = { a };
            DoubleExtensions.tryParse(match.getGroups().get_Item(1).getValue(), /*out*/ referenceToA);
            a = referenceToA[0];
            double[] referenceToC = { c };
            DoubleExtensions.tryParse(match.getGroups().get_Item(3).getValue(), /*out*/ referenceToC);
            c = referenceToC[0];
        }
        else
        {
            return DoubleExtensions.NaN;
        }

        if (a == 0)
        {
            return DoubleExtensions.NaN;
        }
        else
        {
            double result = (Logarithm.log((value - c) / a)) / Logarithm.log(Constants.E);
            return result;
        }
    
    }

    public static double logarithmicEquationSolver(String equation, double value)
    {
        String equifiedEquation = DoubleExtensions.toString(Equif.equify(equation, value));

        if (!StringExtensions.contains(equifiedEquation, "x"))
        {
            return DoubleExtensions.NaN;
        }

        double a = 0;
        double c = 0;

        // Parse the equation to find coefficients
        MatchCollection matches = Regex.matches(equifiedEquation, "(\\d+\\.?\\d*)(\\*?log\\(\\d+\\.?\\d*\\*x\\))(\\+?-?\\d+\\.?\\d*)?");
        if (matches.getCount() == 1)
        {
            Match match = matches.get(0);
            double[] referenceToA = { a };
            DoubleExtensions.tryParse(match.getGroups().get_Item(1).getValue(), /*out*/ referenceToA);
            a = referenceToA[0];
            double[] referenceToC = { c };
            DoubleExtensions.tryParse(match.getGroups().get_Item(3).getValue(), /*out*/ referenceToC);
            c = referenceToC[0];
        }
        else
        {
            return DoubleExtensions.NaN;
        }

        // Solve for x
        if (a == 0 || c < 0)
        {
            return DoubleExtensions.NaN;
        }
        else
        {
            double result = (value - c) / a;
            result = Basic.power(10, result);
            result = result / a;
            return result;
        }
    }

    public static double solveEquation(String equifiedEquation) {
        DataTable dataTable = new DataTable();
        ExpressionParser parser = new ExpressionParser(dataTable);
        Expression expression = parser.parse(equifiedEquation);
        Functions.registerStandardFunctions(parser);
        Operators.registerStandardOperators(parser);

        Expression<Func<Double>> lambda = expression.asLambda();
        Func<Double> function = lambda.compile();
        return function.invoke();
    }

    public static double solveLinearEquation(String equation, double x) {
        equation = "(" + equation.replace("=", "-") + ")";
        double result = Equif.equify(equation, x);
        return result;
    }

    public static Tuple<Double, Double> solveQuadraticEquation(String equation) {
        equation = "(" + equation + ")";
        String[] parts = equation.split(" = ");
        String expr = parts[0];
        double rhs = Double.parseDouble(parts[1]);
        expr = Pattern.compile("x\\^2").matcher(expr).replaceAll("a");
        expr = expr.replace("x", "b");
        DataTable dataTable = new DataTable();
        DataColumn aColumn = dataTable.getDataColumn("a");
        aColumn.setDataType(Double.class);
        DataColumn bColumn = dataTable.getDataColumn("b");
        bColumn.setDataType(Double.class);
        dataTable.addRow(aColumn, 1.0);
        dataTable.addRow(bColumn, 0.0);
        ExpressionParser parser = new ExpressionParser(dataTable);
        Expression expression = parser.parse(expr);
        Functions.registerStandardFunctions(parser);
        Operators.registerStandardOperators(parser);

        Expression<Func<Double, Double>> lambda = expression.asLambda(aColumn, bColumn);
        Func<Double, Double> function = lambda.compile();
        double a = function.invoke(1.0);
        double b = function.invoke(0.0);
        double c = -rhs;
        double discriminant = b * b - 4 * a * c;
        if (discriminant < 0) {
            throw new IllegalArgumentException("Equation has no real roots.");
        }
        double root1 = (-b + Math.sqrt(discriminant)) / (2 * a);
        double root2 = (-b - Math.sqrt(discriminant)) / (2 * a);
        return Tuple.Create(root1, root2);
    }

    public static Tuple<Double, Double, Double> solveCubicEquation(String equation) {
        equation = "(" + equation + ")";
        String[] parts = equation.split(" = ");
        String expr = parts[0];
        double rhs = Double.parseDouble(parts[1]);
        expr = expr.replaceAll("x\\^3", "a");
        expr = expr.replaceAll("x\\^2", "b");
        expr = expr.replaceAll("x", "c");
        Expression expression = new Expression(expr, new Argument("a"), new Argument("b"), new Argument("c"));
        Function function = expression.getFunction("c");
        double a = function.calculate(1);
        double b = function.calculate(0);
        double c = function.calculate(0);
        double d = -rhs;
        double Q = (3 * a * c - b * b) / (9 * a * a);
        double R = (9 * a * b * c - 27 * a * a * d - 2 * b * b * b) / (54 * a * a * a);
        double D = Q * Q * Q + R * R;
        if (D >= 0) {
            double S = Math.signum(R + Math.sqrt(D)) * Math.pow(Math.abs(R + Math.sqrt(D)), 1.0 / 3.0);
            double T = Math.signum(R - Math.sqrt(D)) * Math.pow(Math.abs(R - Math.sqrt(D)), 1.0 / 3.0);
            double root1 = (-b / (3 * a)) + S + T;
            double root2 = (-b / (3 * a)) - (S + T) / 2;
            double root3 = (-b / (3 * a)) - (S + T) / 2;
            return new Tuple<Double, Double, Double>(root1, root2, root3);
        } else {
            double theta = Math.acos(R / Math.sqrt(-Q * Q * Q));
            double root1 = (-2 * Math.sqrt(-Q) * Math.cos(theta / 3) - b / (3 * a));
            double root2 = (-2 * Math.sqrt(-Q) * Math.cos((theta + 2 * Math.PI) / 3) - b / (3 * a));
            double root3 = (-2 * Math.sqrt(-Q) * Math.cos((theta - 2 * Math.PI) / 3) - b / (3 * a));
            return new Tuple<Double, Double, Double>(root1, root2, root3);
        }
    }

    public static double[] solvePolynomialEquation(double[] coefficients)
    {
        if (coefficients == null || coefficients.length < 2)
        {
            throw new ArgumentException("The coefficients must contain at least two values.");
        }

        int degree = coefficients.length - 1;

        if (degree == 1)
        {
            return new double[] { -coefficients[0] / coefficients[1] };
        }

        if (degree == 2)
        {
            double discriminant = coefficients[1] * coefficients[1] - 4 * coefficients[0] * coefficients[2];

            if (discriminant >= 0)
            {
                double sqrtDiscriminant = Basic.squareRoot(discriminant);
                double r1 = (-coefficients[1] + sqrtDiscriminant) / (2 * coefficients[2]);
                double r2 = (-coefficients[1] - sqrtDiscriminant) / (2 * coefficients[2]);
                return new double[] { r1, r2 };
            }

            return new double[0];
        }

        double[] roots = new double[degree];
        double[] work = new double[degree];

        double x = 1.0;

        for (int i = 0; i < degree; i++)
        {
            work[i] = coefficients[i];
        }

        for (int i = degree - 1; i >= 0; i--)
        {
            double b = work[i];
            double d = 0;

            for (int j = i; j >= 0; j--)
            {
                d = d * x + work[j];
            }

            roots[i] = b / d;
            x = roots[i];
        }

        return roots;
    }

    static class BinomialTheorem
    {
        public static double calculate(double a, double b, double n)
        {
            double result = 1;
            for (int i = 0; i < n; i++)
            {
                result *= (a - i) / (i + 1);
                result *= b;
            }
            return result;
        }
    }

    static class PowerEquation
    {
        public static double solve(double baseValue, double exponent)
        {
            return Basic.power(baseValue, exponent);
        }
    }

    public class Differentiation {
        public double differentiate(String equation, double x) {
            ELProcessor elProcessor = new ELProcessor();
            elProcessor.defineBean("x", x);
            Object expression = elProcessor.eval(equation);
            var lambda = new org.codehaus.janino.ExpressionEvaluator();
            lambda.cook(expression.toString());
            double h = 0.00000001;
            double f1 = (lambda.evaluate(new Object[]{x + h}) - lambda.evaluate(new Object[]{x - h})) / (2 * h);
            return f1;
        }
    }
    
    public class HyperbolicEquation {
        public double solve(String equation, double tolerance) {
            ELProcessor elProcessor = new ELProcessor();
            elProcessor.defineBean("x", 1.0);
            Object expression = elProcessor.eval(equation);
            var lambda = new org.codehaus.janino.ExpressionEvaluator();
            lambda.cook(expression.toString());
            double x = 1.0;
            double y = 0.0;
            double dx = tolerance * 10;
            while (dx > tolerance) {
                y = (double) lambda.evaluate(new Object[]{x});
                double dy = (double) lambda.evaluate(new Object[]{x + dx}) - y;
                if (dy == 0) {
                    break;
                }
                x -= y / dy;
                dx = Math.abs(y);
            }
            return x;
        }
    }
}