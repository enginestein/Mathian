#pragma once

#include <system/predicate.h>
#include <system/object.h>
#include <system/linq/enumerable.h>
#include <system/func.h>
#include <system/collections/list.h>
#include <system/collections/ienumerator.h>
#include <system/collections/ienumerable.h>
#include <functional>
#include <cstdint>

namespace Sigmath {

class Sets : public System::Object
{
    typedef Sets ThisType;
    typedef System::Object BaseType;
    
    typedef ::System::BaseTypesInfo<BaseType> ThisTypeBaseTypesInfo;
    RTTI_INFO_DECL();
    
public:

    template <typename T>
    static System::SharedPtr<System::Collections::Generic::List<T>> Union(System::SharedPtr<System::Collections::Generic::List<T>> set1, System::SharedPtr<System::Collections::Generic::List<T>> set2)
    {
        auto unionSet = System::MakeObject<System::Collections::Generic::List<T>>(set1);
        unionSet->AddRange(set2->LINQ_Except(set1));
        return unionSet;
    }
    
    template <typename T>
    static System::SharedPtr<System::Collections::Generic::List<T>> Intersection(System::SharedPtr<System::Collections::Generic::List<T>> set1, System::SharedPtr<System::Collections::Generic::List<T>> set2)
    {
        auto intersectionSet = System::MakeObject<System::Collections::Generic::List<T>>(set1);
        intersectionSet->RemoveAll(static_cast<System::Predicate<T>>(static_cast<std::function<bool(T x)>>([&set2](T x) -> bool
        {
            return !set2->Contains(x);
        })));
        return intersectionSet;
    }
    
    template <typename T>
    static System::SharedPtr<System::Collections::Generic::List<T>> Difference(System::SharedPtr<System::Collections::Generic::List<T>> set1, System::SharedPtr<System::Collections::Generic::List<T>> set2)
    {
        auto differenceSet = System::MakeObject<System::Collections::Generic::List<T>>(set1);
        differenceSet->RemoveAll(static_cast<System::Predicate<T>>(static_cast<std::function<bool(T x)>>([&set2](T x) -> bool
        {
            return set2->Contains(x);
        })));
        return differenceSet;
    }
    
    template <typename T>
    static System::SharedPtr<System::Collections::Generic::List<T>> SymmetricDifference(System::SharedPtr<System::Collections::Generic::List<T>> set1, System::SharedPtr<System::Collections::Generic::List<T>> set2)
    {
        auto symmetricDifferenceSet = System::MakeObject<System::Collections::Generic::List<T>>();
        auto unionSet = Union<T>(set1, set2);
        
        
        {
            auto item_enumerator = (unionSet)->GetEnumerator();
            while (item_enumerator->MoveNext())
            {
                auto&& item = item_enumerator->get_Current();
                
                if ((set1->Contains(item) && !set2->Contains(item)) || (!set1->Contains(item) && set2->Contains(item)))
                {
                    symmetricDifferenceSet->Add(item);
                }
            }
        }
        
        return symmetricDifferenceSet;
    }
    
    template <typename T>
    static bool IsSubset(System::SharedPtr<System::Collections::Generic::List<T>> subset, System::SharedPtr<System::Collections::Generic::List<T>> set)
    {
        return subset->LINQ_All(static_cast<System::Func<T, bool>>(std::bind(&System::Collections::Generic::List<T>::Contains, set, std::placeholders::_1)));
    }
    
    template <typename T>
    static bool IsSuperset(System::SharedPtr<System::Collections::Generic::List<T>> superset, System::SharedPtr<System::Collections::Generic::List<T>> set)
    {
        return set->LINQ_All(static_cast<System::Func<T, bool>>(std::bind(&System::Collections::Generic::List<T>::Contains, superset, std::placeholders::_1)));
    }
    
    
};

} // namespace Sigmath


