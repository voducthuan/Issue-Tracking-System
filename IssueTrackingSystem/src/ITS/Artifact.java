/**
 *
 */
package ITS;

import ITSDB.ArtifactDB;
import java.util.Set;
import java.util.HashSet;
import tool.Table;
import tool.SysConstant;

/**
 
 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class Artifact {
	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private int artifactID;

	/**
	 * @return the artifactID
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int getArtifactID() {
		// begin-user-code
		return artifactID;
		// end-user-code
	}

	/**
	 * @param theArtifactID the artifactID to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setArtifactID(int theArtifactID) {
		// begin-user-code
		artifactID = theArtifactID;
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
	private Iteration iteration;

	/**
	 * @return the iteration
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Iteration getIteration() {
		// begin-user-code
		return iteration;
		// end-user-code
	}

	/**
	 * @param theIteration the iteration to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setIteration(Iteration theIteration) {
		// begin-user-code
		iteration = theIteration;
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int add() {
		// begin-user-code
		// TODO Auto-generated method stub
                ArtifactDB db = new ArtifactDB();
		return db.add(this.iteration.getIterationID(), this.description);
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int update() {
		// begin-user-code
		// TODO Auto-generated method stub
                ArtifactDB db = new ArtifactDB();
		return db.update(this.artifactID, this.iteration.getIterationID(), this.description);
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int delete() {
		// begin-user-code
		// TODO Auto-generated method stub
                ArtifactDB db = new ArtifactDB();
		return db.delete(this.artifactID);
		// end-user-code
	}

	/**
	 * @param pID
	 * @param pDescription
	 * @param pIteration
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int setArtifact(int pID, String pDescription, Iteration pIteration) {
		// begin-user-code
		// TODO Auto-generated method stub
                this.setArtifactID(pID);
                this.setDescription(pDescription);
                this.setIteration(pIteration);
                return 0;

		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set getListArtifact() {
		// begin-user-code
		// TODO Auto-generated method stub
               HashSet result = null;
               ArtifactDB db = new ArtifactDB();
               Table t = db.getListArtifact(this.iteration.getIterationID());
               if (t!=null)
               {
                 result = new HashSet();
                 for(int i = 0; i<t.getRowsCount(); i++)
                 {
                   Artifact artifact = new Artifact();
                   this.loadRow(artifact, t, i);
                   result.add(artifact);
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
                ArtifactDB db = new ArtifactDB();
                db.copyTemplate(this.iteration.getIterationID());
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int load() {
		// begin-user-code
		// TODO Auto-generated method stub
               ArtifactDB db = new ArtifactDB();
               Table t = db.getArtifact(this.artifactID);
               return this.loadRow(this,t,0);

		// end-user-code
	}

	/**
	 * @param t
	 * @param row
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int loadRow(Artifact pArtifact, Table t, int row) {
		// begin-user-code
		// TODO Auto-generated method stub
                if (t!=null){
                int count = t.getRowsCount();
                if (row >= 0 && row < count) {
                  pArtifact.artifactID = Integer.parseInt(t.getCell(row, 0));
                  int iterationID = Integer.parseInt(t.getCell(row, 1));
                  pArtifact.iteration = new Iteration();
                  pArtifact.iteration.setIterationID(iterationID);
                  pArtifact.iteration.load();
                  pArtifact.description = t.getCell(row, 2);
                  return SysConstant.OK;
                }
                return SysConstant.ERROR_RANGE;
              }
              return SysConstant.ERROR;

		// end-user-code
	}
}
