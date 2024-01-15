module Sigmath
	class Mechanical
		def Mechanical.CalculateTorque(force, radius)
			return force * radius
		end

		def Mechanical.CalculatePower(torque, angularVelocity)
			return torque * angularVelocity
		end

		def Mechanical.CalculateVelocity(distance, time)
			return distance / time
		end

		def Mechanical.CalculateAcceleration(initialVelocity, finalVelocity, time)
			return (finalVelocity - initialVelocity) / time
		end

		def Mechanical.CalculateForce(mass, acceleration)
			return mass * acceleration
		end
	end
end