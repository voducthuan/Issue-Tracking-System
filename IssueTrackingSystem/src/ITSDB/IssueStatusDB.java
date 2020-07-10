/**
 *
 */
package ITSDB;

import tool.DBManager;
import tool.Table;
import java.sql.CallableStatement;
import java.sql.SQLException;
import tool.SysConstant;

/**

 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class IssueStatusDB {
	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private DBManager dbmanager;

        public IssueStatusDB(){
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
	 * @param pID
	 * @param pName
	 * @param pProjectID
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int add(int pProjectID, String pName) {
		// begin-user-code
		// TODO Auto-generated method stub
                int intResult = SysConstant.OK;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call AddIssueStatusDB(?,?)}";
                cs = dbmanager.makeCall(sStoredProc);
                try {
                  cs.setInt(1, pProjectID);
                  cs.setString(2, pName);
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
	 * @param pProjectID
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int update(int pIssueStatusID, int pProjectID, String pName) {
		// begin-user-code
		// TODO Auto-generated method stub
                int intResult = SysConstant.OK;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call UpdateIssueStatus(?,?,?)}" ;
                cs = dbmanager.makeCall(sStoredProc);
                try{
                  cs.setInt(1,pIssueStatusID);
                  cs.setInt(2,pProjectID);
                  cs.setString(3,pName);
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
	public int delete(int pStatusID) {
		// begin-user-code
		// TODO Auto-generated method stub
                int intResult = SysConstant.OK;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call DeleteStatusIssueByID(?)}" ;
                cs = dbmanager.makeCall(sStoredProc);
                try{
                  cs.setInt(1,pStatusID);
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
	public Table getListIssueStatus(int projectID) {
		// begin-user-code
		// TODO Auto-generated method stub
                Table result = null;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call GetListIssueStatue(?)}" ;
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
                sStoredProc = "{call CopyIssueStatueTemplate(?)}" ;
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
	public Table getIssueStatus(int pID) {
		// begin-user-code
		// TODO Auto-generated method stub
                Table result = null;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call GetIssueStatus(?)}" ;
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
