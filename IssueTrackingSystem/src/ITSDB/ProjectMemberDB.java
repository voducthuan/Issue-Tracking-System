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
public class ProjectMemberDB {
	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private DBManager dbmanager;

        public ProjectMemberDB(){
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
	 * @param pUserID
	 * @param pProjectID
	 * @param pTrackingRightID
	 * @param pRole
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int add(int pUserID, int pProjectID, int pTrackingRightID, int pRoleID) {
		// begin-user-code
		// TODO Auto-generated method stub
                 int intResult = SysConstant.OK;
                 String sStoredProc;
                 CallableStatement cs;
                 sStoredProc = "{call AddProjectMember(?,?,?,?)}";
                 cs = dbmanager.makeCall(sStoredProc);
                 try {
                   cs.setInt(1, pUserID);
                   cs.setInt(2, pProjectID);
                   cs.setInt(3, pTrackingRightID);
                   cs.setInt(4, pRoleID);
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
	 * @param pUserID
	 * @param pProjectID
	 * @param pTrackingRightID
	 * @param pRole
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int update(int pUserID, int pProjectID, int pTrackingRightID, int pRoleID) {
		// begin-user-code
		// TODO Auto-generated method stub
                int intResult = SysConstant.OK;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call UpdateProjectMember(?,?,?,?)}" ;
                cs = dbmanager.makeCall(sStoredProc);
                try{
                  cs.setInt(1,pUserID);
                  cs.setInt(2,pProjectID);
                  cs.setInt(3,pTrackingRightID);
                  cs.setInt(4,pRoleID);
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
	 * @param pUserID
	 * @param pProjectID
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int delete(int pUserID, int pProjectID) {
		// begin-user-code
		// TODO Auto-generated method stub
                int intResult = SysConstant.OK;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call DeleteProjectMemberByPK(?,?)}" ;
                cs = dbmanager.makeCall(sStoredProc);
                try{
                  cs.setInt(1,pUserID);
                  cs.setInt(2,pProjectID);
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
	 * @param pProjectID
	 * @return a table having the same structure of UserTable
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Table getListProjectMeber(int pProjectID) {
		// begin-user-code
		// TODO Auto-generated method stub
                Table result = null;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call GetListProjectMember(?)}" ;
                cs = dbmanager.makeCall(sStoredProc);
                try{
                  cs.setInt(1,pProjectID);
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
	 * @param pUserID
	 * @param pProjectID
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Table getProjectMember(int pUserID, int pProjectID) {
		// begin-user-code
		// TODO Auto-generated method stub
                Table result = null;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call GetProjectMember(?,?)}" ;
                cs = dbmanager.makeCall(sStoredProc);
                try{
                  cs.setInt(1,pUserID);
                  cs.setInt(2,pProjectID);
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
