package sigmath;



public class Kinematics
{
    public static double calculateDisplacement(double initialVelocity, double finalVelocity, double acceleration, double time)
    {
        return ((finalVelocity + initialVelocity) / 2) * time + (0.5 * acceleration * Basic.power(time, 2));
    }

    public static double calculateFinalVelocity(double initialVelocity, double acceleration, double displacement)
    {
        return Basic.squareRoot(Basic.power(initialVelocity, 2) + 2 * acceleration * displacement);
    }

    public static double calculateTime(double initialVelocity, double finalVelocity, double displacement, double acceleration)
    {
        return (2 * displacement) / (initialVelocity + finalVelocity);
    }

    public static double calculateAcceleration(double initialVelocity, double finalVelocity, double displacement, double time)
    {
        return (2 * (displacement - (initialVelocity * time))) / Basic.power(time, 2);
    }

    public static double calculateProjectileRange(double initialVelocity, double launchAngle)
    {
        return (Basic.power(initialVelocity, 2) * Trig.sin(2 * launchAngle)) / Constants.G;
    }



}

