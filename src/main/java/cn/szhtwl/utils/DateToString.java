package cn.szhtwl.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by 宁采臣丶 on 2017/10/22.
 */
public class DateToString {

    public static String build(Date date){
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
        return dateFormat.format(date);
    }
}
