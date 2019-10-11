package kr.co.momstudy.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class Calender {
	
	String s;
	String e;
		
	public String[] calmonth(int year, int month) {
		int day = 1;

		String [] dates = new String[42];
		Calendar cal = Calendar.getInstance();

		// 현재달의 달력
		cal.set(year, month - 1, day); // 월은 -1해줘야 해당월로 인식
		int thisLastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH); // 현재월의 마지막 일
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
		cal.add(Calendar.DATE, -(dayOfWeek - 1));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

		int cycle = 0;
		
		for (int i = dayOfWeek - 1; i > 0; i--) {
			dates[cycle++] = sdf.format(cal.getTime());
			cal.add(Calendar.DATE, +1);
		}
		
		for (int i = 0; i < thisLastDay; i++) {
			dates[cycle++] = sdf.format(cal.getTime());
			cal.add(Calendar.DATE, +1);
		}
		
		cal.set(year, month, day);
		
		for (;cycle < 42; cycle++) {
			dates[cycle] = sdf.format(cal.getTime());
			cal.add(Calendar.DATE, + 1);
		}


		return dates;
	}


}
