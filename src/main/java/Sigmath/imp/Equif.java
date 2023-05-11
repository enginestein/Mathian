package sigmath;

import com.aspose.ms.System.Char;
import com.aspose.ms.System.DoubleExtensions;
import com.aspose.ms.System.Data.DataTable;
import com.aspose.ms.System.Linq.Expressions.Expression;
import com.aspose.ms.System.Linq.Expressions.ExpressionParser;
import com.aspose.ms.System.Func;

public class Equif {
    public static double equify(String equation, double value) {
        equation = Regex.replace(equation, "[A-Za-z]+", new MatchEvaluator() {
            public String evaluate(Match match) {
                if (match.getIndex() > 0 && Char.isDigit(equation.charAt(match.getIndex() - 1))) {
                    return match.getValue();
                } else {
                    return DoubleExtensions.toString(value);
                }
            }
        });

        DataTable dataTable = new DataTable();
        ExpressionParser parser = new ExpressionParser(dataTable);
        Object expression = parser.parse(equation);

        Expression<Func<Double>> lambda = Expression.<Func<Double>>Lambda((Expression) expression);
        Func<Double> function = lambda.compile();
        return function.invoke();
    }
}
