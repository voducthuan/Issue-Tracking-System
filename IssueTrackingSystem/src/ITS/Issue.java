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
public class Issue {

  /**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	private int issueID;
        private String createdDate;
        private String title;
        private IssueStatus issuestatus;
        private String description;
        private KindOfActivity kindofactivity;
        private TypeOfActivity typeofactivity;
        private SubSystem subsystem;
        private String buildNumber;
        private Reproducibility reproducibility;
        private IssueType issuetype;
        private Severity severity;
        private int priority;
        private Environment environment;
        private Platform platform;
        private ProjectMember submiter;
        private ProjectMember assignedUser;
        private Set<Comment> comment;
        private String assignedDate;
        private String fixedDate;
        private String correctiveAction;
        private String attachment1;
        private String attachment2;
        private Artifact artifact;
        private String reproductionSteps;

	/**
	 * @return the issueID
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int getIssueID() {
		// begin-user-code
		return issueID;
		// end-user-code
	}

	/**
	 * @param theIssueID the issueID to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setIssueID(int theIssueID) {
		// begin-user-code
		issueID = theIssueID;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */


	/**
	 * @return the createdDate
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public String getCreatedDate() {
		// begin-user-code
		return createdDate;
		// end-user-code
	}

	/**
	 * @param theCreatedDate the createdDate to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setCreatedDate(String theCreatedDate) {
		// begin-user-code
		createdDate = theCreatedDate;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */


	/**
	 * @return the title
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public String getTitle() {
		// begin-user-code
		return title;
		// end-user-code
	}

	/**
	 * @param theTitle the title to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setTitle(String theTitle) {
		// begin-user-code
		title = theTitle;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */


	/**
	 * @return the issuestatus
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public IssueStatus getIssuestatus() {
		// begin-user-code
		return issuestatus;
		// end-user-code
	}

	/**
	 * @param theIssuestatus the issuestatus to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setIssuestatus(IssueStatus theIssuestatus) {
		// begin-user-code
		issuestatus = theIssuestatus;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */


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


	/**
	 * @return the kindofactivity
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public KindOfActivity getKindofactivity() {
		// begin-user-code
		return kindofactivity;
		// end-user-code
	}

	/**
	 * @param theKindofactivity the kindofactivity to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setKindofactivity(KindOfActivity theKindofactivity) {
		// begin-user-code
		kindofactivity = theKindofactivity;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */


	/**
	 * @return the typeofactivity
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public TypeOfActivity getTypeofactivity() {
		// begin-user-code
		return typeofactivity;
		// end-user-code
	}

	/**
	 * @param theTypeofactivity the typeofactivity to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setTypeofactivity(TypeOfActivity theTypeofactivity) {
		// begin-user-code
		typeofactivity = theTypeofactivity;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */

	/**
	 * @return the subsystem
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public SubSystem getSubsystem() {
		// begin-user-code
		return subsystem;
		// end-user-code
	}

	/**
	 * @param theSubsystem the subsystem to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setSubsystem(SubSystem theSubsystem) {
		// begin-user-code
		subsystem = theSubsystem;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */

	/**
	 * @return the buildNumber
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public String getBuildNumber() {
		// begin-user-code
		return buildNumber;
		// end-user-code
	}

	/**
	 * @param theBuildNumber the buildNumber to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setBuildNumber(String theBuildNumber) {
		// begin-user-code
		buildNumber = theBuildNumber;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */

	/**
	 * @return the reproducibility
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Reproducibility getReproducibility() {
		// begin-user-code
		return reproducibility;
		// end-user-code
	}

	/**
	 * @param theReproducibility the reproducibility to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setReproducibility(Reproducibility theReproducibility) {
		// begin-user-code
		reproducibility = theReproducibility;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */

