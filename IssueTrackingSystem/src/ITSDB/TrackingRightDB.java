/**
 *
 */
package ITSDB;

import tool.*;
import java.sql.*;

/**

 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class TrackingRightDB {
	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private DBManager dbmanager;

        public TrackingRightDB(){
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
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Table getAllTrackingRight() {
		// begin-user-code
		// TODO Auto-generated method stub
                Table result = null;
               String sStoredProc;
               CallableStatement cs;
               sStoredProc = "{call GetAllTrackingRight()}" ;
               cs = dbmanager.makeCall(sStoredProc);
               if(dbmanager.runQueryStoredProc(cs)){
                 result = dbmanager.getDataTable();
               }
               return result;

		// end-user-code
	}

	/**
	 * @param trackingRightID
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Table getTrackingRight(int pintTrackingRightID) {
		// begin-user-code
		// TODO Auto-generated method stub
                Table result = null;
                String sStoredProc;
                CallableStatement cs;
                sStoredProc = "{call GetTrackingRightByID(?)}" ;
                cs = dbmanager.makeCall(sStoredProc);
                try{
                  cs.setInt(1,pintTrackingRightID);
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
