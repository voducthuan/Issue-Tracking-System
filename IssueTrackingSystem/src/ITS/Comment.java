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
public class Comment {
        /**
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        private ProjectMember projectmember;
        private int commentID;
        private String description;
        private Issue issue;
        /**
         * @return the projectmember
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public ProjectMember getProjectmember() {
                // begin-user-code
                return projectmember;
                // end-user-code
        }

        /**
         * @param theProjectmember the projectmember to set
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public void setProjectmember(ProjectMember theProjectmember) {
                // begin-user-code
                projectmember = theProjectmember;
                // end-user-code
        }

        /**
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */


        /**
         * @return the commentID
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public int getCommentID() {
                // begin-user-code
                return commentID;
                // end-user-code
        }

        /**
         * @param theCommentID the commentID to set
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public void setCommentID(int theCommentID) {
                // begin-user-code
                commentID = theCommentID;
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
         * @return the issue
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public Issue getIssue() {
                // begin-user-code
                return issue;
                // end-user-code
        }

        /**
         * @param theIssue the issue to set
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public void setIssue(Issue theIssue) {
                // begin-user-code
                issue = theIssue;
                // end-user-code
        }

        /**
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public int add() {
                // begin-user-code
                // TODO Auto-generated method stub
                CommentDB db = new CommentDB();
                int intResult;

                Project objProject = this.projectmember.getProject();
                User objUser = this.projectmember.getUser();
                Issue objIssue = this.getIssue();
                // xem lai row ben duoi
                intResult = db.add(this.description, objProject.getProjectID(),objUser.getUserID(),objIssue.getIssueID());
                return intResult;

                // end-user-code
        }

        /**
         * @param pID
         * @param pDescription
         * @param pProjectMember
         * @param pIssue
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public int setComment(int pID, String pDescription,
                        ProjectMember pProjectMember, Issue pIssue) {
                // begin-user-code
                // TODO Auto-generated method stub
                this.commentID = pID;
                this.projectmember = pProjectMember;
                this.description = pDescription;
                this.issue = pIssue;
                return 0;
                // end-user-code
        }

        /**
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public Set getListIssueComment() {
                // begin-user-code
                // TODO Auto-generated method stub
                HashSet result = null;
                CommentDB db = new CommentDB();
                Table t = db.getListIssueComment(issue.getIssueID());
                if (t!=null)
                {
                  result = new HashSet();
                  for(int i = 0; i<t.getRowsCount(); i++)
                  {
                    Comment p = new Comment();
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
                CommentDB db = new CommentDB();
                Table t = db.getComment(this.commentID);
                return this.loadRow(t,0,this);

                // end-user-code
        }

        /**
         * @param t
         * @param row
         * @return
         * @generated "UML to Java V5.0 (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
         */
        public int loadRow(Table t, int row, Comment pObjComment) {
                // begin-user-code
                // TODO Auto-generated method stub
                int intIssueID,intProjectID,intUserID;
                if (t!=null){
                  int count = t.getRowsCount();
                  if (row >= 0 && row < count) {
                    pObjComment.commentID = Integer.parseInt(t.getCell(row, 0));
                    intIssueID = Integer.parseInt(t.getCell(row, 1));
                    intProjectID = Integer.parseInt(t.getCell(row, 2));
                    intUserID = Integer.parseInt(t.getCell(row, 3));
                    pObjComment.description = t.getCell(row, 4);

                    pObjComment.issue = new Issue();
                    pObjComment.issue.setIssueID(intIssueID);
                    pObjComment.issue.load();

                    pObjComment.projectmember = new ProjectMember();
                    //Xem lai 2 rows ben duoi
                    //pObjComment.projectmember.setProjectID(intProjectID);
                    //pObjComment.projectmember.setUserID(intUserID);
                    Project objProject = new Project();
                    objProject.setProjectID(intProjectID);
                    objProject.load();
                    User objUser = new User();
                    objUser.setUserID(intUserID);
                    objUser.load();

                    pObjComment.projectmember.setProject(objProject);
                    pObjComment.projectmember.setUser(objUser);
                    pObjComment.projectmember.load();

                    return SysConstant.OK;
                  }
                  return SysConstant.ERROR_RANGE;
                }
                return SysConstant.ERROR;


                // end-user-code
        }
}
