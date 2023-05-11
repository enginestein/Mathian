#pragma once

#include <system/object.h>
#include <cstdint>

namespace Sigmath {

class Nums : public System::Object
{
    typedef Nums ThisType;
    typedef System::Object BaseType;
    
    typedef ::System::BaseTypesInfo<BaseType> ThisTypeBaseTypesInfo;
    RTTI_INFO_DECL();
    
public:

    static int32_t Gcd(int32_t a, int32_t b);
    static int32_t Lcm(int32_t a, int32_t b);
    static int32_t Mod(int32_t a, int32_t b);
    
};

} // namespace Sigmath


