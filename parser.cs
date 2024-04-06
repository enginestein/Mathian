using System;
using System.Data;
using System.Linq.Expressions;

namespace Mathian
{
    public class ExpressionParser
    {
        private readonly DataTable dataTable;

        public ExpressionParser(DataTable dataTable)
        {
            this.dataTable = dataTable;
        }

        public Expression Parse(string expression)
        {
            try
            {
                return Expression.Constant(dataTable.Compute(expression, null), typeof(double));
            }   
            catch
            {
                throw new ArgumentException("Invalid expression");
            }
        }

        public Func<double> Compile(Expression expression)
        {
            try
            {
                var lambda = Expression.Lambda<Func<double>>(expression);
                var compiled = lambda.Compile();
                return compiled;
            }
            catch
            {
                throw new ArgumentException("Invalid expression");
            }
        }
    }
}
