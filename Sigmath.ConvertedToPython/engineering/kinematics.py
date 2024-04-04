class Kinematics(object):
	def CalculateDisplacement(initialVelocity, finalVelocity, acceleration, time):
		return ((finalVelocity + initialVelocity) / 2) * time + (0.5 * acceleration * Basic.Power(time, 2))

	CalculateDisplacement = staticmethod(CalculateDisplacement)

	def CalculateFinalVelocity(initialVelocity, acceleration, displacement):
		return Basic.SquareRoot(Basic.Power(initialVelocity, 2) + 2 * acceleration * displacement)

	CalculateFinalVelocity = staticmethod(CalculateFinalVelocity)

	def CalculateTime(initialVelocity, finalVelocity, displacement, acceleration):
		return (2 * displacement) / (initialVelocity + finalVelocity)

	CalculateTime = staticmethod(CalculateTime)

	def CalculateProjectileRange(initialVelocity, launchAngle):
		return (Basic.Power(initialVelocity, 2) * Trig.Sin(2 * launchAngle)) / Constants.G

	CalculateProjectileRange = staticmethod(CalculateProjectileRange)