#pragma once

#include <system/array.h>

namespace Sigmath {

class Electrical : public System::Object
{
    typedef Electrical ThisType;
    typedef System::Object BaseType;
    
    typedef ::System::BaseTypesInfo<BaseType> ThisTypeBaseTypesInfo;
    RTTI_INFO_DECL();
    
public:

    static double CalculateResistance(double voltage, double current);
    static double CalculatePower(double voltage, double current);
    static double CalculateCapacitance(double charge, double voltage);
    static double CalculateInductance(double voltage, double current, double frequency);
    static double CalculateImpedance(double resistance, double reactance);
    static double CalculateReactance(double inductance, double frequency);
    static double CalculateResonantFrequency(double inductance, double capacitance);
    static double CalculatePowerFactor(double realPower, double apparentPower);
    static double CalculateRMS(System::ArrayPtr<double> values);
    static double CalculateTotalResistanceInSeries(System::ArrayPtr<double> resistances);
    static double CalculateTotalResistanceInParallel(System::ArrayPtr<double> resistances);
    static double CalculateTotalCapacitanceInSeries(System::ArrayPtr<double> capacitances);
    static double CalculateTotalCapacitanceInParallel(System::ArrayPtr<double> capacitances);
    static double CalculateTotalInductanceInSeries(System::ArrayPtr<double> inductances);
    static double CalculateTotalInductanceInParallel(System::ArrayPtr<double> inductances);
    
};

} // namespace Sigmath


