require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module Sigmath
	class Calculus
		def Calculus.Derivative(f, x)
			dx = 1e-9 # small increment to find the derivative
			y1 = Calculus.f(x)
			y2 = Calculus.f(x + dx)
			derivative = (y2 - y1) / dx
			return derivative
		end

		def Calculus.Integral(f, a, b, n)
			h = (b - a) / n
			integral = 0
			i = 1
			while i < n
				x = a + i * h
				integral += Calculus.f(x)
				i += 1
			end
			integral += (Calculus.f(a) + Calculus.f(b)) / 2
			integral *= h
			return integral
		end

		def Calculus.Limit(f, g, x)
			maxIterations = 1000
			tolerance = 1e-9
			fx = Calculus.f(x)
			gx = Calculus.g(x)
			limit = fx / gx
			i = 0
			while i < maxIterations
				fx1 = Calculus.Derivative(f, x)
				gx1 = Calculus.Derivative(g, x)
				newLimit = fx1 / gx1
				if Basic.Abs(newLimit - limit) < tolerance then
					return newLimit
				end
				limit = newLimit
				x += 1e-9
				i += 1
			end
			raise Exception.new("Limit does not exist or cannot be computed with L'Hopital's Rule.")
		end

		def Calculus.FindRoot(f, a, b, epsilon)
			if Calculus.f(a) * Calculus.f(b) > 0 then
				raise ArgumentException.new("Function must have opposite signs at interval endpoints")
			end
			c = (a + b) / 2
			while Math.Abs(Calculus.f(c)) > epsilon
				if Calculus.f(a) * Calculus.f(c) < 0 then
					b = c
				else
					a = c
				end
				c = (a + b) / 2
			end
			return c
		end

		def Calculus.Factorial(n)
			result = 1
			i = 2
			while i <= n
				result *= i
				i += 1
			end
			return result
		end

		def Calculus.PartialDerivative(f, index, h)
			return 			xPlus = x.Clone()
			xPlus[index] += h
			xMinus = x.Clone()
			xMinus[index] -= h
			return (Calculus.f(xPlus) - Calculus.f(xMinus)) / (2 * h)

		end

		def Calculus.Gradient(f, h)
			return 			gradient = Array.CreateInstance(System::Double, x.Length)
			i = 0
			while i < x.Length
				gradient[i] = (x)
				i += 1
			end
			return gradient

		end

		def Calculus.Hessian(f, h)
			return 			n = x.Length
			hessian = Array.CreateInstance(System::Double, n, n)
			i = 0
			while i < n
				j = 0
				while j < n
					fxx = (x)
					hessian[i][j] = fxx
					j += 1
				end
				i += 1
			end
			return hessian

		end

		def Calculus.FindCriticalPoints(f, a, b, epsilon)
			criticalPoints = List[System::Double].new()
			# Evaluate function at endpoints of interval
			fa = Calculus.f(a)
			fb = Calculus.f(b)
			# Check if endpoints are critical points
			if Math.Abs(fa) < epsilon then
				criticalPoints.Add(a)
			end
			if Math.Abs(fb) < epsilon then
				criticalPoints.Add(b)
			end
			# Find critical points in the interval
			x = a
			fx = Calculus.f(a)
			while x < b
				xNext = x + epsilon
				fxNext = Calculus.f(xNext)
				# Check if the current point is a critical point
				if Math.Abs(fx) < epsilon and x > a and x < b then
					criticalPoints.Add(x)
				end
				# Check if the function changes sign between x and xNext
				if fx * fxNext < 0 then
					# Use bisection method to find a root
					xLeft = x
					xRight = xNext
					while xRight - xLeft > epsilon
						xMid = (xLeft + xRight) / 2
						fxMid = Calculus.f(xMid)
						if Math.Abs(fxMid) < epsilon then
							criticalPoints.Add(xMid)
							break
						end
						if fx * fxMid < 0 then
							xRight = xMid
						else
							xLeft = xMid
						end
					end
				end
				x = xNext
				fx = fxNext
			end
			return criticalPoints.ToArray()
		end

		class RiemannSumType
			def initialize()
			end
		end

		def RiemannSumType.RiemannSum(f, a, b, n, type)
			dx = (b - a) / n
			sum = 0
			i = 0
			while i < n
				x = a + i * dx
				fx = Calculus.f(x)
				case type
					when RiemannSumType.Left
						sum += fx * dx
					when RiemannSumType.Right
						sum += Calculus.f(x + dx) * dx
					when RiemannSumType.Midpoint
						sum += Calculus.f(x + dx / 2) * dx
					when RiemannSumType.Trapezoidal
						sum += (fx + Calculus.f(x + dx)) * dx / 2
				end
				i += 1
			end
			return sum
		end

		def RiemannSumType.DefiniteIntegral(f, a, b, n)
			return Calculus.RiemannSum(f, a, b, n, RiemannSumType.Midpoint)
		end
	end
end