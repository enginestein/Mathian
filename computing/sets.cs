using System.Collections.Generic;
using System.Linq;

namespace Mathian
{
    public class Sets
    {
        public static List<T> Union<T>(List<T> set1, List<T> set2)
        {
            var unionSet = new List<T>(set1);
            unionSet.AddRange(set2.Except(set1));
            return unionSet;
        }

        public static List<T> Intersection<T>(List<T> set1, List<T> set2)
        {
            var intersectionSet = new List<T>(set1);
            intersectionSet.RemoveAll(x => !set2.Contains(x));
            return intersectionSet;
        }

        public static List<T> Difference<T>(List<T> set1, List<T> set2)
        {
            var differenceSet = new List<T>(set1);
            differenceSet.RemoveAll(x => set2.Contains(x));
            return differenceSet;
        }

        public static List<T> SymmetricDifference<T>(List<T> set1, List<T> set2)
        {
            var symmetricDifferenceSet = new List<T>();
            var unionSet = Union(set1, set2);

            foreach (var item in unionSet)
            {
                if ((set1.Contains(item) && !set2.Contains(item))
                    || (!set1.Contains(item) && set2.Contains(item)))
                {
                    symmetricDifferenceSet.Add(item);
                }
            }

            return symmetricDifferenceSet;
        }

        public static bool IsSubset<T>(List<T> subset, List<T> set)
        {
            return subset.All(set.Contains);
        }

        public static bool IsSuperset<T>(List<T> superset, List<T> set)
        {
            return set.All(superset.Contains);
        }
    }
}