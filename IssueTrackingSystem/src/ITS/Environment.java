/**
 *
 */
package ITS;

import ITSDB.EnvironmentDB;
import java.util.*;
import tool.*;

/**

 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class Environment {
	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private int environmentID;

	/**
	 * @return the environmentID
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int getEnvironmentID() {
		// begin-user-code
		return environmentID;
		// end-user-code
	}

	/**
	 * @param theEnvironmentID the environmentID to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setEnvironmentID(int theEnvironmentID) {
		// begin-user-code
		environmentID = theEnvironmentID;
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
	public int setEnvironment(int pID, String pName) {
		// begin-user-code
		// TODO Auto-generated method stub
                setEnvironmentID(pID);
                setName(pName);
                return 0;

		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set getAllEnvironment() {
		// begin-user-code
		// TODO Auto-generated method stub
               HashSet result = null;
               EnvironmentDB db = new EnvironmentDB();
               Table t = db.getAllEnvironment();
               if (t!=null)
               {
                 result = new HashSet();
                 for(int i = 0; i<t.getRowsCount(); i++)
                 {
                   Environment e = new Environment();
                   this.loadRow(t, i, e);
                   result.add(e);
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
                EnvironmentDB db = new EnvironmentDB();
                Table t = db.getEnvironment(this.environmentID);
                return this.loadRow(t,0,this);

		// end-user-code
	}

	/**
	 * @param t
	 * @param row
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
        public int loadRow(Table t, int row, Environment environment) {
                // begin-user-code
                // TODO Auto-generated method stub
                if (t!=null){
                  int count = t.getRowsCount();
                  if (row >= 0 && row < count) {
                    environment.environmentID = Integer.parseInt(t.getCell(row, 0));
                    environment.name = t.getCell(row, 1);
                    return SysConstant.OK;
                  }
                  return SysConstant.ERROR_RANGE;
                }
                return SysConstant.ERROR;

		// end-user-code
	}
}
