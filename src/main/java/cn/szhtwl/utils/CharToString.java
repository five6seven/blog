package cn.szhtwl.utils;

import java.io.UnsupportedEncodingException;

/**
 * Created by 宁采臣丶 on 2017/10/20.
 */
public class CharToString {

    public static String toString(String s) throws UnsupportedEncodingException {
        if(s==null) s="";
       s = new String(s.getBytes("iso8859-1"),"utf-8");
       return s;
    }
}
