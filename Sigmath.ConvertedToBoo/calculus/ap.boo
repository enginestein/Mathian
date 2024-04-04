
namespace Sigmath

import System

public class ArithmeticProgression:

	
	public static def Arithmetic(firstTerm as double, commonDifference as double, numTerms as int) as (double):
		terms as (double) = array(double, numTerms)
		for i in range(0, numTerms):
			terms[i] = (firstTerm + (i * commonDifference))
		return terms

	
	public static def ArithmeticSum(firstTerm as double, commonDifference as double, numTerms as int) as double:
		return ((numTerms * ((2 * firstTerm) + ((numTerms - 1) * commonDifference))) / 2)

	
	public static def NthTerm(n as int, a1 as double, d as double) as double:
		return (a1 + ((n - 1) * d))

	
	public static def TermNumber(an as double, a1 as double, d as double) as int:
		n as double = (((an - a1) / d) + 1)
		return Convert.ToInt32(n)

	
	public static def TermNumber(an as double, n as int, a1 as double) as int:
		d as double = ((an - a1) / (n - 1))
		return Convert.ToInt32(d)

	
	public static def CommonDifference(an as double, a1 as double, n as int) as double:
		return ((an - a1) / (n - 1))

	
	public static def FirstTerm(an as double, n as int, d as double) as double:
		return (an - ((n - 1) * d))

	
	public static def LastTerm(a1 as double, n as int, d as double) as double:
		return (a1 + ((n - 1) * d))

