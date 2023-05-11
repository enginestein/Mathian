package sigmath;

public class Equif
{
	public static double Equify(String equation, double value)
	{
		equation = Regex.Replace(equation, "[A-Za-z]+", match ->
		{
				if (match.Index > 0 && Character.isDigit(equation.charAt(match.Index - 1)))
				{
					return match.Value;
				}
				else
				{
					return String.valueOf(value);
				}
		});

		var dataTable = new DataTable();
		var parser = new ExpressionParser(dataTable);
		var expression = parser.Parse(equation);

		var lambda = Expression.<tangible.Func0Param<Double>>Lambda((Expression)expression);
		var function = lambda.Compile();
		return function.invoke();
	}




}
