package common;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;

public class JSFunction {
	//경고창 띄우고 url로 이동시키는 문자열을 리턴
	public static void alertLocation(String msg, String url,JspWriter out) {
		
		try {
			
			String str = ""
					   + "<script>"
					   + "alert('"+ msg +"');"
					   + "location.href='"+url+"';"
					   + "</script>";
			out.println(str);
		} catch (IOException e) {
			
		}
	}
}
