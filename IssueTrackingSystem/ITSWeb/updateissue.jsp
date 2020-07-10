<%@ page import="tool.*"%>
<%@ page import="ITS.*"%>
<%@ page import="java.util.*"%>
<%
  User actorUser = (User) session.getAttribute("objuser");
  User loginUser = new User();
  loginUser.setUserID(actorUser.getUserID());
  loginUser.load();

  int intSubmit = 0; // 0 first load, 1 form load, 2 save, 3 add comment
  String sError="";
  String sCurrentDate = SimpleDate.getShortCurrentDate();
  //get form data
  String sLoginUserFullName = (String)loginUser.getFullName();
  String sSubmitterFullName = "";
  String sRole = "";
  String sIssueID = Utility.ConvertNullToEmpty(request.getParameter("txtIssue"));
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

  String textEnable = "";
  String comboboxEnable = "";
  String txtFixedDateEnable = "";
  String txtCorrectiveActionEnable = "";
  String cboStatusEnable = "";
  String btnSaveEnable = "";


  if (Utility.ConvertNullToEmpty(request.getParameter("txtAction")).length() != 0) {
    intSubmit = Integer.parseInt(request.getParameter("txtAction"));
  }
  // incorrect when issue is null
  Issue issue = new Issue();
  int iIssueID = 0;
  if(sIssueID.length() == 0){
    sError = "Incorrect issue selected";
  }else{
    // load issue
    iIssueID = Integer.parseInt(sIssueID);
    issue.setIssueID(iIssueID);
    if (issue.load()==SysConstant.ERROR_RANGE){
      sError = "Not exist issue";
    }
  }


  if(sError.length()==0)
  {
    // add comment
    if(intSubmit==3){
      response.sendRedirect("addcomment.jsp?IssueID=" + Integer.toString(issue.getIssueID()));
    }
    // submitter
    ProjectMember submitter = issue.getSubmiter();

    int iStatusID =  0;
    int iKindOfActivityID = 0;
    int iTypeOfActivityID = 0;
    int iArtifactID = 0;
    int iSubSystemID = 0;
    int iReproducibilityID = 0;
    int iIssueTypeID = 0;
    int iSeverityID = 0;
    int iPriorityValue = 0;
    int iEnvironmentID = 0;
    int iPlatformID = 0;
    int iAssignedUserID = 0;
    int iPhaseID = 0;
    int iIterationID = 0;
    int iDomainID = 0;

    // first load issue from data
    if(intSubmit==0){
      iStatusID = issue.getIssuestatus().getStatusID();
      iKindOfActivityID = issue.getKindofactivity().getKindOfActivityID();
      iTypeOfActivityID = issue.getTypeofactivity().getTypeOfActivityID();
      iArtifactID = issue.getArtifact().getArtifactID();
      iSubSystemID = issue.getSubsystem().getSubSystemID();
      iReproducibilityID = issue.getReproducibility().getReproducibilityID();
      iIssueTypeID = issue.getIssuetype().getTypeID();
      iSeverityID = issue.getSeverity().getSeverityID();
      iPriorityValue = issue.getPriority();
      iEnvironmentID = issue.getEnvironment().getEnvironmentID();
      iPlatformID = issue.getPlatform().getPlatformID();
      iAssignedUserID = issue.getAssignedUser().getUser().getUserID();
      Iteration iter = issue.getArtifact().getIteration();
      iIterationID = iter.getIterationID();
      Phase pha = iter.getPhase();
      iPhaseID = pha.getPhaseID();
      Domain dom = issue.getSubsystem().getDomain();
      iDomainID = dom.getDomainID();
      sCreateDate = issue.getCreatedDate();
      sTitle = issue.getTitle();
      sDesription = issue.getDescription();
      sBuildNumber = issue.getBuildNumber();
      sAssignDate = issue.getAssignedDate();
      sFixedDate = issue.getFixedDate();
      sReproductionSteps = issue.getReproductionSteps();
      sCorrectiveAction = issue.getCorrectiveAction();
      sAttachment1 = issue.getAttachment1();
      sAttachment2 = issue.getAttachment2();
    }

    // load issue from submit form
    if(intSubmit != 0){
      if(sStatusID.length() != 0){
        iStatusID = Integer.parseInt(sStatusID);
      }
      if(sKindOfActivityID.length() != 0){
        iKindOfActivityID = Integer.parseInt(sKindOfActivityID);
      }
      if(sTypeOfActivityID.length()!=0){
        iTypeOfActivityID = Integer.parseInt(sTypeOfActivityID);
      }
      if (sArtifactID.length()!=0){
        iArtifactID = Integer.parseInt(sArtifactID);
      }
      if (sSubSystemID.length()!=0){
        iSubSystemID = Integer.parseInt(sSubSystemID);
      }
      if(sReproducibilityID.length()!=0){
        iReproducibilityID = Integer.parseInt(sReproducibilityID);
      }
      if(sIssueTypeID.length()!= 0){
        iIssueTypeID = Integer.parseInt(sIssueTypeID);
      }
      if(sSeverityID.length()!= 0){
        iSeverityID = Integer.parseInt(sSeverityID);
      }
      if(sPriorityValue.length()!= 0){
        iPriorityValue = Integer.parseInt(sPriorityValue);
      }
      if(sEnvironmentID.length() != 0){
        iEnvironmentID = Integer.parseInt(sEnvironmentID);
      }
      if(sPlatformID.length() != 0){
        iPlatformID = Integer.parseInt(sPlatformID);
      }
      if(sAssignedUserID.length() != 0){
        iAssignedUserID = Integer.parseInt(sAssignedUserID);
      }
      if(sPhaseID.length()!= 0){
        iPhaseID = Integer.parseInt(sPhaseID);
      }
      if (sIterationID.length()!=0){
        iIterationID = Integer.parseInt(sIterationID);
      }
      if(sDomainID.length()!= 0){
        iDomainID = Integer.parseInt(sDomainID);
      }

    }


    // status
    IssueStatus issueStatus = new IssueStatus();
    issueStatus.setStatusID(iStatusID); // remeber status of issue
    // kind of activity
    KindOfActivity kindOfActivity = new KindOfActivity();
    kindOfActivity.setKindOfActivityID(iKindOfActivityID); // remember kind of activity of issue
    // type of activity
    TypeOfActivity typeOfActivity = new TypeOfActivity();
    typeOfActivity.setTypeOfActivityID(iTypeOfActivityID); // remember type of Activity of issue
    // artifact
    Artifact artifact = new Artifact();
    artifact.setArtifactID(iArtifactID);// remember iteration of issue
    // subsytem
    SubSystem subsystem = new SubSystem();
    subsystem.setSubSystemID(iSubSystemID);// remember iteration of issue
    // reproducibility
    Reproducibility reproducibility = new Reproducibility();
    reproducibility.setReproducibilityID(iReproducibilityID); // remember type of Activity of issue
    // issue type
    IssueType issueType = new IssueType();
    issueType.setTypeID(iIssueTypeID); // remember domain of issue
    //severity
    Severity severity = new Severity();
    severity.setSeverityID(iSeverityID); // remember domain of issue
    // environment
    Environment environment = new Environment();
    environment.setEnvironmentID(iEnvironmentID);
    // platform
    Platform platform = new Platform();
    platform.setPlatformID(iPlatformID);
    //set up assigned user information
    User assignedUser = new User();
    assignedUser.setUserID(iAssignedUserID); // remember kind of activity of issue
    // assigned user
    ProjectMember assignedProjectMember = new ProjectMember();
    assignedProjectMember.setProject(issue.getAssignedUser().getProject());
    assignedProjectMember.setUser(assignedUser);

    //Get project member information of submitter
    sSubmitterFullName = submitter.getUser().getFullName();
    //Get Project information
    Project project = submitter.getProject();
    sProjectName=project.getName();
    //Get project member information of update user
    ProjectMember loginProjectMember = new ProjectMember();
    loginProjectMember.setProject(project);
    loginProjectMember.setUser(loginUser);
    loginProjectMember.load();
    sRole= loginProjectMember.getRole().getName();
    sTrackingRight = loginProjectMember.getTrackingright().getName();

    ////////////////////////////////////////////////////////////////////////////
    //Save issue
    if(intSubmit==2){
      if(sTitle.length()==0){
        sError = "Title of issue must not be empty";
      }else{
        if ((submitter.getUser().getUserID() == loginUser.getUserID())
        || (loginProjectMember.getTrackingright().getTrackingRightID()==1)){
          issue.setIssue(submitter,issue.getIssueID(),sCreateDate,sTitle,issueStatus,sDesription,kindOfActivity,typeOfActivity,artifact,
          subsystem,sBuildNumber,reproducibility,issueType,severity,iPriorityValue,environment,platform,assignedProjectMember,
          sAssignDate,sFixedDate, sReproductionSteps,sCorrectiveAction,sAttachment1,sAttachment2);
        }else{
          if(loginUser.getUserID() == issue.getAssignedUser().getUser().getUserID()){
            issue.setIssuestatus(issueStatus);
            issue.setFixedDate(sFixedDate);
            issue.setCorrectiveAction(sCorrectiveAction);
          }
        }
        if (issue.update() == SysConstant.OK){
          response.sendRedirect("issuelist.jsp");
          return;
        }else{
          sError = "Database can not connect";
        }
      }
    }

    //Implementation of update right
    if ((submitter.getUser().getUserID() == loginUser.getUserID())
    || (loginProjectMember.getTrackingright().getTrackingRightID()==1)){
      textEnable = "class=\"TextBoxStyle\"";
      comboboxEnable = "";
      txtFixedDateEnable = "class=\"TextBoxStyle\"";
      txtCorrectiveActionEnable = "class=\"TextBoxStyle\"";
      cboStatusEnable = "";
      btnSaveEnable = "";
    }else{
      if(loginUser.getUserID() == assignedUser.getUserID()){
        textEnable = "class=\"ReadOnlyTextBoxStyle\" readonly";
        comboboxEnable = "disabled";
        txtFixedDateEnable = "class=\"TextBoxStyle\"";
        txtCorrectiveActionEnable = "class=\"TextBoxStyle\"";
        cboStatusEnable = "";
        btnSaveEnable = "";
      }else{
        textEnable = "class=\"ReadOnlyTextBoxStyle\" readonly";
        comboboxEnable = "disabled";
        txtFixedDateEnable = "class=\"ReadOnlyTextBoxStyle\" readonly";
        txtCorrectiveActionEnable = "class=\"ReadOnlyTextBoxStyle\" readonly";
        cboStatusEnable = "disabled";
        btnSaveEnable = "disabled";
      }
    }
    //Get department information of login User
    Department department = new Department();
    department.getUserDepartment(loginUser);
    sDepartmentDescription=department.getDescription();
    //Store object set
    Set setTemp;
    Iterator iter;
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
    phase.setPhaseID(iPhaseID);// remember phase of issue
    phase.setProject(project);
    setTemp = phase.getListPhase();
    iter = setTemp.iterator();
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
    iteration.setIterationID(iIterationID);
    if(phase.getPhaseID() == 0){
      sIterationOption = sIterationOption + sDefault;
    }else{
        iteration.setPhase(phase);
        setTemp = iteration.getListIteration();
        iter = setTemp.iterator();
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
    domain.setDomainID(iDomainID); // remember domain of issue
    domain.setProject(project);
    setTemp = domain.getListDomain();
    iter = setTemp.iterator();
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
    setTemp = submitter.getListProjectMember();
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

  }
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<link href="style/formstyle.css" type="text/css" rel="stylesheet">
<title>Update Issue</title>
</head>
<script language=JavaScript src="script/updateissueform.js" type="text/javascript"></script>
<script language=JavaScript src="script/utility.js" type="text/javascript"></script>

<body style="margin-top:0; margin-left:0; margin-right:0; margin-bottom:0 " bgcolor="#84BFE9" onload="frmIssue_Load();">

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
						Update Issue</td>
					</tr>
					<tr>
						<td class="CellBorderFrm">
						<form name="frmIssue" method="POST" action="updateissue.jsp">
							<!--webbot bot="FileUpload" U-File="fpweb:///_private/form_results.csv" S-Format="TEXT/CSV" S-Label-Fields="TRUE" -->
							<table border="0" width="100%" id="table9">
								<tr>
									<td width="40%" class="Label">User: <%=sLoginUserFullName%></td>
									<td width="30%" class="Label">Role: <%=sRole%></td>
									<td width="30%" class="Label">Project: <%=sProjectName%></td>
								</tr>
								<tr>
									<td width="40%" class="Label">Department: <%=sDepartmentDescription%></td>
									<td width="30%" class="Label">Right: <%=sTrackingRight%></td>
									<td width="30%" class="Label">&nbsp;</td>
								</tr>
								<tr>
									<td width="40%" class="Label">Submitter: <%=sSubmitterFullName%></td>
									<td width="30%" class="Label">Create Date :
									<input type="text" name="txtCreateDate" size="20" value="<%=sCreateDate%>" class="ReadOnlyTextBoxStyle" readonly> </td>
									<td width="30%" class="Label">&nbsp;</td>
								</tr>
								<tr>
									<td width="40%" class="Label">Title :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="text" name="txtTitle" size="37" <%=textEnable%> value="<%=sTitle%>" maxlength="100"></td>
									<td width="30%" class="Label">Status :
									<select size="1" name="cboStatus" class="ComboBoxStyle" <%=cboStatusEnable%> onchange="cboDoNoThing();">
                                                                          <%=sStatusOption%>
									</select></td>
									<td width="30%" class="Label">&nbsp;</td>
								</tr>
							</table>
							<table border="0" width="100%" id="table10">
								<tr>
									<td width="96" class="Label">Description :</td>
									<td>
									<textarea rows="5" name="txtDesription" cols="121" <%=textEnable%>><%=sDesription%></textarea></td>
								</tr>
							</table>
							<table border="0" width="100%" id="table11">
								<tr>
									<td class="Label" width="133">Kind of activity:</td>
									<td width="175">
									<select size="1" name="cboKindOfActivity" class="ComboBoxStyle" <%=comboboxEnable%>>
									<%=sKindOfActivityOption%>
									</select></td>
									<td class="Label" width="130">Type:</td>
									<td>
									<select size="1" name="cboType" class="ComboBoxStyle" <%=comboboxEnable%>>
									<%=sIssueTypeOption%>
									</select></td>
								</tr>
								<tr>
									<td class="Label" width="133">Type of activity:</td>
									<td width="175">
									<select size="1" name="cboTypeOfActivity" class="ComboBoxStyle" <%=comboboxEnable%>>
									<%=sTypeOfActivityOption%>
									</select></td>
									<td class="Label" width="130">Severity:</td>
									<td>
									<select size="1" name="cboSeverity" class="ComboBoxStyle" <%=comboboxEnable%>>
									<%=sSeverityOption%>
									</select></td>
								</tr>
								<tr>
									<td class="Label" width="133">Phase:</td>
									<td width="175">
									<select size="1" name="cboPhase" class="ComboBoxStyle" <%=comboboxEnable%> onchange="cboPhase_Change();">
									<%=sPhaseOption%>
									</select></td>
									<td class="Label" width="130">Priority:</td>
									<td>
									<select size="1" name="cboPriority" class="ComboBoxStyle" <%=comboboxEnable%>>
									<%=sPriorityOption%>
									</select></td>
								</tr>
								<tr>
									<td class="Label" width="133">Iteration:</td>
									<td width="175">
									<select size="1" name="cboIteration" class="ComboBoxStyle" <%=comboboxEnable%> onchange="cboIteration_Change();">
									<%=sIterationOption%>
									</select></td>
									<td class="Label" width="130">Environment:</td>
									<td>
									<select size="1" name="cboEnvironment" class="ComboBoxStyle" <%=comboboxEnable%>>
									<%=sEnvironmentOption%>
									</select></td>
								</tr>
								<tr>
									<td class="Label" width="133">Artifact:</td>
									<td width="175">
									<select size="1" name="cboArtifact" class="ComboBoxStyle" <%=comboboxEnable%>>
									<%=sArtifactOption%>
									</select></td>
									<td class="Label" width="130">Platform:</td>
									<td>
									<select size="1" name="cboPlatform" class="ComboBoxStyle" <%=comboboxEnable%>>
									<%=sPlatformOption%>
									</select></td>
								</tr>
								<tr>
									<td class="Label" width="133">Domain: </td>
									<td width="175">
									<select size="1" name="cboDomain" class="ComboBoxStyle" <%=comboboxEnable%> onchange="cboDomain_Change();">
									<%=sDomainOption%>
									</select></td>
									<td class="Label" width="130">Assign to:</td>
									<td>
									<select size="1" name="cboAssignedUser" class="ComboBoxStyle" <%=comboboxEnable%> onchange="cboAssignedUser_Change();">
									<%=sAssignedUserOption%>
									</select></td>
								</tr>
								<tr>
									<td class="Label" width="133">Subsystem:</td>
									<td width="175">
									<select size="1" name="cboSubSystem" class="ComboBoxStyle" <%=comboboxEnable%>>
									<%=sSubSystemOption%>
									</select></td>
									<td class="Label" width="130">Assign date:</td>
									<td><input type="text" name="txtAssignDate" size="20" <%=textEnable%> value="<%=sAssignDate%>" onblur="txtAssignDate_OnBlur();"></td>
								</tr>
								<tr>
									<td class="Label" width="133">Build number:</td>
									<td width="175">
									<input type="text" name="txtBuildNumber" size="20" <%=textEnable%> value="<%=sBuildNumber%>"></td>
									<td class="Label" width="130">Fixed date: </td>
									<td><input type="text" name="txtFixedDate" size="20" <%=txtFixedDateEnable%> value="<%=sFixedDate%>"  onblur="txtFixedDate_OnBlur();"></td>
								</tr>
								<tr>
									<td class="Label" width="133">Reproducibility:</td>
									<td width="175">
									<select size="1" name="cboReproducibility" class="ComboBoxStyle" <%=comboboxEnable%>>
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
									<textarea rows="5" name="txtReproductionSteps" cols="117" <%=textEnable%>><%=sReproductionSteps%></textarea></td>
								</tr>
								<tr>
									<td width="132" class="Label">Corrective
									Action:</td>
									<td>
									<textarea rows="5" name="txtCorrectiveAction" cols="117" <%=txtCorrectiveActionEnable%>><%=sCorrectiveAction%></textarea></td>
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
									<input type="button" value="Save" name="btnSave" class="ButtonStyle" <%=btnSaveEnable%> onclick="cmdSave_Click();">
                                                                        &nbsp;&nbsp;
									<input type="button" value="Add Comment" name="btnAddComment" class="ButtonAutoSizeStyle" onclick="cmdAddComment_Click();"></td>
								</tr>
							</table>
                                                        <input name="txtCurrentDate" ID="txtCurrentDate" value="<%=sCurrentDate%>" type="hidden">
                                                        <input name="txtAction" ID="txtAction" value="" type="hidden">
                                                        <input name="txtIssue" ID="txtIssue" value="<%=sIssueID%>" type="hidden">
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
				<td align = "center">
				<table border="0" width="70%" id="table12" class="BorderTable">
					<tr>
						<td class="CellBorderCaptionFrm">Comments</td>
					</tr>
<%
Set listCommnet = issue.getComment();
Iterator iter = listCommnet.iterator();
String sCommentUser = "";
String sComment = "";
for (int i = 0; iter.hasNext(); i++) {
  Comment cmm = (Comment) iter.next();
  sComment = cmm.getDescription();
  sComment = sComment.replaceAll("\r\n","<br>");
  sCommentUser = cmm.getProjectmember().getUser().getFullName();
%>

					<tr>
						<td class="EvenTableRow">User : <%=sCommentUser%></td>
					</tr>
					<tr>
						<td class="OddTableRow"><%=sComment%></td>
					</tr>
<%
}
%>
				</table>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>
