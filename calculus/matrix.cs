using System;

namespace Mathian
{
    public class Matrix
    {
        private readonly double[,] _data;
        public int Rows { get; }
        public int Cols { get; }

        public Matrix(int rows, int cols)
        {
            Rows = rows;
            Cols = cols;
            _data = new double[rows, cols];
        }

        public Matrix(double[,] data)
        {
            Rows = data.GetLength(0);
            Cols = data.GetLength(1);
            _data = data;
        }

        public double this[int row, int col]
        {
            get => _data[row, col];
            set => _data[row, col] = value;
        }

        public static Matrix operator +(Matrix a, Matrix b)
        {
            if (a.Rows != b.Rows || a.Cols != b.Cols)
            {
                throw new ArgumentException("Matrices must have the same dimensions");
            }

            var result = new Matrix(a.Rows, a.Cols);

            for (var i = 0; i < a.Rows; i++)
            {
                for (var j = 0; j < a.Cols; j++)
                {
                    result[i, j] = a[i, j] + b[i, j];
                }
            }

            return result;
        }

        public static Matrix operator -(Matrix a, Matrix b)
        {
            if (a.Rows != b.Rows || a.Cols != b.Cols)
            {
                throw new ArgumentException("Matrices must have the same dimensions");
            }

            var result = new Matrix(a.Rows, a.Cols);

            for (var i = 0; i < a.Rows; i++)
            {
                for (var j = 0; j < a.Cols; j++)
                {
                    result[i, j] = a[i, j] - b[i, j];
                }
            }

            return result;
        }

        public static Matrix operator *(Matrix a, Matrix b)
        {
            if (a.Cols != b.Rows)
            {
                throw new ArgumentException("Matrices cannot be multiplied");
            }

            var result = new Matrix(a.Rows, b.Cols);

            for (var i = 0; i < a.Rows; i++)
            {
                for (var j = 0; j < b.Cols; j++)
                {
                    for (var k = 0; k < a.Cols; k++)
                    {
                        result[i, j] += a[i, k] * b[k, j];
                    }
                }
            }

            return result;
        }

        public static Matrix Inverse(Matrix matrix)
        {
            if (matrix.Rows != matrix.Cols)
            {
                throw new ArgumentException("Matrix must be square");
            }

            var n = matrix.Rows;
            var identity = Identity(n);
            var augmented = Concatenate(matrix, identity);

            for (var i = 0; i < n; i++)
            {
                var pivot = augmented[i, i];
                if (pivot == 0)
                {
                    throw new InvalidOperationException("Matrix is not invertible");
                }

                for (var j = 0; j < 2 * n; j++)
                {
                    augmented[i, j] /= pivot;
                }

                for (var k = 0; k < n; k++)
                {
                    if (k != i)
                    {
                        var factor = augmented[k, i];
                        for (var j = 0; j < 2 * n; j++)
                        {
                            augmented[k, j] -= factor * augmented[i, j];
                        }
                    }
                }
            }

            var inverse = new Matrix(n, n);
            for (var i = 0; i < n; i++)
            {
                for (var j = 0; j < n; j++)
                {
                    inverse[i, j] = augmented[i, j + n];
                }
            }

            return inverse;
        }

        private static Matrix Identity(int n)
        {
            var identity = new Matrix(n, n);
            for (var i = 0; i < n; i++)
            {
                identity[i, i] = 1;
            }
            return identity;
        }

        private static Matrix Concatenate(Matrix a, Matrix b)
        {
            var rows = a.Rows;
            var cols = a.Cols + b.Cols;
            var concatenated = new Matrix(rows, cols);

            for (var i = 0; i < rows; i++)
            {
                for (var j = 0; j < a.Cols; j++)
                {
                    concatenated[i, j] = a[i, j];
                }

                for (var j = 0; j < b.Cols; j++)
                {
                    concatenated[i, j + a.Cols] = b[i, j];
                }
            }

            return concatenated;
        }
    }
}