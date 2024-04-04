module Sigmath
	class Computing
		def Computing.Floor(x)
			return (x >= 0 ? x : x - 0.999999999999999)
		end

		def Computing.Ceil(x)
			return (x >= 0 ? x + 0.999999999999999 : x)
		end

		def Computing.Round(x)
			return (x >= 0 ? x + 0.5 : x - 0.5)
		end
	end
end