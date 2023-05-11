package sigmath;



public class Nums
{

    public static int gcd(int a, int b)
    {
        while (b != 0)
        {
            int temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }

    public static int lcm(int a, int b)
    {
        return Basic.abs(a * b) / gcd(a, b);
    }

    public static int mod(int a, int b)
    {
        int r = a % b;
        return r < 0 ? r + b : r;
    }
}

