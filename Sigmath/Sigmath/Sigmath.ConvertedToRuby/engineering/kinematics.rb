module Sigmath
	class Kinematics
		def Kinematics.CalculateDisplacement(initialVelocity, finalVelocity, acceleration, time)
			return ((finalVelocity + initialVelocity) / 2) * time + (0.5 * acceleration * Basic.Power(time, 2))
		end

		def Kinematics.CalculateFinalVelocity(initialVelocity, acceleration, displacement)
			return Basic.SquareRoot(Basic.Power(initialVelocity, 2) + 2 * acceleration * displacement)
		end

		def Kinematics.CalculateTime(initialVelocity, finalVelocity, displacement, acceleration)
			return (2 * displacement) / (initialVelocity + finalVelocity)
		end

		def Kinematics.CalculateProjectileRange(initialVelocity, launchAngle)
			return (Basic.Power(initialVelocity, 2) * Trig.Sin(2 * launchAngle)) / Constants.G
		end
	end
end