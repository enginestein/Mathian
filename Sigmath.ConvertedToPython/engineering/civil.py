class Civil(object):
	def CalculateBeamDeflection(length, load, elasticity, momentOfInertia):
		return ((load * Basic.Power(length, 3)) / (3 * elasticity * momentOfInertia))

	CalculateBeamDeflection = staticmethod(CalculateBeamDeflection)

	def CalculateStress(force, area):
		return (force / area)

	CalculateStress = staticmethod(CalculateStress)

	def CalculateStrain(initialLength, finalLength, initialDiameter):
		return ((finalLength - initialLength) / (initialLength * (initialDiameter / 2)))

	CalculateStrain = staticmethod(CalculateStrain)

	def CalculateYoungsModulus(stress, strain):
		return (stress / strain)

	CalculateYoungsModulus = staticmethod(CalculateYoungsModulus)