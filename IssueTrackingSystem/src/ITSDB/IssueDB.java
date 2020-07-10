/**
 *
 */
package ITSDB;


import tool.*;
import java.sql.*;

/**
 *
 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class IssueDB {
	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */



	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private DBManager dbmanager;

        public IssueDB(){
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
	 * @param pSubmiterID
	 * @param pCreatedDate
	 * @param pTitle
	 * @param pStatusID
	 * @param pDescription
	 * @param pKindOfActivityID
	 * @param pTypeOfActivityID
	 * @param pPhaseID
	 * @param pIterationID
	 * @param pArtifactID
	 * @param pDomainID
	 * @param pSubSystemID
	 * @param pBuildNumber
	 * @param pReproducibilityID
	 * @param pTypeID
	 * @param pSeverityID
	 * @param pPriority
	 * @param pEnvironmentID
	 * @param pPlatformID
	 * @param pAssignedUserID
	 * @param pAssignedDate
	 * @param pFixedDate
	 * @param pReproduction
	 * @param pCorrectiveAction
	 * @param pAttachment1
	 * @param pAttachment2
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */

	/**
	 * @param projectID
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Table reportIssueOfPhase(int projectID) {
		// begin-user-code
		// TODO Auto-generated method stub
		return null;
		// end-user-code
	}

	/**
	 * @param projectID
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Table reportIssueStatus(int projectID) {
		// begin-user-code
		// TODO Auto-generated method stub
		return null;
		// end-user-code
	}

	/**
	 * @param artifactID
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Table reportIssueOfArtifact(int artifactID) {
		// begin-user-code
		// TODO Auto-generated method stub
		return null;
		// end-user-code
	}

	/**
	 * @param projectID
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Table reportIssueOfPerProjectMember(int projectID) {
		// begin-user-code
		// TODO Auto-generated method stub
		return null;
		// end-user-code
	}

	/**
	 * @param issueID
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int exportIssueToXML(int issueID) {
		// begin-user-code
		// TODO Auto-generated method stub
		return 0;
		// end-user-code
	}
        public int add(int pStatusID, int pReproducibilityID, int pSeverityID,
                          int pArtifactID, int pPlatformID, int pTypeOfActivityID,
                          int pKindOfActivityID, int pTypeID, int pEnvironmentID, int pSubSystemID,
                          int pProjectID, int pAssignedUserID, int pSubmiterID, String pCreatedDate,
                          String pTitle, String pDescription, String pBuildNumber,
                          int pPriority, String pAssignedDate, String pFixedDate,
                          String pReproduction, String pCorrectiveAction,
                          String pAttachment1, String pAttachment2) {
                        // begin-user-code
                        // TODO Auto-generated method stub
                        int intResult = SysConstant.OK;
               String sStoredProc;
               CallableStatement cs;
               sStoredProc = "{call AddIssue(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}" ;
               cs = dbmanager.makeCall(sStoredProc);
               try{
                 cs.setInt(1,pStatusID);
                 cs.setInt(2,pReproducibilityID);
                 cs.setInt(3,pSeverityID);
                 cs.setInt(4,pArtifactID);
                 cs.setInt(5,pPlatformID);
                 cs.setInt(6,pTypeOfActivityID);
                 cs.setInt(7,pKindOfActivityID);
                 cs.setInt(8,pTypeID);
                 cs.setInt(9,pEnvironmentID);
                 cs.setInt(10,pSubSystemID);
                 cs.setInt(11,pProjectID);
                 cs.setInt(12,pAssignedUserID);
                 cs.setInt(13,pSubmiterID);
                 cs.setString(14,pCreatedDate);
                 cs.setString(15,pTitle);
                 cs.setString(16,pDescription);
                 cs.setString(17,pBuildNumber);
                 cs.setInt(18,pPriority);
                 cs.setString(19,pAssignedDate);
                 cs.setString(20,pFixedDate);
                 cs.setString(21,pReproduction);
                 cs.setString(22,pCorrectiveAction);
                 cs.setString(23,pAttachment1);
                 cs.setString(24,pAttachment2);


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
        * @param pSubmiterID
        * @param pCreatedDate
        * @param pTitle
        * @param pStatusID
        * @param pDescription
        * @param pKindOfActivityID
        * @param pTypeOfActivityID
        * @param pPhaseID
        * @param pIterationID
        * @param pArtifactID
        * @param pDomainID
        * @param pSubSystemID
        * @param pBuildNumber
        * @param pReproducibilityID
        * @param pTypeID
        * @param pSeverityID
        * @param pPriority
        * @param pEnvironmentID
        * @param pPlatformID
        * @param pAssignedUserID
        * @param pAssignedDate
        * @param pFixedDate
        * @param pReproduction
        * @param pCorrectiveAction
        * @param pAttachment1
        * @param pAttachment2
        * @return
        * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
        */
        public int update(int pIssueID, int pStatusID, int pReproducibilityID, int pSeverityID,
                          int pArtifactID, int pPlatformID, int pTypeOfActivityID,
                          int pKindOfActivityID, int pTypeID, int pEnvironmentID, int pSubSystemID,
                          int pProjectID, int pAssignedUserID, int pSubmiterID, String pCreatedDate,
                          String pTitle, String pDescription, String pBuildNumber,
                          int pPriority, String pAssignedDate, String pFixedDate,
                          String pReproduction, String pCorrectiveAction,
                          String pAttachment1, String pAttachment2) {
        // begin-user-code
        // TODO Auto-generated method stub
                int intResult = SysConstant.OK;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call UpdateIssue(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}" ;
                cs = dbmanager.makeCall(sStoredProc);
                try{
                  cs.setInt(1,pIssueID);
                  cs.setInt(2,pStatusID);
                  cs.setInt(3,pReproducibilityID);
                  cs.setInt(4,pSeverityID);
                  cs.setInt(5,pArtifactID);
                  cs.setInt(6,pPlatformID);
                  cs.setInt(7,pTypeOfActivityID);
                  cs.setInt(8,pKindOfActivityID);
                  cs.setInt(9,pTypeID);
                  cs.setInt(10,pEnvironmentID);
                  cs.setInt(11,pSubSystemID);
                  cs.setInt(12,pProjectID);
                  cs.setInt(13,pAssignedUserID);
                  cs.setInt(14,pSubmiterID);
                  cs.setString(15,pCreatedDate);
                  cs.setString(16,pTitle);
                  cs.setString(17,pDescription);
                  cs.setString(18,pBuildNumber);
                  cs.setInt(19,pPriority);
                  cs.setString(20,pAssignedDate);
                  cs.setString(21,pFixedDate);
                  cs.setString(22,pReproduction);
                  cs.setString(23,pCorrectiveAction);
                  cs.setString(24,pAttachment1);
                  cs.setString(25,pAttachment2);


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
        public int delete(int pIssueID) {
        // begin-user-code
        // TODO Auto-generated method stub
                int intResult = SysConstant.OK;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call DeleteIssueByID(?)}" ;
                cs = dbmanager.makeCall(sStoredProc);
                try{
                  cs.setInt(1,pIssueID);
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
        * @param intProjectID
        * @return
        * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
        */
        public Table getListProjectIssue(int intProjectID) {
        // begin-user-code
        // TODO Auto-generated method stub
                Table result = null;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call GetIssueListByProjectID(?)}";
                cs = dbmanager.makeCall(sStoredProc);
                try {
                       cs.setInt(1, intProjectID);
                }
                catch (SQLException e) {
                  return result;
                }
                if (dbmanager.runQueryStoredProc(cs)) {
                  result = dbmanager.getDataTable();
                }
                return result;

                        // end-user-code
	}
	/**
	 * @param  pIssueID
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Table getIssue(int pIssueID) {
		// begin-user-code
		// TODO Auto-generated method stub
                Table result = null;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call GetIssueByID(?)}" ;
                cs = dbmanager.makeCall(sStoredProc);
                try{
                  cs.setInt(1,pIssueID);
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
