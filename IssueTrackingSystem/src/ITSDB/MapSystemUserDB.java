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
public class MapSystemUserDB {

	 public MapSystemUserDB(){
         dbmanager = new DBManager();
        }
	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
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
	 * @param pAdminSystemRightID
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int addAdminSystemRight(int pAdminSystemRightID, int pUserID, int pProjectID) {
		// begin-user-code
		// TODO Auto-generated method stub
                int intResult = SysConstant.OK;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call AddAdminSystemRightToUser(?,?,?)}";
                cs = dbmanager.makeCall(sStoredProc);
                try {
                  cs.setInt(1, pAdminSystemRightID);
                  cs.setInt(2, pUserID);
                  //minh edit
                  //if (pAdminSystemRightID == 3){ // project admin
                    cs.setInt(3, pProjectID);
                  //}
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
	 * @param pAdminSystemRightID
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int removeCompanyAdminRight(int pUserID, int pAdminSystemRightID) {
		// begin-user-code
		// TODO Auto-generated method stub
                int intResult = SysConstant.OK;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call RemoveCompanyAdminRight(?,?)}" ;
                cs = dbmanager.makeCall(sStoredProc);
                try{
                  cs.setInt(1,pUserID);
                  cs.setInt(2,pAdminSystemRightID);
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
         * @param pAdminSystemRightID
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public int removeApplicationAdminRight(int pUserID, int pAdminSystemRightID) {
                // begin-user-code
                // TODO Auto-generated method stub
                int intResult = SysConstant.OK;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call RemoveApplicationAdminRight(?,?)}" ;
                cs = dbmanager.makeCall(sStoredProc);
                try{
                  cs.setInt(1,pUserID);
                  cs.setInt(2,pAdminSystemRightID);
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
         * @param pAdminSystemRightID
         * @param pProjectID
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public int removePorjectAdminRight(int pUserID, int pAdminSystemRightID, int pProjectID) {
                // begin-user-code
                // TODO Auto-generated method stub
                int intResult = SysConstant.OK;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call RemovePorjectAdminRight(?,?,?)}" ;
                cs = dbmanager.makeCall(sStoredProc);
                try{
                  cs.setInt(1,pUserID);
                  cs.setInt(2,pAdminSystemRightID);
                  cs.setInt(3,pProjectID);
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
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Table getAdminSystemRight(int pUserID) {
		// begin-user-code
		// TODO Auto-generated method stub
                 Table result = null;
                 String sStoredProc;
                 CallableStatement cs;
                 sStoredProc = "{call GetAdminSystemRightUser(?)}" ;
                 cs = dbmanager.makeCall(sStoredProc);
                 try{
                   cs.setInt(1,pUserID);
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
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public Table getListProjectOfSystemAdmin(int pUserID) {
                // begin-user-code
                // TODO Auto-generated method stub
                 Table result = null;
                 String sStoredProc;
                 CallableStatement cs;
                 sStoredProc = "{call GetProjectOfSystemAdmin(?)}" ;
                 cs = dbmanager.makeCall(sStoredProc);
                 try{
                   cs.setInt(1,pUserID);
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
