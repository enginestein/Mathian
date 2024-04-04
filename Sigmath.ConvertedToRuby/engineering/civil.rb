module Sigmath
	class Civil
		def Civil.CalculateBeamDeflection(length, load, elasticity, momentOfInertia)
			return ((load * Basic.Power(length, 3)) / (3 * elasticity * momentOfInertia))
		end

		def Civil.CalculateStress(force, area)
			return (force / area)
		end

		def Civil.CalculateStrain(initialLength, finalLength, initialDiameter)
			return ((finalLength - initialLength) / (initialLength * (initialDiameter / 2)))
		end

		def Civil.CalculateYoungsModulus(stress, strain)
			return (stress / strain)
		end
	end
end