from System.Collections.Generic import *
from System.Linq import *

class Sets(object):
	def Union(set1, set2):
		unionSet = List[T](set1)
		unionSet.AddRange(set2.Except(set1))
		return unionSet

	Union = staticmethod(Union)

	def Intersection(set1, set2):
		intersectionSet = List[T](set1)
		intersectionSet.RemoveAll()
		return intersectionSet

	Intersection = staticmethod(Intersection)

	def Difference(set1, set2):
		differenceSet = List[T](set1)
		differenceSet.RemoveAll()
		return differenceSet

	Difference = staticmethod(Difference)

	def SymmetricDifference(set1, set2):
		symmetricDifferenceSet = List[T]()
		unionSet = Sets.Union(set1, set2)
		enumerator = unionSet.GetEnumerator()
		while enumerator.MoveNext():
			item = enumerator.Current
			if (set1.Contains(item) and not set2.Contains(item)) or (not set1.Contains(item) and set2.Contains(item)):
				symmetricDifferenceSet.Add(item)
		return symmetricDifferenceSet

	SymmetricDifference = staticmethod(SymmetricDifference)

	def IsSubset(subset, set):
		return subset.All(set.Contains)

	IsSubset = staticmethod(IsSubset)

	def IsSuperset(superset, set):
		return set.All(superset.Contains)

	IsSuperset = staticmethod(IsSuperset)