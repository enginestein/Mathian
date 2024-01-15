import clr

clr.AddReference('C:\\Main\\Projects\\C#\\Sigmath\\bin\\Debug\Sigmath.dll')

from Sigmath import Basic
from Sigmath import Computing
from Sigmath import Hyperbolic
from Sigmath import Equations
from Sigmath import Compl
from Sigmath import Nums
from Sigmath import Sets
from Sigmath import ArithmeticProgression
from Sigmath import Calculus
from Sigmath import Matrix
from Sigmath import Mechanical
from Sigmath import Kinematics
from Sigmath import Electrical
from Sigmath import Civil
from Sigmath import Constants
from Sigmath import Trig
from Sigmath import Hyperbolic
from Sigmath import Polynomial
from Sigmath import Equif
from Sigmath import Rand
from Sigmath import Statistics
from Sigmath import Statgorithm
from Sigmath import Random
from Sigmath import Time
from Sigmath import Geometry
from Sigmath import Logarithm

__all__ = ['ArithmeticProgression', "Calculus", "Equations", "Matrix", "Basic", "Computing", "Nums", "Sets", "Compl", "Civil", "Electrical", "Kinematics", "Mechanical", "Geometry", "Logarithm", "Random", "Statistics", "Statgorithm", "Trig", "Hyperbolic", "Constants", "Polynomial", "Time", "Equif"]

compl = Compl()
Pi = Constants.Pi
E = Constants.E
G = Constants.G
Phi = Constants.Phi
Sqrt2 = Constants.Sqrt2
Sqrt3 = Constants.Sqrt3
Sqrt5 = Constants.Sqrt5
Sqrt7 = Constants.Sqrt7
Sqrt10 = Constants.Sqrt10
Ln2 = Constants.Ln2
Ln3 = Constants.Ln3
Ln10 = Constants.Ln10
Catalan = Constants.Catalan
EulerMascheroni = Constants.EulerMascheroni
GlaisherKinkelin = Constants.GlaisherKinkelin
Omega = Constants.Omega
BrentKung = Constants.BrentKung
Khinchin = Constants.Khinchin
LandauRamunajan = Constants.LandauRamanujan
LaplaceLimit = Constants.LaplaceLimit
Lengendre = Constants.Lengendre
Ljunggren = Constants.Ljunggren
Mason = Constants.Mason
Niven = Constants.Niven
PlasticConstant = Constants.PlasticConstant
SilverRatio = Constants.SilverRatio
Viswanath = Constants.Viswanath
ReciprocalFibonacci = Constants.ReciprocalFibonacci
Gelfond = Constants.Gelfond
ArtinsConstant = Constants.ArtinsConstant
h = Constants.h
c = Constants.c
k = Constants.k
Na = Constants.Na
R = Constants.R
gamma = Constants.gamma
mu0 = Constants.mu0
eps0 = Constants.eps0
Z0 = Constants.Z0
alpha = Constants.alpha
me = Constants.me
mp = Constants.mp
mn = Constants.mn
sigma = Constants.sigma
Ry = Constants.Ry
a = Constants.a
G0 = Constants.G0
hbar = Constants.hbar
kb = Constants.kb
PlanckMass = Constants.PlanckMass
PlanckLength = Constants.PlanckLength
PlanckTime = Constants.PlanckTime
PlanckCharge = Constants.PlanckCharge
PlanckTemperature = Constants.PlanchTempurature
GravitationalAlpha = Constants.GravitationalAlpha
GravitationalBeta = Constants.GravitationalBeta
GravitationalGamma = Constants.GravitationalGamma
ChandrasekharLimit = Constants.GravitationalLimit
SolarMass = Constants.SolarMass
LunarMass = Constants.LunarMass
EarthMass = Constants.EarthMass
SolarRadius = Constants.SolarRadius
LunarRadius = Constants.LunarRadius
EarthRadius = Constants.EarthRadius
AstronomicalUnit = Constants.AstronomicalUnit
LightYear = Constants.LightYear
Parsec = Constants.Parsec
BoltzmannEntropy = Constants.BoltzmannEntropy
WienFrequencyDisplacement = Constants.WienFrequencyDisplacement
WienWavelengthDisplacement = Constants.WienWavelengthDisplacement
ElectronCharge = Constants.ElectronCharge
ElectronRadius = Constants.ElectronRadius
ProtonRadius = Constants.ProtonRadius
BohrRadius = Constants.BohrRadius
RydbergEnergy = Constants.RydbergEnergy
FineStructureConstant = Constants.FineStructureConstant
MagneticFluxQuantum = Constants.MagneticFluxQuantum
ConductanceQuantum = Constants.ConductanceQuantukm
JosephsonConstant = Constants.JosephsonConstant
VonKlitzingConstant = Constants.VonklitzingConstant
AtomicMassUnit = Constants.AtomicMassUnit
FaradayConstant = Constants.FaradayCpnstant
ElementaryCharge = Constants.ElementryCharge
VacuumPermittivity = Constants.VacuumPermittivity
VacuumPermeability = Constants.VacuumPermeability
SpeedOfLight = Constants.SpeedOfLight
CoulombsConstant = Constants.CoulombsConstant
ConductivityOfCopper = Constants.ConductivityOfCopper
ConductivityOfAluminum = Constants.ConductivityOfAluminium
ConductivityOfSilver = Constants.ConductivityOfSilver
ConductivityOfGold = Constants.ConductivityOfGold
ConductivityOfIron = Constants.ConductivityOfIron
ConductivityOfSteel = Constants.ConductivityOfSteel
ConductivityOfBrass = Constants.ConductivityOfBrass
ConductivityOfBronze = Constants.ConductivityOfBronze
AvogadroNumber = Constants.AvogadroNumber

