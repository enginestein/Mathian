namespace Mathian
{
    public class Nums
    {

        public static int Gcd(int a, int b)
        {
            while (b != 0)
            {
                int temp = b;
                b = a % b;
                a = temp;
            }
            return a;
        }

        public static int Lcm(int a, int b)
        {
            return Basic.Abs(a * b) / Gcd(a, b);
        }

        public static int Mod(int a, int b)
        {
            int r = a % b;
            return r < 0 ? r + b : r;
        }
    }
}
