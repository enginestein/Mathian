package sigmath;

import com.aspose.ms.System.ArgumentException;
import com.aspose.ms.System.DivideByZeroException;
import System.Data.DataTable;
import System.Linq.Expressions.Expression;
import System.Linq.Expressions.ExpressionParser;

public class Basic {
  public static double add(double... numbers) {
    double sum = 0;
    for (double num: numbers)
      sum += num;
    return sum;
  }

  public static double subtract(double... numbers) {
    double result = numbers[0];
    for (int i = 1; i < numbers.length; i++)
      result -= numbers[i];
    return result;
  }

  public static double multiply(double... numbers) {
    double product = 1;
    for (double num: numbers)
      product *= num;
    return product;
  }

  public static double divide(double... numbers) {
    double result = numbers[0];
    for (int i = 1; i < numbers.length; i++) {
      if (numbers[i] == 0)
        throw new DivideByZeroException();
      result /= numbers[i];
    }
    return result;
  }

  public static double power(double baseNum, double exponent) {
    double result = 1;
    for (int i = 0; i < exponent; i++)
      result *= baseNum;
    return result;
  }

  public static double abs(double value) {
    return value >= 0 ? value : -value;
  }

  public static float abs(float value) {
    return value >= 0 ? value : -value;
  }

  public static int abs(int value) {
    return value >= 0 ? value : -value;
  }

  public static long abs(long value) {
    return value >= 0 ? value : -value;
  }

  public static double squareRoot(double number) {
    if (number < 0)
      throw new ArgumentException("Cannot take square root of negative number");
    double guess = number / 2;
    for (int i = 0; i < 100; i++) {
      double newGuess = (guess + number / guess) / 2;
      if (abs(newGuess - guess) < 0.0001)
        break;
      guess = newGuess;
    }
    return guess;
  }

  public static double exp(double x) {
    double result = 1.0;
    double term = 1.0;
    int n = 1;
    while (term > 0.0000001) {
      term *= x / n;
      result += term;
      n++;
    }
    return result;
  }

  public static double cubeRoot(double x) {
    if (x >= 0) {
      return power(x, 1.0 / 3.0);
    } else {
      return -power(-x, 1.0 / 3.0);
    }
  }

  public static double evaluate(String expression) {
    DataTable dataTable = new DataTable();
    ExpressionParser parser = new ExpressionParser(dataTable);
    Expression parsedExpression = parser.parse(expression);
    Expression<Func<Double>> lambda = Expression.Lambda(parsedExpression);
    Func<Double> compiledExpression = lambda.Compile();
    return compiledExpression();
  }
}