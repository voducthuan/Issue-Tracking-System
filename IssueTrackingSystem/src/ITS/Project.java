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
public class Project {
	/**
	 * @uml.annotations for <code>domain</code>
	 *     collection_type="ITS.Domain"
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private Set<Domain> domain;
        private Set<Phase> phase;
        private Set<IssueStatus> issuestatus;
        private Set<Severity> severity;
        private Set<IssueType> issuetype;
        private Set<Role> role;
        private int projectID;
        private String name;
        private String description;

	/**
	 * @return the domain
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set<Domain> getDomain() {
		// begin-user-code
                if((domain==null)||(domain.isEmpty())){
                    Domain p = new Domain();
                    p.setProject(this);
                    this.domain = p.getListDomain();
                  }
                  return this.domain;

		// end-user-code
	}

	/**
	 * @param theDomain the domain to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setDomain(Set<Domain> theDomain) {
		// begin-user-code
		domain = theDomain;
		// end-user-code
	}

	/**
	 * @uml.annotations for <code>phase</code>
	 *     collection_type="ITS.Phase"
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */


	/**
	 * @return the phase
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set<Phase> getPhase() {
		// begin-user-code
                if((phase==null)||(phase.isEmpty())){
                    Phase p = new Phase();
                    p.setProject(this);
                    this.phase = p.getListPhase();
                  }
                  return this.phase;

		// end-user-code
	}

	/**
	 * @param thePhase the phase to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setPhase(Set<Phase> thePhase) {
		// begin-user-code
		phase = thePhase;
		// end-user-code
	}

	/**
	 * @uml.annotations for <code>issuestatus</code>
	 *     collection_type="ITS.IssueStatus"
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */


	/**
	 * @return the issuestatus
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set<IssueStatus> getIssuestatus() {
		// begin-user-code
                if((issuestatus==null)||(issuestatus.isEmpty())){
                    IssueStatus p = new IssueStatus();
                    p.setProject(this);
                    this.issuestatus = p.getListIssueStatus();
                  }
                  return this.issuestatus;

		// end-user-code
	}

	/**
	 * @param theIssuestatus the issuestatus to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setIssuestatus(Set<IssueStatus> theIssuestatus) {
		// begin-user-code
		issuestatus = theIssuestatus;
		// end-user-code
	}

	/**
	 * @uml.annotations for <code>severity</code>
	 *     collection_type="ITS.Severity"
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */


	/**
	 * @return the severity
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set<Severity> getSeverity() {
		// begin-user-code
                if((severity==null)||(severity.isEmpty())){
                    Severity p = new Severity();
                    p.setProject(this);
                    this.severity = p.getListSeverity();
                  }
                  return this.severity;

		// end-user-code
	}

	/**
	 * @param theSeverity the severity to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setSeverity(Set<Severity> theSeverity) {
		// begin-user-code
		severity = theSeverity;
		// end-user-code
	}

	/**
	 * @uml.annotations for <code>issuetype</code>
	 *     collection_type="ITS.IssueType"
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */


	/**
	 * @return the issuetype
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set<IssueType> getIssuetype() {
		// begin-user-code
                if((issuetype==null)||(issuetype.isEmpty())){
                    IssueType p = new IssueType();
                    p.setProject(this);
                    this.issuetype = p.getListIssueType();
                  }
                  return this.issuetype;

		// end-user-code
	}

	/**
	 * @param theIssuetype the issuetype to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setIssuetype(Set<IssueType> theIssuetype) {
		// begin-user-code
		issuetype = theIssuetype;
		// end-user-code
	}

	/**
	 * @uml.annotations for <code>role</code>
	 *     collection_type="ITS.Role"
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */


	/**
	 * @return the role
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set<Role> getRole() {
		// begin-user-code
                if((role==null)||(role.isEmpty())){
                    Role p = new Role();
                    p.setProject(this);
                    this.role = p.getListProjectRole();
                  }
                  return this.role;

		// end-user-code
	}

	/**
	 * @param theRole the role to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setRole(Set<Role> theRole) {
		// begin-user-code
		role = theRole;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */


	/**
	 * @return the projectID
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int getProjectID() {
		// begin-user-code
		return projectID;
		// end-user-code
	}

	/**
	 * @param theProjectID the projectID to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setProjectID(int theProjectID) {
		// begin-user-code
		projectID = theProjectID;
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
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */


	/**
	 * @return the description
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public String getDescription() {
		// begin-user-code
		return description;
		// end-user-code
	}

	/**
	 * @param theDescription the description to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setDescription(String theDescription) {
		// begin-user-code
		description = theDescription;
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int add() {
		// begin-user-code
		// TODO Auto-generated method stub
                ProjectDB db = new ProjectDB();
                int intResult;
                intResult = db.add(this.name,this.description);
                return intResult;

		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int update() {
		// begin-user-code
		// TODO Auto-generated method stub
                ProjectDB db = new ProjectDB();
                int intResult;
                intResult = db.update(this.projectID,this.name,this.description);
                return intResult;
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int delete() {
		// begin-user-code
		// TODO Auto-generated method stub
                ProjectDB db = new ProjectDB();
                int intResult;
                intResult = db.delete(this.projectID);
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
	public int setProject(int pID, String pname, String pDescription) {
		// begin-user-code
		// TODO Auto-generated method stub
                this.projectID = pID;
                this.name = pname;
                this.description = pDescription;
                return 0;
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set getAllProject() {
		// begin-user-code
		// TODO Auto-generated method stub
                HashSet result = null;
                ProjectDB db = new ProjectDB();
                Table t = db.getAllProject();
                if (t!=null)
                {
                  result = new HashSet();
                  for(int i = 0; i<t.getRowsCount(); i++)
                  {
                    Project p = new Project();
                    this.loadRow(p,t, i);
                    int intProID;
                    intProID = p.getProjectID();
                    if(intProID !=0)
                      result.add(p);


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
                ProjectDB db = new ProjectDB();
                db.copyTemplate(this.projectID);
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int load() {
		// begin-user-code
		// TODO Auto-generated method stub
                ProjectDB db = new ProjectDB();
                Table t = db.getProject(this.projectID);
                return this.loadRow(this,t,0);

		// end-user-code
	}



    public int loadByName() {
                        // begin-user-code
                        // TODO Auto-generated method stub
                        ProjectDB db = new ProjectDB();
                        Table t = db.getProjectByName(this.getName());
                        return this.loadRow(this,t,0);
                        // end-user-code
	}
	/**
	 * @param pProject
	 * @param t
	 * @param row
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int loadRow(Project pObjProject, Table t, int row) {
		// begin-user-code
		// TODO Auto-generated method stub
                if (t!=null){
                  int count = t.getRowsCount();
                  if (row >= 0 && row < count) {
                    pObjProject.projectID = Integer.parseInt(t.getCell(row, 0));
                    pObjProject.name = t.getCell(row, 1);
                    pObjProject.description = t.getCell(row, 2);
                    return SysConstant.OK;
                  }
                  return SysConstant.ERROR_RANGE;
                }
                return SysConstant.ERROR;

		// end-user-code
	}
}
