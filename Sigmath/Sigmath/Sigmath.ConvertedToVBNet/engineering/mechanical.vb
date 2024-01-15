Class Mechanical
	Public Shared Function CalculateTorque(force As Double, radius As Double) As Double
		Return force * radius
	End Function

	Public Shared Function CalculatePower(torque As Double, angularVelocity As Double) As Double
		Return torque * angularVelocity
	End Function

	Public Shared Function CalculateVelocity(distance As Double, time As Double) As Double
		Return distance / time
	End Function

	Public Shared Function CalculateAcceleration(initialVelocity As Double, finalVelocity As Double, time As Double) As Double
		Return (finalVelocity - initialVelocity) / time
	End Function

	Public Shared Function CalculateForce(mass As Double, acceleration As Double) As Double
		Return mass * acceleration
	End Function
End Class
