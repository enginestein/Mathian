using System;

namespace Mathian
{
    public class Chemistry
    {
        // Molar Mass Calculation
        public static double CalculateMolarMass(double mass, double moles)
        {
            return mass / moles;
        }

        // Mole Calculation
        public static double CalculateMoles(double mass, double molarMass)
        {
            return mass / molarMass;
        }

        // Molarity Calculation
        public static double CalculateMolarity(double moles, double volume)
        {
            return moles / volume;
        }

        // Molality Calculation
        public static double CalculateMolality(double molesOfSolute, double massOfSolvent)
        {
            return molesOfSolute / massOfSolvent;
        }

        // Ideal Gas Law
        public static double CalculateIdealGasLaw(double pressure, double volume, double moles, double temperature)
        {
            double gasConstant = 0.0821; // atm·L/mol·K
            return (pressure * volume) / (moles * temperature * gasConstant);
        }

        // Rate of Reaction
        public static double CalculateRateOfReaction(double changeInConcentration, double time)
        {
            return changeInConcentration / time;
        }

        // Equilibrium Constant
        public static double CalculateEquilibriumConstant(double products, double reactants)
        {
            return products / reactants;
        }

        // Nernst Equation
        public static double CalculateNernstEquation(double standardPotential, double molesOfElectrons, double reactionQuotient)
        {
            double constant = 0.0592;
            return standardPotential - (constant / molesOfElectrons) * Math.Log(reactionQuotient);
        }

        // Hess's Law
        public static double CalculateHessLaw(double[] deltaHOfProducts, double[] deltaHOfReactants)
        {
            double sumProducts = 0;
            double sumReactants = 0;

            foreach (double deltaH in deltaHOfProducts)
            {
                sumProducts += deltaH;
            }

            foreach (double deltaH in deltaHOfReactants)
            {
                sumReactants += deltaH;
            }

            return sumProducts - sumReactants;
        }

        // Beer-Lambert Law
        public static double CalculateBeerLambertLaw(double molarAbsorptivity, double pathLength, double concentration)
        {
            return molarAbsorptivity * pathLength * concentration;
        }
    }

}
