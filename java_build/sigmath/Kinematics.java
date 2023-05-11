package sigmath;

public class Kinematics
{
	public static double CalculateDisplacement(double initialVelocity, double finalVelocity, double acceleration, double time)
	{
		return ((finalVelocity + initialVelocity) / 2) * time + (0.5 * acceleration * Basic.Power(time, 2));
	}

	public static double CalculateFinalVelocity(double initialVelocity, double acceleration, double displacement)
	{
		return Basic.SquareRoot(Basic.Power(initialVelocity, 2) + 2 * acceleration * displacement);
	}

	public static double CalculateTime(double initialVelocity, double finalVelocity, double displacement, double acceleration)
	{
		return (2 * displacement) / (initialVelocity + finalVelocity);
	}

	public static double CalculateProjectileRange(double initialVelocity, double launchAngle)
	{
		return (Basic.Power(initialVelocity, 2) * Trig.Sin(2 * launchAngle)) / Constants.G;
	}



}
