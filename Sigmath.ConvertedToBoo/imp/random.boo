
namespace Sigmath

import System


public class Rand:

	private static final a as long = 6364136223846793005L

	private static final c as long = 1442695040888963407L

	private static final m as long = 9223372036854775783L

	private seed as long

	
	public def constructor():
		seed = DateTime.Now.Ticks

	
	public def constructor(seed as long):
		self.seed = seed

	
	public def NextLong() as long:
		seed = (((a * seed) + c) % m)
		return seed

	
	public def NextDouble() as double:
		return ((NextLong() cast double) / m)

	
	public def Next(minValue as int, maxValue as int) as int:
		if minValue >= maxValue:
			raise ArgumentException('minValue must be less than maxValue')
		
		range as long = ((maxValue cast long) - minValue)
		return (((NextDouble() * range) cast int) + minValue)

	
	public def Next(maxValue as int) as int:
		return Next(0, maxValue)

	
	public def Next() as int:
		return Next(int.MinValue, int.MaxValue)

internal class Random:

	public static def RandUniform(min as double, max as double) as double:
		rand = Rand()
		return ((rand.NextDouble() * (max - min)) + min)

	
	public static def RandNormal(mean as double, stdDev as double) as double:
		rand = Rand()
		u1 as double = rand.NextDouble()
		u2 as double = rand.NextDouble()
		z0 as double = (Basic.SquareRoot(((-2) * Logarithm.Log(u1))) * Trig.Cos(((2 * Constants.Pi) * u2)))
		return ((z0 * stdDev) + mean)

	
	public static def RandPoisson(lambda as double) as int:
		rand = Rand()
		L as double = Basic.Exp(-lambda)
		p as double = 1
		k = 0
		while true:
			k += 1
			p *= rand.NextDouble()
			break  unless (p > L)
		return (k - 1)

