package sigmath;

import com.aspose.ms.System.ArgumentException;
import com.aspose.ms.System.InvalidOperationException;

public class Matrix {
    private final double[][] _data;
    private final int rows;
    private final int cols;

    public Matrix(int rows, int cols) {
        this.rows = rows;
        this.cols = cols;
        _data = new double[rows][cols];
    }

    public Matrix(double[][] data) {
        rows = data.length;
        cols = data[0].length;
        _data = data;
    }

    public double get_Item(int row, int col) {
        return _data[row][col];
    }

    public void set(int row, int col, double value) {
        _data[row][col] = value;
    }

    public int getRows() {
        return rows;
    }

    public int getCols() {
        return cols;
    }

    public static Matrix op_Addition(Matrix a, Matrix b) {
        if (a.getRows() != b.getRows() || a.getCols() != b.getCols()) {
            throw new ArgumentException("Matrices must have the same dimensions");
        }

        Matrix result = new Matrix(a.getRows(), a.getCols());

        for (int i = 0; i < a.getRows(); i++) {
            for (int j = 0; j < a.getCols(); j++) {
                result.set(i, j, a.get_Item(i, j) + b.get_Item(i, j));
            }
        }

        return result;
    }

    public static Matrix op_Subtraction(Matrix a, Matrix b) {
        if (a.getRows() != b.getRows() || a.getCols() != b.getCols()) {
            throw new ArgumentException("Matrices must have the same dimensions");
        }

        Matrix result = new Matrix(a.getRows(), a.getCols());

        for (int i = 0; i < a.getRows(); i++) {
            for (int j = 0; j < a.getCols(); j++) {
                result.set(i, j, a.get_Item(i, j) - b.get_Item(i, j));
            }
        }

        return result;
    }

    public static Matrix op_Multiply(Matrix a, Matrix b) {
        if (a.getCols() != b.getRows()) {
            throw new ArgumentException("Matrices cannot be multiplied");
        }

        Matrix result = new Matrix(a.getRows(), b.getCols());

        for (int i = 0; i < a.getRows(); i++) {
            for (int j = 0; j < b.getCols(); j++) {
                double sum = 0;
                for (int k = 0; k < a.getCols(); k++) {
                    sum += a.get_Item(i, k) * b.get_Item(k, j);
                }
                result.set(i, j, sum);
            }
        }

        return result;
    }

    public static Matrix inverse(Matrix matrix)
    {
        if (matrix.getRows() != matrix.getCols())
        {
            throw new IllegalArgumentException("Matrix must be square");
        }

        int n = matrix.getRows();
        Matrix identity = identity(n);
        Matrix augmented = concatenate(matrix, identity);

        for (int i = 0; i < n; i++)
        {
            double pivot = augmented.get(i, i); // use get method to retrieve element value
            if (pivot == 0)
            {
                throw new IllegalStateException("Matrix is not invertible"); // use IllegalStateException for runtime exceptions
            }

            for (int j = 0; j < 2 * n; j++)
            {
                augmented.set(i, j, augmented.get(i, j) / pivot); // use set method to modify element value
            }

            for (int k = 0; k < n; k++)
            {
                if (k != i)
                {
                    double factor = augmented.get(k, i);
                    for (int j = 0; j < 2 * n; j++)
                    {
                        augmented.set(k, j, augmented.get(k, j) - ( factor * augmented.get(i, j)));
                    }
                }
            }
        }

        Matrix inverse = new Matrix(n, n);
        for (int i = 0; i < n; i++)
        {
            for (int j = 0; j < n; j++)
            {
                inverse.set(i, j, augmented.get(i, j + n));
            }
        }

        return inverse;
    }

    private static Matrix identity(int n)
    {
        Matrix identity = new Matrix(n, n);
        for (int i = 0; i < n; i++)
        {
            identity.set(i, i, 1);
        }
        return identity;
    }

    private static Matrix concatenate(Matrix a, Matrix b)
    {
        int rows = a.getRows();
        int cols = a.getCols() + b.getCols();
        Matrix concatenated = new Matrix(rows, cols);

        for (int i = 0; i < rows; i++)
        {
            for (int j = 0; j < a.getCols(); j++)
            {
                concatenated.set(i, j, a.get(i, j));
            }

            for (int j = 0; j < b.getCols(); j++)
            {
                concatenated.set(i, j + a.getCols(), b.get(i, j));
            }
        }

        return concatenated;
    }

}
