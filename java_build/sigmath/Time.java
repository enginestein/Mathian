package sigmath;

public class Time
{
	private int year;
	private int month;
	private int day;
	private int hour;
	private int minute;
	private int second;
	private final long ticks;

	private static final long TicksPerSecond = TimeSpan.TicksPerSecond;
	private static final long TicksPerMinute = TimeSpan.TicksPerMinute;
	private static final long TicksPerHour = TimeSpan.TicksPerHour;
	private static final long TicksPerDay = TimeSpan.TicksPerDay;

	public Time(long ticks)
	{
		this.ticks = ticks;

		long seconds = ticks / TicksPerSecond;
		long minutes = seconds / 60;
		long hours = minutes / 60;
		long days = hours / 24;

		second = (int)(seconds % 60);
		minute = (int)(minutes % 60);
		hour = (int)(hours % 24);

		long years = 1;
		long daysInYear = IsLeapYear(year) ? 366 : 365;

		while (days >= daysInYear)
		{
			days -= daysInYear;
			years++;
			daysInYear = IsLeapYear((int)(year + years - 1)) ? 366 : 365;
		}

		year = (int)(years + 1);
		month = 1;

		while (days >= GetDaysInMonth(year, month))
		{
			days -= GetDaysInMonth(year, month);
			month++;
		}

		day = (int)(days + 1);
	}

	public static Time Now()
	{
		long ticks = GetSystemTimeAsFileTime();
		ticks -= 116444736000000000;
		ticks /= 10;
		return new Time(ticks);
	}

	public final long getTicks()
	{
		return ticks;
	}

	@Override
	public String toString()
	{
		return String.format("%1$s-%2$02d-%3$02d %4$02d:%5$02d:%6$02d", year, month, day, hour, minute, second);
	}

	private static boolean IsLeapYear(int year)
	{
		return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
	}

	private static int GetDaysInMonth(int year, int month)
	{
		switch (month)
		{
			case 2:
				return IsLeapYear(year) ? 29 : 28;
			case 4:
			case 6:
			case 9:
			case 11:
				return 30;
			default:
				return 31;
		}
	}

	private static native void GetSystemTimeAsFileTime(tangible.OutObject<Long> lpSystemTimeAsFileTime);
	static
	{
		System.loadLibrary("kernel32.dll");
	}

	private static long GetSystemTimeAsFileTime()
	{
		long fileTime;
//C# TO JAVA CONVERTER TASK: The following method call contained an unresolved 'out' keyword - these cannot be converted using the 'OutObject' helper class unless the method is within the code being modified:
		GetSystemTimeAsFileTime(out fileTime);
		return fileTime;
	}
}
