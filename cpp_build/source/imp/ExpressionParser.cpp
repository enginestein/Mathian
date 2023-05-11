#include "ExpressionParser.h"

#include <system/string.h>
#include <system/exceptions.h>
#include <data/data_table.h>

namespace Sigmath {

RTTI_INFO_IMPL_HASH(1295592912u, ::Sigmath::ExpressionParser, ThisTypeBaseTypesInfo);

ExpressionParser::ExpressionParser(System::SharedPtr<System::Data::DataTable> dataTable)
{
    this->dataTable = dataTable;
}

System::SharedPtr<System::Object> ExpressionParser::Parse(System::String equation)
{
    throw System::NotImplementedException();
}

#ifdef ASPOSE_GET_SHARED_MEMBERS
void ExpressionParser::GetSharedMembers(System::Object::shared_members_type& result) const
{
    System::Object::GetSharedMembers(result);
    
    result.Add("Sigmath::ExpressionParser::dataTable", this->dataTable);
}
#endif

} // namespace Sigmath
