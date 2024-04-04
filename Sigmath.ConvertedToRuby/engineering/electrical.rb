module Sigmath
	class Electrical
		def Electrical.CalculateResistance(voltage, current)
			return voltage / current
		end

		def Electrical.CalculatePower(voltage, current)
			return voltage * current
		end

		def Electrical.CalculateCapacitance(charge, voltage)
			return charge / voltage
		end

		def Electrical.CalculateInductance(voltage, current, frequency)
			return voltage / (current * 2 * Constants.Pi * frequency)
		end

		def Electrical.CalculateImpedance(resistance, reactance)
			return Basic.SquareRoot(Basic.Power(resistance, 2) + Basic.Power(reactance, 2))
		end

		def Electrical.CalculateReactance(inductance, frequency)
			return 2 * Constants.Pi * frequency * inductance
		end

		def Electrical.CalculateResonantFrequency(inductance, capacitance)
			return 1 / (2 * Constants.Pi * Basic.SquareRoot(inductance * capacitance))
		end

		def Electrical.CalculatePowerFactor(realPower, apparentPower)
			return realPower / apparentPower
		end

		def Electrical.CalculateRMS(values)
			sum = 0
			i = 0
			while i < values.Length
				sum += Basic.Power(values[i], 2)
				i += 1
			end
			return Basic.SquareRoot(sum / values.Length)
		end

		def Electrical.CalculateTotalResistanceInSeries(resistances)
			total = 0
			i = 0
			while i < resistances.Length
				total += resistances[i]
				i += 1
			end
			return total
		end

		def Electrical.CalculateTotalResistanceInParallel(resistances)
			total = 0
			i = 0
			while i < resistances.Length
				total += 1 / resistances[i]
				i += 1
			end
			return 1 / total
		end

		def Electrical.CalculateTotalCapacitanceInSeries(capacitances)
			total = 0
			i = 0
			while i < capacitances.Length
				total += 1 / capacitances[i]
				i += 1
			end
			return 1 / total
		end

		def Electrical.CalculateTotalCapacitanceInParallel(capacitances)
			total = 0
			i = 0
			while i < capacitances.Length
				total += capacitances[i]
				i += 1
			end
			return total
		end

		def Electrical.CalculateTotalInductanceInSeries(inductances)
			total = 0
			i = 0
			while i < inductances.Length
				total += inductances[i]
				i += 1
			end
			return total
		end

		def Electrical.CalculateTotalInductanceInParallel(inductances)
			total = 0
			i = 0
			while i < inductances.Length
				total += 1 / inductances[i]
				i += 1
			end
			return 1 / total
		end
	end
end