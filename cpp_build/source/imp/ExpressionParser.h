#pragma once

#include <system/object.h>

namespace System
{
namespace Data
{
class DataTable;
} // namespace Data
class String;
} // namespace System

namespace Sigmath {

class ExpressionParser : public System::Object
{
    typedef ExpressionParser ThisType;
    typedef System::Object BaseType;
    
    typedef ::System::BaseTypesInfo<BaseType> ThisTypeBaseTypesInfo;
    RTTI_INFO_DECL();
    
public:

    ExpressionParser(System::SharedPtr<System::Data::DataTable> dataTable);
    
    System::SharedPtr<System::Object> Parse(System::String equation);
    
protected:

    #ifdef ASPOSE_GET_SHARED_MEMBERS
    void GetSharedMembers(System::Object::shared_members_type& result) const override;
    #endif
    
    
private:

    System::SharedPtr<System::Data::DataTable> dataTable;
    
};

} // namespace Sigmath


