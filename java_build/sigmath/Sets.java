package sigmath;

import java.util.*;

public class Sets
{
	public static <T> ArrayList<T> Union(ArrayList<T> set1, ArrayList<T> set2)
	{
		var unionSet = new ArrayList<T>(set1);
		unionSet.addAll(set2.Except(set1));
		return unionSet;
	}

	public static <T> ArrayList<T> Intersection(ArrayList<T> set1, ArrayList<T> set2)
	{
		var intersectionSet = new ArrayList<T>(set1);
		tangible.ListHelper.removeAll(intersectionSet, x -> !set2.contains(x));
		return intersectionSet;
	}

	public static <T> ArrayList<T> Difference(ArrayList<T> set1, ArrayList<T> set2)
	{
		var differenceSet = new ArrayList<T>(set1);
		tangible.ListHelper.removeAll(differenceSet, x -> set2.contains(x));
		return differenceSet;
	}

	public static <T> ArrayList<T> SymmetricDifference(ArrayList<T> set1, ArrayList<T> set2)
	{
		var symmetricDifferenceSet = new ArrayList<T>();
		var unionSet = Union(set1, set2);

		for (var item : unionSet)
		{
			if ((set1.contains(item) && !set2.contains(item)) || (!set1.contains(item) && set2.contains(item)))
			{
				symmetricDifferenceSet.add(item);
			}
		}

		return symmetricDifferenceSet;
	}

	public static <T> boolean IsSubset(ArrayList<T> subset, ArrayList<T> set)
	{
		return subset.All(set.Contains);
	}

	public static <T> boolean IsSuperset(ArrayList<T> superset, ArrayList<T> set)
	{
		return set.All(superset.Contains);
	}
}
