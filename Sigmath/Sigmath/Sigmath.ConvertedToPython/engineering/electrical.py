class Electrical(object):
	def CalculateResistance(voltage, current):
		return voltage / current

	CalculateResistance = staticmethod(CalculateResistance)

	def CalculatePower(voltage, current):
		return voltage * current

	CalculatePower = staticmethod(CalculatePower)

	def CalculateCapacitance(charge, voltage):
		return charge / voltage

	CalculateCapacitance = staticmethod(CalculateCapacitance)

	def CalculateInductance(voltage, current, frequency):
		return voltage / (current * 2 * Constants.Pi * frequency)

	CalculateInductance = staticmethod(CalculateInductance)

	def CalculateImpedance(resistance, reactance):
		return Basic.SquareRoot(Basic.Power(resistance, 2) + Basic.Power(reactance, 2))

	CalculateImpedance = staticmethod(CalculateImpedance)

	def CalculateReactance(inductance, frequency):
		return 2 * Constants.Pi * frequency * inductance

	CalculateReactance = staticmethod(CalculateReactance)

	def CalculateResonantFrequency(inductance, capacitance):
		return 1 / (2 * Constants.Pi * Basic.SquareRoot(inductance * capacitance))

	CalculateResonantFrequency = staticmethod(CalculateResonantFrequency)

	def CalculatePowerFactor(realPower, apparentPower):
		return realPower / apparentPower

	CalculatePowerFactor = staticmethod(CalculatePowerFactor)

	def CalculateRMS(values):
		sum = 0
		i = 0
		while i < values.Length:
			sum += Basic.Power(values[i], 2)
			i += 1
		return Basic.SquareRoot(sum / values.Length)

	CalculateRMS = staticmethod(CalculateRMS)

	def CalculateTotalResistanceInSeries(resistances):
		total = 0
		i = 0
		while i < resistances.Length:
			total += resistances[i]
			i += 1
		return total

	CalculateTotalResistanceInSeries = staticmethod(CalculateTotalResistanceInSeries)

	def CalculateTotalResistanceInParallel(resistances):
		total = 0
		i = 0
		while i < resistances.Length:
			total += 1 / resistances[i]
			i += 1
		return 1 / total

	CalculateTotalResistanceInParallel = staticmethod(CalculateTotalResistanceInParallel)

	def CalculateTotalCapacitanceInSeries(capacitances):
		total = 0
		i = 0
		while i < capacitances.Length:
			total += 1 / capacitances[i]
			i += 1
		return 1 / total

	CalculateTotalCapacitanceInSeries = staticmethod(CalculateTotalCapacitanceInSeries)

	def CalculateTotalCapacitanceInParallel(capacitances):
		total = 0
		i = 0
		while i < capacitances.Length:
			total += capacitances[i]
			i += 1
		return total

	CalculateTotalCapacitanceInParallel = staticmethod(CalculateTotalCapacitanceInParallel)

	def CalculateTotalInductanceInSeries(inductances):
		total = 0
		i = 0
		while i < inductances.Length:
			total += inductances[i]
			i += 1
		return total

	CalculateTotalInductanceInSeries = staticmethod(CalculateTotalInductanceInSeries)

	def CalculateTotalInductanceInParallel(inductances):
		total = 0
		i = 0
		while i < inductances.Length:
			total += 1 / inductances[i]
			i += 1
		return 1 / total

	CalculateTotalInductanceInParallel = staticmethod(CalculateTotalInductanceInParallel)