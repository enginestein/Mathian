//====================================================================================================
//The Free Edition of C# to Java Converter limits conversion output to 100 lines per file.

//To purchase the Premium Edition, visit our website:
//https://www.tangiblesoftwaresolutions.com/order/order-csharp-to-java.html
//====================================================================================================

package sigmath;

public class Equations
{

	public static double ExponentialEquationSolver(String equation, double value)
	{
		var equifiedEquation = String.valueOf(Equif.Equify(equation, value));

		if (!equifiedEquation.contains("x"))
		{
			return Double.NaN;
		}

		double a = 0;
		double c = 0;

		MatchCollection matches = Regex.Matches(equifiedEquation, "(\\d+\\.?\\d*)([eE]\\^\\(\\d+\\.?\\d*\\*x\\))(\\+?-?\\d+\\.?\\d*)?");
		if (matches.Count == 1)
		{
			Match match = matches.get(0);
			tangible.OutObject<Double> tempOut_a = new tangible.OutObject<Double>();
			tangible.TryParseHelper.tryParseDouble(match.Groups[1].Value, tempOut_a);
		a = tempOut_a.outArgValue;
			tangible.OutObject<Double> tempOut_c = new tangible.OutObject<Double>();
			tangible.TryParseHelper.tryParseDouble(match.Groups[3].Value, tempOut_c);
		c = tempOut_c.outArgValue;
		}
		else
		{
			return Double.NaN;
		}

		if (a == 0)
		{
			return Double.NaN;
		}
		else
		{
			double result = (Logarithm.Log((value - c) / a)) / Logarithm.Log(Constants.E);
			return result;
		}

	}

	public static double LogarithmicEquationSolver(String equation, double value)
	{
		var equifiedEquation = String.valueOf(Equif.Equify(equation, value));

		if (!equifiedEquation.contains("x"))
		{
			return Double.NaN;
		}

		double a = 0;
		double c = 0;

		// Parse the equation to find coefficients
		MatchCollection matches = Regex.Matches(equifiedEquation, "(\\d+\\.?\\d*)(\\*?log\\(\\d+\\.?\\d*\\*x\\))(\\+?-?\\d+\\.?\\d*)?");
		if (matches.Count == 1)
		{
			Match match = matches.get(0);
			tangible.OutObject<Double> tempOut_a = new tangible.OutObject<Double>();
			tangible.TryParseHelper.tryParseDouble(match.Groups[1].Value, tempOut_a);
		a = tempOut_a.outArgValue;
			tangible.OutObject<Double> tempOut_c = new tangible.OutObject<Double>();
			tangible.TryParseHelper.tryParseDouble(match.Groups[3].Value, tempOut_c);
		c = tempOut_c.outArgValue;
		}
		else
		{
			return Double.NaN;
		}

		// Solve for x
		if (a == 0 || c < 0)
		{
			return Double.NaN;
		}
		else
		{
			double result = (value - c) / a;
			result = Basic.Power(10, result);
			result = result / a;
			return result;
		}
	}

	public static double SolveEquation(String equifiedEquation)
	{
		var dataTable = new DataTable();
		var parser = new ExpressionParser(dataTable);
		var expression = parser.Parse(equifiedEquation);

		var lambda = Expression.<tangible.Func0Param<Double>>Lambda((Expression)expression);
		var function = lambda.Compile();
		return function.invoke();
	}
	public static double SolveLinearEquation(String equation, double x)
	{
		equation = String.format("(%1$s)", equation);
		equation = equation.replace("=", "-");
		double result = Equif.Equify(equation, x);
		return result;
	}

	public static Tuple<Double, Double> SolveQuadraticEquation(String equation)
	{
		equation = String.format("(%1$s)", equation);
		[] tempVar = new[](), StringSplitOptions.RemoveEmptyEntries);
		tempVar." = ";
		var parts = equation.split(tempVar, StringSplitOptions.RemoveEmptyEntries);
		var expr = parts[0];
		var rhs = Double.parseDouble(parts[1]);
		expr = Regex.Replace(expr, "x\\^2", "a");
		expr = Regex.Replace(expr, "x", "b");
		var dataTable = new DataTable();
		var parser = new ExpressionParser(dataTable);
		var expression = parser.Parse(expr);
		var lambda = Expression.<tangible.Func1Param<Double, Double>>Lambda((Expression)expression, Expression.Parameter(Double.class, "a"));
		tangible.Func1Param<Double, Double> function = lambda.Compile();
		double a = function.invoke(1);
		double b = function.invoke(0);
		double c = -rhs;
		double discriminant = b * b - 4 * a * c;
		if (discriminant < 0)
		{
			throw new IllegalArgumentException("Equation has no real roots.");
		}
		double root1 = (-b + Basic.SquareRoot(discriminant)) / (2 * a);
		double root2 = (-b - Basic.SquareRoot(discriminant)) / (2 * a);
		return Tuple.Create(root1, root2);
	}

	public static Tuple<Double, Double, Double> SolveCubicEquation(String equation)
	{
		equation = String.format("(%1$s)", equation);
		[] tempVar = new[](), StringSplitOptions.RemoveEmptyEntries);
		tempVar." = ";
		var parts = equation.split(tempVar, StringSplitOptions.RemoveEmptyEntries);
		var expr = parts[0];
		var rhs = Double.parseDouble(parts[1]);
		expr = Regex.Replace(expr, "x\\^3", "a");
		expr = Regex.Replace(expr, "x\\^2", "b");
		expr = Regex.Replace(expr, "x", "c");
		var dataTable = new DataTable();
		var parser = new ExpressionParser(dataTable);
		var expression = parser.Parse(expr);
		var lambda = Expression.<tangible.Func1Param<Double, Double>>Lambda((Expression)expression, Expression.Parameter(Double.class, "a"));
		tangible.Func1Param<Double, Double> function = lambda.Compile();
		double a = function.invoke(1);
		double b = function.invoke(0);

//====================================================================================================
//End of the allowed output for the Free Edition of C# to Java Converter.

//To purchase the Premium Edition, visit our website:
//https://www.tangiblesoftwaresolutions.com/order/order-csharp-to-java.html
//====================================================================================================
