package sigmath;

import java.util.Iterator;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

public class Sets {
    public static <T> List<T> union(List<T> set1, List<T> set2) {
        List<T> unionSet = set1.stream().collect(Collectors.toList());
        unionSet.addAll(set2.stream().filter(item -> !set1.contains(item)).collect(Collectors.toList()));
        return unionSet;
    }

    public static <T> List<T> intersection(List<T> set1, final List<T> set2) {
        List<T> intersectionSet = set1.stream().filter(item -> set2.contains(item)).collect(Collectors.toList());
        return intersectionSet;
    }

    public static <T> List<T> difference(List<T> set1, final List<T> set2) {
        List<T> differenceSet = set1.stream().filter(item -> !set2.contains(item)).collect(Collectors.toList());
        return differenceSet;
    }

    public static <T> List<T> symmetricDifference(List<T> set1, List<T> set2) {
        List<T> symmetricDifferenceSet = set1.stream().filter(item -> !set2.contains(item)).collect(Collectors.toList());
        symmetricDifferenceSet.addAll(set2.stream().filter(item -> !set1.contains(item)).collect(Collectors.toList()));
        return symmetricDifferenceSet;
    }

    public static <T> boolean isSubset(List<T> subset, List<T> set) {
        return subset.stream().allMatch(set::contains);
    }

    public static <T> boolean isSuperset(List<T> superset, List<T> set) {
        return set.stream().allMatch(superset::contains);
    }
}