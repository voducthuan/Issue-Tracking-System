/**
 *
 */
package ITS;

import ITSDB.ReproducibilityDB;
import java.util.*;
import tool.*;


/**

 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class Reproducibility {
	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private int reproducibilityID;

	/**
	 * @return the reproducibilityID
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int getReproducibilityID() {
		// begin-user-code
		return reproducibilityID;
		// end-user-code
	}

	/**
	 * @param theReproducibilityID the reproducibilityID to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setReproducibilityID(int theReproducibilityID) {
		// begin-user-code
		reproducibilityID = theReproducibilityID;
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
	 * @param pID
	 * @param pName
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int setReproducibility(int pID, String pName) {
		// begin-user-code
		// TODO Auto-generated method stub
                setReproducibilityID(pID);
                setName(pName);
                return 0;

		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set getAllReproducibility() {
		// begin-user-code
		// TODO Auto-generated method stub
                HashSet result = null;
                ReproducibilityDB db = new ReproducibilityDB();
                Table t = db.getAllReproducibility();
                if (t!=null)
                {
                  result = new HashSet();
                  for(int i = 0; i<t.getRowsCount(); i++)
                  {
                    Reproducibility r = new Reproducibility();
                    this.loadRow(t, i, r);
                    result.add(r);
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
               ReproducibilityDB db = new ReproducibilityDB();
               Table t = db.getReproducibility(this.reproducibilityID);
               return this.loadRow(t,0,this);

		// end-user-code
	}

	/**
	 * @param t
	 * @param row
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int loadRow(Table t, int row, Reproducibility reproducibility) {
		// begin-user-code
		// TODO Auto-generated method stub
                if (t!=null){
                  int count = t.getRowsCount();
                  if (row >= 0 && row < count) {
                    reproducibility.reproducibilityID = Integer.parseInt(t.getCell(row, 0));
                    reproducibility.name = t.getCell(row, 1);
                    return SysConstant.OK;
                  }
                  return SysConstant.ERROR_RANGE;
                }
                return SysConstant.ERROR;

		// end-user-code
	}
}
