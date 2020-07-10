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
public class User {
	/**
	 * @uml.annotations for <code>adminsystemright</code>
	 *     collection_type="ITS.AdminSystemRight"
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private Set<AdminSystemRight> adminsystemright;
	/**
	 * @return the adminsystemright
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set<AdminSystemRight> getAdminsystemright() {
		// begin-user-code
                if(adminsystemright==null)
                {
                  HashSet result = null;
                  MapSystemUserDB db = new MapSystemUserDB();
                  Table t = db.getAdminSystemRight(this.userID);
                  if (t!=null)
                  {
                    result = new HashSet();
                    for(int i = 0; i<t.getRowsCount(); i++)
                    {
                      AdminSystemRight ad = new AdminSystemRight();
                      ad.loadRow(t, i, ad);
                      result.add(ad);
                    }
                  }
                  adminsystemright  = result;
                }

                return adminsystemright;
		// end-user-code
	}

	/**
	 * @param theAdminsystemright the adminsystemright to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setAdminsystemright(Set<AdminSystemRight> theAdminsystemright) {
		// begin-user-code
		adminsystemright = theAdminsystemright;
		// end-user-code
	}

	/**
	 * @uml.annotations for <code>team</code>
	 *     collection_type="ITS.Team"
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private Set<Team> team;

	/**
	 * @return the team
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set<Team> getTeam() {
		// begin-user-code
                if(team==null)
                {
                  HashSet result = null;
                  ParticipationDB db = new ParticipationDB();
                  Table t = db.getUserTeam(this.userID);
                  if (t!=null)
                  {
                    result = new HashSet();
                    for(int i = 0; i<t.getRowsCount(); i++)
                    {
                      Team te = new Team();
                      te.loadRow(te, i, t);
                      result.add(te);
                    }
                  }
                  team  = result;
                }

		return team;
		// end-user-code
	}

	/**
	 * @param theTeam the team to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setTeam(Set<Team> theTeam) {
		// begin-user-code
		team = theTeam;
		// end-user-code
	}

        /**
         * @uml.annotations for <code>listProjectOfSystemAdmin</code>
         *     collection_type="ITS.Project"
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        private Set<Project> listProjectOfSystemAdmin;

        /**
         * @return the listProjectOfSystemAdmin
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public Set<Project> getListProjectOfSystemAdmin() {
                // begin-user-code
                if(listProjectOfSystemAdmin==null)
                {
                  HashSet result = null;
                  MapSystemUserDB db = new MapSystemUserDB();
                  Table t = db.getListProjectOfSystemAdmin(this.userID);
                  if (t!=null)
                  {
                    result = new HashSet();
                    for(int i = 0; i<t.getRowsCount(); i++)
                    {
                      Project pro = new Project();
                      pro.loadRow(pro, t, i);
                      result.add(pro);
                    }
                  }
                  listProjectOfSystemAdmin  = result;
                }

                return listProjectOfSystemAdmin;
                // end-user-code
        }

        /**
         * @param theListProjectOfSystemAdmin
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public void setListProjectOfSystemAdmin(Set<Project> theListProjectOfSystemAdmin) {
                // begin-user-code
                listProjectOfSystemAdmin = theListProjectOfSystemAdmin;
                // end-user-code
        }

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private int userID;

	/**
	 * @return the userID
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int getUserID() {
		// begin-user-code
		return userID;
		// end-user-code
	}

	/**
	 * @param theUserID the userID to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setUserID(int theUserID) {
		// begin-user-code
		userID = theUserID;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private String userName;

	/**
	 * @return the userName
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public String getUserName() {
		// begin-user-code
		return userName;
		// end-user-code
	}

	/**
	 * @param theUserName the userName to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setUserName(String theUserName) {
		// begin-user-code
		userName = theUserName;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private String fullName;

	/**
	 * @return the fullName
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public String getFullName() {
		// begin-user-code
		return fullName;
		// end-user-code
	}

	/**
	 * @param theFullName the fullName to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setFullName(String theFullName) {
		// begin-user-code
		fullName = theFullName;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private String password;

	/**
	 * @return the password
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public String getPassword() {
		// begin-user-code
		return password;
		// end-user-code
	}

	/**
	 * @param thePassword the password to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setPassword(String thePassword) {
		// begin-user-code
		password = thePassword;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private String email;

	/**
	 * @return the email
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public String getEmail() {
		// begin-user-code
		return email;
		// end-user-code
	}

	/**
	 * @param theEmail the email to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setEmail(String theEmail) {
		// begin-user-code
		email = theEmail;
		// end-user-code
	}

	/**
         * @param objDept
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
        public int add(Department objDept) {
                // begin-user-code
                // TODO Auto-generated method stub
                UserDB db = new UserDB();
                int intResult=1;
                /*Department department= new Department();
                department.getUserDepartment(this);*/
                intResult = db.add( objDept.getDepartmentID() , this.getUserName(), this.getFullName(), this.getPassword(), this.getEmail());
                return intResult;


