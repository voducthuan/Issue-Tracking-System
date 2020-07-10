/**
 *
 */
package ITSDB;

import java.util.*;
import ITS.AdminSystemRight;
import ITS.Team;
import tool.*;
import java.sql.CallableStatement;
import java.sql.SQLException;


/**
 * @author Administrator
 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class ParticipationDB {
	/**
	 * @return the adminsystemright
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
        public ParticipationDB(){
         dbmanager = new DBManager();
        }
	private DBManager dbmanager;
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
	 * @param pTeamID
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int assignTeam(int pTeamID, int pUserID) {
		// begin-user-code
		// TODO Auto-generated method stub
                int intResult = SysConstant.OK;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call AssignTeamtoUser(?,?)}";
                cs = dbmanager.makeCall(sStoredProc);
                try {
                  cs.setInt(1, pTeamID);
                  cs.setInt(2, pUserID);
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
	 * @param pTeam
	 * @param pUserID
	 * @param pTeamID
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int unassignTeam(int pTeamID, int pUserID) {
		// begin-user-code
		// TODO Auto-generated method stub
                int intResult = SysConstant.OK;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call UnassignTeamtoUser(?,?)}" ;
                cs = dbmanager.makeCall(sStoredProc);
                try{
                  cs.setInt(1,pTeamID);
                  cs.setInt(2,pUserID);
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
	 * @param UserID
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Table getUserTeam(int UserID) {
		// begin-user-code
		// TODO Auto-generated method stub
                Table result = null;
                 String sStoredProc;
                 CallableStatement cs;
                 sStoredProc = "{call GetUserTeam(?)}" ;
                 cs = dbmanager.makeCall(sStoredProc);
                 try{
                   cs.setInt(1,UserID);
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
