#pragma once

#include <system/object.h>
#include <cstdint>

namespace Sigmath
{
class Equations;
} // namespace Sigmath

namespace Sigmath {

class Compl : public System::Object
{
    typedef Compl ThisType;
    typedef System::Object BaseType;
    
    typedef ::System::BaseTypesInfo<BaseType> ThisTypeBaseTypesInfo;
    RTTI_INFO_DECL();
    
public:

    class Complex;
    
private:
    friend class Equations;
    friend class Equations;
    friend Compl::Complex operator +(Compl::Complex a, Compl::Complex b);
    friend Compl::Complex operator -(Compl::Complex a, Compl::Complex b);
    friend Compl::Complex operator *(Compl::Complex a, Compl::Complex b);
    friend Compl::Complex operator /(Compl::Complex a, Compl::Complex b);
    
public:

    class Complex : public System::Object
    {
        typedef Complex ThisType;
        typedef System::Object BaseType;
        
        typedef ::System::BaseTypesInfo<BaseType> ThisTypeBaseTypesInfo;
        RTTI_INFO_DECL();
        
        friend Compl::Complex operator +(Compl::Complex a, Compl::Complex b);
        friend Compl::Complex operator -(Compl::Complex a, Compl::Complex b);
        friend Compl::Complex operator *(Compl::Complex a, Compl::Complex b);
        friend Compl::Complex operator /(Compl::Complex a, Compl::Complex b);
        
    public:
    
        double get_Real();
        double get_Imaginary();
        
        Complex(double real, double imaginary);
        
        static Compl::Complex to_Complex(int32_t v);
        
        static double Abs(Compl::Complex a);
        static double Magnitude(Compl::Complex number);
        
        Complex();
        
    private:
    
        double pr_Real;
        double pr_Imaginary;
        
    };
    
    
protected:

    static double Abs(double v);
    
};

Compl::Complex operator +(Compl::Complex a, Compl::Complex b);
Compl::Complex operator -(Compl::Complex a, Compl::Complex b);
Compl::Complex operator *(Compl::Complex a, Compl::Complex b);
Compl::Complex operator /(Compl::Complex a, Compl::Complex b);

} // namespace Sigmath


