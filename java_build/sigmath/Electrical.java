package sigmath;

public class Electrical
{
	public static double CalculateResistance(double voltage, double current)
	{
		return voltage / current;
	}

	public static double CalculatePower(double voltage, double current)
	{
		return voltage * current;
	}

	public static double CalculateCapacitance(double charge, double voltage)
	{
		return charge / voltage;
	}

	public static double CalculateInductance(double voltage, double current, double frequency)
	{
		return voltage / (current * 2 * Constants.Pi * frequency);
	}

	public static double CalculateImpedance(double resistance, double reactance)
	{
		return Basic.SquareRoot(Basic.Power(resistance, 2) + Basic.Power(reactance, 2));
	}

	public static double CalculateReactance(double inductance, double frequency)
	{
		return 2 * Constants.Pi * frequency * inductance;
	}

	public static double CalculateResonantFrequency(double inductance, double capacitance)
	{
		return 1 / (2 * Constants.Pi * Basic.SquareRoot(inductance * capacitance));
	}

	public static double CalculatePowerFactor(double realPower, double apparentPower)
	{
		return realPower / apparentPower;
	}

	public static double CalculateRMS(double[] values)
	{
		double sum = 0;
		for (int i = 0; i < values.length; i++)
		{
			sum += Basic.Power(values[i], 2);
		}
		return Basic.SquareRoot(sum / values.length);
	}

	public static double CalculateTotalResistanceInSeries(double[] resistances)
	{
		double total = 0;
		for (int i = 0; i < resistances.length; i++)
		{
			total += resistances[i];
		}
		return total;
	}

	public static double CalculateTotalResistanceInParallel(double[] resistances)
	{
		double total = 0;
		for (int i = 0; i < resistances.length; i++)
		{
			total += 1 / resistances[i];
		}
		return 1 / total;
	}

	public static double CalculateTotalCapacitanceInSeries(double[] capacitances)
	{
		double total = 0;
		for (int i = 0; i < capacitances.length; i++)
		{
			total += 1 / capacitances[i];
		}
		return 1 / total;
	}

	public static double CalculateTotalCapacitanceInParallel(double[] capacitances)
	{
		double total = 0;
		for (int i = 0; i < capacitances.length; i++)
		{
			total += capacitances[i];
		}
		return total;
	}

	public static double CalculateTotalInductanceInSeries(double[] inductances)
	{
		double total = 0;
		for (int i = 0; i < inductances.length; i++)
		{
			total += inductances[i];
		}
		return total;
	}

	public static double CalculateTotalInductanceInParallel(double[] inductances)
	{
		double total = 0;
		for (int i = 0; i < inductances.length; i++)
		{
			total += 1 / inductances[i];
		}
		return 1 / total;
	}
}
