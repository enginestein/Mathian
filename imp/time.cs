using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace Sigmath
{
    public class Time
    {
        private int year;
        private int month;
        private int day;
        private int hour;
        private int minute;
        private int second;
        private readonly long ticks;

        private static readonly long TicksPerSecond = TimeSpan.TicksPerSecond;
        private static readonly long TicksPerMinute = TimeSpan.TicksPerMinute;
        private static readonly long TicksPerHour = TimeSpan.TicksPerHour;
        private static readonly long TicksPerDay = TimeSpan.TicksPerDay;

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

        public long Ticks { get { return ticks; } }

        public override string ToString()
        {
            return $"{year}-{month:00}-{day:00} {hour:00}:{minute:00}:{second:00}";
        }

        private static bool IsLeapYear(int year)
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

        [DllImport("kernel32.dll")]
        private static extern void GetSystemTimeAsFileTime(out long lpSystemTimeAsFileTime);

        private static long GetSystemTimeAsFileTime()
        {
            GetSystemTimeAsFileTime(out long fileTime);
            return fileTime;
        }
    }
}
