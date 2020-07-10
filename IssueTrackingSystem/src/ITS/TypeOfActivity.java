/**
 *
 */
package ITS;

import ITSDB.TypeOfActivityDB;
import java.util.*;
import tool.*;

/**

 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class TypeOfActivity {
	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private int typeOfActivityID;

	/**
	 * @return the typeOfActivityID
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int getTypeOfActivityID() {
		// begin-user-code
		return typeOfActivityID;
		// end-user-code
	}

	/**
	 * @param theTypeOfActivityID the typeOfActivityID to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setTypeOfActivityID(int theTypeOfActivityID) {
		// begin-user-code
		typeOfActivityID = theTypeOfActivityID;
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
	public int setTypeOfActivity(int pID, String pName) {
		// begin-user-code
		// TODO Auto-generated method stub
                setTypeOfActivityID(pID);
                setName(pName);
                return 0;

		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set getAllTypeOfActivity() {
		// begin-user-code
		// TODO Auto-generated method stub
                HashSet result = null;
                TypeOfActivityDB db = new TypeOfActivityDB();
                Table t = db.getAllTypeOfActivity();
                if (t!=null)
                {
                  result = new HashSet();
                  for(int i = 0; i<t.getRowsCount(); i++)
                  {
                    TypeOfActivity a = new TypeOfActivity();
                    this.loadRow(t, i, a);
                    result.add(a);
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
                TypeOfActivityDB db = new TypeOfActivityDB();
                Table t = db.getTypeOfActivity(this.typeOfActivityID);
                return this.loadRow(t,0,this);

		// end-user-code
	}

	/**
	 * @param t
	 * @param row
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int loadRow(Table t, int row, TypeOfActivity typeofactivity) {
		// begin-user-code
		// TODO Auto-generated method stub
                if (t!=null){
                  int count = t.getRowsCount();
                  if (row >= 0 && row < count) {
                    typeofactivity.typeOfActivityID = Integer.parseInt(t.getCell(row, 0));
                    typeofactivity.name = t.getCell(row, 1);
                    return SysConstant.OK;
                  }
                  return SysConstant.ERROR_RANGE;
                }
                return SysConstant.ERROR;

		// end-user-code
	}
}
