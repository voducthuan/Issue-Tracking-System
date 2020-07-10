<%@ page import="tool.*"%>
<%@ page import="ITS.*"%>
<%@ page import="java.util.*"%>
<%
  User actorUser = (User) session.getAttribute("objuser");
  User loginUser = new User();
  loginUser.setUserID(actorUser.getUserID());
  loginUser.load();

  int intSubmit = 0; // 1 submit
  String sError="";
  String sCurrentDate = SimpleDate.getShortCurrentDate();
  //get form data
  String sFullName = (String)loginUser.getFullName();
  String sRole = "";
  String sProjectID = Utility.ConvertNullToEmpty(request.getParameter("txtProject"));
  String sProjectName = "";
  String sDepartmentDescription = "";
  String sTrackingRight = "";
  String sCreateDate = Utility.ConvertNullToEmpty(request.getParameter("txtCreateDate"));
  String sTitle = Utility.ConvertNullToEmpty(request.getParameter("txtTitle"));
  String sDesription = Utility.ConvertNullToEmpty(request.getParameter("txtDesription"));
  String sStatusID = Utility.ConvertNullToEmpty(request.getParameter("cboStatus"));
  String sKindOfActivityID = Utility.ConvertNullToEmpty(request.getParameter("cboKindOfActivity"));
  String sTypeOfActivityID = Utility.ConvertNullToEmpty(request.getParameter("cboTypeOfActivity"));
  String sPhaseID = Utility.ConvertNullToEmpty(request.getParameter("cboPhase"));
  String sIterationID = Utility.ConvertNullToEmpty(request.getParameter("cboIteration"));
  String sArtifactID = Utility.ConvertNullToEmpty(request.getParameter("cboArtifact"));
  String sDomainID = Utility.ConvertNullToEmpty(request.getParameter("cboDomain"));
  String sSubSystemID = Utility.ConvertNullToEmpty(request.getParameter("cboSubSystem"));
  String sBuildNumber = Utility.ConvertNullToEmpty(request.getParameter("txtBuildNumber"));
  String sReproducibilityID =  Utility.ConvertNullToEmpty(request.getParameter("cboReproducibility"));
  String sIssueTypeID = Utility.ConvertNullToEmpty(request.getParameter("cboType"));
  String sSeverityID = Utility.ConvertNullToEmpty(request.getParameter("cboSeverity"));
  String sPriorityValue = Utility.ConvertNullToEmpty(request.getParameter("cboPriority"));
  String sEnvironmentID = Utility.ConvertNullToEmpty(request.getParameter("cboEnvironment"));
  String sPlatformID = Utility.ConvertNullToEmpty(request.getParameter("cboPlatform"));
  String sAssignedUserID = Utility.ConvertNullToEmpty(request.getParameter("cboAssignedUser"));
  String sAssignDate = Utility.ConvertNullToEmpty(request.getParameter("txtAssignDate"));
  String sFixedDate = Utility.ConvertNullToEmpty(request.getParameter("txtFixedDate"));
  String sReproductionSteps = Utility.ConvertNullToEmpty(request.getParameter("txtReproductionSteps"));
  String sCorrectiveAction = Utility.ConvertNullToEmpty(request.getParameter("txtCorrectiveAction"));
  String sAttachment1 = Utility.ConvertNullToEmpty(request.getParameter("bfbAttachment1"));
  String sAttachment2 = Utility.ConvertNullToEmpty(request.getParameter("bfbAttachment2"));


  String sDefault="<option selected value=\"0\">Default value</option>";
  String sDefaultNS="<option value=\"0\">Default value</option>";
  String sStatusOption="";
  String sKindOfActivityOption="";
  String sTypeOfActivityOption="";
  String sPhaseOption="";
  String sIterationOption="";
  String sArtifactOption="";
  String sDomainOption="";
  String sSubSystemOption="";
  String sReproducibilityOption =  "";
  String sIssueTypeOption = "";
  String sSeverityOption = "";
  String sPriorityOption ="";
  String sEnvironmentOption = "";
  String sPlatformOption = "";
  String sAssignedUserOption = "";


  if (Utility.ConvertNullToEmpty(request.getParameter("txtAction")).length() != 0) {
    intSubmit = Integer.parseInt(request.getParameter("txtAction"));
  }
  //
  if(sProjectID.length() == 0){
    sError = "Incorrect project selected";
  }else{

  }

  Project project = new Project();
  ProjectMember projectMember = new ProjectMember();
  Department department = new Department();
  if(sError.length()==0)
  {
    // project
    project.setProjectID(Integer.parseInt(sProjectID));
    // submiter or login user
    projectMember.setProject(project);
    projectMember.setUser(loginUser);
    // status
    IssueStatus issueStatus = new IssueStatus();
    int iStatusID =  0;
    if(sStatusID.length() != 0){
      iStatusID = Integer.parseInt(sStatusID);
    }
    issueStatus.setStatusID(iStatusID); // remeber status of issue
    // kind of activity
    KindOfActivity kindOfActivity = new KindOfActivity();
    int iKindOfActivityID = 0;
    if(sKindOfActivityID.length() != 0){
      iKindOfActivityID = Integer.parseInt(sKindOfActivityID);
    }
    kindOfActivity.setKindOfActivityID(iKindOfActivityID); // remember kind of activity of issue
    // type of activity
    TypeOfActivity typeOfActivity = new TypeOfActivity();
    // Default value
    int iTypeOfActivityID = 0;
    if(sTypeOfActivityID.length()!=0){
      iTypeOfActivityID = Integer.parseInt(sTypeOfActivityID);
    }
    typeOfActivity.setTypeOfActivityID(iTypeOfActivityID); // remember type of Activity of issue
    // artifact
    Artifact artifact = new Artifact();
    int iArtifactID = 0;
    if (sArtifactID.length()!=0){
      iArtifactID = Integer.parseInt(sArtifactID);
    }
    artifact.setArtifactID(iArtifactID);// remember iteration of issue
    // subsytem
    SubSystem subsystem = new SubSystem();
    int iSubSystemID = 0;
    if (sSubSystemID.length()!=0){
      iSubSystemID = Integer.parseInt(sSubSystemID);
    }
    subsystem.setSubSystemID(iSubSystemID);// remember iteration of issue
    // reproducibility
    Reproducibility reproducibility = new Reproducibility();
    int iReproducibilityID = 0;
    if(sReproducibilityID.length()!=0){
      iReproducibilityID = Integer.parseInt(sReproducibilityID);
    }
    reproducibility.setReproducibilityID(iReproducibilityID); // remember type of Activity of issue
    // issue type
    IssueType issueType = new IssueType();
    int iIssueTypeID = 0;
    if(sIssueTypeID.length()!= 0){
      iIssueTypeID = Integer.parseInt(sIssueTypeID);
    }
    issueType.setTypeID(iIssueTypeID); // remember domain of issue
    //severity
    Severity severity = new Severity();
    int iSeverityID = 0;
    if(sSeverityID.length()!= 0){
      iSeverityID = Integer.parseInt(sSeverityID);
    }
    severity.setSeverityID(iSeverityID); // remember domain of issue
    // priority
    int iPriorityValue = 0;
    if(sPriorityValue.length()!= 0){
      iPriorityValue = Integer.parseInt(sPriorityValue);
    }
    // environment
    Environment environment = new Environment();
    int iEnvironmentID = 0;
    if(sEnvironmentID.length() != 0){
      iEnvironmentID = Integer.parseInt(sEnvironmentID);
    }
    environment.setEnvironmentID(iEnvironmentID);
    // platform
    Platform platform = new Platform();
    int iPlatformID = 0;
    if(sPlatformID.length() != 0){
      iPlatformID = Integer.parseInt(sPlatformID);
    }
    platform.setPlatformID(iPlatformID);
    //set up assigned user information
    ProjectMember assignedProjectMember = new ProjectMember();
    assignedProjectMember.setProject(project);
    User assignedUser = new User();
    int iAssignedUserID = 0;
    if(sAssignedUserID.length() != 0){
      iAssignedUserID = Integer.parseInt(sAssignedUserID);
    }
    assignedUser.setUserID(iAssignedUserID); // remember kind of activity of issue
    assignedProjectMember.setUser(assignedUser);

    ////////////////////////////////////////////////////////////////////////////
    //Save issue
    if(intSubmit==1){
      if(sTitle.length()==0){
        sError = "Title of issue must not be empty";
      }else{
        Issue issue = new Issue();
        issue.setIssue(projectMember,0,sCreateDate,sTitle,issueStatus,sDesription,kindOfActivity,typeOfActivity,artifact,
        subsystem,sBuildNumber,reproducibility,issueType,severity,iPriorityValue,environment,platform,assignedProjectMember,
        sAssignDate,sFixedDate, sReproductionSteps,sCorrectiveAction,sAttachment1,sAttachment2);
        if (issue.add() == SysConstant.OK){
          response.sendRedirect("issuelist.jsp");
          return;
        }else{
          sError = "Database can not connect";
        }
      }
    }
    //Get Project information
    project.load();
    sProjectName=project.getName();
    //Get project member information of this user or submitter
    projectMember.load();
    sRole=projectMember.getRole().getName();
    sTrackingRight = projectMember.getTrackingright().getName();
    //Get department information of login User
    department.getUserDepartment(loginUser);
    sDepartmentDescription=department.getDescription();
    //Store object set
    Set setTemp;
    Iterator iter;
    ///////////////////////////////////////////////////////////////////////////
    //Get default crate date
    if(sCreateDate.length() == 0){
      sCreateDate = sCreateDate + sCurrentDate; // have a copy of current date. Not assign directly because in java string is reference address
    }
    ///////////////////////////////////////////////////////////////////////////
    //Get list of Issue Status
    issueStatus.setProject(project);
    setTemp = issueStatus.getListIssueStatus();
    iter = setTemp.iterator();
    if(iStatusID == 0){
      sStatusOption = sStatusOption + sDefault;
    }else{
      sStatusOption = sStatusOption + sDefaultNS;
    }
    for (int i = 0; iter.hasNext(); i++) {
      IssueStatus isst = (IssueStatus) iter.next();
      // Already select value
      if (iStatusID == isst.getStatusID()) {
        sStatusOption = sStatusOption + "<option selected value=\"" + isst.getStatusID() + "\" >" + isst.getName() + "</option>";
      }
      else{
        sStatusOption = sStatusOption + "<option value=\"" + isst.getStatusID() + "\" >" + isst.getName() + "</option>";
      }
    }
    ///////////////////////////////////////////////////////////////////////////
    //Get list of Kind of Activity
    setTemp = kindOfActivity.getAllKindOfActivity();
    iter = setTemp.iterator();
    if(iKindOfActivityID == 0){
      sKindOfActivityOption = sKindOfActivityOption + sDefault;
    }else{
      sKindOfActivityOption = sKindOfActivityOption + sDefaultNS;
    }
    for (int i = 0; iter.hasNext(); i++) {
      KindOfActivity koa = (KindOfActivity) iter.next();
      // Already select value
      if (iKindOfActivityID == koa.getKindOfActivityID()) {
        sKindOfActivityOption = sKindOfActivityOption + "<option selected value=\"" + koa.getKindOfActivityID() + "\" >" + koa.getName() + "</option>";
      }
      else{
        sKindOfActivityOption = sKindOfActivityOption + "<option value=\"" + koa.getKindOfActivityID() + "\" >" + koa.getName() + "</option>";
      }
    }
    ///////////////////////////////////////////////////////////////////////////
    //Get list of Type of Activity
    setTemp = typeOfActivity.getAllTypeOfActivity();
    iter = setTemp.iterator();
    if(iTypeOfActivityID == 0){
      sTypeOfActivityOption = sTypeOfActivityOption + sDefault;
    }else{
      sTypeOfActivityOption = sTypeOfActivityOption + sDefaultNS;
    }
    for (int i = 0; iter.hasNext(); i++) {
      TypeOfActivity toa= (TypeOfActivity) iter.next();
      // Already select value
      if (iTypeOfActivityID == toa.getTypeOfActivityID()) {
        sTypeOfActivityOption = sTypeOfActivityOption + "<option selected value=\"" + toa.getTypeOfActivityID() + "\" >" + toa.getName() + "</option>";
      }
      else{
        sTypeOfActivityOption = sTypeOfActivityOption + "<option value=\"" + toa.getTypeOfActivityID() + "\" >" + toa.getName() + "</option>";
      }
    }
    ///////////////////////////////////////////////////////////////////////////
    //Get list of Phase
    Phase phase = new Phase();
    phase.setProject(project);
    setTemp = phase.getListPhase();
    iter = setTemp.iterator();
    // Default value
    int iPhaseID = 0;
    if(sPhaseID.length()!= 0){
      iPhaseID = Integer.parseInt(sPhaseID);
    }
    phase.setPhaseID(iPhaseID); // remember phase of issue
    if(iPhaseID==0){
      sPhaseOption = sPhaseOption + sDefault;
    }else{
      sPhaseOption = sPhaseOption + sDefaultNS;
    }
    for (int i = 0; iter.hasNext(); i++) {
      Phase  phs = (Phase) iter.next();
      // Already select value
      if (iPhaseID == phs.getPhaseID()) {
        sPhaseOption = sPhaseOption + "<option selected value=\"" + phs.getPhaseID() + "\" >" + phs.getDescription() + "</option>";
      }
      else{
        sPhaseOption = sPhaseOption + "<option value=\"" + phs.getPhaseID() + "\" >" + phs.getDescription() + "</option>";
      }
    }
    ///////////////////////////////////////////////////////////////////////////
    //Get list of Iteration
    Iteration iteration = new Iteration();
    if(phase.getPhaseID() == 0){
      sIterationOption = sIterationOption + sDefault;
    }else{
        iteration.setPhase(phase);
        setTemp = iteration.getListIteration();
        iter = setTemp.iterator();
        // Default value
        int iIterationID = 0;
        if (sIterationID.length()!=0){
          iIterationID = Integer.parseInt(sIterationID);
        }
        iteration.setIterationID(iIterationID);// remember iteration of issue
        if(iIterationID==0){
          sIterationOption = sIterationOption + sDefault;
        }else{
          sIterationOption = sIterationOption + sDefaultNS;
        }
        for (int i = 0; iter.hasNext(); i++) {
          Iteration itt = (Iteration) iter.next();
          // Already select value
          if (iIterationID == itt.getIterationID()) {
            sIterationOption = sIterationOption + "<option selected value=\"" + itt.getIterationID() + "\" >" + itt.getDescription() + "</option>";
          }
          else{
            sIterationOption = sIterationOption + "<option value=\"" + itt.getIterationID() + "\" >" + itt.getDescription() + "</option>";
          }
        }
    }
    ///////////////////////////////////////////////////////////////////////////
    //Get list of Artifact
    if(iteration.getIterationID() == 0){
      sArtifactOption = sArtifactOption + sDefault;
    }else{
        artifact.setIteration(iteration);
        setTemp = artifact.getListArtifact();
        iter = setTemp.iterator();
        if(iArtifactID==0){
          sArtifactOption = sArtifactOption + sDefault;
        }else{
          sArtifactOption = sArtifactOption + sDefaultNS;
        }
        for (int i = 0; iter.hasNext(); i++) {
          Artifact atf = (Artifact) iter.next();
          // Already select value
          if (iArtifactID == atf.getArtifactID()) {
            sArtifactOption = sArtifactOption + "<option selected value=\"" + atf.getArtifactID() + "\" >" + atf.getDescription() + "</option>";
          }
          else{
            sArtifactOption = sArtifactOption + "<option value=\"" + atf.getArtifactID() + "\" >" + atf.getDescription() + "</option>";
          }
        }
    }
    ///////////////////////////////////////////////////////////////////////////
    //Get list of Domain
    Domain domain = new Domain();
    domain.setProject(project);
    setTemp = domain.getListDomain();
    iter = setTemp.iterator();
    // Default value
    int iDomainID = 0;
    if(sDomainID.length()!= 0){
      iDomainID = Integer.parseInt(sDomainID);
    }
    domain.setDomainID(iDomainID); // remember domain of issue
    if(iDomainID==0){
      sDomainOption = sDomainOption + sDefault;
    }else{
      sDomainOption = sDomainOption + sDefaultNS;
    }
    for (int i = 0; iter.hasNext(); i++) {
      Domain  dmn = (Domain) iter.next();
      // Already select value
      if (iDomainID == dmn.getDomainID()) {
        sDomainOption = sDomainOption + "<option selected value=\"" + dmn.getDomainID() + "\" >" + dmn.getName() + "</option>";
      }
      else{
        sDomainOption = sDomainOption + "<option value=\"" + dmn.getDomainID() + "\" >" + dmn.getName() + "</option>";
      }
    }
    ///////////////////////////////////////////////////////////////////////////
    //Get list of Subsystem
    if(domain.getDomainID() == 0){
      sSubSystemOption = sSubSystemOption + sDefault;
    }else{
        subsystem.setDomain(domain);
        setTemp = subsystem.getListSubSystem();
        iter = setTemp.iterator();
        if(iSubSystemID==0){
          sSubSystemOption = sSubSystemOption + sDefault;
        }else{
          sSubSystemOption = sSubSystemOption + sDefaultNS;
        }
        for (int i = 0; iter.hasNext(); i++) {
          SubSystem sst = (SubSystem) iter.next();
          // Already select value
          if (iSubSystemID == sst.getSubSystemID()) {
            sSubSystemOption = sSubSystemOption + "<option selected value=\"" + sst.getSubSystemID() + "\" >" + sst.getName() + "</option>";
          }
          else{
            sSubSystemOption = sSubSystemOption + "<option value=\"" + sst.getSubSystemID() + "\" >" + sst.getName() + "</option>";
          }
        }
    }
    ///////////////////////////////////////////////////////////////////////////
    //Get list of Reproducibility
    setTemp = reproducibility.getAllReproducibility();
    iter = setTemp.iterator();
    if(iReproducibilityID == 0){
      sReproducibilityOption = sReproducibilityOption + sDefault;
    }else{
      sReproducibilityOption = sReproducibilityOption + sDefaultNS;
    }
    for (int i = 0; iter.hasNext(); i++) {
      Reproducibility rdl= (Reproducibility) iter.next();
      // Already select value
      if (iReproducibilityID == rdl.getReproducibilityID()) {
        sReproducibilityOption = sReproducibilityOption + "<option selected value=\"" + rdl.getReproducibilityID() + "\" >" + rdl.getName() + "</option>";
      }
      else{
        sReproducibilityOption = sReproducibilityOption + "<option value=\"" + rdl.getReproducibilityID() + "\" >" + rdl.getName() + "</option>";
      }
    }
    ///////////////////////////////////////////////////////////////////////////
    //Get list of Issue Type
    issueType.setProject(project);
    setTemp = issueType.getListIssueType();
    iter = setTemp.iterator();
    if(iIssueTypeID==0){
      sIssueTypeOption = sIssueTypeOption + sDefault;
    }else{
      sIssueTypeOption = sIssueTypeOption + sDefaultNS;
    }
    for (int i = 0; iter.hasNext(); i++) {
      IssueType  itp = (IssueType) iter.next();
      // Already select value
      if (iIssueTypeID == itp.getTypeID()) {
        sIssueTypeOption = sIssueTypeOption + "<option selected value=\"" + itp.getTypeID() + "\" >" + itp.getName() + "</option>";
      }
      else{
        sIssueTypeOption = sIssueTypeOption + "<option value=\"" + itp.getTypeID() + "\" >" + itp.getName() + "</option>";
      }
    }

    ///////////////////////////////////////////////////////////////////////////
    //Get list of Severity
    severity.setProject(project);
    setTemp = severity.getListSeverity();
    iter = setTemp.iterator();
    if(iSeverityID==0){
      sSeverityOption = sSeverityOption + sDefault;
    }else{
      sSeverityOption = sSeverityOption + sDefaultNS;
    }
    for (int i = 0; iter.hasNext(); i++) {
      Severity  svt = (Severity) iter.next();
      // Already select value
      if (iSeverityID == svt.getSeverityID()) {
        sSeverityOption = sSeverityOption + "<option selected value=\"" + svt.getSeverityID() + "\" >" + svt.getName() + "</option>";
      }
      else{
        sSeverityOption = sSeverityOption + "<option value=\"" + svt.getSeverityID() + "\" >" + svt.getName() + "</option>";
      }
    }
    ///////////////////////////////////////////////////////////////////////////
    //Get list of Priority
    if(iPriorityValue==0){
      sPriorityOption = "<option selected value=\"0\">0</option>";
    }else{
      sPriorityOption = "<option value=\"0\">0</option>";;
    }
    for (int i = 1; i<6; i++) {
      // Already select value
      if (iPriorityValue == i) {
        sPriorityOption = sPriorityOption + "<option selected value=\"" + i + "\" >" + i + "</option>";
      }
      else{
        sPriorityOption = sPriorityOption + "<option value=\"" + i + "\" >" + i + "</option>";
      }
    }
    ///////////////////////////////////////////////////////////////////////////
    //Get list of Environment
    setTemp = environment.getAllEnvironment();
    iter = setTemp.iterator();
    environment.setEnvironmentID(iEnvironmentID); // remember kind of activity of issue
    if(iEnvironmentID == 0){
      sEnvironmentOption = sEnvironmentOption + sDefault;
    }else{
      sEnvironmentOption = sEnvironmentOption + sDefaultNS;
    }
    for (int i = 0; iter.hasNext(); i++) {
      Environment evr = (Environment) iter.next();
      // Already select value
      if (iEnvironmentID == evr.getEnvironmentID()) {
        sEnvironmentOption = sEnvironmentOption + "<option selected value=\"" + evr.getEnvironmentID() + "\" >" + evr.getName() + "</option>";
      }
      else{
        sEnvironmentOption = sEnvironmentOption + "<option value=\"" + evr.getEnvironmentID() + "\" >" + evr.getName() + "</option>";
      }
    }
    ///////////////////////////////////////////////////////////////////////////
    //Get list of Platform
    setTemp = platform.getAllPlatform();
    iter = setTemp.iterator();
    platform.setPlatformID(iPlatformID); // remember kind of activity of issue
    if(iPlatformID == 0){
      sPlatformOption = sPlatformOption + sDefault;
    }else{
      sPlatformOption = sPlatformOption + sDefaultNS;
    }
    for (int i = 0; iter.hasNext(); i++) {
      Platform pfm = (Platform) iter.next();
      // Already select value
      if (iPlatformID == pfm.getPlatformID()) {
        sPlatformOption = sPlatformOption + "<option selected value=\"" + pfm.getPlatformID() + "\" >" + pfm.getName() + "</option>";
      }
      else{
        sPlatformOption = sPlatformOption + "<option value=\"" + pfm.getPlatformID() + "\" >" + pfm.getName() + "</option>";
      }
    }
    ///////////////////////////////////////////////////////////////////////////
    //Get list of assigned user
    setTemp = projectMember.getListProjectMember();
    iter = setTemp.iterator();
    if(iAssignedUserID == 0){
      sAssignedUserOption = sAssignedUserOption + sDefault;
    }else{
      sAssignedUserOption = sAssignedUserOption + sDefaultNS;
    }
    for (int i = 0; iter.hasNext(); i++) {
      ProjectMember pmb = (ProjectMember) iter.next();
      // Already select value
      if (iAssignedUserID == pmb.getUser().getUserID()) {
        sAssignedUserOption = sAssignedUserOption + "<option selected value=\"" + pmb.getUser().getUserID() + "\" >" + pmb.getUser().getFullName() + "</option>";
      }
      else{
        sAssignedUserOption = sAssignedUserOption + "<option value=\"" + pmb.getUser().getUserID() + "\" >" + pmb.getUser().getFullName() + "</option>";
      }
    }
    /*//////////////////////////////////////////////////////////////////////////
    //Get default Assign date
    if(sAssignDate.length() == 0){
      sAssignDate = tool.SimpleDate.getShortCurrentDate();
    }
    ///////////////////////////////////////////////////////////////////////////
    //Get default Fix date
    if(sFixedDate.length() == 0){
      sFixedDate = tool.SimpleDate.getShortCurrentDate();
    }*/

  }
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<link href="style/formstyle.css" type="text/css" rel="stylesheet">
<title>Add Issue</title>
</head>
<script language=JavaScript src="script/addissueform.js" type="text/javascript"></script>
<script language=JavaScript src="script/utility.js" type="text/javascript"></script>

