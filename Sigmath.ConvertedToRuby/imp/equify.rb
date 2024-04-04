require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq.Expressions, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Text.RegularExpressions, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module Sigmath
	class Equif
		def Equif.Equify(equation, value)
			equation = Regex.Replace(equation, @"[A-Za-z]+", 			if match.Index > 0 and System::Char.IsDigit(equation[match.Index - 1]) then
				return match.Value
			else
				return value.ToString()
			end
)
			dataTable = DataTable.new()
			parser = ExpressionParser.new(dataTable)
			expression = parser.Parse(equation)
			lambda = Expression.Lambda(expression)
			function = lambda.Compile()
			return Equif.function()
		end
	end
end