package sigmath;

public class Civil
{
	private static double CalculateBeamDeflection(double length, double load, double elasticity, double momentOfInertia)
	{
		return ((load * Basic.Power(length, 3)) / (3 * elasticity * momentOfInertia));
	}

	private static double CalculateStress(double force, double area)
	{
		return (force / area);
	}

	private static double CalculateStrain(double initialLength, double finalLength, double initialDiameter)
	{
		return ((finalLength - initialLength) / (initialLength * (initialDiameter / 2)));
	}

	private static double CalculateYoungsModulus(double stress, double strain)
	{
		return (stress / strain);
	}
}
