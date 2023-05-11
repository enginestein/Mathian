package sigmath;



public class Electrical
{
    public static double calculateResistance(double voltage, double current)
    {
        return voltage / current;
    }

    public static double calculatePower(double voltage, double current)
    {
        return voltage * current;
    }

    public static double calculateCapacitance(double charge, double voltage)
    {
        return charge / voltage;
    }

    public static double calculateInductance(double voltage, double current, double frequency)
    {
        return voltage / (current * 2 * Constants.Pi * frequency);
    }

    public static double calculateImpedance(double resistance, double reactance)
    {
        return Basic.squareRoot(Basic.power(resistance, 2) + Basic.power(reactance, 2));
    }

    public static double calculateReactance(double inductance, double frequency)
    {
        return 2 * Constants.Pi * frequency * inductance;
    }

    public static double calculateResonantFrequency(double inductance, double capacitance)
    {
        return 1 / (2 * Constants.Pi * Basic.squareRoot(inductance * capacitance));
    }

    public static double calculatePowerFactor(double realPower, double apparentPower)
    {
        return realPower / apparentPower;
    }

    public static double calculateRMS(double[] values)
    {
        double sum = 0;
        for (int i = 0; i < values.length; i++)
        {
            sum += Basic.power(values[i], 2);
        }
        return Basic.squareRoot(sum / values.length);
    }

    public static double calculateTotalResistanceInSeries(double[] resistances)
    {
        double total = 0;
        for (int i = 0; i < resistances.length; i++)
        {
            total += resistances[i];
        }
        return total;
    }

    public static double calculateTotalResistanceInParallel(double[] resistances)
    {
        double total = 0;
        for (int i = 0; i < resistances.length; i++)
        {
            total += 1 / resistances[i];
        }
        return 1 / total;
    }

    public static double calculateTotalCapacitanceInSeries(double[] capacitances)
    {
        double total = 0;
        for (int i = 0; i < capacitances.length; i++)
        {
            total += 1 / capacitances[i];
        }
        return 1 / total;
    }

    public static double calculateTotalCapacitanceInParallel(double[] capacitances)
    {
        double total = 0;
        for (int i = 0; i < capacitances.length; i++)
        {
            total += capacitances[i];
        }
        return total;
    }

    public static double calculateTotalInductanceInSeries(double[] inductances)
    {
        double total = 0;
        for (int i = 0; i < inductances.length; i++)
        {
            total += inductances[i];
        }
        return total;
    }

    public static double calculateTotalInductanceInParallel(double[] inductances)
    {
        double total = 0;
        for (int i = 0; i < inductances.length; i++)
        {
            total += 1 / inductances[i];
        }
        return 1 / total;
    }
}

