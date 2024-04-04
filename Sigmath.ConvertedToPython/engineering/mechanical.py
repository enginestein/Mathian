class Mechanical(object):
	def CalculateTorque(force, radius):
		return force * radius

	CalculateTorque = staticmethod(CalculateTorque)

	def CalculatePower(torque, angularVelocity):
		return torque * angularVelocity

	CalculatePower = staticmethod(CalculatePower)

	def CalculateVelocity(distance, time):
		return distance / time

	CalculateVelocity = staticmethod(CalculateVelocity)

	def CalculateAcceleration(initialVelocity, finalVelocity, time):
		return (finalVelocity - initialVelocity) / time

	CalculateAcceleration = staticmethod(CalculateAcceleration)

	def CalculateForce(mass, acceleration):
		return mass * acceleration

	CalculateForce = staticmethod(CalculateForce)