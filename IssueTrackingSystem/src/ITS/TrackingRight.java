/**
 *
 */
package ITS;

import ITSDB.*;
import ITS.*;
import java.util.*;
import tool.*;
/**

 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class TrackingRight {
	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private int trackingRightID;
      	private String name;

	/**
	 * @return the trackingRightID
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int getTrackingRightID() {
		// begin-user-code
		return trackingRightID;
		// end-user-code
	}

	/**
	 * @param theTrackingRightID the trackingRightID to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setTrackingRightID(int theTrackingRightID) {
		// begin-user-code
		trackingRightID = theTrackingRightID;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */


	/**
	 * @return the name
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public String getName() {
		// begin-user-code
		return name;
		// end-user-code
	}

	/**
	 * @param theName the name to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setName(String theName) {
		// begin-user-code
		name = theName;
		// end-user-code
	}

	/**
	 * @param pID
	 * @param pName
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int setTrackingRight(int pID, String pName) {
		// begin-user-code
		// TODO Auto-generated method stub
                this.trackingRightID = pID;
                this.name = pName;
		return 0;
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set getAllTrackingRight() {
		// begin-user-code
		// TODO Auto-generated method stub
                HashSet result = null;
                TrackingRightDB db = new TrackingRightDB();
                Table t = db.getAllTrackingRight();
                if (t!=null)
                {
                  result = new HashSet();
                  for(int i = 0; i<t.getRowsCount(); i++)
                  {
                    TrackingRight p = new TrackingRight();
                    this.loadRow(t, i, p);
                    result.add(p);
                  }
                }
                return result;

		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int load() {
		// begin-user-code
		// TODO Auto-generated method stub
                TrackingRightDB db = new TrackingRightDB();
                Table t = db.getTrackingRight(this.trackingRightID);
                return this.loadRow(t,0,this);

		// end-user-code
	}

	/**
	 * @param t
	 * @param row
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int loadRow(Table t, int row, TrackingRight pObjTrackingRight) {
		// begin-user-code
		// TODO Auto-generated method stub

               if (t!=null){
                 int count = t.getRowsCount();
                 if (row >= 0 && row < count) {
                   pObjTrackingRight.trackingRightID = Integer.parseInt(t.getCell(row, 0));
                   pObjTrackingRight.name = t.getCell(row, 1);
                   return SysConstant.OK;
                 }
                 return SysConstant.ERROR_RANGE;
               }
               return SysConstant.ERROR;

		// end-user-code
	}
}
