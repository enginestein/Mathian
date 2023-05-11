package sigmath;



class Mechanical
{
    public static double calculateTorque(double force, double radius)
    {
        return force * radius;
    }

    public static double calculatePower(double torque, double angularVelocity)
    {
        return torque * angularVelocity;
    }

    public static double calculateVelocity(double distance, double time)
    {
        return distance / time;
    }

    public static double calculateAcceleration(double initialVelocity, double finalVelocity, double time)
    {
        return (finalVelocity - initialVelocity) / time;
    }

    public static double calculateForce(double mass, double acceleration)
    {
        return mass * acceleration;
    }
}

