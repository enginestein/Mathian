require "mscorlib"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module Sigmath
	class Sets
		def Sets.Union(set1, set2)
			unionSet = List[T].new(set1)
			unionSet.AddRange(set2.Except(set1))
			return unionSet
		end

		def Sets.Intersection(set1, set2)
			intersectionSet = List[T].new(set1)
			intersectionSet.RemoveAll(not set2.Contains(x))
			return intersectionSet
		end

		def Sets.Difference(set1, set2)
			differenceSet = List[T].new(set1)
			differenceSet.RemoveAll(set2.Contains(x))
			return differenceSet
		end

		def Sets.SymmetricDifference(set1, set2)
			symmetricDifferenceSet = List[T].new()
			unionSet = Sets.Union(set1, set2)
			enumerator = unionSet.GetEnumerator()
			while enumerator.MoveNext()
				item = enumerator.Current
				if (set1.Contains(item) and not set2.Contains(item)) or (not set1.Contains(item) and set2.Contains(item)) then
					symmetricDifferenceSet.Add(item)
				end
			end
			return symmetricDifferenceSet
		end

		def Sets.IsSubset(subset, set)
			return subset.All(set.Contains)
		end

		def Sets.IsSuperset(superset, set)
			return set.All(superset.Contains)
		end
	end
end