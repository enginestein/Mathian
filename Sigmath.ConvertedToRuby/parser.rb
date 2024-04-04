require "mscorlib"

require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Linq.Expressions, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module Sigmath
	class ExpressionParser
		def initialize(dataTable)
			self.@dataTable = dataTable
		end

		def Parse(expression)
			begin
				return Expression.Constant(@dataTable.Compute(expression, nil), System::Double.to_clr_type)
			rescue  => 
				raise ArgumentException.new("Invalid expression")
			ensure
			end
		end

		def Compile(expression)
			begin
				lambda = Expression.Lambda(expression)
				compiled = lambda.Compile()
				return compiled
			rescue  => 
				raise ArgumentException.new("Invalid expression")
			ensure
			end
		end
	end
end