	/**
	 * @return the issuetype
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public IssueType getIssuetype() {
		// begin-user-code
		return issuetype;
		// end-user-code
	}

	/**
	 * @param theIssuetype the issuetype to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setIssuetype(IssueType theIssuetype) {
		// begin-user-code
		issuetype = theIssuetype;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */

	/**
	 * @return the severity
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Severity getSeverity() {
		// begin-user-code
		return severity;
		// end-user-code
	}

	/**
	 * @param theSeverity the severity to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setSeverity(Severity theSeverity) {
		// begin-user-code
		severity = theSeverity;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */

	/**
	 * @return the priority
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int getPriority() {
		// begin-user-code
		return priority;
		// end-user-code
	}

	/**
	 * @param thePriority the priority to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setPriority(int thePriority) {
		// begin-user-code
		priority = thePriority;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */

	/**
	 * @return the environment
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Environment getEnvironment() {
		// begin-user-code
		return environment;
		// end-user-code
	}

	/**
	 * @param theEnvironment the environment to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setEnvironment(Environment theEnvironment) {
		// begin-user-code
		environment = theEnvironment;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */

	/**
	 * @return the platform
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Platform getPlatform() {
		// begin-user-code
		return platform;
		// end-user-code
	}

	/**
	 * @param thePlatform the platform to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setPlatform(Platform thePlatform) {
		// begin-user-code
		platform = thePlatform;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */

	/**
	 * @return the submiter
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public ProjectMember getSubmiter() {
		// begin-user-code
		return submiter;
		// end-user-code
	}

	/**
	 * @param theSubmiter the submiter to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setSubmiter(ProjectMember theSubmiter) {
		// begin-user-code
		submiter = theSubmiter;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */

	/**
	 * @return the assignedUser
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public ProjectMember getAssignedUser() {
		// begin-user-code
		return assignedUser;
		// end-user-code
	}

	/**
	 * @param theAssignedUser the assignedUser to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setAssignedUser(ProjectMember theAssignedUser) {
		// begin-user-code
		assignedUser = theAssignedUser;
		// end-user-code
	}

	/**
	 * @uml.annotations for <code>comment</code>
	 *     collection_type="ITS.Comment"
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */


	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	/**
	 * @return the assignedDate
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public String getAssignedDate() {
		// begin-user-code
		return assignedDate;
		// end-user-code
	}

	/**
	 * @param theAssignedDate the assignedDate to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setAssignedDate(String theAssignedDate) {
		// begin-user-code
		assignedDate = theAssignedDate;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */

	/**
	 * @return the fixedDate
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public String getFixedDate() {
		// begin-user-code
		return fixedDate;
		// end-user-code
	}

	/**
	 * @param theFixedDate the fixedDate to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setFixedDate(String theFixedDate) {
		// begin-user-code
		fixedDate = theFixedDate;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */


	/**
	 * @return the reproductionSteps
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public String getReproductionSteps() {
		// begin-user-code
		return reproductionSteps;
		// end-user-code
	}

	/**
	 * @param theReproductionSteps the reproductionSteps to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setReproductionSteps(String theReproductionSteps) {
		// begin-user-code
		reproductionSteps = theReproductionSteps;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */


	/**
	 * @return the correctiveAction
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public String getCorrectiveAction() {
		// begin-user-code
		return correctiveAction;
		// end-user-code
	}

	/**
	 * @param theCorrectiveAction the correctiveAction to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setCorrectiveAction(String theCorrectiveAction) {
		// begin-user-code
		correctiveAction = theCorrectiveAction;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */

	/**
	 * @return the attachment1
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public String getAttachment1() {
		// begin-user-code
		return attachment1;
		// end-user-code
	}

	/**
	 * @param theAttachment1 the attachment1 to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setAttachment1(String theAttachment1) {
		// begin-user-code
		attachment1 = theAttachment1;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */


