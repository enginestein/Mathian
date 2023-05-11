#include "engineering/electrical.h"

#include <cstdint>

#include "imp/constants.h"
#include "computing/basic.h"

namespace Sigmath {

RTTI_INFO_IMPL_HASH(595166689u, ::Sigmath::Electrical, ThisTypeBaseTypesInfo);

double Electrical::CalculateResistance(double voltage, double current)
{
    return voltage / current;
}

double Electrical::CalculatePower(double voltage, double current)
{
    return voltage * current;
}

double Electrical::CalculateCapacitance(double charge, double voltage)
{
    return charge / voltage;
}

double Electrical::CalculateInductance(double voltage, double current, double frequency)
{
    return voltage / (current * 2 * Constants::Pi * frequency);
}

double Electrical::CalculateImpedance(double resistance, double reactance)
{
    return Basic::SquareRoot(Basic::Power(resistance, 2) + Basic::Power(reactance, 2));
}

double Electrical::CalculateReactance(double inductance, double frequency)
{
    return 2 * Constants::Pi * frequency * inductance;
}

double Electrical::CalculateResonantFrequency(double inductance, double capacitance)
{
    return 1 / (2 * Constants::Pi * Basic::SquareRoot(inductance * capacitance));
}

double Electrical::CalculatePowerFactor(double realPower, double apparentPower)
{
    return realPower / apparentPower;
}

double Electrical::CalculateRMS(System::ArrayPtr<double> values)
{
    double sum = 0;
    for (int32_t i = 0; i < values->get_Length(); i++)
    {
        sum += Basic::Power(values[i], 2);
    }
    return Basic::SquareRoot(sum / values->get_Length());
}

double Electrical::CalculateTotalResistanceInSeries(System::ArrayPtr<double> resistances)
{
    double total = 0;
    for (int32_t i = 0; i < resistances->get_Length(); i++)
    {
        total += resistances[i];
    }
    return total;
}

double Electrical::CalculateTotalResistanceInParallel(System::ArrayPtr<double> resistances)
{
    double total = 0;
    for (int32_t i = 0; i < resistances->get_Length(); i++)
    {
        total += 1 / resistances[i];
    }
    return 1 / total;
}

double Electrical::CalculateTotalCapacitanceInSeries(System::ArrayPtr<double> capacitances)
{
    double total = 0;
    for (int32_t i = 0; i < capacitances->get_Length(); i++)
    {
        total += 1 / capacitances[i];
    }
    return 1 / total;
}

double Electrical::CalculateTotalCapacitanceInParallel(System::ArrayPtr<double> capacitances)
{
    double total = 0;
    for (int32_t i = 0; i < capacitances->get_Length(); i++)
    {
        total += capacitances[i];
    }
    return total;
}

double Electrical::CalculateTotalInductanceInSeries(System::ArrayPtr<double> inductances)
{
    double total = 0;
    for (int32_t i = 0; i < inductances->get_Length(); i++)
    {
        total += inductances[i];
    }
    return total;
}

double Electrical::CalculateTotalInductanceInParallel(System::ArrayPtr<double> inductances)
{
    double total = 0;
    for (int32_t i = 0; i < inductances->get_Length(); i++)
    {
        total += 1 / inductances[i];
    }
    return 1 / total;
}

} // namespace Sigmath
