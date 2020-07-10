/**
 *
 */
package ITSDB;

import tool.DBManager;
import ITS.Project;
import tool.Table;
import java.sql.CallableStatement;
import java.sql.SQLException;
import tool.SysConstant;

/**

 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class SeverityDB {
	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private DBManager dbmanager;

        public SeverityDB(){
          dbmanager = new DBManager();
        }
	/**
	 * @return the dbmanager
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public DBManager getDbmanager() {
		// begin-user-code
		return dbmanager;
		// end-user-code
	}

	/**
	 * @param theDbmanager the dbmanager to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setDbmanager(DBManager theDbmanager) {
		// begin-user-code
		dbmanager = theDbmanager;
		// end-user-code
	}

	/**
	 * @param pName
	 * @param pMark
	 * @param pProjectID
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int add(int pProjectID, String pName, int pMark) {
		// begin-user-code
		// TODO Auto-generated method stub
                int intResult = SysConstant.OK;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call AddSeverity(?,?,?)}";
                cs = dbmanager.makeCall(sStoredProc);
                try {
                  cs.setInt(1, pProjectID);
                  cs.setString(2, pName);
                  cs.setInt(3, pMark);
                }
                catch (SQLException e) {
                  intResult = SysConstant.ERROR;
                  return intResult;
                }
                if (!dbmanager.runUpdateStoredProc(cs)) {
                  intResult = SysConstant.ERROR;
                }

                return intResult;

		// end-user-code
	}

	/**
	 * @param pID
	 * @param pName
	 * @param pMark
	 * @param pProject
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int update(int pID, int pProjectID, String pName, int pMark) {
		// begin-user-code
		// TODO Auto-generated method stub
                int intResult = SysConstant.OK;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call UpdateSeverity(?,?,?,?)}" ;
                cs = dbmanager.makeCall(sStoredProc);
                try{
                  cs.setInt(1,pID);
                  cs.setInt(2,pProjectID);
                  cs.setString(3,pName);
                  cs.setInt(4,pMark);
                }catch(SQLException e){
                  intResult=SysConstant.ERROR;
                  return intResult;
                }
                if(!dbmanager.runUpdateStoredProc(cs)){
                   intResult=SysConstant.ERROR;
                 }

                return intResult;
		// end-user-code
	}

	/**
	 * @param pID
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int delete(int pID) {
		// begin-user-code
		// TODO Auto-generated method stub
                int intResult = SysConstant.OK;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call DeleteSeverityByID(?)}" ;
                cs = dbmanager.makeCall(sStoredProc);
                try{
                  cs.setInt(1,pID);
                }catch(SQLException e){
                  intResult=SysConstant.ERROR;
                  return intResult;
                }
                if(!dbmanager.runUpdateStoredProc(cs)){
                   intResult=SysConstant.ERROR;
                 }
                 return intResult;
		// end-user-code
	}

	/**
	 * @param projectID
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Table getListSeverity(int projectID) {
		// begin-user-code
		// TODO Auto-generated method stub
                Table result = null;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call GetListSeverity(?)}" ;
                cs = dbmanager.makeCall(sStoredProc);
                try{
                  cs.setInt(1,projectID);
                }catch(SQLException e){
                  return result;
                }

                if(dbmanager.runQueryStoredProc(cs)){
                  result = dbmanager.getDataTable();
                }
                return result;
		// end-user-code
	}

	/**
	 * @param projectID
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void copyTemplate(int projectID) {
		// begin-user-code
		// TODO Auto-generated method stub
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call CopySeverityTemplate(?)}" ;
                cs = dbmanager.makeCall(sStoredProc);
                try{
                  cs.setInt(1,projectID);
                }catch(SQLException e){
                }
                dbmanager.runUpdateStoredProc(cs);
		// end-user-code
	}

	/**
	 * @param pID
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Table getSeverity(int pID) {
		// begin-user-code
		// TODO Auto-generated method stub
                Table result = null;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call GetSeverity(?)}" ;
                cs = dbmanager.makeCall(sStoredProc);
                try{
                  cs.setInt(1,pID);
                }catch(SQLException e){
                  return result;
                }

                if(dbmanager.runQueryStoredProc(cs)){
                  result = dbmanager.getDataTable();
                }
                return result;
		// end-user-code
	}
}
