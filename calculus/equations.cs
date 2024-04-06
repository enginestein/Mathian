using System;
using System.Data;
using System.Linq.Expressions;
using System.Text.RegularExpressions;

namespace Mathian
{
    public class Equations
    {

        public static double ExponentialEquationSolver(string equation, double value)
        {
            var equifiedEquation = Equif.Equify(equation, value).ToString();

            if (!equifiedEquation.Contains("x"))
            {
                return double.NaN;
            }

            double a = 0;
            double c = 0;

            MatchCollection matches = Regex.Matches(equifiedEquation, @"(\d+\.?\d*)([eE]\^\(\d+\.?\d*\*x\))(\+?-?\d+\.?\d*)?");
            if (matches.Count == 1)
            {
                Match match = matches[0];
                double.TryParse(match.Groups[1].Value, out a);
                double.TryParse(match.Groups[3].Value, out c);
            }
            else
            {
                return double.NaN;
            }

            if (a == 0)
            {
                return double.NaN;
            }
            else
            {
                double result = (Logarithm.Log((value - c) / a)) / Logarithm.Log(Constants.E);
                return result;
            }

        }

        public static double LogarithmicEquationSolver(string equation, double value)
        {
            var equifiedEquation = Equif.Equify(equation, value).ToString();

            if (!equifiedEquation.Contains("x"))
            {
                return double.NaN;
            }

            double a = 0;
            double c = 0;

            // Parse the equation to find coefficients
            MatchCollection matches = Regex.Matches(equifiedEquation, @"(\d+\.?\d*)(\*?log\(\d+\.?\d*\*x\))(\+?-?\d+\.?\d*)?");
            if (matches.Count == 1)
            {
                Match match = matches[0];
                double.TryParse(match.Groups[1].Value, out a);
                double.TryParse(match.Groups[3].Value, out c);
            }
            else
            {
                return double.NaN;
            }

            // Solve for x
            if (a == 0 || c < 0)
            {
                return double.NaN;
            }
            else
            {
                double result = (value - c) / a;
                result = Basic.Power(10, result);
                result = result / a;
                return result;
            }
        }

        public static double SolveEquation(string equifiedEquation)
        {
            var dataTable = new DataTable();
            var parser = new ExpressionParser(dataTable);
            var expression = parser.Parse(equifiedEquation);

            var lambda = Expression.Lambda<Func<double>>((Expression)expression);
            var function = lambda.Compile();
            return function();
        }
        public static double SolveLinearEquation(string equation, double x)
        {
            equation = $"({equation})";
            equation = equation.Replace("=", "-");
            double result = Equif.Equify(equation, x);
            return result;
        }

        public static Tuple<double, double> SolveQuadraticEquation(string equation)
        {
            equation = $"({equation})";
            var parts = equation.Split(new[] { " = " }, StringSplitOptions.RemoveEmptyEntries);
            var expr = parts[0];
            var rhs = double.Parse(parts[1]);
            expr = Regex.Replace(expr, @"x\^2", "a");
            expr = Regex.Replace(expr, @"x", "b");
            var dataTable = new DataTable();
            var parser = new ExpressionParser(dataTable);
            var expression = parser.Parse(expr);
            var lambda = Expression.Lambda<Func<double, double>>((Expression)expression, Expression.Parameter(typeof(double), "a"));
            Func<double, double> function = lambda.Compile();
            double a = function(1);
            double b = function(0);
            double c = -rhs;
            double discriminant = b * b - 4 * a * c;
            if (discriminant < 0)
            {
                throw new ArgumentException("Equation has no real roots.");
            }
            double root1 = (-b + Basic.SquareRoot(discriminant)) / (2 * a);
            double root2 = (-b - Basic.SquareRoot(discriminant)) / (2 * a);
            return Tuple.Create(root1, root2);
        }

