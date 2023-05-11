package sigmath;

import java.util.Calendar;
import java.util.TimeZone;

public class Time {
    private int year;
    private int month;
    private int day;
    private int hour;
    private int minute;
    private int second;
    private final long ticks;

    public Time(long ticks) {
        this.ticks = ticks;

        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("UTC"));
        calendar.setTimeInMillis(ticks / 10000L);

        year = calendar.get(Calendar.YEAR);
        month = calendar.get(Calendar.MONTH) + 1;
        day = calendar.get(Calendar.DAY_OF_MONTH);
        hour = calendar.get(Calendar.HOUR_OF_DAY);
        minute = calendar.get(Calendar.MINUTE);
        second = calendar.get(Calendar.SECOND);
    }

    public static Time now() {
        long ticks = System.currentTimeMillis() * 10000L + 621355968000000000L;
        return new Time(ticks);
    }

    public final long getTicks() {
        return ticks;
    }

    @Override
    public String toString() {
        return String.format("%d-%02d-%02d %02d:%02d:%02d", year, month, day, hour, minute, second);
    }

    private static boolean isLeapYear(int year) {
        return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
    }

    private static int getDaysInMonth(int year, int month) {
        switch (month) {
            case 2:
                return isLeapYear(year) ? 29 : 28;
            case 4:
            case 6:
            case 9:
            case 11:
                return 30;
            default:
                return 31;
        }
    }
}