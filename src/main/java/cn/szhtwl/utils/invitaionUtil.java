package cn.szhtwl.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * ���ӹ�����
 */
public class invitaionUtil {
	public static String getContent(String str){
		//����������ʽ
		String regEx_script="<script[^>]*?>[\\s\\S]*?<\\/script>";
		String regEx_html = "<[^>]+>";	
		String regEx_css = "<style[^>]*?>[\\s\\S]*?<\\/style>";
		/*
		 * ����script��ǩ
		 */
		Pattern pScript = Pattern.compile(regEx_script,Pattern.CASE_INSENSITIVE);
		Matcher mScript = pScript.matcher(str);
		str = mScript.replaceAll("");
		
		/*
		 * ����style��ǩ
		 */
		Pattern pStyle = Pattern.compile(regEx_css,Pattern.CASE_INSENSITIVE);
		Matcher mStyle = pStyle.matcher(str);
		str = mStyle.replaceAll("");
		
		/*
		 * ����html��ǩ
		 */
		Pattern pHtml = Pattern.compile(regEx_html,Pattern.CASE_INSENSITIVE);
		Matcher mHtml = pHtml.matcher(str);
		str = mHtml.replaceAll("");
		
		//�滻���пո�
		str = str.replace("&nbsp;", "");
		str = str.replace("\r","");
		str = str.replace("\n","");
		str = str.replace("\t","");
		return str;
		
	}
}
