require "mscorlib"
require "System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
require "System.Runtime.InteropServices, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

module Sigmath
	class Time
		def initialize(ticks)
			@TicksPerSecond = TimeSpan.TicksPerSecond
			@TicksPerMinute = TimeSpan.TicksPerMinute
			@TicksPerHour = TimeSpan.TicksPerHour
			@TicksPerDay = TimeSpan.TicksPerDay
			self.@ticks = ticks
			seconds = ticks / @TicksPerSecond
			minutes = seconds / 60
			hours = minutes / 60
			days = hours / 24
			@second = (seconds % 60)
			@minute = (minutes % 60)
			@hour = (hours % 24)
			years = 1
			daysInYear = self.IsLeapYear(@year) ? 366 : 365
			while days >= daysInYear
				days -= daysInYear
				years += 1
				daysInYear = self.IsLeapYear((@year + years - 1)) ? 366 : 365
			end
			@year = (years + 1)
			@month = 1
			while days >= self.GetDaysInMonth(@year, @month)
				days -= self.GetDaysInMonth(@year, @month)
				@month += 1
			end
			@day = (days + 1)
		end

		def Time.Now()
			ticks = Time.GetSystemTimeAsFileTime()
			@ticks -= 116444736000000000
			@ticks /= 10
			return Time.new(@ticks)
		end

		def Ticks
			return @ticks
		end

		def ToString()
			return "{year}-{month:00}-{day:00} {hour:00}:{minute:00}:{second:00}"
		end

		def Time.IsLeapYear(year)
			return year % 4 == 0 and (year % 100 != 0 or year % 400 == 0)
		end

		def Time.GetDaysInMonth(year, month)
			case month
				when 2
					return Time.IsLeapYear(year) ? 29 : 28
				when 4, 6, 9, 11
					return 30
				else
					return 31
			end
		end

		def Time.GetSystemTimeAsFileTime(lpSystemTimeAsFileTime)
		end

		def Time.GetSystemTimeAsFileTime()
			Time.GetSystemTimeAsFileTime(System::Int64)
			return fileTime
		end
	end
end