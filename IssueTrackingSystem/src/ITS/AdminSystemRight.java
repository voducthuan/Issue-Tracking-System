/**
 *
 */
package ITS;

import ITSDB.*;
import tool.*;
import java.util.*;
/**
 
 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class AdminSystemRight {
	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private int systemRightID;

	/**
	 * @return the systemRightID
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int getSystemRightID() {
		// begin-user-code
		return systemRightID;
		// end-user-code
	}

	/**
	 * @param theSystemRightID the systemRightID to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setSystemRightID(int theSystemRightID) {
		// begin-user-code
		systemRightID = theSystemRightID;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private String name;

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
	 * @param pname
	 * @param pID
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int setAdminSystemRight(String pname, int pID) {
		// begin-user-code
		// TODO Auto-generated method stub
                this.setSystemRightID(pID);
                this.setName(pname);
		return 0;
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int load() {
		// begin-user-code
		// TODO Auto-generated method stub
                AdminSystemRightDB db = new AdminSystemRightDB();
                Table t = db.getAdminSystemRight(this.systemRightID);
                return this.loadRow(t,0,this);

		// end-user-code
	}

	/**
	 * @param t
	 * @param row
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int loadRow(Table t, int row, AdminSystemRight pObjAddminSystemRight) {
		// begin-user-code
		// TODO Auto-generated method stub
                if (t!=null){
                  int count = t.getRowsCount();
                  if (row >= 0 && row < count) {
                    pObjAddminSystemRight.systemRightID = Integer.parseInt(t.getCell(row, 0));
                    pObjAddminSystemRight.name = t.getCell(row, 1);
                    return SysConstant.OK;
                  }
                  return SysConstant.ERROR_RANGE;
                }
                return SysConstant.ERROR;

		// end-user-code
	}
}
