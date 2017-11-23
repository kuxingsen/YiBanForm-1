package src.sust.util;

import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import bean.StuInf;
import net.sf.json.JSONObject;

public class JsonUtil {
	
	public String decodeUnicode(String str) {
        Charset set = Charset.forName("UTF-16");
        Pattern p = Pattern.compile("\\\\u([0-9a-fA-F]{4})");
        Matcher m = p.matcher( str );
        int start = 0 ;
        int start2 = 0 ;
        StringBuffer sb = new StringBuffer();
        while( m.find( start ) ) {
            start2 = m.start() ;
            if( start2 > start ){
                String seg = str.substring(start, start2) ;
                sb.append( seg );
            }
            String code = m.group( 1 );
            int i = Integer.valueOf( code , 16 );
            byte[] bb = new byte[ 4 ] ;
            bb[ 0 ] = (byte) ((i >> 8) & 0xFF );
            bb[ 1 ] = (byte) ( i & 0xFF ) ;
            ByteBuffer b = ByteBuffer.wrap(bb);
            sb.append( String.valueOf( set.decode(b) ).trim() );
            start = m.end() ;
        }
        start2 = str.length() ;
        if( start2 > start ){
            String seg = str.substring(start, start2) ;
            sb.append( seg );
        }
        return sb.toString() ;
    }
	
	public String getInf(String str,String id){
		
		return  toJsonObject(str).getString(id); 
	}
	
	public JSONObject toJsonObject(String str){
		JSONObject json = JSONObject.fromObject(str);		
		return json;
	}
	
	public StuInf toStuInf(String me,String real_me,String verify_me){
		StuInf si =new StuInf();
		System.out.println("Util:\n***1.me��" + me + "\n" + "***2.real_me��"
				+ real_me + "\n" + "***3.verify_me��" + verify_me);
		
		try {
			if (!verify_me.equals(" ") || verify_me != null || getInf(verify_me, "status").equals("success")) {
				System.out.println("aa");
				String inff = getInf(verify_me, "info");
				System.out.println("bb");
				si.setYb_userid(getInf(inff, "yb_userid"));
				si.setYb_realname(getInf(inff, "yb_realname"));
				si.setYb_schoolname(getInf(inff, "yb_schoolname"));
				si.setYb_collegename(getInf(inff, "yb_collegename"));
				si.setYb_classname(getInf(inff, "yb_classname"));
				si.setYb_enteryear(getInf(inff, "yb_enteryear"));
				si.setYb_studentid(getInf(inff, "yb_studentid"));
				si.setYb_examid(getInf(inff, "yb_examid"));
				si.setYb_admissionid(getInf(inff, "yb_admissionid"));
				si.setYb_employid(getInf(inff, "yb_employid"));
			}
		
			System.out.println("****"+getInf(real_me, "status"));
			if (!real_me.equals(" ") || real_me != null || getInf(real_me, "status").equals("success")) {
				System.out.println("cc");
				String inf = getInf(real_me, "info");
				System.out.println("dd");
				si.setYb_sex(getInf(inf, "yb_sex"));
				si.setYb_birthday(getInf(inf, "yb_birthday"));
			}
			
			System.out.println("&&&&&");
			if (!me.equals(" ") || me != null || getInf(me, "status").equals("success")) {
				System.out.println("ee");
				System.out.println(me);
			} 
		} catch (Exception e) {
			System.out.println("StuInf��ʼ������");
		}
		System.out.println(si.toString());
		return si;
	}
	
}
