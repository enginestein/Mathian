package sigmath;

public class ExpressionParser
{
	private final DataTable dataTable;

	public ExpressionParser(DataTable dataTable)
	{
		this.dataTable = new DataTable();
	}

	public final Expression Parse(String expression)
	{
		try
		{
			return Expression.Constant((new DataTable()).Compute(expression, null), Double.class);
		}
		catch (java.lang.Exception e)
		{
			throw new IllegalArgumentException("Invalid expression");
		}
	}

	public final tangible.Func0Param<Double> Compile(Expression expression)
	{
		try
		{
			var lambda = Expression.<tangible.Func0Param<Double>>Lambda(expression);
			var compiled = lambda.Compile();
			return compiled;
		}
		catch (java.lang.Exception e)
		{
			throw new IllegalArgumentException("Invalid expression");
		}
	}
}
