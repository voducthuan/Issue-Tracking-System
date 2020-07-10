/**
 *
 */
package ITS;

import ITSDB.IssueTypeDB;
import java.util.Set;
import java.util.HashSet;
import tool.Table;
import tool.SysConstant;

/**

 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class IssueType {
	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private int typeID;

	/**
	 * @return the typeID
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int getTypeID() {
		// begin-user-code
		return typeID;
		// end-user-code
	}

	/**
	 * @param theTypeID the typeID to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setTypeID(int theTypeID) {
		// begin-user-code
		typeID = theTypeID;
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
                IssueTypeDB db = new IssueTypeDB();
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
                IssueTypeDB db = new IssueTypeDB();
		return db.update(this.typeID, this.project.getProjectID(), this.name);
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int delete() {
		// begin-user-code
		// TODO Auto-generated method stub
                IssueTypeDB db = new IssueTypeDB();
		return db.delete(this.typeID);
		// end-user-code
	}

	/**
	 * @param pID
	 * @param pName
	 * @param pProject
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int setIssueType(int pID, String pName, Project pProject) {
		// begin-user-code
		// TODO Auto-generated method stub
                this.setTypeID(pID);
                this.setName(pName);
                this.setProject(pProject);
                return 0;

		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set getListIssueType() {
		// begin-user-code
		// TODO Auto-generated method stub
               HashSet result = null;
               IssueTypeDB db = new IssueTypeDB();
               Table t = db.getListIssueType(this.project.getProjectID());
               if (t!=null)
               {
                 result = new HashSet();
                 for(int i = 0; i<t.getRowsCount(); i++)
                 {
                   IssueType issuestype = new IssueType();
                   this.loadRow(issuestype, t, i);
                   result.add(issuestype);
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
                IssueTypeDB db = new IssueTypeDB();
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
               IssueTypeDB db = new IssueTypeDB();
               Table t = db.getIssueType(this.typeID);
               return this.loadRow(this,t,0);

		// end-user-code
	}

	/**
	 * @param t
	 * @param row
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int loadRow(IssueType pIssuetype,Table t, int row) {
		// begin-user-code
		// TODO Auto-generated method stub
                if (t!=null){
                int count = t.getRowsCount();
                if (row >= 0 && row < count) {
                  pIssuetype.typeID = Integer.parseInt(t.getCell(row, 0));
                  int projectID = Integer.parseInt(t.getCell(row, 1));
                  pIssuetype.project = new Project();
                  pIssuetype.project.setProjectID(projectID);
                  pIssuetype.project.load();
                  pIssuetype.name = t.getCell(row, 2);
                  return SysConstant.OK;
                }
                return SysConstant.ERROR_RANGE;
              }
              return SysConstant.ERROR;

		// end-user-code
	}
}