def add(*args: float):
    return Basic.Add(*args)

def substract(*args: float):
    return Basic.Subtract(*args)

def multiply(*args: float):
    return Basic.Multiply(*args)

def divide(*args: float):
    return Basic.Divide(*args)

def power(a: float, b: float):
    return Basic.Power(a, b)

def abs(num: float):
    return Basic.Abs(num)

def sqrt(num: float):
    return Basic.SquareRoot(num)

def cbrt(num: float):
    return Basic.CubeRoot(num)

def exp(num: float):
    return Basic.Exp(num)

def evaluate(expression):
    return Basic.Evaluate(expression)

def magnitude(complex: compl.Complex):
    try:
        return Compl.Complex.Magnitude(complex)
    except TypeError:
        print(f"You must use compl.Complex type for arguement {complex}.")

def complex_abs(complex: compl.Complex):
    try:
        return Compl.Complex.Abs(complex)
    except TypeError:
        print(f"You must use compl.Complex type for arguement {complex}.")
    
def real(complex: compl.Complex):
    try:
        return complex.Real
    except TypeError:
        print(f"You must use compl.Complex type for arguement {complex}.")

def imaginary(complex: complex.Complex):
    try:
        return complex.Imaginary
    except TypeError:
        print(f"You must use compl.Complex type for arguement {complex}.")
    
def floor(number: float):
    return Computing.Floor(number)

def ceil(number: float):
    return Computing.Ceil(number)

def Round(number: float):
    return Computing.Round(number)

def gcd(a: float, b: float):
    return Nums.Gcd(a, b)

def lcm(a: float, b: float):
    return Nums.Lcm(a, b)

def modulus(a: float, b: float):
    return Nums.Mod(a, b)

def union(set1: list, set2: list):
    try:
        return Sets.Union(set1, set2)
    except TypeError:
        print(f"Data type list is necessary for the arguements {set1} and {set2}")

def floatersect(set1: list, set2: list):
    try:
        return Sets.floatersection(set1, set2)
    except TypeError:
        print(f"Data type list is necessary for the arguements {set1} and {set2}")

def diff(set1: list, set2: list):
    try:
        return Sets.Difference(set1, set2)
    except TypeError:
        print(f"Data type list is necessary for the arguements {set1} and {set2}")

def symdiff(set1: list, set2: list):
    try:
        return Sets.SymmetricDifference(set1, set2)
    except TypeError:
        print(f"Data type list is necessary for the arguements {set1} and {set2}")

