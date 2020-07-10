/**
 *
 */
package ITS;

import ITSDB.ProjectMemberDB;
import java.util.*;
import tool.SysConstant;
import tool.Table;

/**

 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class ProjectMember {
	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private TrackingRight trackingright;

	/**
	 * @return the trackingright
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public TrackingRight getTrackingright() {
		// begin-user-code
		return trackingright;
		// end-user-code
	}

	/**
	 * @param theTrackingright the trackingright to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setTrackingright(TrackingRight theTrackingright) {
		// begin-user-code
		trackingright = theTrackingright;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private Role role;

	/**
	 * @return the role
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Role getRole() {
		// begin-user-code
		return role;
		// end-user-code
	}

	/**
	 * @param theRole the role to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setRole(Role theRole) {
		// begin-user-code
		role = theRole;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private User user;

	/**
	 * @return the user
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public User getUser() {
		// begin-user-code
		return user;
		// end-user-code
	}

	/**
	 * @param theUser the user to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setUser(User theUser) {
		// begin-user-code
		user = theUser;
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
                ProjectMemberDB db = new ProjectMemberDB();
                return db.add(this.user.getUserID(),this.project.getProjectID(),this.trackingright.getTrackingRightID(),this.role.getRoleID());
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int update() {
		// begin-user-code
		// TODO Auto-generated method stub
                ProjectMemberDB db = new ProjectMemberDB();
		return db.update(this.user.getUserID(),this.project.getProjectID(),this.trackingright.getTrackingRightID(),this.role.getRoleID());
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int delete() {
		// begin-user-code
		// TODO Auto-generated method stub
                ProjectMemberDB db = new ProjectMemberDB();
		return db.delete(this.user.getUserID(),this.project.getProjectID());
		// end-user-code
	}

	/**
	 * @param pUser
	 * @param pProject
	 * @param pRole
	 * @param pTrackingRight
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int setProjectMember(User pUser, Project pProject, Role pRole,
			TrackingRight pTrackingRight) {
		// begin-user-code
		// TODO Auto-generated method stub
                this.setUser(pUser);
                this.setProject(pProject);
                this.setRole(pRole);
                this.setTrackingright(pTrackingRight);
		return 0;
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set getListProjectMember() {
		// begin-user-code
		// TODO Auto-generated method stub
                HashSet result = null;
                ProjectMemberDB db = new ProjectMemberDB();
                Table t = db.getListProjectMeber(this.project.getProjectID());
                if (t!=null)
                {
                  result = new HashSet();
                  for(int i = 0; i<t.getRowsCount(); i++)
                  {
                    ProjectMember pm = new ProjectMember();
                    this.loadRow(pm, t, i);
                    result.add(pm);
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
                ProjectMemberDB db = new ProjectMemberDB();
                Table t = db.getProjectMember(this.user.getUserID(),this.project.getProjectID());
                return this.loadRow(this,t,0);
		// end-user-code
	}

	/**
	 * @param pProjectMember
	 * @param t
	 * @param row
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int loadRow(ProjectMember pProjectMember, Table t, int row) {
		// begin-user-code
		// TODO Auto-generated method stub
                if (t!=null){
                  int count = t.getRowsCount();
                  if (row >= 0 && row < count) {

                    int userID = Integer.parseInt(t.getCell(row, 3));
                    pProjectMember.user = new User();
                    pProjectMember.user.setUserID(userID);
                    pProjectMember.user.load();

                    int projectID = Integer.parseInt(t.getCell(row, 1));
                    pProjectMember.project = new Project();
                    pProjectMember.project.setProjectID(projectID);
                    pProjectMember.project.load();

                    int trackingRightID = Integer.parseInt(t.getCell(row, 0));
                    pProjectMember.trackingright = new TrackingRight();
                    pProjectMember.trackingright.setTrackingRightID(trackingRightID);
                    pProjectMember.trackingright.load();

                    int roleID = Integer.parseInt(t.getCell(row, 2));
                    pProjectMember.role = new Role();
                    pProjectMember.role.setRoleID(roleID);
                    pProjectMember.role.load();

                    return SysConstant.OK;
                  }
                  return SysConstant.ERROR_RANGE;
                }
                return SysConstant.ERROR;
		// end-user-code
	}
}