<body style="margin-top:0; margin-left:0; margin-right:0; margin-bottom:0 " bgcolor="#84BFE9">

<jsp:include page="header.jsp" flush="true"/>
<jsp:include page="menuissuetracking.jsp" flush="true"/>
	<tr>
		<td>
		<table border="0" width="100%" id="table6" bgcolor="#FFFFFF">
			<tr>
				<td class="ErrMsg" align="center"><%=sError%></td>
			</tr>
			<tr>
				<td align="center">
				<table border="0" width="70%" id="table7" class="TableBorderFrm">
					<tr>
						<td class="CellBorderCaptionFrm">
						<img border="0" src="images/issue.gif" width="16" height="16" alt="">
						Add Issue</td>
					</tr>
					<tr>
						<td class="CellBorderFrm">
						<form name="frmIssue" method="POST" action="addissue.jsp">
							<!--webbot bot="FileUpload" U-File="fpweb:///_private/form_results.csv" S-Format="TEXT/CSV" S-Label-Fields="TRUE" -->
							<table border="0" width="100%" id="table9">
								<tr>
									<td width="40%" class="Label">User: <%=sFullName%></td>
									<td width="30%" class="Label">Role: <%=sRole%></td>
									<td width="30%" class="Label">Project: <%=sProjectName%></td>
								</tr>
								<tr>
									<td width="40%" class="Label">Department: <%=sDepartmentDescription%></td>
									<td width="30%" class="Label">Right: <%=sTrackingRight%></td>
									<td width="30%" class="Label">&nbsp;</td>
								</tr>
								<tr>
									<td width="40%" class="Label">Submitter: <%=sFullName%></td>
									<td width="30%" class="Label">Create Date :
									<input type="text" name="txtCreateDate" size="20" value="<%=sCreateDate%>" class="ReadOnlyTextBoxStyle" readonly> </td>
									<td width="30%" class="Label">&nbsp;</td>
								</tr>
								<tr>
									<td width="40%" class="Label">Title :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="text" name="txtTitle" size="37" class="TextBoxStyle" value="<%=sTitle%>" maxlength="100"></td>
									<td width="30%" class="Label">Status :
									<select size="1" name="cboStatus" class="ComboBoxStyle">
                                                                          <%=sStatusOption%>
									</select></td>
									<td width="30%" class="Label">&nbsp;</td>
								</tr>
							</table>
							<table border="0" width="100%" id="table10">
								<tr>
									<td width="96" class="Label">Description :</td>
									<td>
									<textarea rows="5" name="txtDesription" cols="121" class="TextBoxStyle"><%=sDesription%></textarea></td>
								</tr>
							</table>
							<table border="0" width="100%" id="table11">
								<tr>
									<td class="Label" width="133">Kind of activity:</td>
									<td width="175">
									<select size="1" name="cboKindOfActivity" class="ComboBoxStyle">
									<%=sKindOfActivityOption%>
									</select></td>
									<td class="Label" width="130">Type:</td>
									<td>
									<select size="1" name="cboType" class="ComboBoxStyle">
									<%=sIssueTypeOption%>
									</select></td>
								</tr>
								<tr>
									<td class="Label" width="133">Type of activity:</td>
									<td width="175">
									<select size="1" name="cboTypeOfActivity" class="ComboBoxStyle">
									<%=sTypeOfActivityOption%>
									</select></td>
									<td class="Label" width="130">Severity:</td>
									<td>
									<select size="1" name="cboSeverity" class="ComboBoxStyle">
									<%=sSeverityOption%>
									</select></td>
								</tr>
								<tr>
									<td class="Label" width="133">Phase:</td>
									<td width="175">
									<select size="1" name="cboPhase" class="ComboBoxStyle" onchange="cboPhase_Change();">
									<%=sPhaseOption%>
									</select></td>
									<td class="Label" width="130">Priority:</td>
									<td>
									<select size="1" name="cboPriority" class="ComboBoxStyle">
									<%=sPriorityOption%>
									</select></td>
								</tr>
								<tr>
									<td class="Label" width="133">Iteration:</td>
									<td width="175">
									<select size="1" name="cboIteration" class="ComboBoxStyle" onchange="cboIteration_Change();">
									<%=sIterationOption%>
									</select></td>
									<td class="Label" width="130">Environment:</td>
									<td>
									<select size="1" name="cboEnvironment" class="ComboBoxStyle">
									<%=sEnvironmentOption%>
									</select></td>
								</tr>
								<tr>
									<td class="Label" width="133">Artifact:</td>
									<td width="175">
									<select size="1" name="cboArtifact" class="ComboBoxStyle">
									<%=sArtifactOption%>
									</select></td>
									<td class="Label" width="130">Platform:</td>
									<td>
									<select size="1" name="cboPlatform" class="ComboBoxStyle">
									<%=sPlatformOption%>
									</select></td>
								</tr>
								<tr>
									<td class="Label" width="133">Domain: </td>
									<td width="175">
									<select size="1" name="cboDomain" class="ComboBoxStyle"  onchange="cboDomain_Change();">
									<%=sDomainOption%>
									</select></td>
									<td class="Label" width="130">Assign to:</td>
									<td>
									<select size="1" name="cboAssignedUser" class="ComboBoxStyle" onchange="cboAssignedUser_Change();">
									<%=sAssignedUserOption%>
									</select></td>
								</tr>
								<tr>
									<td class="Label" width="133">Subsystem:</td>
									<td width="175">
									<select size="1" name="cboSubSystem" class="ComboBoxStyle">
									<%=sSubSystemOption%>
									</select></td>
									<td class="Label" width="130">Assign date:</td>
									<td><input type="text" name="txtAssignDate" size="20" class="TextBoxStyle" value="<%=sAssignDate%>" onblur="txtAssignDate_OnBlur();"></td>
								</tr>
								<tr>
									<td class="Label" width="133">Build number:</td>
									<td width="175">
									<input type="text" name="txtBuildNumber" size="20" class="TextBoxStyle" value="<%=sBuildNumber%>"></td>
									<td class="Label" width="130">Fixed date: </td>
									<td><input type="text" name="txtFixedDate" size="20" class="TextBoxStyle" value="<%=sFixedDate%>"  onblur="txtFixedDate_OnBlur();"></td>
								</tr>
								<tr>
									<td class="Label" width="133">Reproducibility:</td>
									<td width="175">
									<select size="1" name="cboReproducibility" class="ComboBoxStyle">
									<%=sReproducibilityOption%>
									</select></td>
									<td class="Label" width="130">&nbsp;</td>
									<td>
									&nbsp;</td>
								</tr>
								</table>
							<table border="0" width="100%" id="table8">
								<tr>
									<td class="Label" width="132">Reproduction
									steps: </td>
									<td>
									<textarea rows="5" name="txtReproductionSteps" cols="117" class="TextBoxStyle"><%=sReproductionSteps%></textarea></td>
								</tr>
								<tr>
									<td width="132" class="Label">Corrective
									Action:</td>
									<td>
									<textarea rows="5" name="txtCorrectiveAction" cols="117" class="TextBoxStyle"><%=sCorrectiveAction%></textarea></td>
								</tr>
                                                                <!--
								<tr>
									<td width="132" class="Label">Attachment 1:</td>
									<td>
									<input type="file" name="bfbAttachment1" size="20"></td>
								</tr>
								<tr>
									<td width="132" class="Label">Attachment 2:</td>
									<td>
									<input type="file" name="bfbAttachment2" size="20"></td>
								</tr>
                                                                -->
								<tr>
									<td width="132" class="Label">&nbsp;</td>
									<td>
									<input type="button" value="Save" name="btnSave" class="ButtonStyle" onclick="cmdSave_Click();"></td>
								</tr>
							</table>
                                                        <input name="txtCurrentDate" ID="txtCurrentDate" value="<%=sCurrentDate%>" type="hidden">
                                                        <input name="txtAction" ID="txtAction" value="" type="hidden">
                                                        <input name="txtProject" ID="txtProject" value="<%=sProjectID%>" type="hidden">
						</form>
						</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>
