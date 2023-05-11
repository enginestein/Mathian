#pragma once

#include <system/object.h>

namespace System
{
class String;
} // namespace System

namespace Sigmath {

class Equif : public System::Object
{
    typedef Equif ThisType;
    typedef System::Object BaseType;
    
    typedef ::System::BaseTypesInfo<BaseType> ThisTypeBaseTypesInfo;
    RTTI_INFO_DECL();
    
public:

    static double Equify(System::String equation, double value);
    
};

} // namespace Sigmath