	/**
	 * @return the attachment2
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public String getAttachment2() {
		// begin-user-code
		return attachment2;
		// end-user-code
	}

	/**
	 * @param theAttachment2 the attachment2 to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setAttachment2(String theAttachment2) {
		// begin-user-code
		attachment2 = theAttachment2;
		// end-user-code
	}

	/**
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */


	/**
	 * @return the artifact
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Artifact getArtifact() {
		// begin-user-code
		return artifact;
		// end-user-code
	}

	/**
	 * @param theArtifact the artifact to set
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public void setArtifact(Artifact theArtifact) {
		// begin-user-code
		artifact = theArtifact;
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */

	/**
	 * @param pSubmiter
	 * @param pIssueID
	 * @param pCreatedDate
	 * @param pTitle
	 * @param pStatus
	 * @param pDescription
	 * @param pKindOfActivity
	 * @param pTypeOfActivity
	 * @param pArtifact
	 * @param pSubSystem
	 * @param pBuildNumber
	 * @param pReproducibility
	 * @param pType
	 * @param pSeverity
	 * @param pPriority
	 * @param pEnvironment
	 * @param pPlatform
	 * @param pAssignedUser
	 * @param pAssignedDate
	 * @param pFixedDate
	 * @param pReproduction
	 * @param pCorrectiveAction
	 * @param pAttachment1
	 * @param pAttachment2
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int setIssue(ProjectMember pSubmiter, int pIssueID, String pCreatedDate,
			String pTitle, IssueStatus pStatus, String pDescription,
			KindOfActivity pKindOfActivity, TypeOfActivity pTypeOfActivity,
			Artifact pArtifact, SubSystem pSubSystem, String pBuildNumber,
			Reproducibility pReproducibility, IssueType pType,
			Severity pSeverity, int pPriority, Environment pEnvironment,
			Platform pPlatform, ProjectMember pAssignedUser, String pAssignedDate,
			String pFixedDate, String pReproduction, String pCorrectiveAction,
			String pAttachment1, String pAttachment2) {
		// begin-user-code
		// TODO Auto-generated method stub
                this.issueID = pIssueID;
                this.createdDate = pCreatedDate;
                this.title = pTitle;
                this.issuestatus = pStatus;
                this.description = pDescription;
                this.kindofactivity = pKindOfActivity;
                this.typeofactivity = pTypeOfActivity;
                this.subsystem = pSubSystem;
                this.buildNumber = pBuildNumber;
                this.reproducibility = pReproducibility;
                this.issuetype = pType;
                this.severity = pSeverity;
                this.priority = pPriority;
                this.environment = pEnvironment;
                this.platform = pPlatform;
                this.submiter = pSubmiter;
                this.assignedUser = pAssignedUser;
                //don't set collection of comment ;
                this.assignedDate = pAssignedDate;
                this.fixedDate = pFixedDate;
                this.correctiveAction = pCorrectiveAction;
                this.attachment1 = pAttachment1;
                this.attachment2 = pAttachment2;
                this.artifact = pArtifact;
                this.reproductionSteps = pReproduction;
                return 0;
		// end-user-code
	}



	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set reportIssueOfPhase() {
		// begin-user-code
		// TODO Auto-generated method stub
		return null;
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set reportIssueStatus() {
		// begin-user-code
		// TODO Auto-generated method stub
		return null;
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set reportIssueOfArtifact() {
		// begin-user-code
		// TODO Auto-generated method stub
		return null;
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set reportIssueOfPerProjectMember() {
		// begin-user-code
		// TODO Auto-generated method stub
		return null;
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public Set exportIssueToXML() {
		// begin-user-code
		// TODO Auto-generated method stub
		return null;
		// end-user-code
	}

	/**
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
        /**
         /**
         * @param theComment the comment to set
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
         public void setComment(Set<Comment> theComment) {
         // begin-user-code
                comment = theComment;
         // end-user-code
	}

        /**
        * @return the comment
        * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
        */
        public Set<Comment> getComment() {
         // begin-user-code
                  if((comment==null)||(comment.isEmpty())){
                    Comment p = new Comment();
                    p.setIssue(this);
                    this.comment = p.getListIssueComment();
                  }
                  return this.comment;
          // end-user-code
	}
        /**
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public int add() {
                // begin-user-code
                // TODO Auto-generated method stub
                IssueDB db = new IssueDB();
                int intResult;
                intResult = db.add(this.issuestatus.getStatusID(), this.reproducibility.getReproducibilityID(), this.severity.getSeverityID(),
                        this.artifact.getArtifactID(), this.platform.getPlatformID(), this.typeofactivity.getTypeOfActivityID(),
                        this.kindofactivity.getKindOfActivityID(), this.issuetype.getTypeID(), this.environment.getEnvironmentID(), this.subsystem.getSubSystemID(),
                        this.assignedUser.getProject().getProjectID(), this.assignedUser.getUser().getUserID(), this.submiter.getUser().getUserID(), this.createdDate,
                                        this.title, this.description, this.buildNumber,
                                         this.priority, this.assignedDate, this.fixedDate,
                                         this.reproductionSteps, this.correctiveAction,
                                         this.attachment1, this.attachment2);

                                 return intResult;

                // end-user-code
        }

        /**
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public int update() {
                // begin-user-code
                // TODO Auto-generated method stub
                IssueDB db = new IssueDB();
                int intResult;
                intResult = db.update(this.issueID, this.issuestatus.getStatusID(), this.reproducibility.getReproducibilityID(), this.severity.getSeverityID(),
                          this.artifact.getArtifactID(), this.platform.getPlatformID(), this.typeofactivity.getTypeOfActivityID(),
                          this.kindofactivity.getKindOfActivityID(), this.issuetype.getTypeID(), this.environment.getEnvironmentID(), this.subsystem.getSubSystemID(),
                          this.assignedUser.getProject().getProjectID(), this.assignedUser.getUser().getUserID(), this.submiter.getUser().getUserID(), this.createdDate,
                          this.title, this.description, this.buildNumber,
                          this.priority, this.assignedDate, this.fixedDate,
                          this.reproductionSteps, this.correctiveAction,
                          this.attachment1, this.attachment2);

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
                IssueDB db = new IssueDB();
                int intResult;
                intResult = db.delete(this.issueID);
                return intResult;

                // end-user-code
        }



        /* @return
        * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
        */
         public Set getListProjectIssue() {
         // begin-user-code
         // TODO Auto-generated method stub
                  HashSet result = null;
                  IssueDB db = new IssueDB();
                  Table t = db.getListProjectIssue(this.submiter.getProject().getProjectID());
                  if (t!=null)
                  {
                    result = new HashSet();
                    for(int i = 0; i<t.getRowsCount(); i++)
                    {
                      Issue p = new Issue();
                      this.loadRow(t, i, p);
                      result.add(p);
                    }
                  }
                  return result;
        // end-user-code
	}

