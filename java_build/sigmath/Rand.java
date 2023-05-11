package sigmath;

import java.time.*;

public class Rand
{
	private static final long a = 6364136223846793005;
	private static final long c = 1442695040888963407;
	private static final long m = 9223372036854775783;
	private long seed;

	public Rand()
	{
		seed = LocalDateTime.now().getTime();
	}

	public Rand(long seed)
	{
		this.seed = seed;
	}

	public final long NextLong()
	{
		seed = (a * seed + c) % m;
		return seed;
	}

	public final double NextDouble()
	{
		return (double)NextLong() / m;
	}

	public final int Next(int minValue, int maxValue)
	{
		if (minValue >= maxValue)
		{
			throw new IllegalArgumentException("minValue must be less than maxValue");
		}

		long range = (long)maxValue - minValue;
		return (int)(NextDouble() * range) + minValue;
	}

	public final int Next(int maxValue)
	{
		return Next(0, maxValue);
	}

	public final int Next()
	{
		return Next(Integer.MIN_VALUE, Integer.MAX_VALUE);
	}
}
