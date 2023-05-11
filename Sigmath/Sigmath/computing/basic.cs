using System;
using System.Data;
using System.Linq.Expressions;

namespace Sigmath
{
    public class Basic
    {
        public static double Add(params double[] numbers)
        {
            double sum = 0;
            foreach (double num in numbers)
                sum += num;
            return sum;
        }

        public static double Subtract(params double[] numbers)
        {
            double result = numbers[0];
            for (int i = 1; i < numbers.Length; i++)
                result -= numbers[i];
            return result;
        }

        public static double Multiply(params double[] numbers)
        {
            double product = 1;
            foreach (double num in numbers)
                product *= num;
            return product;
        }

        public static double Divide(params double[] numbers)
        {
            double result = numbers[0];
            for (int i = 1; i < numbers.Length; i++)
            {
                if (numbers[i] == 0)
                    throw new DivideByZeroException();
                result /= numbers[i];
            }
            return result;
        }

        public static double Power(double baseNum, double exponent)
        {
            double result = 1;
            for (int i = 0; i < exponent; i++)
                result *= baseNum;
            return result;
        }

        public static double Abs(double value)
        {
            return value >= 0 ? value : -value;
        }

        public static float Abs(float value)
        {
            return value >= 0 ? value : -value;
        }

        public static int Abs(int value)
        {
            return value >= 0 ? value : -value;
        }

        public static long Abs(long value)
        {
            return value >= 0 ? value : -value;
        }
        public static double SquareRoot(double number)
        {
            if (number < 0)
                throw new ArgumentException("Cannot take square root of negative number");
            double guess = number / 2;
            for (int i = 0; i < 100; i++)
            {
                double newGuess = (guess + number / guess) / 2;
                if (Abs(newGuess - guess) < 0.0001)
                    break;
                guess = newGuess;
            }
            return guess;
        }

        public static double Exp(double x)
        {
            double result = 1.0;
            double term = 1.0;
            int n = 1;
            while (term > 0.0000001)
            {
                term *= x / n;
                result += term;
                n++;
            }
            return result;
        }

        public static double CubeRoot(double x)
        {
            if (x >= 0)
            {
                return Power(x, 1.0 / 3.0);
            }
            else
            {
                return -Power(-x, 1.0 / 3.0);
            }
        }

        public static double Evaluate(string expression)
        {
            var dataTable = new DataTable();
            var parser = new ExpressionParser(dataTable);
            var parsedExpression = parser.Parse(expression);
            var lambda = Expression.Lambda<Func<double>>((Expression)parsedExpression);
            var compiledExpression = lambda.Compile();
            return compiledExpression();
        }

    }
}
