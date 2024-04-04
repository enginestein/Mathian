namespace Sigmath

internal class Mechanical:

	public static def CalculateTorque(force as double, radius as double) as double:
		return (force * radius)

	
	public static def CalculatePower(torque as double, angularVelocity as double) as double:
		return (torque * angularVelocity)

	
	public static def CalculateVelocity(distance as double, time as double) as double:
		return (distance / time)

	
	public static def CalculateAcceleration(initialVelocity as double, finalVelocity as double, time as double) as double:
		return ((finalVelocity - initialVelocity) / time)

	
	public static def CalculateForce(mass as double, acceleration as double) as double:
		return (mass * acceleration)

