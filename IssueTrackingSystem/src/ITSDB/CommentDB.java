/**
 *
 */
package ITSDB;

import tool.*;
import java.sql.*;

/**

 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class CommentDB {
        /**
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        private DBManager dbmanager;

        public CommentDB(){
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
         * @param pDescription
         * @param pProjectID
         * @param pUserID
         * @param pIssueID
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public int add(String pDescription, int pProjectID,
                        int pUserID, int pIssueID) {
                // begin-user-code
                // TODO Auto-generated method stub
                int intResult = SysConstant.OK;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call AddComment(?,?,?,?)}";
                cs = dbmanager.makeCall(sStoredProc);
                try {
                  cs.setInt(1, pIssueID);
                  cs.setInt(2, pProjectID);
                  cs.setInt(3, pUserID);
                  cs.setString(4, pDescription);
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
         * @param issueID
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public Table getListIssueComment(int pintIssueID) {
                // begin-user-code
                // TODO Auto-generated method stub
                Table result = null;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call GetCommentListByIssueID(?)}" ;
                cs = dbmanager.makeCall(sStoredProc);
                try{
                  cs.setInt(1,pintIssueID);
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
         * @param pID
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public Table getComment(int pID) {
                // begin-user-code
                // TODO Auto-generated method stub
                Table result = null;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call GetCommentByID(?)}" ;
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
