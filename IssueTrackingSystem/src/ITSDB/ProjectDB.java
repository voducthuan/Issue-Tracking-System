/**
 *
 */
package ITSDB;


import tool.*;
import java.sql.*;


/**

 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class ProjectDB {
	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private DBManager dbmanager;

	/**
	 * @return the dbmanager
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
        public ProjectDB(){
          dbmanager = new DBManager();
        }
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
	 * @param pname
	 * @param pDescription
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int add(String pname, String pDescription) {
		// begin-user-code
		// TODO Auto-generated method stub
                int intOutput=0;
                int intResult = SysConstant.OK;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call AddProject(?,?,?)}";
                cs = dbmanager.makeCall(sStoredProc);
                try {
                  cs.setString(1, pname);
                  cs.setString(2, pDescription);
                  cs.registerOutParameter(3, java.sql.Types.INTEGER);
                }
                catch (SQLException e) {
                  intResult = SysConstant.ERROR;
                  return intResult;
                }
                if (!dbmanager.runUpdateStoredProc(cs)) {
                  intResult = SysConstant.ERROR;
                }
                try{
                    intOutput = cs.getInt(3);
                  }catch(SQLException ex){}
                if(intOutput==1)
                  intResult = SysConstant.ERROR_DUPLICATE;
                return intResult;

		// end-user-code
	}

	/**
	 * @param pID
	 * @param pname
	 * @param pDescription
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int update(int pProjectID, String pname, String pDescription) {
		// begin-user-code
		// TODO Auto-generated method stub
                int intResult = SysConstant.OK;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call UpdateProject(?,?,?)}" ;
                cs = dbmanager.makeCall(sStoredProc);
                try{
                  cs.setInt(1,pProjectID);
                  cs.setString(2,pname);
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
	public int delete(int pProjectID) {
		// begin-user-code
		// TODO Auto-generated method stub
                int intResult = SysConstant.OK;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call DeleteProjectByID(?)}" ;
                cs = dbmanager.makeCall(sStoredProc);
                try{
                  cs.setInt(1,pProjectID);
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
	public Table getAllProject() {
		// begin-user-code
		// TODO Auto-generated method stub
                Table result = null;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call GetAllProject()}";
                cs = dbmanager.makeCall(sStoredProc);
                if (dbmanager.runQueryStoredProc(cs)) {
                  result = dbmanager.getDataTable();
                }
                return result;

		// end-user-code
	}

	/**
	 * copy all thing associate with project such as phase, iteration, domain, serverity, ...
	 * @param projectID
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void copyTemplate(int pProjectID) {
		// begin-user-code
		// TODO Auto-generated method stub
                int intResult = SysConstant.OK;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call ProjectCopyTemplate(?)}" ;
                cs = dbmanager.makeCall(sStoredProc);
                try{
                  cs.setInt(1,pProjectID);
                }catch(SQLException e){
                  intResult=SysConstant.ERROR;
                }
                if(!dbmanager.runUpdateStoredProc(cs)){
                   intResult=SysConstant.ERROR;
                 }
		// end-user-code
	}

	/**
	 * @param projectID
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Table getProject(int pProjectID) {
		// begin-user-code
		// TODO Auto-generated method stub
                Table result = null;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call GetProjectByID(?)}" ;
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
        public Table getProjectByName(String pProjectName) {
                // begin-user-code
                // TODO Auto-generated method stub
                Table result = null;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call GetProjectByName(?)}" ;
                cs = dbmanager.makeCall(sStoredProc);
                try{
                  cs.setString(1,pProjectName);
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