        public static Tuple<double, double, double> SolveCubicEquation(string equation)
        {
            equation = $"({equation})";
            var parts = equation.Split(new[] { " = " }, StringSplitOptions.RemoveEmptyEntries);
            var expr = parts[0];
            var rhs = double.Parse(parts[1]);
            expr = Regex.Replace(expr, @"x\^3", "a");
            expr = Regex.Replace(expr, @"x\^2", "b");
            expr = Regex.Replace(expr, @"x", "c");
            var dataTable = new DataTable();
            var parser = new ExpressionParser(dataTable);
            var expression = parser.Parse(expr);
            var lambda = Expression.Lambda<Func<double, double>>((Expression)expression, Expression.Parameter(typeof(double), "a"));
            Func<double, double> function = lambda.Compile();
            double a = function(1);
            double b = function(0);
            double c = function(0);
            double d = -rhs;
            double Q = (3 * a * c - b * b) / (9 * a * a);
            double R = (9 * a * b * c - 27 * a * a * d - 2 * b * b * b) / (54 * a * a * a);
            double D = Q * Q * Q + R * R;
            if (D >= 0)
            {
                double S = Math.Sign(R + Basic.SquareRoot(D)) * Math.Pow(Basic.Abs(R + Basic.SquareRoot(D)), 1.0 / 3.0);
                double T = Math.Sign(R - Basic.SquareRoot(D)) * Math.Pow(Basic.Abs(R - Basic.SquareRoot(D)), 1.0 / 3.0);
                double root1 = (-b / (3 * a)) + S + T;
                double root2 = (-b / (3 * a)) - (S + T) / 2;
                double root3 = (-b / (3 * a)) - (S + T) / 2;
                return Tuple.Create(root1, root2, root3);
            }
            else
            {
                double theta = Trig.Acos(R / Basic.SquareRoot(-Q * Q * Q));
                double root1 = (-2 * Basic.SquareRoot(-Q) * Trig.Cos(theta / 3) - b / (3 * a));
                double root2 = (-2 * Basic.SquareRoot(-Q) * Trig.Cos((theta + 2 * Constants.Pi) / 3) - b / (3 * a));
                double root3 = (-2 * Basic.SquareRoot(-Q) * Trig.Cos((theta - 2 * Constants.Pi) / 3) - b / (3 * a));
                return Tuple.Create(root1, root2, root3);
            }
        }

        public static double[] SolvePolynomialEquation(double[] coefficients)
        {
            if (coefficients == null || coefficients.Length < 2)
            {
                throw new ArgumentException("The coefficients must contain at least two values.");
            }

            int degree = coefficients.Length - 1;

            if (degree == 1)
            {
                return new double[] { -coefficients[0] / coefficients[1] };
            }

            if (degree == 2)
            {
                double discriminant = coefficients[1] * coefficients[1] - 4 * coefficients[0] * coefficients[2];

                if (discriminant >= 0)
                {
                    double sqrtDiscriminant = Basic.SquareRoot(discriminant);
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

        internal class BinomialTheorem
        {
            public static double Calculate(double a, double b, double n)
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

        internal class PowerEquation
        {
            public static double Solve(double baseValue, double exponent)
            {
                return Basic.Power(baseValue, exponent);
            }
        }

        internal class Differentiation
        {
            public static double Differentiate(string equation, double x)
            {
                var dataTable = new DataTable();
                var parser = new ExpressionParser(dataTable);
                var expression = parser.Parse(equation);

                var lambda = Expression.Lambda<Func<double, double>>((Expression)expression, new[] { Expression.Parameter(typeof(double), "x") });
                var function = lambda.Compile();

                double h = 0.00000001;
                double f1 = (function(x + h) - function(x - h)) / (2 * h);
                return f1;
            }
        }

        internal class HyperbolicEquation
        {
            public static double Solve(string equation, double tolerance)
            {
                var dataTable = new DataTable();
                var parser = new ExpressionParser(dataTable);
                var expression = parser.Parse(equation);

                var lambda = Expression.Lambda<Func<double, double>>((Expression)expression, new[] { Expression.Parameter(typeof(double), "x") });
                var function = lambda.Compile();

                double x = 1.0;
                double y = 0.0;
                double dx = tolerance * 10;
                while (dx > tolerance)
                {
                    y = function(x);
                    double dy = function(x + dx) - y;
                    if (dy == 0)
                    {
                        break;
                    }
                    x -= y / dy;
                    dx = Basic.Abs(y);
                }
                return x;
            }
        }



    }

}
