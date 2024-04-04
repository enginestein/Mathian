namespace Sigmath

public class Electrical:

	public static def CalculateResistance(voltage as double, current as double) as double:
		return (voltage / current)

	
	public static def CalculatePower(voltage as double, current as double) as double:
		return (voltage * current)

	
	public static def CalculateCapacitance(charge as double, voltage as double) as double:
		return (charge / voltage)

	
	public static def CalculateInductance(voltage as double, current as double, frequency as double) as double:
		return (voltage / (((current * 2) * Constants.Pi) * frequency))

	
	public static def CalculateImpedance(resistance as double, reactance as double) as double:
		return Basic.SquareRoot((Basic.Power(resistance, 2) + Basic.Power(reactance, 2)))

	
	public static def CalculateReactance(inductance as double, frequency as double) as double:
		return (((2 * Constants.Pi) * frequency) * inductance)

	
	public static def CalculateResonantFrequency(inductance as double, capacitance as double) as double:
		return (1 / ((2 * Constants.Pi) * Basic.SquareRoot((inductance * capacitance))))

	
	public static def CalculatePowerFactor(realPower as double, apparentPower as double) as double:
		return (realPower / apparentPower)

	
	public static def CalculateRMS(values as (double)) as double:
		sum as double = 0
		for i in range(0, values.Length):
			sum += Basic.Power(values[i], 2)
		return Basic.SquareRoot((sum / values.Length))

	
	public static def CalculateTotalResistanceInSeries(resistances as (double)) as double:
		total as double = 0
		for i in range(0, resistances.Length):
			total += resistances[i]
		return total

	
	public static def CalculateTotalResistanceInParallel(resistances as (double)) as double:
		total as double = 0
		for i in range(0, resistances.Length):
			total += (1 / resistances[i])
		return (1 / total)

	
	public static def CalculateTotalCapacitanceInSeries(capacitances as (double)) as double:
		total as double = 0
		for i in range(0, capacitances.Length):
			total += (1 / capacitances[i])
		return (1 / total)

	
	public static def CalculateTotalCapacitanceInParallel(capacitances as (double)) as double:
		total as double = 0
		for i in range(0, capacitances.Length):
			total += capacitances[i]
		return total

	
	public static def CalculateTotalInductanceInSeries(inductances as (double)) as double:
		total as double = 0
		for i in range(0, inductances.Length):
			total += inductances[i]
		return total

	
	public static def CalculateTotalInductanceInParallel(inductances as (double)) as double:
		total as double = 0
		for i in range(0, inductances.Length):
			total += (1 / inductances[i])
		return (1 / total)

