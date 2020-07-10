/**
 *
 */
package ITS;

import ITSDB.*;
import java.util.Set;
import java.util.HashSet;
import tool.Table;
import tool.SysConstant;

/**

 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class SubSystem {
	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private int subSystemID;

	/**
	 * @return the subSystemID
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int getSubSystemID() {
		// begin-user-code
		return subSystemID;
		// end-user-code
	}

	/**
	 * @param theSubSystemID the subSystemID to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setSubSystemID(int theSubSystemID) {
		// begin-user-code
		subSystemID = theSubSystemID;
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
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private Domain domain;

	/**
	 * @return the domain
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Domain getDomain() {
		// begin-user-code
		return domain;
		// end-user-code
	}

	/**
	 * @param theDomain the domain to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setDomain(Domain theDomain) {
		// begin-user-code
		domain = theDomain;
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int add() {
		// begin-user-code
		// TODO Auto-generated method stub
                SubSystemDB db = new SubSystemDB();
		return db.add(this.domain.getDomainID(), this.name);
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int update() {
		// begin-user-code
		// TODO Auto-generated method stub
                SubSystemDB db = new SubSystemDB();
		return db.update(this.subSystemID, this.domain.getDomainID(), this.name);
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int delete() {
		// begin-user-code
		// TODO Auto-generated method stub
                SubSystemDB db = new SubSystemDB();
		return db.delete(this.subSystemID);
		// end-user-code
	}

	/**
	 * @param pID
	 * @param pName
	 * @param pDomain
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int setSubSystem(int pSubSystemID, String pName, Domain pDomain) {
		// begin-user-code
		// TODO Auto-generated method stub
                this.setSubSystemID(pSubSystemID);
                this.setName(pName);
                this.setDomain(pDomain);
                return 0;

		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set getListSubSystem() {
		// begin-user-code
		// TODO Auto-generated method stub
               HashSet result = null;
               SubSystemDB db = new SubSystemDB();
               Table t = db.getListSubSystem(this.domain.getDomainID());
               if (t!=null)
               {
                 result = new HashSet();
                 for(int i = 0; i<t.getRowsCount(); i++)
                 {
                   SubSystem subsystem = new SubSystem();
                   this.loadRow(subsystem, t, i);
                   result.add(subsystem);
                 }
               }
               return result;

		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void copyTemplate() {
		// begin-user-code
		// TODO Auto-generated method stub
                SubSystemDB db = new SubSystemDB();
                db.copyTemplate(this.domain.getDomainID());
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int load() {
		// begin-user-code
		// TODO Auto-generated method stub
               SubSystemDB db = new SubSystemDB();
               Table t = db.getSubSystem(this.subSystemID);
               return this.loadRow(this,t,0);

		// end-user-code
	}

	/**
	 * @param t
	 * @param row
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int loadRow(SubSystem pSubsystem, Table t, int row) {
		// begin-user-code
		// TODO Auto-generated method stub
                if (t!=null){
                int count = t.getRowsCount();
                if (row >= 0 && row < count) {
                  pSubsystem.subSystemID = Integer.parseInt(t.getCell(row, 0));
                  int domainID = Integer.parseInt(t.getCell(row, 1));
                  pSubsystem.domain = new Domain();
                  pSubsystem.domain.setDomainID(domainID);
                  pSubsystem.domain.load();
                  pSubsystem.name = t.getCell(row, 2);
                  return SysConstant.OK;
                }
                return SysConstant.ERROR_RANGE;
              }
              return SysConstant.ERROR;

		// end-user-code
	}
}
