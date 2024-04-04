
namespace Sigmath

import System.Collections.Generic
import System.Linq

public class Sets:

	public static def Union(set1 as List[of T], set2 as List[of T]) as List[of T]:
		unionSet as var = List[of T](set1)
		unionSet.AddRange(set2.Except(set1))
		return unionSet

	
	public static def Intersection(set1 as List[of T], set2 as List[of T]) as List[of T]:
		intersectionSet as var = List[of T](set1)
		intersectionSet.RemoveAll({ x | return (not set2.Contains(x)) })
		return intersectionSet

	
	public static def Difference(set1 as List[of T], set2 as List[of T]) as List[of T]:
		differenceSet as var = List[of T](set1)
		differenceSet.RemoveAll({ x | return set2.Contains(x) })
		return differenceSet

	
	public static def SymmetricDifference(set1 as List[of T], set2 as List[of T]) as List[of T]:
		symmetricDifferenceSet as var = List[of T]()
		unionSet as var = Union(set1, set2)
		
		for item as var in unionSet:
			if (set1.Contains(item) and (not set2.Contains(item))) or ((not set1.Contains(item)) and set2.Contains(item)):
				symmetricDifferenceSet.Add(item)
		
		return symmetricDifferenceSet

	
	public static def IsSubset(subset as List[of T], set as List[of T]) as bool:
		return subset.All(set.Contains)

	
	public static def IsSuperset(superset as List[of T], set as List[of T]) as bool:
		return set.All(superset.Contains)

