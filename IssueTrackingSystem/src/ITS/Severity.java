/**
 *
 */
package ITS;

import ITSDB.SeverityDB;
import java.util.Set;
import java.util.HashSet;
import tool.Table;
import tool.SysConstant;

/**

 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class Severity {
	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private int severityID;

	/**
	 * @return the severityID
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int getSeverityID() {
		// begin-user-code
		return severityID;
		// end-user-code
	}

	/**
	 * @param theSeverityID the severityID to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setSeverityID(int theSeverityID) {
		// begin-user-code
		severityID = theSeverityID;
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
	private int mark;

	/**
	 * @return the mark
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int getMark() {
		// begin-user-code
		return mark;
		// end-user-code
	}

	/**
	 * @param theMark the mark to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setMark(int theMark) {
		// begin-user-code
		mark = theMark;
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
                SeverityDB db = new SeverityDB();
		return db.add(this.project.getProjectID(), this.name, this.mark);
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int update() {
		// begin-user-code
		// TODO Auto-generated method stub
                SeverityDB db = new SeverityDB();
		return db.update(this.severityID, this.project.getProjectID(), this.name, this.mark);
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int delete() {
		// begin-user-code
		// TODO Auto-generated method stub
                SeverityDB db = new SeverityDB();
		return db.delete(this.severityID);
		// end-user-code
	}

	/**
	 * @param pID
	 * @param pName
	 * @param pMark
	 * @param pProject
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int setSeverity(int pID, String pName, int pMark, Project pProject) {
		// begin-user-code
		// TODO Auto-generated method stub
                this.setSeverityID(pID);
                this.setProject(pProject);
                this.setName(pName);
                this.setMark(pMark);
		return 0;
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set getListSeverity() {
		// begin-user-code
		// TODO Auto-generated method stub
                HashSet result = null;
                SeverityDB db = new SeverityDB();
                Table t = db.getListSeverity(this.project.getProjectID());
                if (t!=null)
                {
                  result = new HashSet();
                  for(int i = 0; i<t.getRowsCount(); i++)
                  {
                    Severity severity = new Severity();
                    this.loadRow(severity, t, i);
                    result.add(severity);
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
                SeverityDB db = new SeverityDB();
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
                SeverityDB db = new SeverityDB();
                Table t = db.getSeverity(this.severityID);
                return this.loadRow(this,t,0);

		// end-user-code
	}

	/**
	 * @param pSeverity
	 * @param t
	 * @param row
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int loadRow(Severity pSeverity, Table t, int row) {
		// begin-user-code
		// TODO Auto-generated method stub
                if (t!=null){
                  int count = t.getRowsCount();
                  if (row >= 0 && row < count) {
                    pSeverity.severityID = Integer.parseInt(t.getCell(row, 0));
                    int projectID = Integer.parseInt(t.getCell(row, 1));
                    pSeverity.project = new Project();
                    pSeverity.project.setProjectID(projectID);
                    pSeverity.project.load();
                    pSeverity.name = t.getCell(row, 2);
                    pSeverity.mark = Integer.parseInt(t.getCell(row, 3));
                    return SysConstant.OK;
                  }
                  return SysConstant.ERROR_RANGE;
                }
                return SysConstant.ERROR;
		// end-user-code
	}
}
