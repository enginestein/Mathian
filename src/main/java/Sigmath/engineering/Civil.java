package sigmath;



public class Civil
{
    private static double calculateBeamDeflection(double length, double load, double elasticity, double momentOfInertia)
    {
        return ((load * Basic.power(length, 3)) / (3 * elasticity * momentOfInertia));
    }

    private static double calculateStress(double force, double area)
    {
        return (force / area);
    }

    private static double calculateStrain(double initialLength, double finalLength, double initialDiameter)
    {
        return ((finalLength - initialLength) / (initialLength * (initialDiameter / 2)));
    }

    private static double calculateYoungsModulus(double stress, double strain)
    {
        return (stress / strain);
    }
}

