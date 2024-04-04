namespace Sigmath

public class Kinematics:

	public static def CalculateDisplacement(initialVelocity as double, finalVelocity as double, acceleration as double, time as double) as double:
		return ((((finalVelocity + initialVelocity) / 2) * time) + ((0.5 * acceleration) * Basic.Power(time, 2)))

	
	public static def CalculateFinalVelocity(initialVelocity as double, acceleration as double, displacement as double) as double:
		return Basic.SquareRoot((Basic.Power(initialVelocity, 2) + ((2 * acceleration) * displacement)))

	
	public static def CalculateTime(initialVelocity as double, finalVelocity as double, displacement as double, acceleration as double) as double:
		return ((2 * displacement) / (initialVelocity + finalVelocity))

	
	public static def CalculateProjectileRange(initialVelocity as double, launchAngle as double) as double:
		return ((Basic.Power(initialVelocity, 2) * Trig.Sin((2 * launchAngle))) / Constants.G)
	
	
	

