Public Class Electrical
	Public Shared Function CalculateResistance(voltage As Double, current As Double) As Double
		Return voltage / current
	End Function

	Public Shared Function CalculatePower(voltage As Double, current As Double) As Double
		Return voltage * current
	End Function

	Public Shared Function CalculateCapacitance(charge As Double, voltage As Double) As Double
		Return charge / voltage
	End Function

	Public Shared Function CalculateInductance(voltage As Double, current As Double, frequency As Double) As Double
		Return voltage / (current * 2 * Constants.Pi * frequency)
	End Function

	Public Shared Function CalculateImpedance(resistance As Double, reactance As Double) As Double
		Return Basic.SquareRoot(Basic.Power(resistance, 2) + Basic.Power(reactance, 2))
	End Function

	Public Shared Function CalculateReactance(inductance As Double, frequency As Double) As Double
		Return 2 * Constants.Pi * frequency * inductance
	End Function

	Public Shared Function CalculateResonantFrequency(inductance As Double, capacitance As Double) As Double
		Return 1 / (2 * Constants.Pi * Basic.SquareRoot(inductance * capacitance))
	End Function

	Public Shared Function CalculatePowerFactor(realPower As Double, apparentPower As Double) As Double
		Return realPower / apparentPower
	End Function

	Public Shared Function CalculateRMS(values As Double()) As Double
		Dim sum As Double = 0
		For i As Integer = 0 To values.Length - 1
			sum += Basic.Power(values(i), 2)
		Next
		Return Basic.SquareRoot(sum / values.Length)
	End Function

	Public Shared Function CalculateTotalResistanceInSeries(resistances As Double()) As Double
		Dim total As Double = 0
		For i As Integer = 0 To resistances.Length - 1
			total += resistances(i)
		Next
		Return total
	End Function

	Public Shared Function CalculateTotalResistanceInParallel(resistances As Double()) As Double
		Dim total As Double = 0
		For i As Integer = 0 To resistances.Length - 1
			total += 1 / resistances(i)
		Next
		Return 1 / total
	End Function

	Public Shared Function CalculateTotalCapacitanceInSeries(capacitances As Double()) As Double
		Dim total As Double = 0
		For i As Integer = 0 To capacitances.Length - 1
			total += 1 / capacitances(i)
		Next
		Return 1 / total
	End Function

	Public Shared Function CalculateTotalCapacitanceInParallel(capacitances As Double()) As Double
		Dim total As Double = 0
		For i As Integer = 0 To capacitances.Length - 1
			total += capacitances(i)
		Next
		Return total
	End Function

	Public Shared Function CalculateTotalInductanceInSeries(inductances As Double()) As Double
		Dim total As Double = 0
		For i As Integer = 0 To inductances.Length - 1
			total += inductances(i)
		Next
		Return total
	End Function

	Public Shared Function CalculateTotalInductanceInParallel(inductances As Double()) As Double
		Dim total As Double = 0
		For i As Integer = 0 To inductances.Length - 1
			total += 1 / inductances(i)
		Next
		Return 1 / total
	End Function
End Class
