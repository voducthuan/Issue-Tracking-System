function text_Date(textBox)
{
	result=true;
	if(textBox.value!='')
	{
		if(!isDate(textBox.value)){
			window.alert('Incorrect Date');
			textBox.focus();
			textBox.select();
			result=false;
		}
	}
	else
		result=false;
	return result;
}
function isDate(textValue){
	if(hasTwoFlash(textValue)){
		myDay = textValue.substring(0, textValue.indexOf("/"));
		if(isNaN(myDay))  return false;
		myMonth = textValue.substring(textValue.indexOf("/")+1, textValue.lastIndexOf("/"));
		if(isNaN(myMonth))  return false;
		myYear = textValue.substring(textValue.lastIndexOf("/")+1);
		if(isNaN(myYear))  return false;
		iYear = parseInt(myYear,10);
		if(iYear>2100)  return false;
		if(iYear<1900)  return false;
		iMonth = parseInt(myMonth,10);
		if(iMonth>12)  return false;
		if(iMonth<0)  return false;
		iDay = parseInt(myDay,10);
		if(iDay<0)  return false;
		aDays = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
		if(iMonth==2)
		{

			if(isLeapYear(myYear))
			{
				if(iDay>29) return false;
			}
			else
			{
				if(iDay>aDays[1])  return false;
			}
		}
		else
		{
			if(iDay>aDays[iMonth-1])  return false;
		}
		return true;
	}
	return false;
}
function hasTwoFlash(textValue){
	if(textValue.indexOf("/")!=-1)
		if(textValue.lastIndexOf("/")!=-1)
			if(textValue.indexOf("/")!=textValue.lastIndexOf("/"))
				if((textValue.substring(textValue.indexOf("/")+1, textValue.lastIndexOf("/"))).indexOf("/")==-1)
					return true;
	return false;
}
function isLeapYear(strYear){
	iYear = parseInt(strYear,10);
	if((iYear%4==0) && (!(iYear%100==0)) || (iYear%400==0))
		return true;
	return false;
}
function compareDate(sD1,sD2)
{
	d1=parseInt(sD1.substring(0, sD1.indexOf("/")));
	m1=parseInt(sD1.substring(sD1.indexOf("/")+1, sD1.lastIndexOf("/")));
	y1=parseInt(sD1.substring(sD1.lastIndexOf("/")+1));

	d2=parseInt(sD2.substring(0, sD2.indexOf("/")));
	m2=parseInt(sD2.substring(sD2.indexOf("/")+1, sD2.lastIndexOf("/")));
	y2=parseInt(sD2.substring(sD2.lastIndexOf("/")+1));

	if(y1>y2)
	{
		//alert(y1 + '>' + y2);
		return 1;
	}
	else
		if(y1<y2)
		{
			//alert(y1 + '<' + y2);
			return -1;
		}
		else
			if(m1>m2)
			{
				//alert(m1 + '>' + m2);
				return 1;
			}
			else
				if(m1<m2)
				{
					//alert(m1 + '<' + m2);
					return -1;
				}
				else
					if(d1>d2)
					{
						//alert(d1 + '>' + d2);
						return 1;
					}
					else
						if(d1<d2)
						{
						    //alert(d1 + '<' + d2);
							return -1;
						}
						else
						{
							//alert(d1 + '=' + d2);
							return 0;
						}
}
