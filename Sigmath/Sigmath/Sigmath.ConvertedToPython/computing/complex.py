from System import *

class Compl(object):

	class Complex(object):
		def get_Real(self):

		Real = property(fget=get_Real)

		def get_Imaginary(self):

		Imaginary = property(fget=get_Imaginary)

		def __init__(self, real, imaginary):
			self.Real = real
			self.Imaginary = imaginary

		def Abs(a):
			return Basic.SquareRoot(a.Real * a.Real + a.Imaginary * a.Imaginary)

		Abs = staticmethod(Abs)

		def Magnitude(number):
			return Basic.SquareRoot(number.Real * number.Real + number.Imaginary * number.Imaginary)

		Magnitude = staticmethod(Magnitude)