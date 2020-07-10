/**
 *
 */
package ITS;

import ITSDB.*;
import java.util.Set;
import java.util.HashSet;
import tool.*;

/**

 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class Domain {
	/**
	 * @uml.annotations for <code>subsystem</code>
	 *     collection_type="ITS.SubSystem"
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private Set<SubSystem> subsystem;

	/**
	 * @return the subsystem
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set<SubSystem> getSubsystem() {
		// begin-user-code
                if(subsystem==null)
                {
                  HashSet result = null;
                  SubSystemDB db = new SubSystemDB();
                  Table t = db.getSubSystem(this.domainID);
                  if (t!=null)
                  {
                    result = new HashSet();
                    for(int i = 0; i<t.getRowsCount(); i++)
                    {
                      SubSystem su = new SubSystem();
                      su.loadRow(su, t,i);
                      result.add(su);
                    }
                  }
                  subsystem  = result;
                }
                return subsystem;
		// end-user-code
	}

	/**
	 * @param theSubsystem the subsystem to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setSubsystem(Set<SubSystem> theSubsystem) {
		// begin-user-code
		subsystem = theSubsystem;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private int domainID;

	/**
	 * @return the domainID
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int getDomainID() {
		// begin-user-code
		return domainID;
		// end-user-code
	}

	/**
	 * @param theDomainID the domainID to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setDomainID(int theDomainID) {
		// begin-user-code
		domainID = theDomainID;
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
	private Project project;

	/**
	 * @return the project
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Project getProject() {
		// begin-user-code
		return project;
		// end-user-code
	}

	/**
	 * @param theProject the project to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setProject(Project theProject) {
		// begin-user-code
		project = theProject;
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int add() {
		// begin-user-code
		// TODO Auto-generated method stub
                DomainDB db = new DomainDB();
		return db.add(this.project.getProjectID(), this.name);
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int update() {
		// begin-user-code
		// TODO Auto-generated method stub
                DomainDB db = new DomainDB();
		return db.update(this.domainID, this.project.getProjectID(), this.name);
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int delete() {
		// begin-user-code
		// TODO Auto-generated method stub
                DomainDB db = new DomainDB();
		return db.delete(this.domainID);
		// end-user-code
	}

	/**
	 * @param pID
	 * @param pName
	 * @param pProject
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int setDomain(int pID, String pName, Project pProject) {
		// begin-user-code
		// TODO Auto-generated method stub
                this.setDomainID(pID);
                this.setName(pName);
                this.setProject(pProject);
                return 0;

		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set getListDomain() {
		// begin-user-code
		// TODO Auto-generated method stub
                HashSet result = null;
               DomainDB db = new DomainDB();
               Table t = db.getListDomain(this.project.getProjectID());
               if (t!=null)
               {
                 result = new HashSet();
                 for(int i = 0; i<t.getRowsCount(); i++)
                 {
                   Domain domain = new Domain();
                   this.loadRow(domain, t, i);
                   result.add(domain);
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
                DomainDB db = new DomainDB();
                db.copyTemplate(this.project.getProjectID());
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int load() {
		// begin-user-code
		// TODO Auto-generated method stub
               DomainDB db = new DomainDB();
               Table t = db.getDomain(this.domainID);
               return this.loadRow(this,t,0);

		// end-user-code
	}

	/**
	 * @param t
	 * @param row
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int loadRow(Domain pDomain, Table t, int row) {
		// begin-user-code
		// TODO Auto-generated method stub
                if (t!=null){
                int count = t.getRowsCount();
                if (row >= 0 && row < count) {
                  pDomain.domainID = Integer.parseInt(t.getCell(row, 0));
                  int projectID = Integer.parseInt(t.getCell(row, 1));
                  pDomain.project = new Project();
                  pDomain.project.setProjectID(projectID);
                  pDomain.project.load();
                  pDomain.name = t.getCell(row, 2);
                  return SysConstant.OK;
                }
                return SysConstant.ERROR_RANGE;
              }
              return SysConstant.ERROR;

		// end-user-code
	}
}
