package tool;

import java.util.*;
import java.sql.*;

public class Table {

    private Vector data = null;         //Vector du lieu cua bang
    private Vector columnName = null;   //Vector chua cac ten cua cac columm
    private int colCount;               //So cot cua bang
    private String report = null;       //Thong tin thong bao neu co loi
    public Table() {

    }

    public Table(ResultSet resultSet) {
        if (resultSet!=null){
            this.getData(resultSet);
        }
    }

    public void setResultSet(ResultSet resultSet){
        if (resultSet!=null){
            this.getData(resultSet);
        }
    }
    protected boolean getData(ResultSet rss){
      try{
        data = new Vector();
        ResultSetMetaData meta = rss.getMetaData();
        columnName = new Vector();
        colCount = meta.getColumnCount();
        for(int i=0;i<colCount;i++){
          columnName.addElement(meta.getColumnName(i+1));
        }
        while(rss.next()){
          Vector rowData = new Vector();
          for(int i=0;i<colCount;i++){
            String field = rss.getString(i+1);
            rowData.addElement(field);
          }
          data.addElement(rowData);
        }
      }catch(SQLException e){
        report = e.toString();
        return false;
      }
      return true;
    }
    // Lay Vector data dung cho table
    public Vector getDataVector(){
      return data;
    }
    // Lay Vector column dung cho table
    public Vector getColumnNameVector(){
      return columnName;
    }
    // Lay mot field
    public String getCell(int row,int col){
      if(row<0 || row>data.size()) return null;
      if(col<0 || col>(((Vector)data.get(0)).size())) return null;
      return (String)((Vector)data.get(row)).get(col);
    }
    // Lay tong so column
    public int getColsCount(){
     return colCount;
    }
    // Lay tong so record
    public int getRowsCount(){
     return data.size();
    }
    // Lay thong bao sao khi thuc hien mot cau sql va xoa rong thong bao
    public String getReport(){
      String temp = report.toString();
      report = null;
      return temp;
    }
}
