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
import ITS.Department;
/**

 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class UserDB {
        /**
         * @uml.annotations for <code>adminsystemright</code>
         *     collection_type="ITS.AdminSystemRight"
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public UserDB(){
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
         * @param pdepartmentID
         * @param pName
         * @param pFullName
         * @param pPassword
         * @param pemail
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public int add(int pdepartmentID, String pName, String pFullName, String pPassword,
                        String pEmail) {
                // begin-user-code
                // TODO Auto-generated method stub
                int intResult = SysConstant.OK;
                int intOutput=0;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call AddUser(?,?,?,?,?,?)}";
                cs = dbmanager.makeCall(sStoredProc);
                try {
                  cs.setInt(1, pdepartmentID);
                  cs.setString(2, pName);
                  cs.setString(3, pFullName);
                  cs.setString(4, pPassword);
                  cs.setString(5, pEmail);
                  cs.registerOutParameter(6, java.sql.Types.INTEGER);
                    }
                catch (SQLException e) {
                  intResult = SysConstant.ERROR;
                  return intResult;
                }
                if (!dbmanager.runUpdateStoredProc(cs)) {
                  intResult = SysConstant.ERROR;
                }

                try{
                    intOutput = cs.getInt(6);
                  }catch(SQLException ex){}

                if(intOutput==1)
                  intResult = SysConstant.ERROR_DUPLICATE;
                return intResult;

                // end-user-code
        }
        /**
         * @param pID
         * @param pdepartmentID
         * @param pName
         * @param pFullName
         * @param pPassword
         * @param pemail
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public int update(int pID, int pdepartmentID, String pName, String pFullName,
                        String pPassword, String pemail) {
                // begin-user-code
                // TODO Auto-generated method stub
               int intResult = SysConstant.OK;
               String sStoredProc;
               CallableStatement cs;
               sStoredProc = "{call UpdateUser(?,?,?,?,?,?)}" ;
               cs = dbmanager.makeCall(sStoredProc);
               try{
                 cs.setInt(1,pID);
                 cs.setInt(2,pdepartmentID);
                 cs.setString(3,pName);
                 cs.setString(4,pFullName);
                 cs.setString(5,pPassword);
                 cs.setString(6,pemail);
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
                sStoredProc = "{call DeleteUserByID(?)}" ;
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
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public Table getAllUser() {
                // begin-user-code
                // TODO Auto-generated method stub
               Table result = null;
               String sStoredProc;
               CallableStatement cs;
               sStoredProc = "{call GetAllUser()}" ;
               cs = dbmanager.makeCall(sStoredProc);
               if(dbmanager.runQueryStoredProc(cs)){
                 result =  dbmanager.getDataTable();
               }
               return result;

                // end-user-code
        }

         /**
         * @param userID
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */

        public Table getUser(int userID) {
                // begin-user-code
                // TODO Auto-generated method stub
                 Table result = null;
                 String sStoredProc;
                 CallableStatement cs;
                 sStoredProc = "{call GetUser(?)}" ;
                 cs = dbmanager.makeCall(sStoredProc);
                 try{
                   cs.setInt(1,userID);
                 }catch(SQLException e){
                   return result;
                 }

                 if(dbmanager.runQueryStoredProc(cs)){
                   result = dbmanager.getDataTable();
                 }
                 return result;
                 // end-user-code

                // end-user-code
        }

        /**
        * @param userName
        * @return
        * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
        */

        public Table getUserbyLoginName(String userName) {
                // begin-user-code
                // TODO Auto-generated method stub
                 Table result = null;
                 String sStoredProc;
                 CallableStatement cs;
                 sStoredProc = "{call GetUserbyName(?)}" ;
                 cs = dbmanager.makeCall(sStoredProc);
                 try{
                   cs.setString(1,userName);
                 }catch(SQLException e){
                   return result;
                 }

                 if(dbmanager.runQueryStoredProc(cs)){
                   result = dbmanager.getDataTable();
                 }
                 return result;
                 // end-user-code

                // end-user-code
        }
        /**
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public Table getListUserNotCompanyAdmin() {
	          // begin-user-code
	          // TODO Auto-generated method stub
	          Table result = null;
	          String sStoredProc;
	          CallableStatement cs;
	          sStoredProc = "{call getListUserNotCompanyAdmin()}" ;
	          cs = dbmanager.makeCall(sStoredProc);
	          if(dbmanager.runQueryStoredProc(cs)){
	                  result = dbmanager.getDataTable();
	          }
	          return result;
	          // end-user-code

        }

        /**
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public Table getListUserNotApplicationAdmin() {
	          // begin-user-code
                  // TODO Auto-generated method stub
                  Table result = null;
                  String sStoredProc;
                  CallableStatement cs;
                  sStoredProc = "{call getListUserNotApplicationAdmin()}" ;
                  cs = dbmanager.makeCall(sStoredProc);
                  if(dbmanager.runQueryStoredProc(cs)){
	                  result = dbmanager.getDataTable();
                  }
                  return result;
                  // end-user-code

        }

        /**
         * @param pProjectID
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public Table getListUserNotProjectAdmin(int pProjectID) {
          	// begin-user-code
		// TODO Auto-generated method stub
		Table result = null;
		String sStoredProc;
		CallableStatement cs;
		sStoredProc = "{call getListUserNotProjectAdmin(?)}" ;
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
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public Table getListUserCompanyAdmin() {
          // begin-user-code
          // TODO Auto-generated method stub
                Table result = null;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call getListUserCompanyAdmin()}" ;
                cs = dbmanager.makeCall(sStoredProc);
                if(dbmanager.runQueryStoredProc(cs)){
                        result = dbmanager.getDataTable();
                }
                return result;
                // end-user-code

        }

        /**
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public Table getListUserApplicationAdmin() {
          // begin-user-code
          // TODO Auto-generated method stub
          	Table result = null;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call getListUserApplicationAdmin()}" ;
                cs = dbmanager.makeCall(sStoredProc);
                if(dbmanager.runQueryStoredProc(cs)){
	                result = dbmanager.getDataTable();
                }
          	return result;
                // end-user-code
        }

        /**
         * @param pProjectID
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public Table getListUserProjectAdmin(int pProjectID) {
          	// begin-user-code
                // TODO Auto-generated method stub
                Table result = null;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call getListUserProjectAdmin(?)}" ;
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
        * @param pProjectID
        * @return
        * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
        */
        public Table getListUserNotInProject(int pProjectID) {
        	// begin-user-code
                // TODO Auto-generated method stub
                Table result = null;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call getListUserNotInProject(?)}" ;
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
        * @return
        * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
        */
        public Table getListProjectManagedByUser(int intUserID) {
        	// begin-user-code
                // TODO Auto-generated method stub
                Table result = null;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call getListProjectManagedByUser(?)}";
                cs = dbmanager.makeCall(sStoredProc);
                try{
                	cs.setInt(1,intUserID);
                }catch(SQLException e){
        		return result;
                }
                if (dbmanager.runQueryStoredProc(cs)) {
        	        result = dbmanager.getDataTable();
                }
                return result;
                // end-user-code
        }

        /**
               * @return
               * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
               */
               public Table getListJoinedProject(int intUserID) {
                       // begin-user-code
                       // TODO Auto-generated method stub
                       Table result = null;
                       String sStoredProc;
                       CallableStatement cs;
                       sStoredProc = "{call getListJoinedProject(?)}";
                       cs = dbmanager.makeCall(sStoredProc);
                       try{
                               cs.setInt(1,intUserID);
                       }catch(SQLException e){
                               return result;
                       }
                       if (dbmanager.runQueryStoredProc(cs)) {
                               result = dbmanager.getDataTable();
                       }
                       return result;
                       // end-user-code
        }
        /**
  * @return
  * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
  */
  public Table getListProjectAdminedByUser(int intUserID) {
          // begin-user-code
          // TODO Auto-generated method stub
          Table result = null;
          String sStoredProc;
          CallableStatement cs;
          sStoredProc = "{call getListProjectAdminedByUser(?)}";
          cs = dbmanager.makeCall(sStoredProc);
          try{
                  cs.setInt(1,intUserID);
          }catch(SQLException e){
                  return result;
          }
          if (dbmanager.runQueryStoredProc(cs)) {
                  result = dbmanager.getDataTable();
          }
          return result;
          // end-user-code
  }

}
