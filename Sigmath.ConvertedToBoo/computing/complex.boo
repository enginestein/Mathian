
namespace Sigmath

import System

public class Compl:

	
	public struct Complex:

		public Real as double:
			get:
				pass

		public Imaginary as double:
			get:
				pass

		
		public def constructor(real as double, imaginary as double):
			Real = real
			Imaginary = imaginary

		
		
		
		
		
		
		
		public static def Abs(a as Complex) as double:
			return Basic.SquareRoot(((a.Real * a.Real) + (a.Imaginary * a.Imaginary)))

		
		public static def Magnitude(number as Complex) as double:
			return Basic.SquareRoot(((number.Real * number.Real) + (number.Imaginary * number.Imaginary)))

