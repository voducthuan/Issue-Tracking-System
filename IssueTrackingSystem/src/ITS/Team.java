/**
 *
 */
package ITS;

import ITSDB.TeamDB;
import java.util.*;
import tool.Table;
import tool.SysConstant;

/**

 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class Team {
	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private int teamID;

	/**
	 * @return the teamID
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int getTeamID() {
		// begin-user-code
		return teamID;
		// end-user-code
	}

	/**
	 * @param theTeamID the teamID to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setTeamID(int theTeamID) {
		// begin-user-code
		teamID = theTeamID;
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
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int add() {
		// begin-user-code
		// TODO Auto-generated method stub
                TeamDB db = new TeamDB();
		return db.add(this.name);
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int update() {
		// begin-user-code
		// TODO Auto-generated method stub
                TeamDB db = new TeamDB();
		return db.update(this.teamID,this.name);
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int delete() {
		// begin-user-code
		// TODO Auto-generated method stub
                TeamDB db = new TeamDB();
		return db.delete(this.teamID);
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set getAllTeam() {
		// begin-user-code
		// TODO Auto-generated method stub
                HashSet result = null;
                TeamDB db = new TeamDB();
                Table t = db.getAllTeam();
                if (t!=null)
                {
                  result = new HashSet();
                  for(int i = 0; i<t.getRowsCount(); i++)
                  {
                    Team team = new Team();
                    this.loadRow(team, i, t);
                    result.add(team);
                  }
                }
                return result;

		// end-user-code
	}

	/**
	 * @param pName
	 * @param pID
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int setTeam(String pName, int pID) {
		// begin-user-code
		// TODO Auto-generated method stub
                setTeamID(pID);
                setName(pName);
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
                TeamDB db = new TeamDB();
                Table t = db.getTeam(this.teamID);
                return this.loadRow(this,0,t);
		// end-user-code
	}

	/**
	 * @param pTeam
	 * @param row
	 * @param t
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int loadRow(Team pTeam, int row, Table t) {
		// begin-user-code
		// TODO Auto-generated method stub
                if (t!=null){
                  int count = t.getRowsCount();
                  if (row >= 0 && row < count) {
                    pTeam.teamID = Integer.parseInt(t.getCell(row, 0));
                    pTeam.name = t.getCell(row, 1);
                    return SysConstant.OK;
                  }
                  return SysConstant.ERROR_RANGE;
                }
                return SysConstant.ERROR;
		// end-user-code
	}
}
