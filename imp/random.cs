using System;

namespace Sigmath
{

    public class Rand
    {
        private const long a = 6364136223846793005;
        private const long c = 1442695040888963407;
        private const long m = 9223372036854775783;
        private long seed;

        public Rand()
        {
            seed = DateTime.Now.Ticks;
        }

        public Rand(long seed)
        {
            this.seed = seed;
        }

        public long NextLong()
        {
            seed = (a * seed + c) % m;
            return seed;
        }

        public double NextDouble()
        {
            return (double)NextLong() / m;
        }

        public int Next(int minValue, int maxValue)
        {
            if (minValue >= maxValue)
                throw new ArgumentException("minValue must be less than maxValue");

            long range = (long)maxValue - minValue;
            return (int)(NextDouble() * range) + minValue;
        }

        public int Next(int maxValue)
        {
            return Next(0, maxValue);
        }

        public int Next()
        {
            return Next(int.MinValue, int.MaxValue);
        }
    }
    internal class Random
    {
        public static double RandUniform(double min, double max)
        {
            Rand rand = new Rand();
            return rand.NextDouble() * (max - min) + min;
        }

        public static double RandNormal(double mean, double stdDev)
        {
            Rand rand = new Rand();
            double u1 = rand.NextDouble();
            double u2 = rand.NextDouble();
            double z0 = Basic.SquareRoot(-2 * Logarithm.Log(u1)) * Trig.Cos(2 * Constants.Pi * u2);
            return z0 * stdDev + mean;
        }

        public static int RandPoisson(double lambda)
        {
            Rand rand = new Rand();
            double L = Basic.Exp(-lambda);
            double p = 1;
            int k = 0;
            do
            {
                k++;
                p *= rand.NextDouble();
            } while (p > L);
            return k - 1;
        }
    }
}
