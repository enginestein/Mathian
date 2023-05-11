#include "calculus/calculus.h"

#include <system/multi_array.h>
#include <system/math.h>
#include <system/exceptions.h>
#include <system/details/lambda_capture_holder.h>
#include <system/collections/list.h>
#include <functional>

#include "computing/basic.h"

namespace Sigmath {

RTTI_INFO_IMPL_HASH(339793155u, ::Sigmath::Calculus, ThisTypeBaseTypesInfo);

double Calculus::Derivative(System::Func<double, double> f, double x)
{
    const double dx = 1e-9;
    // small increment to find the derivative
    double y1 = f(x);
    double y2 = f(x + dx);
    double derivative = (y2 - y1) / dx;
    return derivative;
}

double Calculus::Integral(System::Func<double, double> f, double a, double b, int32_t n)
{
    double h = (b - a) / n;
    double integral = 0;
    for (int32_t i = 1; i < n; i++)
    {
        double x = a + i * h;
        integral += f(x);
    }
    integral += (f(a) + f(b)) / 2;
    integral *= h;
    return integral;
}

double Calculus::Limit(System::Func<double, double> f, System::Func<double, double> g, double x)
{
    const int32_t maxIterations = 1000;
    const double tolerance = 1e-9;
    double fx = f(x);
    double gx = g(x);
    double limit = fx / gx;
    for (int32_t i = 0; i < maxIterations; i++)
    {
        double fx1 = Derivative(f, x);
        double gx1 = Derivative(g, x);
        double newLimit = fx1 / gx1;
        if (Basic::Abs(newLimit - limit) < tolerance)
        {
            return newLimit;
        }
        limit = newLimit;
        x += 1e-9;
    }
    throw System::Exception(u"Limit does not exist or cannot be computed with L'Hopital's Rule.");
}

double Calculus::FindRoot(System::Func<double, double> f, double a, double b, double epsilon /* = 1e-6*/)
{
    if (f(a) * f(b) > 0)
    {
        throw System::ArgumentException(u"Function must have opposite signs at interval endpoints");
    }
    
    double c = (a + b) / 2;
    
    while (System::Math::Abs(f(c)) > epsilon)
    {
        if (f(a) * f(c) < 0)
        {
            b = c;
        }
        else
        {
            a = c;
        }
        
        c = (a + b) / 2;
    }
    
    return c;
}

int32_t Calculus::Factorial(int32_t n)
{
    int32_t result = 1;
    
    for (int32_t i = 2; i <= n; i++)
    {
        result *= i;
    }
    
    return result;
}

System::Func<System::ArrayPtr<double>, double> Calculus::PartialDerivative(System::Func<System::ArrayPtr<double>, double> f, int32_t index, double h /* = 1e-6*/)
{
    System::Details::LambdaCaptureHolder<System::Func<System::ArrayPtr<double>, double>> _lch_f = f;
    System::Func<System::ArrayPtr<double>, double>& _f = _lch_f.GetCapture();
    System::Details::LambdaCaptureHolder<int32_t> _lch_index = index;
    int32_t& _index = _lch_index.GetCapture();
    System::Details::LambdaCaptureHolder<double> _lch_h = h;
    double& _h = _lch_h.GetCapture();
    return static_cast<System::Func<System::ArrayPtr<double>, double>>(static_cast<std::function<double(System::ArrayPtr<double> x)>>([_lch_index, &_index, _lch_h, &_h, _lch_f, &_f](System::ArrayPtr<double> x) -> double
    {
        auto xPlus = System::DynamicCast<System::Array<double>>(x->Clone());
        xPlus[_index] += _h;
        
        auto xMinus = System::DynamicCast<System::Array<double>>(x->Clone());
        xMinus[_index] -= _h;
        
        return (_f(xPlus) - _f(xMinus)) / (2 * _h);
    })).template AddHeldVariable<System::Func<System::ArrayPtr<double>, double>>("_index", _index).template AddHeldVariable<System::Func<System::ArrayPtr<double>, double>>("_h", _h).template AddHeldVariable<System::Func<System::ArrayPtr<double>, double>>("_f", _f);
}

System::Func<System::ArrayPtr<double>, System::ArrayPtr<double>> Calculus::Gradient(System::Func<System::ArrayPtr<double>, double> f, double h /* = 1e-6*/)
{
    System::Details::LambdaCaptureHolder<System::Func<System::ArrayPtr<double>, double>> _lch_f = f;
    System::Func<System::ArrayPtr<double>, double>& _f = _lch_f.GetCapture();
    System::Details::LambdaCaptureHolder<double> _lch_h = h;
    double& _h = _lch_h.GetCapture();
    return static_cast<System::Func<System::ArrayPtr<double>, System::ArrayPtr<double>>>(static_cast<std::function<System::ArrayPtr<double>(System::ArrayPtr<double> x)>>([_lch_f, &_f, _lch_h, &_h](System::ArrayPtr<double> x) -> System::ArrayPtr<double>
    {
        auto gradient = System::MakeArray<double>(x->get_Length(), 0);
        
        for (int32_t i = 0; i < x->get_Length(); i++)
        {
            gradient[i] = PartialDerivative(_f, i, _h)(x);
        }
        
        return gradient;
    })).template AddHeldVariable<System::Func<System::ArrayPtr<double>, System::ArrayPtr<double>>>("_f", _f).template AddHeldVariable<System::Func<System::ArrayPtr<double>, System::ArrayPtr<double>>>("_h", _h);
}

System::Func<System::ArrayPtr<double>, System::ArrayPtr<std::vector<double>>> Calculus::Hessian(System::Func<System::ArrayPtr<double>, double> f, double h /* = 1e-6*/)
{
    System::Details::LambdaCaptureHolder<System::Func<System::ArrayPtr<double>, double>> _lch_f = f;
    System::Func<System::ArrayPtr<double>, double>& _f = _lch_f.GetCapture();
    System::Details::LambdaCaptureHolder<double> _lch_h = h;
    double& _h = _lch_h.GetCapture();
    return static_cast<System::Func<System::ArrayPtr<double>, System::ArrayPtr<std::vector<double>>>>(static_cast<std::function<System::ArrayPtr<std::vector<double>>(System::ArrayPtr<double> x)>>([_lch_f, &_f, _lch_h, &_h](System::ArrayPtr<double> x) -> System::ArrayPtr<std::vector<double>>
    {
        int32_t n = x->get_Length();
        auto hessian = System::MakeArray<std::vector<double>>(n);
        RESIZE_MARRAY_INIT(i1, hessian->data(), n, 0)
        RESIZE_MARRAY_END()
        
        
        for (int32_t i = 0; i < n; i++)
        {
            for (int32_t j = 0; j < n; j++)
            {
                double fxx = PartialDerivative(PartialDerivative(_f, i, _h), j, _h)(x);
                hessian[i][j] = fxx;
            }
        }
        
        return hessian;
    })).template AddHeldVariable<System::Func<System::ArrayPtr<double>, System::ArrayPtr<std::vector<double>>>>("_f", _f).template AddHeldVariable<System::Func<System::ArrayPtr<double>, System::ArrayPtr<std::vector<double>>>>("_h", _h);
}

System::ArrayPtr<double> Calculus::FindCriticalPoints(System::Func<double, double> f, double a, double b, double epsilon /* = 1e-6*/)
{
    auto criticalPoints = System::MakeObject<System::Collections::Generic::List<double>>();
    
    // Evaluate function at endpoints of interval
    double fa = f(a);
    double fb = f(b);
    
    // Check if endpoints are critical points
    if (System::Math::Abs(fa) < epsilon)
    {
        criticalPoints->Add(a);
    }
    if (System::Math::Abs(fb) < epsilon)
    {
        criticalPoints->Add(b);
    }
    
    // Find critical points in the interval
    double x = a;
    double fx = f(a);
    
    while (x < b)
    {
        double xNext = x + epsilon;
        double fxNext = f(xNext);
        
        // Check if the current point is a critical point
        if (System::Math::Abs(fx) < epsilon && x > a && x < b)
        {
            criticalPoints->Add(x);
        }
        
        // Check if the function changes sign between x and xNext
        if (fx * fxNext < 0)
        {
            // Use bisection method to find a root
            double xLeft = x;
            double xRight = xNext;
            
            while (xRight - xLeft > epsilon)
            {
                double xMid = (xLeft + xRight) / 2;
                double fxMid = f(xMid);
                
                if (System::Math::Abs(fxMid) < epsilon)
                {
                    criticalPoints->Add(xMid);
                    break;
                }
                
                if (fx * fxMid < 0)
                {
                    xRight = xMid;
                }
                else
                {
                    xLeft = xMid;
                }
            }
        }
        
        x = xNext;
        fx = fxNext;
    }
    
    return criticalPoints->ToArray();
}

double Calculus::RiemannSum(System::Func<double, double> f, double a, double b, int32_t n, Calculus::RiemannSumType type /* = Sigmath::Calculus::RiemannSumType::Left*/)
{
    double dx = (b - a) / n;
    double sum = 0;
    
    for (int32_t i = 0; i < n; i++)
    {
        double x = a + i * dx;
        double fx = f(x);
        
        switch (type)
        {
            case Sigmath::Calculus::RiemannSumType::Left:
                sum += fx * dx;
                break;
            
            case Sigmath::Calculus::RiemannSumType::Right:
                sum += f(x + dx) * dx;
                break;
            
            case Sigmath::Calculus::RiemannSumType::Midpoint:
                sum += f(x + dx / 2) * dx;
                break;
            
            case Sigmath::Calculus::RiemannSumType::Trapezoidal:
                sum += (fx + f(x + dx)) * dx / 2;
                break;
            
        }
    }
    
    return sum;
}

double Calculus::DefiniteIntegral(System::Func<double, double> f, double a, double b, int32_t n /* = 1000*/)
{
    return RiemannSum(f, a, b, n, Sigmath::Calculus::RiemannSumType::Midpoint);
}

} // namespace Sigmath
