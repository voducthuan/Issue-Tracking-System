/**
 *
 */
package ITS;

import ITSDB.IterationDB;
import java.util.Set;
import java.util.HashSet;
import tool.Table;
import tool.SysConstant;

/**

 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class Iteration {
	/**
	 * @uml.annotations for <code>artifact</code>
	 *     collection_type="ITS.Artifact"
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private Set<Artifact> artifact;

	/**
	 * @return the artifact
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set<Artifact> getArtifact() {
		// begin-user-code
                if(artifact==null){
                  Artifact art = new Artifact();
                  art.setIteration(this);
                  artifact = art.getListArtifact();
                }
		return artifact;
		// end-user-code
	}

	/**
	 * @param theArtifact the artifact to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setArtifact(Set<Artifact> theArtifact) {
		// begin-user-code
		artifact = theArtifact;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private int iterationID;

	/**
	 * @return the iterationID
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int getIterationID() {
		// begin-user-code
		return iterationID;
		// end-user-code
	}

	/**
	 * @param theIterationID the iterationID to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setIterationID(int theIterationID) {
		// begin-user-code
		iterationID = theIterationID;
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
	private Phase phase;

	/**
	 * @return the phase
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Phase getPhase() {
		// begin-user-code
		return phase;
		// end-user-code
	}

	/**
	 * @param thePhase the phase to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setPhase(Phase thePhase) {
		// begin-user-code
		phase = thePhase;
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int add() {
		// begin-user-code
		// TODO Auto-generated method stub
                IterationDB db = new IterationDB();
		return db.add(this.phase.getPhaseID(), this.description);
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int update() {
		// begin-user-code
		// TODO Auto-generated method stub
                IterationDB db = new IterationDB();
		return db.update(this.iterationID, this.phase.getPhaseID(), this.description);
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int delete() {
		// begin-user-code
		// TODO Auto-generated method stub
                IterationDB db = new IterationDB();
		return db.delete(this.iterationID);
		// end-user-code
	}

	/**
	 * @param pID
	 * @param pDescription
	 * @param pPhase
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int setIteration(int pID, String pDescription, Phase pPhase) {
		// begin-user-code
		// TODO Auto-generated method stub
                this.setIterationID(pID);
                this.setDescription(pDescription);
                this.setPhase(pPhase);
		return 0;
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set getListIteration() {
		// begin-user-code
		// TODO Auto-generated method stub
                HashSet result = null;
                IterationDB db = new IterationDB();
                Table t = db.getListIteration(this.phase.getPhaseID());
                if (t!=null)
                {
                  result = new HashSet();
                  for(int i = 0; i<t.getRowsCount(); i++)
                  {
                    Iteration iteration = new Iteration();
                    this.loadRow(iteration, t, i);
                    result.add(iteration);
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
                IterationDB db = new IterationDB();
                db.copyTemplate(this.phase.getPhaseID());

		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int load() {
		// begin-user-code
		// TODO Auto-generated method stub
                IterationDB db = new IterationDB();
                Table t = db.getIteration(this.iterationID);
                return this.loadRow(this,t,0);
		// end-user-code
	}

	/**
	 * @param pIteration
	 * @param t
	 * @param row
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int loadRow(Iteration pIteration, Table t, int row) {
		// begin-user-code
		// TODO Auto-generated method stub

                if (t!=null){
                  int count = t.getRowsCount();
                  if (row >= 0 && row < count) {
                    pIteration.iterationID = Integer.parseInt(t.getCell(row, 0));
                    int phaseID = Integer.parseInt(t.getCell(row, 1));
                    pIteration.phase = new Phase();
                    pIteration.phase.setPhaseID(phaseID);
                    pIteration.phase.load();
                    pIteration.description = t.getCell(row, 2);
                    return SysConstant.OK;
                  }
                  return SysConstant.ERROR_RANGE;
                }
                return SysConstant.ERROR;

		// end-user-code
	}
}