def subset(set1: list, set2: list):
    try:
        return Sets.IsSubset(set1, set2)
    except TypeError:
        print(f"Data type list is necessary for the arguements {set1} and {set2}")

def superset(set1: list, set2: list):
    try:
        return Sets.IsSuperset(set1, set2)
    except TypeError:
        print(f"Data type list is necessary for the arguements {set1} and {set2}")

def arithmetic(first_term: float, difference: float, number_terms: float):
    return ArithmeticProgression.Arithmetic(first_term, difference, number_terms)

def ArithmeticSum(first_term: float, difference: float, number_terms: float):
    return ArithmeticProgression.ArithmeticSum(first_term, difference, number_terms)

def nthterm(n: float, first_term: float, difference: float):
    return ArithmeticProgression.NthTerm(n, first_term, difference)

def termnum(an: float, n: float, first_term: float):
    return ArithmeticProgression.TermNumber(an, n, first_term)

def termnum(an: float, first_term: float, difference: float):
    return ArithmeticProgression.TermNumber(an, first_term, difference)

def common_diff(an: float, first_term: float, n: float):
    return ArithmeticProgression.CommonDifference(an, first_term, n)

def first_term(an: float, n: float, difference: float):
    return ArithmeticProgression.FirstTerm(an, n, difference)

def Last_term(first_term: float, n: float, difference: float):
    return ArithmeticProgression.LastTerm(first_term, n, difference)

def deriative(f: function, x: float):
    try:
        return Calculus.Deriative(f, x)
    except TypeError:
        print("Wrong data type passed in f or x. f takes a function returning an float, x take an float.")

def integral(f: function, a, b, n):
    return Calculus.integral(f, a, b, n)

def limit(f: function, g: function, x):
    return Calculus.Limit(f, g, x)

def findroot(f: function, a, b):
    return Calculus.FindRoot(f, a, b)

def factorial(number: float):
    return Calculus.Factorial(number)

def partial_deriative(f: function, index, h):
    return Calculus.PartialDeriative(f, index, h)

def gradient(f: function, h):
    return Calculus.Gradient(f, h)

def hessian(f: function, h):
    return Calculus.Hessian(f, h)

def critic_points(f: function, a, b):
    return Calculus.FindCriticalPoints(f, a, b)

def RiemannSum(f: function, a, b, n, type: Calculus.RienmannSumType):
    return Calculus.RienmannSum(f, a, b, n, type)

def definite_integral(f: function, a, b, n):
    return Calculus.DefineIntegral(f, a, b, n)

def exponential(equation: str, value: float):
    return Equations.ExponentialEquationSolver(equation, value)

def logarithmic(equation: str, value: float):
    return Equations.LogarithmicEquationSolve(equation, value)

def solve(equation:str):
    return Equations.SolveEquation(equation)

def linear(equation: str, x: float):
    return Equations.SolveLinearEquation(equation, x)

def quadratric(equation: str):
    return Equations.SolveQuadratricEquation(equation)

def cubic(equation: str):
    return Equations.SolveCubicEquation(equation)

def polynomic(coefficients: list):
    return Equations.SolvePolynomialEquation(coefficients)

def binomial(a: float, b: float, n: float) -> float:
    return Equations.BinomialTheorem.Calculate(a, b, n)

def power_equation(base_value: float, exponent: float) -> float:
    return Equations.PowerEquation.Solve(base_value, exponent)

def df(equation: str, x: float):
    return Equations.Differentiation.Differentiate(equation, x)

def hyperbolic(equation: str, tolerance: float):
    return Equations.HyperbolicEquation.Solve(equation, tolerance)

def inverse(matrix: Matrix):
    return Matrix.Inverse(matrix)

def identity(n: float):
    return Matrix.Identity(n)

def concatenate(a: Matrix, b: Matrix):
    return Matrix.Concatenate(a, b)

def torque(force: float, radius: float) -> float:
    return Mechanical.CalculateTorque(force, radius)

def calc_power(torque: float, angular_velocity: float) -> float:
    return Mechanical.CalculatePower(torque, angular_velocity)

def velocity(distance: float, time: float) -> float:
    return Mechanical.CalculateVelocity(distance, time)

