namespace Sigmath

public class Civil:

	private static def CalculateBeamDeflection(length as double, load as double, elasticity as double, momentOfInertia as double) as double:
		return ((load * Basic.Power(length, 3)) / ((3 * elasticity) * momentOfInertia))

	
	private static def CalculateStress(force as double, area as double) as double:
		return (force / area)

	
	private static def CalculateStrain(initialLength as double, finalLength as double, initialDiameter as double) as double:
		return ((finalLength - initialLength) / (initialLength * (initialDiameter / 2)))

	
	private static def CalculateYoungsModulus(stress as double, strain as double) as double:
		return (stress / strain)

