package tool;
import java.util.*;
import java.text.SimpleDateFormat;

public class SimpleDate{
  private Date m_Date;
  public SimpleDate(){
    m_Date = new Date();
  }
  public SimpleDate(Date date){
    m_Date = date;
  }
  public int getDate(){
    Calendar c = Calendar.getInstance();
    c.setTime(m_Date);
    return c.get(Calendar.DATE);
  }
  public int getMonth(){
    Calendar c = Calendar.getInstance();
    c.setTime(m_Date);
    return c.get(Calendar.MONTH) + 1;
  }
  public int getYear(){
    Calendar c = Calendar.getInstance();
    c.setTime(m_Date);
    return c.get(Calendar.YEAR);
  }
  public static String getFullCurrentDate(){
    SimpleDate sd = new SimpleDate();
    return sd.getFullDate();
  }
  public static String getShortCurrentDate(){
    SimpleDate sd = new SimpleDate();
    return sd.getShortDate();
  }
  public static Date parseFullDate(String sDate){
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date d = new Date();
    try{
      d = sdf.parse(sDate);
    }catch(Exception e){
      d=null;
    }
    return d;
  }
  public void parseFDate(String sDate){
    m_Date = parseFullDate(sDate);
  }
  public static Date parseShortDate(String sDate){
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    Date d = new Date();
    try{
      d = sdf.parse(sDate);
    }catch(Exception e){
      d=null;
    }
    return d;
  }
  public void parseSDate(String sDate){
    m_Date = parseShortDate(sDate);
  }
  public static Date parseSQLDate(String sDate){
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date d = new Date();
    try{
      d = sdf.parse(sDate);
    }catch(Exception e){
      d=null;
    }
    return d;
  }
  public void parseQueryDate(String sDate){
    m_Date = parseSQLDate(sDate);
  }
  public String getFullDate()
  {
    return getFullDate(m_Date);
  }
  public static String getFullDate(Date d){
    Calendar c = Calendar.getInstance();
    c.setTime(d);
    String sdate = Integer.toString(c.get(Calendar.DATE));
    sdate += "/" + Integer.toString(c.get(Calendar.MONTH) + 1);
    sdate += "/" + Integer.toString(c.get(Calendar.YEAR)) + " ";
    sdate += Integer.toString(c.get(c.HOUR_OF_DAY));
    sdate += ":" + Integer.toString(c.get(c.MINUTE));
    sdate += ":" + Integer.toString(c.get(c.SECOND));
    return sdate;
  }
  public String getSQLFullDate()
  {
    return getSQLFullDate(m_Date);
  }
  public static String getSQLFullDate(Date d){
    Calendar c = Calendar.getInstance();
    c.setTime(d);
    String sdate = Integer.toString(c.get(Calendar.MONTH) + 1);
    sdate += "/" + Integer.toString(c.get(Calendar.DATE));
    sdate += "/" + Integer.toString(c.get(Calendar.YEAR)) + " ";
    sdate += Integer.toString(c.get(c.HOUR_OF_DAY));
    sdate += ":" + Integer.toString(c.get(c.MINUTE));
    sdate += ":" + Integer.toString(c.get(c.SECOND));
    return sdate;
  }
  public String getShortDate(){
    return getShortDate(m_Date);
  }
  public static String getShortDate(Date d){
    String sdate="";
    Calendar c = Calendar.getInstance();
    c.setTime(d);
    sdate = Integer.toString(c.get(Calendar.DATE));
    sdate += "/" + Integer.toString(c.get(Calendar.MONTH) + 1);
    sdate += "/" + Integer.toString(c.get(Calendar.YEAR));
    return sdate;
  }
  public String getSQLShortDate(){
    return getSQLShortDate(m_Date);
  }
  public static String getSQLShortDate(Date d){
    String sdate="";
    Calendar c = Calendar.getInstance();
    c.setTime(d);
    sdate = Integer.toString(c.get(Calendar.MONTH) + 1);
    sdate += "/" + Integer.toString(c.get(Calendar.DATE));
    sdate += "/" + Integer.toString(c.get(Calendar.YEAR));
    return sdate;
  }
  public void add(int date){
    Calendar c = Calendar.getInstance();
    c.setTime(m_Date);
    c.add(Calendar.DATE,date);
    m_Date = c.getTime();
  }
}