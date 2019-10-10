package kr.co.momstudy.util;

import java.util.Arrays;
import java.util.Calendar;

public class Calender {
	public int[] calmonth(int year, int month) {
		int day = 1;
		int[] add = new int[42];
		Calendar cal = Calendar.getInstance();

		// 현재달의 달력
		cal.set(year, month - 1, day); // 월은 -1해줘야 해당월로 인식
		int thisLastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH); // 현재월의 마지막 일
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
		int[] thisMonth = new int[thisLastDay];
		for (int i = 0; i < thisMonth.length; i++) {
			thisMonth[i] = i + 1;
		}
		cal.set(year, month - 2, day); // 월은 -1해줘야 해당월로 인식
		int prevLastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		int cycle = 0;
		for (int i = dayOfWeek - 1; i > 0; i--) {
			add[cycle++] = prevLastDay - (i - 1);
		}

		System.arraycopy(thisMonth, 0, add, dayOfWeek - 1, thisMonth.length);
		int nextMonth = cycle + thisLastDay;
		int nextDay = 1;
		for (int i = nextMonth; i < 42; i++) {
			add[i] = nextDay++;
		}

		return add;
	}


}
