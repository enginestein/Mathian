package sigmath;

import com.aspose.ms.lang.Operators;
import com.aspose.ms.System.TypeCode;



public class Computing
{
    public static int floor(double x)
    {
        return Operators.castToInt32((x >= 0 ? x : x - 0.999999999999999), TypeCode.Double);
    }

    public static int ceil(double x)
    {
        return Operators.castToInt32((x >= 0 ? x + 0.999999999999999 : x), TypeCode.Double);
    }

    public static int round(double x)
    {
        return Operators.castToInt32((x >= 0 ? x + 0.5 : x - 0.5), TypeCode.Double);
    }
}

