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
public class ArtifactDB {
	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private DBManager dbmanager;

        public ArtifactDB(){
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
	 * @param pIterationID
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int add(int pIteractionID, String pName) {
		// begin-user-code
		// TODO Auto-generated method stub
                int intResult = SysConstant.OK;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call AddArtifact(?,?)}";
                cs = dbmanager.makeCall(sStoredProc);
                try {
                  cs.setInt(1, pIteractionID);
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
	 * @param pDescription
	 * @param pIterationID
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int update(int pArtifactID, int pIterationID, String pDescription ) {
		// begin-user-code
		// TODO Auto-generated method stub
                int intResult = SysConstant.OK;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call UpdateArtifact(?,?,?)}" ;
                cs = dbmanager.makeCall(sStoredProc);
                try{
                  cs.setInt(1,pArtifactID);
                  cs.setInt(2,pIterationID);
                  cs.setString(3,pDescription);
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
	public int delete(int pArtifactID) {
		// begin-user-code
		// TODO Auto-generated method stub
                int intResult = SysConstant.OK;
               String sStoredProc;
               CallableStatement cs;
               sStoredProc = "{call DeleteArtifactByID(?)}" ;
               cs = dbmanager.makeCall(sStoredProc);
               try{
                 cs.setInt(1,pArtifactID);
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
	 * @param pIterationID
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Table getListArtifact(int pIterationID) {
		// begin-user-code
		// TODO Auto-generated method stub
                Table result = null;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call GetListArtifact(?)}" ;
                cs = dbmanager.makeCall(sStoredProc);
                try{
                  cs.setInt(1,pIterationID);
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
	 * @param pIterationID
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void copyTemplate(int pIterationID) {
		// begin-user-code
		// TODO Auto-generated method stub
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call CopyArtifactTemplate(?)}" ;
                cs = dbmanager.makeCall(sStoredProc);
                try{
                cs.setInt(1,pIterationID);
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
	public Table getArtifact(int pArtifactID) {
		// begin-user-code
		// TODO Auto-generated method stub
                Table result = null;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call GetArtifact(?)}" ;
                cs = dbmanager.makeCall(sStoredProc);
                try{
                  cs.setInt(1,pArtifactID);
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
