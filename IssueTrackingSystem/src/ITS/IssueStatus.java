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
public class IssueStatus {
	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private int statusID;

	/**
	 * @return the statusID
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int getStatusID() {
		// begin-user-code
		return statusID;
		// end-user-code
	}

	/**
	 * @param theStatusID the statusID to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setStatusID(int theStatusID) {
		// begin-user-code
		statusID = theStatusID;
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
                IssueStatusDB db = new IssueStatusDB();
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
                IssueStatusDB db = new IssueStatusDB();
		return db.update(this.statusID, this.project.getProjectID(), this.name);
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int delete() {
		// begin-user-code
		// TODO Auto-generated method stub
                IssueStatusDB db = new IssueStatusDB();
		return db.delete(this.statusID);
		// end-user-code
	}

	/**
	 * @param pID
	 * @param pName
	 * @param pProject
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int setIssueStatus(int pID, String pName, Project pProject) {
		// begin-user-code
		// TODO Auto-generated method stub
                this.setStatusID(pID);
                this.setName(pName);
                this.setProject(pProject);
                return 0;
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set getListIssueStatus() {
		// begin-user-code
		// TODO Auto-generated method stub
               HashSet result = null;
               IssueStatusDB db = new IssueStatusDB();
               Table t = db.getListIssueStatus(this.project.getProjectID());
               if (t!=null)
               {
                 result = new HashSet();
                 for(int i = 0; i<t.getRowsCount(); i++)
                 {
                   IssueStatus issuestatus = new IssueStatus();
                   this.loadRow(issuestatus, t, i);
                   result.add(issuestatus);
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
                IssueStatusDB db = new IssueStatusDB();
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
                IssueStatusDB db = new IssueStatusDB();
                Table t = db.getIssueStatus(this.statusID);
                return this.loadRow(this,t,0);

		// end-user-code
	}

	/**
	 * @param t
	 * @param row
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int loadRow(IssueStatus pIssueStatus, Table t, int row) {
		// begin-user-code
		// TODO Auto-generated method stub
                if (t!=null){
                 int count = t.getRowsCount();
                 if (row >= 0 && row < count) {
                   pIssueStatus.statusID = Integer.parseInt(t.getCell(row, 0));
                   int projectID = Integer.parseInt(t.getCell(row, 1));
                   pIssueStatus.project = new Project();
                   pIssueStatus.project.setProjectID(projectID);
                   pIssueStatus.project.load();
                   pIssueStatus.name = t.getCell(row, 2);
                   return SysConstant.OK;
                 }
                 return SysConstant.ERROR_RANGE;
               }
               return SysConstant.ERROR;

		// end-user-code
	}
}
