/**
 *
 */
package ITS;

import ITSDB.DepartmentDB;
import java.util.*;
import tool.Table;
import tool.SysConstant;

/**

 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class Department {
	/**
	 * @uml.annotations for <code>user</code>
	 *     collection_type="ITS.User"
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private Set<User> user;

	/**
	 * @return the user
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set<User> getUser() {
		// begin-user-code
                user = this.getUserList();
		return user;
		// end-user-code
	}

	/**
	 * @param theUser the user to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setUser(Set<User> theUser) {
		// begin-user-code
		user = theUser;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private int departmentID;

	/**
	 * @return the departmentID
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int getDepartmentID() {
		// begin-user-code
		return departmentID;
		// end-user-code
	}

	/**
	 * @param theDepartmentID the departmentID to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setDepartmentID(int theDepartmentID) {
		// begin-user-code
		departmentID = theDepartmentID;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private String description;

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
                DepartmentDB db = new DepartmentDB();
		return db.add(this.description);
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int update() {
		// begin-user-code
		// TODO Auto-generated method stub
                DepartmentDB db = new DepartmentDB();
		return db.update(this.description,this.departmentID);
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int delete() {
		// begin-user-code
		// TODO Auto-generated method stub
                 DepartmentDB db = new DepartmentDB();
		return db.delete(this.departmentID);
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set getUserList() {
		// begin-user-code
		// TODO Auto-generated method stub
                HashSet result = null;
                DepartmentDB db = new DepartmentDB();
                Table t = db.getUserList(this.departmentID);
                if (t!=null)
                {
                  result = new HashSet();
                  for(int i = 0; i<t.getRowsCount(); i++)
                  {
                    User u = new User();
                    u.loadRow(t,i,u);
                    result.add(u);
                  }
                }
                return result;

		// end-user-code
	}

	/**
	 * @param user
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int getUserDepartment(User u) {
		// begin-user-code
		// TODO Auto-generated method stub
                DepartmentDB db = new DepartmentDB();
                Table t = db.getUserDepartment(u.getUserID());
                return this.loadRow(this,t,0);

		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set getAllDepartment() {
		// begin-user-code
		// TODO Auto-generated method stub
                HashSet result = null;
                DepartmentDB db = new DepartmentDB();
                Table t = db.getAllDepartment();
                if (t!=null)
                {
                  result = new HashSet();
                  for(int i = 0; i<t.getRowsCount(); i++)
                  {
                    Department department = new Department();
                    this.loadRow(department, t, i);
                    result.add(department);
                  }
                }
                return result;
		// end-user-code
	}

	/**
	 * @param pdescription
	 * @param pID
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int setDepartment(String pdescription, int pID) {
		// begin-user-code
		// TODO Auto-generated method stub
                this.setDescription(pdescription);
                this.setDepartmentID(pID);
		return 0;
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int load() {
		// begin-user-code
		// TODO Auto-generated method stub
                DepartmentDB db = new DepartmentDB();
                Table t = db.getDepartment(this.departmentID);
                return this.loadRow(this,t,0);

		// end-user-code
	}

	/**
	 * @param pDepartment
	 * @param t
	 * @param row
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int loadRow(Department pDepartment, Table t, int row) {
		// begin-user-code
		// TODO Auto-generated method stub
                if (t!=null){
                  int count = t.getRowsCount();
                  if (row >= 0 && row < count) {
                    pDepartment.departmentID = Integer.parseInt(t.getCell(row, 0));
                    pDepartment.description = t.getCell(row, 1);
                    return SysConstant.OK;
                  }
                  return SysConstant.ERROR_RANGE;
                }
                return SysConstant.ERROR;
		// end-user-code
	}
}
