/**
 *
 */
package ITS;

import ITSDB.*;
import ITS.Project;
import java.util.*;
import tool.*;

/**

 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class Role {
	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private int roleID;
        private String name;
        private Project project;
	/**
	 * @return the roleID
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int getRoleID() {
		// begin-user-code
		return roleID;
		// end-user-code
	}

	/**
	 * @param theRoleID the roleID to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setRoleID(int theRoleID) {
		// begin-user-code
		roleID = theRoleID;
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
                RoleDB db = new RoleDB();
                int intResult;
                intResult = db.add(this.name,this.project.getProjectID());
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
                RoleDB db = new RoleDB();
                int intResult;
                intResult = db.update(this.roleID,this.name,this.project.getProjectID());
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
		RoleDB db = new RoleDB();
                int intResult;
                intResult = db.delete(this.roleID);
                return intResult;
		// end-user-code
	}

	/**
	 * @param pID
	 * @param pName
	 * @param pProject
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int setRole(int pID, String pName, Project pProject) {
		// begin-user-code
		// TODO Auto-generated method stub
                this.roleID=pID;
                this.name=pName;
                this.project=pProject;
                return 0;
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set getListProjectRole() {
		// begin-user-code
		// TODO Auto-generated method stub
                HashSet result = null;
                RoleDB db = new RoleDB();
                Table t = db.getListProjectRole(project.getProjectID());
                if (t!=null)
                {
                  result = new HashSet();
                  for(int i = 0; i<t.getRowsCount(); i++)
                  {
                    Role p = new Role();
                    this.loadRow(t, i, p);
                    result.add(p);
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
                RoleDB db = new RoleDB();
                Table t = db.getRole(this.roleID);
                return this.loadRow(t,0,this);

		// end-user-code
	}

	/**
	 * @param t
	 * @param row
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int loadRow(Table t, int row, Role pObjRole) {
		// begin-user-code
		// TODO Auto-generated method stub
                int intProjectID;
                if (t!=null){
                  int count = t.getRowsCount();
                  if (row >= 0 && row < count) {
                    pObjRole.roleID = Integer.parseInt(t.getCell(row, 0));
                    intProjectID = Integer.parseInt(t.getCell(row, 1));
                    pObjRole.name = t.getCell(row, 2);
                    pObjRole.project = new Project();
                    pObjRole.project.setProjectID(intProjectID);
                    pObjRole.project.load();
                    return SysConstant.OK;
                  }
                  return SysConstant.ERROR_RANGE;
                }
                return SysConstant.ERROR;

		// end-user-code
	}
}
