/**
 *
 */
package ITS;

import ITSDB.PhaseDB;
import java.util.Set;
import java.util.HashSet;
import tool.Table;
import tool.SysConstant;

/**

 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class Phase {
	/**
	 * @uml.annotations for <code>iteration</code>
	 *     collection_type="ITS.Iteration"
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private Set<Iteration> iteration;

	/**
	 * @return the iteration
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set<Iteration> getIteration() {
		// begin-user-code
                if(iteration==null){
                  Iteration iter = new Iteration();
                  iter.setPhase(this);
                  iteration = iter.getListIteration();
                }
		return iteration;
		// end-user-code
	}

	/**
	 * @param theIteration the iteration to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setIteration(Set<Iteration> theIteration) {
		// begin-user-code
		iteration = theIteration;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private int phaseID;

	/**
	 * @return the phaseID
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int getPhaseID() {
		// begin-user-code
		return phaseID;
		// end-user-code
	}

	/**
	 * @param thePhaseID the phaseID to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setPhaseID(int thePhaseID) {
		// begin-user-code
		phaseID = thePhaseID;
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
                PhaseDB db = new PhaseDB();
		return db.add(this.project.getProjectID(), this.description);
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int update() {
		// begin-user-code
		// TODO Auto-generated method stub
                PhaseDB db = new PhaseDB();
                return db.update(this.phaseID, this.project.getProjectID(), this.description);

		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int delete() {
		// begin-user-code
		// TODO Auto-generated method stub
                PhaseDB db = new PhaseDB();
		return db.delete(this.phaseID);
		// end-user-code
	}

	/**
	 * @param pID
	 * @param pDescription
	 * @param pProject
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int setPhase(int pID, String pDescription, Project pProject) {
		// begin-user-code
		// TODO Auto-generated method stub
                this.setPhaseID(pID);
                this.setProject(pProject);
                this.setDescription(pDescription);
                return 0;
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set getListPhase() {
		// begin-user-code
		// TODO Auto-generated method stub
                HashSet result = null;
                PhaseDB db = new PhaseDB();
                Table t = db.getListPhase(this.project.getProjectID());
                if (t!=null)
                {
                  result = new HashSet();
                  for(int i = 0; i<t.getRowsCount(); i++)
                  {
                    Phase phase = new Phase();
                    this.loadRow(phase, t, i);
                    result.add(phase);
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
                PhaseDB db = new PhaseDB();
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
                PhaseDB db = new PhaseDB();
                Table t = db.getPhase(this.phaseID);
                return this.loadRow(this,t,0);
		// end-user-code
	}

	/**
	 * @param pPhase
	 * @param t
	 * @param row
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int loadRow(Phase pPhase, Table t, int row) {
		// begin-user-code
		// TODO Auto-generated method stub
                if (t!=null){
                  int count = t.getRowsCount();
                  if (row >= 0 && row < count) {
                    pPhase.phaseID = Integer.parseInt(t.getCell(row, 0));
                    int projectID = Integer.parseInt(t.getCell(row, 1));
                    pPhase.project = new Project();
                    pPhase.project.setProjectID(projectID);
                    pPhase.project.load();
                    pPhase.description = t.getCell(row, 2);
                    return SysConstant.OK;
                  }
                  return SysConstant.ERROR_RANGE;
                }
                return SysConstant.ERROR;

		// end-user-code
	}
}
