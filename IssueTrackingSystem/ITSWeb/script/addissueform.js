function cboPhase_Change()
{
	document.frmIssue.cboIteration.selectedIndex=0;
	document.frmIssue.cboArtifact.selectedIndex=0;
	document.frmIssue.submit();
}

function cboIteration_Change()
{
	document.frmIssue.cboArtifact.selectedIndex=0;
	document.frmIssue.submit();
}

function cboDomain_Change()
{
	document.frmIssue.cboSubSystem.selectedIndex=0;
	document.frmIssue.submit();
}

function cboAssignedUser_Change()
{
	if(document.frmIssue.cboAssignedUser.selectedIndex!=0){
                if(document.frmIssue.txtAssignDate.value.length==0){
        	        document.frmIssue.txtAssignDate.value = document.frmIssue.txtCurrentDate.value;
                }
	}
}

function txtAssignDate_OnBlur()
{
	if(text_Date(document.frmIssue.txtAssignDate))
	{
		if(compareDate(document.frmIssue.txtAssignDate.value,document.frmIssue.txtCreateDate.value)==-1)
		{
			alert('Assigned date can not be before Create date');
			document.frmIssue.txtAssignDate.focus();
			document.frmIssue.txtAssignDate.select();
		}
	}
}

function txtFixedDate_OnBlur()
{
	if(text_Date(document.frmIssue.txtFixedDate))
	{
		if(compareDate(document.frmIssue.txtFixedDate.value,document.frmIssue.txtAssignDate.value)==-1)
		{
			alert('Fixed date can not be before Assigned date');
			document.frmIssue.txtFixedDate.focus();
			document.frmIssue.txtFixedDate.select();
		}
	}
}

function cmdSave_Click()
{
	document.frmIssue.txtAction.value = '1';
	document.frmIssue.submit();
}

