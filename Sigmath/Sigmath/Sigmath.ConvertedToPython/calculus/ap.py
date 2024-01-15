from System import *

class ArithmeticProgression(object):
	def Arithmetic(firstTerm, commonDifference, numTerms):
		terms = Array.CreateInstance(Double, numTerms)
		i = 0
		while i < numTerms:
			terms[i] = firstTerm + i * commonDifference
			i += 1
		return terms

	Arithmetic = staticmethod(Arithmetic)

	def ArithmeticSum(firstTerm, commonDifference, numTerms):
		return numTerms * (2 * firstTerm + (numTerms - 1) * commonDifference) / 2

	ArithmeticSum = staticmethod(ArithmeticSum)

	def NthTerm(n, a1, d):
		return a1 + (n - 1) * d

	NthTerm = staticmethod(NthTerm)

	def TermNumber(an, a1, d):
		n = (an - a1) / d + 1
		return Convert.ToInt32(n)

	TermNumber = staticmethod(TermNumber)

	def TermNumber(an, n, a1):
		d = (an - a1) / (n - 1)
		return Convert.ToInt32(d)

	TermNumber = staticmethod(TermNumber)

	def CommonDifference(an, a1, n):
		return (an - a1) / (n - 1)

	CommonDifference = staticmethod(CommonDifference)

	def FirstTerm(an, n, d):
		return an - (n - 1) * d

	FirstTerm = staticmethod(FirstTerm)

	def LastTerm(a1, n, d):
		return a1 + (n - 1) * d

	LastTerm = staticmethod(LastTerm)