from System import *
from System.Runtime.InteropServices import *

class Time(object):
	def __init__(self, ticks):
		self._TicksPerSecond = TimeSpan.TicksPerSecond
		self._TicksPerMinute = TimeSpan.TicksPerMinute
		self._TicksPerHour = TimeSpan.TicksPerHour
		self._TicksPerDay = TimeSpan.TicksPerDay
		self._ticks = ticks
		seconds = ticks / self._TicksPerSecond
		minutes = seconds / 60
		hours = minutes / 60
		days = hours / 24
		self._second = (seconds % 60)
		self._minute = (minutes % 60)
		self._hour = (hours % 24)
		years = 1
		daysInYear = 366 if self.IsLeapYear(self._year) else 365
		while days >= daysInYear:
			days -= daysInYear
			years += 1
			daysInYear = 366 if self.IsLeapYear((self._year + years - 1)) else 365
		self._year = (years + 1)
		self._month = 1
		while days >= self.GetDaysInMonth(self._year, self._month):
			days -= self.GetDaysInMonth(self._year, self._month)
			self._month += 1
		self._day = (days + 1)

	def Now():
		ticks = Time.GetSystemTimeAsFileTime()
		self._ticks -= 116444736000000000
		self._ticks /= 10
		return Time(self._ticks)

	Now = staticmethod(Now)

	def get_Ticks(self):
		return self._ticks

	Ticks = property(fget=get_Ticks)

	def ToString(self):
		return "{year}-{month:00}-{day:00} {hour:00}:{minute:00}:{second:00}"

	def IsLeapYear(year):
		return year % 4 == 0 and (year % 100 != 0 or year % 400 == 0)

	IsLeapYear = staticmethod(IsLeapYear)

	def GetDaysInMonth(year, month):
		if month == 2:
			return 29 if Time.IsLeapYear(year) else 28
		elif month == 4 or month == 6 or month == 9 or month == 11:
			return 30
		else:
			return 31

	GetDaysInMonth = staticmethod(GetDaysInMonth)

	def GetSystemTimeAsFileTime(lpSystemTimeAsFileTime):
		pass

	GetSystemTimeAsFileTime = staticmethod(GetSystemTimeAsFileTime)

	def GetSystemTimeAsFileTime():
		Time.GetSystemTimeAsFileTime()
		return fileTime

	GetSystemTimeAsFileTime = staticmethod(GetSystemTimeAsFileTime)