def acceleration(initial_velocity: float, final_velocity: float, time: float):
    return Mechanical.CalculateAcceleration(initial_velocity, final_velocity, time)

def force(mass: float, acceleration: float) -> float:
    return Mechanical.CalculateForce(mass, acceleration) 

def displacement(initial_velocity: float, final_velocity: float, acceleration: float, time: float) -> float:
    return Kinematics.CalculateDisplacement(initial_velocity, final_velocity, acceleration)

def final_velocity(initial_velocity: float, acceleration: float, displacement: float) -> float:
    return Kinematics.CalculateFinalVelocityt(initial_velocity, acceleration, displacement)

def time(initial_velocity: float, final_velocity: float, displacement: float) -> float:
    return Kinematics.CalculateTime(initial_velocity, final_velocity, displacement)

def projectile_range(initial_velocity: float, launch_angle: float) -> float:
    return Kinematics.CalculateProjectileRange(initial_velocity, launch_angle)

def resistance(voltage: float, current: float) -> float:
    return Electrical.CalculateResistence(voltage, current)

def calculate_power(voltage: float, current: float) -> float:
    return Electrical.CalculatePower(voltage, current)

def capacitance(charge: float, voltage: float) -> float:
    return Electrical.CalculateCapacitance(charge, voltage)

def inductance(voltage: float, current: float, frequency: float) -> float:
    return Electrical.CalculateInductance(voltage, current, frequency)

def impedance(resistance: float, reactance: float) -> float:
    return Electrical.CalculateImpedance(resistance, reactance)

def reactance(inductance: float, frequency: float) -> float:
    return Electrical.CalculateReactance(inductance, frequency)
 
def resonant_frequency(inductance: float, capacitance: float) -> float:
    return Electrical.CalculateResonantFrequency(inductance, capacitance)
 
def power_factor(real_power: float, apparent_power: float) -> float:
    return Electrical.CalculatePowerFactor(real_power, apparent_power)

def rms(values: float) -> float:
    return Electrical.CalculateRMS(values)
   
def resistance_in_series(resistances: float) -> float:
    return Electrical.CalculateTotalResistanceInSeries(resistances)

def resistance_in_parallel(resistances: float) -> float:
    return Electrical.CalculateTotalResistanceInParallel(resistances)
   
def capacitance_in_series(capacitances: float) -> float:
    return Electrical.CalculateTotalCapacitanceInSeries(capacitances)

def capacitance_in_parallel(capacitances: float) -> float:
    return Electrical.CalculateTotalCapacitanceInParallel(capacitances)

def inductance_in_series(inductances: float) -> float:
    return Electrical.CalculateTotalInductanceInSeries(inductances)
   
def inductance_in_parallel(inductances: float) -> float:
    return Electrical.CalculateTotalInductanceInParallel(inductances)

def beam_deflection(length: float, load: float, elasticity: float, moment_of_inertia: float) -> float:
    return Civil.CalculateBeamDeflection(length, load, elasticity, moment_of_inertia)

def stress(force: float, area: float) -> float:
    return Civil.CalculateStress(force, area)

def strain(initial_length: float, final_length: float, initial_diameter: float) -> float:
    return Civil.CalculateStrain(initial_length, final_length, initial_diameter)

def youngs_modulus(stress: float, strain: float) -> float:
    return Civil.CalculateYoungsModulus(stress, strain)

def log(x: float) -> float:
    return Logarithm.Log(x)

def log10(x: float) -> float:
    return Logarithm.Log10(x)

def logn(n: float, x: float) -> float:
    return Logarithm.Logn(n, x)

def circle_area(radius: float) -> float:
    return Geometry.CircleArea(radius)

def circle_perimeter(radius: float) -> float:
    return Geometry.CirclePerimeter(radius)

def rectangle_area(width: float, height: float) -> float:
    return Geometry.RectangleArea(width, height)

def rectangle_perimeter(width: float, height: float) -> float:
    return Geometry.RectanglePerimeter(width, height)

def triangle_area(base: float, height: float) -> float:
    return Geometry.TriangleArea(base, height)

