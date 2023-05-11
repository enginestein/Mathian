package sigmath;

public class Matrix
{
	private final double[][] _data;
	private int Rows;
	public final int getRows()
	{
		return Rows;
	}
	private int Cols;
	public final int getCols()
	{
		return Cols;
	}

	public Matrix(int rows, int cols)
	{
		Rows = rows;
		Cols = cols;
		_data = new double[rows][cols];
	}

	public Matrix(double[][] data)
	{
		Rows = data.length;
		Cols = (data.length == 0 ? 0 : data[0].length);
		_data = data;
	}

	public final double get(int row, int col)
	{
		return _data[row][col];
	}
	public final void set(int row, int col, double value)
	{
		_data[row][col] = value;
	}

	public static Matrix opAdd(Matrix a, Matrix b)
	{
		if (a.getRows() != b.getRows() || a.getCols() != b.getCols())
		{
			throw new IllegalArgumentException("Matrices must have the same dimensions");
		}

		var result = new Matrix(a.getRows(), a.getCols());

		for (var i = 0; i < a.getRows(); i++)
		{
			for (var j = 0; j < a.getCols(); j++)
			{
				result.set(i, j, a.get(i, j) + b.get(i, j));
			}
		}

		return result;
	}

	public static Matrix opSubtract(Matrix a, Matrix b)
	{
		if (a.getRows() != b.getRows() || a.getCols() != b.getCols())
		{
			throw new IllegalArgumentException("Matrices must have the same dimensions");
		}

		var result = new Matrix(a.getRows(), a.getCols());

		for (var i = 0; i < a.getRows(); i++)
		{
			for (var j = 0; j < a.getCols(); j++)
			{
				result.set(i, j, a.get(i, j) - b.get(i, j));
			}
		}

		return result;
	}

	public static Matrix opMultiply(Matrix a, Matrix b)
	{
		if (a.getCols() != b.getRows())
		{
			throw new IllegalArgumentException("Matrices cannot be multiplied");
		}

		var result = new Matrix(a.getRows(), b.getCols());

		for (var i = 0; i < a.getRows(); i++)
		{
			for (var j = 0; j < b.getCols(); j++)
			{
				for (var k = 0; k < a.getCols(); k++)
				{
					result.set(i, j, result.get(i, j) + a.get(i, k) * b.get(k, j));
				}
			}
		}

		return result;
	}

	public static Matrix Inverse(Matrix matrix)
	{
		if (matrix.getRows() != matrix.getCols())
		{
			throw new IllegalArgumentException("Matrix must be square");
		}

		var n = matrix.getRows();
		var identity = Identity(n);
		var augmented = Concatenate(matrix, identity);

		for (var i = 0; i < n; i++)
		{
			var pivot = augmented.get(i, i);
			if (pivot == 0)
			{
				throw new IllegalStateException("Matrix is not invertible");
			}

			for (var j = 0; j < 2 * n; j++)
			{
				augmented.set(i, j, augmented.get(i, j) / pivot);
			}

			for (var k = 0; k < n; k++)
			{
				if (k != i)
				{
					var factor = augmented.get(k, i);
					for (var j = 0; j < 2 * n; j++)
					{
						augmented.set(k, j, augmented.get(k, j) - factor * augmented.get(i, j));
					}
				}
			}
		}

		var inverse = new Matrix(n, n);
		for (var i = 0; i < n; i++)
		{
			for (var j = 0; j < n; j++)
			{
				inverse.set(i, j, augmented.get(i, j + n));
			}
		}

		return inverse;
	}

	private static Matrix Identity(int n)
	{
		var identity = new Matrix(n, n);
		for (var i = 0; i < n; i++)
		{
			identity.set(i, i, 1);
		}
		return identity;
	}

	private static Matrix Concatenate(Matrix a, Matrix b)
	{
		var rows = a.getRows();
		var cols = a.getCols() + b.getCols();
		var concatenated = new Matrix(rows, cols);

		for (var i = 0; i < rows; i++)
		{
			for (var j = 0; j < a.getCols(); j++)
			{
				concatenated.set(i, j, a.get(i, j));
			}

			for (var j = 0; j < b.getCols(); j++)
			{
				concatenated.set(i, j + a.getCols(), b.get(i, j));
			}
		}

		return concatenated;
	}
}
