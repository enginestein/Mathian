Public Class Kinematics
	Public Shared Function CalculateDisplacement(initialVelocity As Double, finalVelocity As Double, acceleration As Double, time As Double) As Double
		Return ((finalVelocity + initialVelocity) / 2) * time + (0.5 * acceleration * Basic.Power(time, 2))
	End Function

	Public Shared Function CalculateFinalVelocity(initialVelocity As Double, acceleration As Double, displacement As Double) As Double
		Return Basic.SquareRoot(Basic.Power(initialVelocity, 2) + 2 * acceleration * displacement)
	End Function

	Public Shared Function CalculateTime(initialVelocity As Double, finalVelocity As Double, displacement As Double, acceleration As Double) As Double
		Return (2 * displacement) / (initialVelocity + finalVelocity)
	End Function

	Public Shared Function CalculateProjectileRange(initialVelocity As Double, launchAngle As Double) As Double
		Return (Basic.Power(initialVelocity, 2) * Trig.Sin(2 * launchAngle)) / Constants.G
	End Function



End Class
