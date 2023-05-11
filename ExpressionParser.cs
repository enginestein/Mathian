using System;
using System.Collections.Generic;
using System.Data;
using System.Linq.Expressions;
using System.Text;

namespace YourNamespace
{
    public class ExpressionParser
    {
        private readonly DataTable dataTable;

        public ExpressionParser()
        {
            this.dataTable = new DataTable();
        }

        public Expression Parse(string expression)
        {
            try
            {
                return new DataTable().Compute(expression, null) as double?;
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
