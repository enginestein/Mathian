namespace Mathian
{
    class Mechanical
    {
        public static double CalculateTorque(double force, double radius)
        {
            return force * radius;
        }

        public static double CalculatePower(double torque, double angularVelocity)
        {
            return torque * angularVelocity;
        }

        public static double CalculateVelocity(double distance, double time)
        {
            return distance / time;
        }

        public static double CalculateAcceleration(double initialVelocity, double finalVelocity, double time)
        {
            return (finalVelocity - initialVelocity) / time;
        }

        public static double CalculateForce(double mass, double acceleration)
        {
            return mass * acceleration;
        }
    }
}
