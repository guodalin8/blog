package com.ch7.common;

import java.util.regex.Pattern;

/**
 * @author dalin
 *数据验证类
 */
public class DataValidator {
	/**
	 * 验证字符串是否为空
	 * @param input
	 * @return
	 */
	public static boolean isNullOrEmpty(String input){
		return "".equals(input)||input==null;
	}
	/**
	 * 匹配正则表达式
	 * @param input--->需要进行匹配的字符串
	 * @param pattern--->正则表达式
	 * @return
	 */
	public static boolean regexMatch(String input,String pattern){
		if(isNullOrEmpty(input)){
			return false;
		}
		return Pattern.compile(pattern).matcher(input).matches();
	}
	
}
