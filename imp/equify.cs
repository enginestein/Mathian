using System;
using System.Data;
using System.Linq.Expressions;
using System.Text.RegularExpressions;

namespace Mathian
{
    public class Equif
    {
        public static double Equify(string equation, double value)
        {
            equation = Regex.Replace(equation, @"[A-Za-z]+", match =>
            {
                if (match.Index > 0 && char.IsDigit(equation[match.Index - 1]))
                {
                    return match.Value;
                }
                else
                {
                    return value.ToString();
                }
            });

            var dataTable = new DataTable();
            var parser = new ExpressionParser(dataTable);
            var expression = parser.Parse(equation);

            var lambda = Expression.Lambda<Func<double>>((Expression)expression);
            var function = lambda.Compile();
            return function();
        }




    }
}
