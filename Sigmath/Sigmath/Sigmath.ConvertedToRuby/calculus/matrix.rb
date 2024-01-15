require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module Sigmath
	class Matrix
		def Rows
		end

		def Cols
		end

		def initialize(data)
			self.Rows = data.GetLength(0)
			self.Cols = data.GetLength(1)
			@_data = data
		end

		def initialize(data)
			self.Rows = data.GetLength(0)
			self.Cols = data.GetLength(1)
			@_data = data
		end

		def Item
		end
	end
end