                // end-user-code
        }

        /**
         * @param objDept
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public int upadate(Department objDept) {
                // begin-user-code
                // TODO Auto-generated method stub
                UserDB db = new UserDB();
                int intResult=1;
                /*Department department= new Department();
                 department.getUserDepartment(this);*/
                intResult=db.update(this.getUserID(),objDept.getDepartmentID(), this.getUserName(), this.getFullName(), this.getPassword(), this.getEmail());
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
                UserDB db = new UserDB();
                int intResult;
                intResult=db.delete(this.getUserID());
                return intResult;

		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set getAllUser() {
		// begin-user-code
		// TODO Auto-generated method stub
               HashSet result = null;
               UserDB db = new UserDB();
               Table t = db.getAllUser();
               if (t!=null)
               {
                 result = new HashSet();
                 for(int i = 0; i<t.getRowsCount(); i++)
                 {
                   User u = new User();
                   this.loadRow(t, i, u);
                   result.add(u);
                 }
               }
               return result;

		// end-user-code
	}

	/**
	 * @param pTeam
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int assignTeam(Team pTeam) {
		// begin-user-code
		// TODO Auto-generated method stub
                ParticipationDB db = new ParticipationDB();
                int intResult;
                intResult=db.assignTeam(pTeam.getTeamID(), this.userID);
                return intResult;

		// end-user-code
	}

	/**
	 * @param pTeam
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int unassignTeam(Team pTeam) {
		// begin-user-code
		// TODO Auto-generated method stub
                ParticipationDB db = new ParticipationDB();
                int intResult;
                intResult=db.unassignTeam(pTeam.getTeamID(), this.userID);
                return intResult;
		// end-user-code
	}

	/**
	 * @param pAdminSystemRight
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int addAdminSystemRight(AdminSystemRight pAdminSystemRight, Project pProject) {
		// begin-user-code
		// TODO Auto-generated method stub
                MapSystemUserDB db = new MapSystemUserDB();
                int intResult;
                intResult=db.addAdminSystemRight(pAdminSystemRight.getSystemRightID(), this.userID, pProject.getProjectID());
                return intResult;
		// end-user-code
	}

	/**
	 * @param pAdminSystemRight
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int removeCompanyAdminRight(AdminSystemRight pAdminSystemRight) {
		// begin-user-code
		// TODO Auto-generated method stub
                MapSystemUserDB db = new MapSystemUserDB();
                int intResult;
                intResult=db.removeCompanyAdminRight(this.userID, pAdminSystemRight.getSystemRightID());
                return intResult;
		// end-user-code
	}

        /**
         * @param pAdminSystemRight
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public int removeApplicationAdminRight(AdminSystemRight pAdminSystemRight) {
                // begin-user-code
                // TODO Auto-generated method stub
                MapSystemUserDB db = new MapSystemUserDB();
                int intResult;
                intResult=db.removeApplicationAdminRight(this.userID, pAdminSystemRight.getSystemRightID());
                return intResult;
                // end-user-code
        }

        /**
         * @param pAdminSystemRight
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public int removePorjectAdminRight(AdminSystemRight pAdminSystemRight, Project pProject) {
                // begin-user-code
                // TODO Auto-generated method stub
                MapSystemUserDB db = new MapSystemUserDB();
                int intResult;
                intResult=db.removePorjectAdminRight(this.userID, pAdminSystemRight.getSystemRightID(), pProject.getProjectID());
                return intResult;
                // end-user-code
        }

	/**
	 * @param pID
	 * @param pName
	 * @param pFullName
	 * @param pPassword
	 * @param pemail
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int setUser(int pID, String pName, String pFullName,
			String pPassword, String pemail) {
		// begin-user-code
		// TODO Auto-generated method stub
                setUserID(pID);
                setUserName(pName);
                setFullName(pFullName);
                setPassword(pPassword);
                setEmail(pemail);
                return 0;

		// end-user-code
	}

        /**
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public Set getListUserNotCompanyAdmin() {
        	HashSet result = null;
          	UserDB db = new UserDB();
          	Table t = db.getListUserNotCompanyAdmin();
          	if (t!=null)
          	{
                	result = new HashSet();
                  	for(int i = 0; i<t.getRowsCount(); i++)
                  	{
                        	User u = new User();
                          	this.loadRow(t, i, u);
                          	result.add(u);
                  	}
          	}
          	return result;
	}

        /**
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public Set getListUserNotApplicationAdmin() {
        	HashSet result = null;
	        UserDB db = new UserDB();
	        Table t = db.getListUserNotApplicationAdmin();
	        if (t!=null)
	        {
	        	result = new HashSet();
	                for(int i = 0; i<t.getRowsCount(); i++)
	                {
	                	User u = new User();
	                      	this.loadRow(t, i, u);
	                      	result.add(u);
                        }
                }
	        return result;
  	}

        /**
         * @param pProject
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public Set getListUserNotProjectAdmin(Project pProject) {
	        HashSet result = null;
        	UserDB db = new UserDB();
          	Table t = db.getListUserNotProjectAdmin(pProject.getProjectID());
          	if (t!=null)
          	{
                	result = new HashSet();
                  	for(int i = 0; i<t.getRowsCount(); i++)
                  	{
                    		User u = new User();
	                    this.loadRow(t, i, u);
	                    result.add(u);
                  	}
          	}
          	return result;
	}

        /**
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public Set getListUserCompanyAdmin() {
        	HashSet result = null;
          	UserDB db = new UserDB();
	        Table t = db.getListUserCompanyAdmin();
          	if (t!=null)
          	{
                	result = new HashSet();
                  	for(int i = 0; i<t.getRowsCount(); i++)
                  	{
                          User u = new User();
                          this.loadRow(t, i, u);
                          result.add(u);
                  	}
          	}
          	return result;
  	}


        /**
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public Set getListUserApplicationAdmin() {
        	HashSet result = null;
                UserDB db = new UserDB();
                Table t = db.getListUserApplicationAdmin();
                if (t!=null)
                {
                	result = new HashSet();
                        for(int i = 0; i<t.getRowsCount(); i++)
                        {
                        	User u = new User();
                                this.loadRow(t, i, u);
                          	result.add(u);
                        }
                }
                return result;
        }



        /**
         * @param pProject
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public Set getListUserProjectAdmin(Project pProject) {
                HashSet result = null;
                UserDB db = new UserDB();
                Table t = db.getListUserProjectAdmin(pProject.getProjectID());
                if (t!=null)
                {
                        result = new HashSet();
                        for(int i = 0; i<t.getRowsCount(); i++)
                        {
                                User u = new User();
                                this.loadRow(t, i, u);
                                result.add(u);
                        }
                }
                return result;
        }

        /**
         * @param pProject
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public Set getListUserNotInProject(Project pProject) {
                HashSet result = null;
                UserDB db = new UserDB();
                Table t = db.getListUserNotInProject(pProject.getProjectID());
                if (t!=null)
                {
                        result = new HashSet();
                        for(int i = 0; i<t.getRowsCount(); i++)
                        {
                                User u = new User();
                                this.loadRow(t, i, u);
                                result.add(u);
                        }
                }
                return result;
        }

        /**
        * @param pProject
        * @return
        * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
        */
        public Set getListProjectManagedByUser() {
        	HashSet result = null;
                UserDB db = new UserDB();
                Table t = db.getListProjectManagedByUser(this.getUserID());
                if (t!=null)
                {
                        result = new HashSet();
                        for(int i = 0; i<t.getRowsCount(); i++)
                        {
                                Project p = new Project();
                                p.loadRow(p,t, i);
                                result.add(p);
                        }
                  }
                  return result;
                }


                /**
                * @param pProject
                * @return
                * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
                */
                public Set getListJoinedProject() {
                        HashSet result = null;
                        UserDB db = new UserDB();
                        Table t = db.getListJoinedProject(this.getUserID());
                        if (t!=null)
                        {
                                result = new HashSet();
                                for(int i = 0; i<t.getRowsCount(); i++)
                                {
                                        Project p = new Project();
                                        p.loadRow(p,t, i);
                                        result.add(p);
                                }
                          }
                          return result;
                        }

                /**
                 * @param pProject
                 * @return
                 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
                 */
                 public Set getListProjectAdminedByUser() {
                         HashSet result = null;
                         UserDB db = new UserDB();
                         Table t = db.getListProjectAdminedByUser(this.getUserID());
                         if (t!=null)
                         {
                                 result = new HashSet();
                                 for(int i = 0; i<t.getRowsCount(); i++)
                                 {
                                         Project p = new Project();
                                         p.loadRow(p,t, i);
                                         result.add(p);
                                 }
                           }
                           return result;
                         }

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int load() {
		// begin-user-code
		// TODO Auto-generated method stub
               UserDB db = new UserDB();
               Table t = db.getUser(this.getUserID());
               return this.loadRow(t,0,this);
	}

        /**
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */

        public int loadbyLoginName() {
                // begin-user-code
                // TODO Auto-generated method stub
                UserDB db = new UserDB();
                Table t = db.getUserbyLoginName(this.getUserName());
                return this.loadRow(t,0,this);
 	// end-user-code
	}

	/**
	 * @param pUser
	 * @param t
	 * @param row
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int loadRow(Table t, int row, User user) {
		// begin-user-code
		// TODO Auto-generated method stub
                if (t!=null){
                  int count = t.getRowsCount();
                  if (row >= 0 && row < count) {
                    user.userID = Integer.parseInt(t.getCell(row, 0));
                    user.userName = t.getCell(row, 1);
                    user.fullName=t.getCell(row,2);
                    user.password=t.getCell(row,3);
                    user.email=t.getCell(row,4);
                    return SysConstant.OK;
                  }
                  return SysConstant.ERROR_RANGE;
                }
                return SysConstant.ERROR;

		// end-user-code
	}
}
