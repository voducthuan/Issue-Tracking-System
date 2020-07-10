package tool;

import java.awt.*;
import java.awt.event.*;
import java.util.*;
import java.sql.*;

public class DBManager{

  public static Connection con = null;//Tao ket noi
  public static Statement stm = null; //Tao statement de thuc hien lenh SQL
  private ResultSet rss = null;        //Ket qua tra ve sau truy van
  private String report = null;       //Thong tin thong bao neu co loi
  // Constructor
  public DBManager(){
    connect(DBConstant.driver,DBConstant.connetionstring);
  }
  // Tao ket noi
  public boolean connect(String driver,String cnstring){
    if(con==null){
      try {
        Class.forName(driver);
        con = DriverManager.getConnection(cnstring);
      }
      catch (ClassNotFoundException e) { // bat ngoai le khi khong khoi tao duoc doi tuong quan ly driver
        report = e.toString();
        return false;
      }
      catch (SQLException e) { // khong tao duoc connection
        report = e.toString();
        return false;
      }
    }
    return true;
  }
  public Table getDataTable(){
      return new Table(rss);
  }

  // Thuc hien mot cau query
  public boolean querySql(String sql){
    boolean result = true;
    try{
      stm = con.createStatement();
      rss = stm.executeQuery(sql);
    }catch(SQLException e){
      report = e.toString();
      result = false;
    }
    return result;
  }
  // Thuc hien mo mot ban trong CSDL
  public boolean openTable(String tblName)
  {
    String sql = "Select * From " + tblName;
    return querySql(sql);
  }
  // Thuc hien lenh SQL
  public boolean updateSql(String sql){
    try {
      stm = con.createStatement();
      stm.executeUpdate(sql);
    }
    catch (SQLException ex) {
      report = ex.toString();
      return false;
    }
    return true;
  }
  // Tao doi tuong CallableStatement de chuan bi goi Stored Proc
  // sProc co dinh dang "{? = call ProcName(?,?,...)}" -> neu khong co tham so thi khong co ()
  // Dung phuong thuc setxxx() de thiet lap InputParam
  // Dung phuong thuc registerOutParameter() de dang ki kieu du lieu tra ve tu SP
  public CallableStatement makeCall(String sProc){
    CallableStatement cs = null;
    try{
      cs = con.prepareCall(sProc);
    }catch(SQLException e){
      report = e.toString();
    }
    return cs;
  }
  // Goi mot query Stored Proc
  public boolean runQueryStoredProc(CallableStatement cs){
    boolean result = true;
    try{
      rss = cs.executeQuery();
    }catch(SQLException e){
      report = e.toString();
      result = false;
    }
    return result;
  }
  // Goi mot update Stored Proc
  public boolean runUpdateStoredProc(CallableStatement cs){
    boolean result = true;
    try{
      cs.executeUpdate();
    }catch(SQLException e){
      report = e.toString();
      result = false;
    }
    return result;
  }
  // Lay thong bao sao khi thuc hien mot cau sql va xoa rong thong bao
  public String getReport(){
    String temp = report.toString();
    report = null;
    return temp;
  }
}

