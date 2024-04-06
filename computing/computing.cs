namespace Mathian
{
    public class Computing
    {
        public static int Floor(double x)
        {
            return (int)(x >= 0 ? x : x - 0.999999999999999);
        }

        public static int Ceil(double x)
        {
            return (int)(x >= 0 ? x + 0.999999999999999 : x);
        }

        public static int Round(double x)
        {
            return (int)(x >= 0 ? x + 0.5 : x - 0.5);
        }
    }
}