def triangle_perimeter(side1: float, side2: float, side3: float) -> float:
    return Geometry.TrianglePerimeter(side1, side2, side3)

def distance_between_points_2d(x1: float, y1: float, x2: float, y2: float) -> float:
    return Geometry.DistanceBetweenPoints2D(x1, y1, x2, y2)

def distance_between_points_3d(x1: float, y1: float, z1: float, x2: float, y2: float, z2: float) -> float:
    return Geometry.DistanceBetweenPoints3D(x1, y1, z1, x2, y2, z2)

def angle_between_lines(slope1: float, slope2: float) -> float:
    return Geometry.AngleBetweenLines(slope1, slope2)

def angle_between_vectors_2d(x1: float, y1: float, x2: float, y2: float) -> float:
    return Geometry.AngleBetweenVectors2D(x1, y1, x2, y2)

def angle_between_vectors_3d(x1: float, y1: float, z1: float, x2: float, y2: float, z2: float) -> float:
    return Geometry.AngleBetweenVectors3D(x1, y1, z1, x2, y2, z2)

def evaluate_polynomial(coefficients, x):
    poly = Polynomial(*coefficients)
    return poly.Evaluate(x)

def differentiate_polynomial(coefficients):
    poly = Polynomial(*coefficients)
    derivative = poly.Derivative()
    return derivative._coefficients

def rand_uniform(min_value, max_value):
    rand = Rand()
    return Random.RandUniform(min_value, max_value)

def rand_normal(mean, std_dev):
    rand = Rand()
    return Random.RandNormal(mean, std_dev)

def rand_poisson(lambd):
    rand = Rand()
    return Random.RandPoisson(lambd)

def get_current_time():
    return str(Time.Now())

def create_time_from_ticks(ticks):
    return str(Time(ticks))

def get_ticks_from_time(time_obj):
    return time_obj.Ticks

def equify(equation: str, value: int):
    return Equif.Equify(equation, value)

def mean(*values):
    return Statistics.Mean(*values)

def median(*values):
    return Statistics.Median(*values)

def mode(*values):
    return Statistics.Mode(*values)

def variance(*values):
    return Statistics.Variance(*values)

def standard_deviation(*values):
    return Statistics.StandardDeviation(*values)

def correlation(valuesX, valuesY):
    return Statistics.Correlation(valuesX, valuesY)

def skewness(values):
    return Statgorithm.Statistics.Skewness(values)

def kurtosis(values):
    return Statgorithm.Statistics.Kurtosis(values)

def covariance(x_values, y_values):
    return Statgorithm.Statistics.Covariance(x_values, y_values)

def percentile(values, percentile):
    return Statgorithm.Statistics.Percentile(values, percentile)

def remove_outliers(values):
    return list(Statgorithm.Statistics.RemoveOutliers(values))

def sinh(x: int):
    return Hyperbolic.Sinh(x)

def cosh(x: int):
    return Hyperbolic.cosh(x)

def tanh(x: int):
    return Hyperbolic.tanh(x)

def sech(x: int):
    return Hyperbolic.Sech(x)

def csch(x: int):
    return Hyperbolic.Csch(x)

def Coth(x: int):
    return Hyperbolic.Coth(x)

def asinh(x: int):
    return Hyperbolic.Asinh(x)

def acosh(x: int):
    return Hyperbolic.Acosh(x)

def atanh(x: int):
    return Hyperbolic.Atanh(x)

def asech(x: int):
    return Hyperbolic.Asech(x)

def acsch(x: int):
    return Hyperbolic.Acsch(x)

def acoth(x: int):
    return Hyperbolic.Acoth(x) 

def sin(x: int):
    return Trig.Sin(x)

def cos(x: int):
    return Trig.cos(x)

def tan(x: int):
    return Trig.tan(x)

def asin(x: int):
    return Trig.Asin(x)

def acos(x: int):
    return Trig.Acos(x)

def atan(x: int):
    return Trig.Atan(x)

def asec(x: int):
    return Trig.Asec(x)                      

def acsc(x: int):
    return Trig.Acsc(x)

def acoth(x: int):
    return Trig.Acot(x)