Public Class Civil
	Private Shared Function CalculateBeamDeflection(length As Double, load As Double, elasticity As Double, momentOfInertia As Double) As Double
		Return ((load * Basic.Power(length, 3)) / (3 * elasticity * momentOfInertia))
	End Function

	Private Shared Function CalculateStress(force As Double, area As Double) As Double
		Return (force / area)
	End Function

	Private Shared Function CalculateStrain(initialLength As Double, finalLength As Double, initialDiameter As Double) As Double
		Return ((finalLength - initialLength) / (initialLength * (initialDiameter / 2)))
	End Function

	Private Shared Function CalculateYoungsModulus(stress As Double, strain As Double) As Double
		Return (stress / strain)
	End Function
End Class