        public int load() {
		// begin-user-code
		// TODO Auto-generated method stub
                IssueDB db = new IssueDB();
                Table t = db.getIssue(this.issueID);
                return this.loadRow(t,0,this);

		// end-user-code
	}

	/**
	 * @param t
	 * @param row
	 * @return
	 * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
	 */
	public int loadRow(Table t, int row, Issue pObjIssue) {
		// begin-user-code
		// TODO Auto-generated method stub
                int intTempID;
                if (t!=null){
                  int count = t.getRowsCount();
                  if (row >= 0 && row < count) {
                    pObjIssue.issueID = Integer.parseInt(t.getCell(row, 0));
                    intTempID = Integer.parseInt(t.getCell(row, 1));
                    pObjIssue.issuestatus  = new IssueStatus();
                    pObjIssue.issuestatus.setStatusID(intTempID);
                    pObjIssue.issuestatus.load();
                    intTempID = Integer.parseInt(t.getCell(row, 2));
                    pObjIssue.reproducibility = new Reproducibility();
                    pObjIssue.reproducibility.setReproducibilityID(intTempID);
                    pObjIssue.reproducibility.load();
                    intTempID = Integer.parseInt(t.getCell(row, 3));
                    pObjIssue.severity = new Severity();
                    pObjIssue.severity.setSeverityID(intTempID);
                    pObjIssue.severity.load();
                    intTempID = Integer.parseInt(t.getCell(row, 4));
                    pObjIssue.artifact = new Artifact();
                    pObjIssue.artifact.setArtifactID(intTempID);
                    pObjIssue.artifact.load();
                    intTempID = Integer.parseInt(t.getCell(row, 5));
                    pObjIssue.platform = new Platform();
                    pObjIssue.platform.setPlatformID(intTempID);
                    pObjIssue.platform.load();
                    intTempID = Integer.parseInt(t.getCell(row, 6));
                    pObjIssue.typeofactivity = new TypeOfActivity();
                    pObjIssue.typeofactivity.setTypeOfActivityID(intTempID);
                    pObjIssue.typeofactivity.load();
                    intTempID = Integer.parseInt(t.getCell(row, 7));
                    pObjIssue.kindofactivity = new KindOfActivity();
                    pObjIssue.kindofactivity.setKindOfActivityID(intTempID);
                    pObjIssue.kindofactivity.load();
                    intTempID = Integer.parseInt(t.getCell(row, 8));
                    pObjIssue.issuetype = new IssueType();
                    pObjIssue.issuetype.setTypeID(intTempID);
                    pObjIssue.issuetype.load();
                    intTempID = Integer.parseInt(t.getCell(row, 9));
                    pObjIssue.environment = new Environment();
                    pObjIssue.environment.setEnvironmentID(intTempID);
                    pObjIssue.environment.load();
                    intTempID = Integer.parseInt(t.getCell(row, 10));
                    pObjIssue.subsystem = new SubSystem();
                    pObjIssue.subsystem.setSubSystemID(intTempID);
                    pObjIssue.subsystem.load();
                    intTempID = Integer.parseInt(t.getCell(row, 11));
                    Project objProject = new Project();
                    objProject.setProjectID(intTempID);
                    objProject.load();
                    intTempID = Integer.parseInt(t.getCell(row, 12));
                    User objUser = new User();
                    objUser.setUserID(intTempID);
                    objUser.load();

                    pObjIssue.assignedUser = new ProjectMember();
                    pObjIssue.assignedUser.setProject(objProject);
                    pObjIssue.assignedUser.setUser(objUser);
                    pObjIssue.assignedUser.load();
                    intTempID = Integer.parseInt(t.getCell(row, 13));
                    objUser = new User();
                    objUser.setUserID(intTempID);
                    objUser.load();
                    pObjIssue.submiter = new ProjectMember();
                    pObjIssue.submiter.setProject(objProject);
                    pObjIssue.submiter.setUser(objUser);
                    pObjIssue.submiter.load();
                    pObjIssue.createdDate = t.getCell(row, 14);
                    pObjIssue.title = t.getCell(row, 15);
                    pObjIssue.description = t.getCell(row, 16);
                    pObjIssue.buildNumber = t.getCell(row, 17);
                    pObjIssue.priority = Integer.parseInt(t.getCell(row, 18));
                    pObjIssue.assignedDate = t.getCell(row, 19);
                    pObjIssue.fixedDate = t.getCell(row, 20);
                    pObjIssue.reproductionSteps = t.getCell(row, 21);
                    pObjIssue.correctiveAction = t.getCell(row, 22);
                    pObjIssue.attachment1 = t.getCell(row, 23);
                    pObjIssue.attachment2 = t.getCell(row, 24);
                    return SysConstant.OK;
                  }
                  return SysConstant.ERROR_RANGE;
                }
                return SysConstant.ERROR;

		// end-user-code
	}
}
