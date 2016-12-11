package com.ch7.common;

import java.text.SimpleDateFormat;
import java.util.Date;




/**
 * @author dalin
 *数据转换类
 */
public class DataConverter {
	/**日期格式化为字符串
	 * @param date
	 * @return
	 */
	public static String dataToString(Date date){
		return dataToString(date,"yyyy-MM-dd HH:mm:ss");
		
	}
	public static String dataToString(Date date,String formatType){
		if(date==null){
			date=Utilty.getNowDateTime();
		}
		SimpleDateFormat formatter=new SimpleDateFormat(formatType);
		return formatter.format(date);
	}
	
	/**
	 * 字符串转换为时间
	 * @param input
	 */
	public static Date toDate(String input){
		return toDate(input,"yyyy-MM-dd HH:mm:ss");
	}
	public static Date toDate(String input,String formatType){
		SimpleDateFormat format=new SimpleDateFormat(formatType);
		Date dt=new Date();
		if(DataValidator.isNullOrEmpty(input)){
			return dt;
		}
		try{
			dt=format.parse(input);
		}catch(Exception e){
			
		}
		return dt;
	}
	/**
	 * 字符串转化为短日期格式
	 * @param input
	 * @return
	 */
	public static java.util.Date toShortDate(String input){
		return toDate(input,"yyyy-MM-dd");
	}
	
	/**
	 * 字符串转化为长日期格式
	 * @param input
	 * @return
	 */
	public static java.util.Date toFullDate(String input) {
		// TODO Auto-generated method stub
		return toDate(input,"yyyy-MM-dd HH:mm:ss");
	}
	
	/**
	 * 字符串转换为整型，出错就返回0
	 * @param input
	 * @return
	 */
	public static int toInt(String input){
		try{
		return Integer.parseInt(input);
		}catch(Exception e){
			return 0;
		}
	}
}
