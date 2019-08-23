/*
 * Billing.jsp
 *
 * Created on 
 */

<!---

Module Name:   Billing.jsp - Billing 

--->   

<%@ page import="java.util.*" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%@ page language="java" import="java.text.SimpleDateFormat"%>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>

<html:html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="GENERATOR" content="Microsoft FrontPage Express 2.0">
<title>DETAIL BILLING REPORT</title>

<!-- This example is from the book _JavaScript: The Definitive Guide_.     -->
<!-- Written by David Flanagan.  Copyright (c) 1996 O'Reilly & Associates. -->
<!-- This example is provided WITHOUT WARRANTY either expressed or implied.-->
<!-- You may study, use, modify, and distribute it for any purpose.        -->
<SCRIPT>
// a variable we use to ensure that each error window we create is unique
var error_count = 0;

// ERROR HERE FOR TESTING!!!!
//function nothing(){ if( } 

// define the error handler.  It generates an HTML form so
// the user can report the error to the author.
function report_error(msg, url, line)
{
   var w = window.open("",                    // URL (none specified)
                       "error"+error_count++, // name (force it to be unique)
                       "resizable,status,width=625,height=400"); // features
   var d = w.document;    // We use this variable to save typing!

   // output an HTML document, including a form into the new window
   d.write('<DIV align=center>');
   d.write('<FONT SIZE=7 FACE="helvetica"><B>');
   d.write('OOPS.... A JavaScript Error Has Occurred!');
   d.write('</B></FONT><BR><HR SIZE=4 WIDTH="80%">');
   //d.write('<FORM ACTION="mailto:nobody@nowhere.com" METHOD=post');
   d.write('<FORM ACTION="larry.landrum@shaws.com" METHOD=post');
   d.write(' ENCTYPE="text/plain">');
   d.write('<FONT SIZE=3>');
   d.write('<I>Click the "Report Error" button to send a bug report.</I><BR>');
   d.write('<INPUT TYPE="submit" VALUE="Report Error">&nbsp;&nbsp;');
   d.write('<INPUT TYPE="button" VALUE="Dismiss" onClick="self.close()">');
   d.write('</DIV><DIV align=right>');
   d.write('<BR>Your name <I>(optional)</I>: ');
           d.write('<INPUT SIZE=42 NAME="name" VALUE="">');
   d.write('<BR>Error Message: ');
   d.write('<INPUT SIZE=42 NAME="message" VALUE="' + msg + '">');
   d.write('<BR>Document: <INPUT SIZE=42 NAME="url" VALUE="' + url + '">');
   d.write('<BR>Line Number: <INPUT SIZE=42 NAME="line" VALUE="' + line +'">');
   d.write('<BR>Browser Version: ');
   d.write('<INPUT SIZE=42 NAME="version" VALUE="'+navigator.userAgent + '">');
   d.write('</DIV></FONT>');
   d.write('</FORM>');

   // Remember to close the document when we're done
   d.close();

   // Return true from this error handler, so that JavaScript does not
   // display its own error dialog.
   return true;
}
// Before the event handler can take effect, we have to register it
// for a particular window.
self.onerror = report_error;
</SCRIPT>


<SCRIPT language="JavaScript">
   <!--- This is used as a marker. No other purpose      --->
   <!--- This will help identify the state of the window --->
   
   var MyWin=2
   
   <!--- This fuction is called when the Submit button is pressed --->
   <!--- Changes the marker to 1 to indicate the window is open  --->
   <!--- Then opens a window and uses the file called PROCBUSYMSG.HTML --->
   
   function ProcessingOutput(){
   MyWin=1
   win=window.open("procbusymsg.html","Processing","toolbar=no,width=200,height=220,directories=no,status=no,scrollbars=no,resize=no,menubar=no,left=600,top=200");
   }
    
   <!--- This fuction Tests to determine the marker ( window state )     --->
   <!--- If the marker is 1 indicating the WINDOW is open, then close it. --->
   
   function myWindowClose(){
    if(MyWin!=2){
     win.close();
   }
  } 
 
   <!--- This fuction is called when the page is loaded to get the curent datex --->
   <!--- The datex field is populated before the window is opened. ---> 
  
   function currentDate(){
    var todayx = new Date()
    var month  = todayx.getMonth() + 1
    var today  = todayx.getDate()
    var year   = todayx.getYear()
    document.forms[0].date.value = (month + "/" + today + "/" + year);
  } 
    
</SCRIPT>

<script language="JavaScript">

function isValidDate(dateStr) {

// Checks for the following valid date formats:
// MM/DD/YY   MM/DD/YYYY   MM-DD-YY   MM-DD-YYYY

var datePat = /^(\d{1,2})(\/|-)(\d{1,2})\2(\d{4})$/; // requires 4 digit year

var matchArray = dateStr.match(datePat); // is the format ok?
if (matchArray == null) {
alert(dateStr + " Date is not in a valid format, MM/DD/YYYY. ")
document.forms[0].date.focus();
return false;
}
month = matchArray[1]; // parse date into variables
day   = matchArray[3];
year  = matchArray[4];
if (month < 1 || month > 12) { // check month range
alert("Month must be between 1 and 12.");
document.forms[0].date.focus();
return false;
}
if (day < 1 || day > 31) {
alert("Day must be between 1 and 31.");
document.forms[0].date.focus();
return false;
}
if ((month==4 || month==6 || month==9 || month==11) && day==31) {
alert("Month "+month+" doesn't have 31 days!")
document.forms[0].date.focus();
return false;
}
if (month == 2) { // check for february 29th
var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
if (day>29 || (day==29 && !isleap)) {
alert("February " + year + " doesn't have " + day + " days!");
document.forms[0].date.focus();
return false;
   }
}
return true;
}

function dateDiff(fromDate, toDate) {
date1 = new Date();
date2 = new Date();

//alert(fromDate.name);
//alert(toDate.name);


if (isValidDate(fromDate)) { // Validates first date 
date1temp = new Date(fromDate);
date1.setTime(date1temp.getTime());
}
else return false; // otherwise exits

if (isValidDate(toDate)) { // Validates second date 
date2temp = new Date(toDate);
date2.setTime(date2temp.getTime());
}
else return false; // otherwise exits

// Compare dates

if (date1.getTime() > date2.getTime()) {
   alert(fromDate + " must be before than " + toDate + ". Please re-enter.");
   return false; // form should never submit, returns false
}
return true;
}

function greaterThanToday(dateIn) {
date1 = new Date();
todayDate = new Date();

if (isValidDate(dateIn)) {
date1temp = new Date(dateIn);
date1.setTime(date1temp.getTime());
}
else return false;

todayDate = new Date();
todayDate.setTime(todayDate.getTime());

if (date1.getTime() <= todayDate.getTime()) {
   alert("The Entered date must be greater than today. Please re-enter.")
   return false;
}

return true;
}

</script>

<SCRIPT language="JavaScript" src="date-picker.js">
</SCRIPT>

</head>

<body BGCOLOR="FFFFFF" onUnload="myWindowClose()" onload="currentDate()" >
 
<img src = "http://shawsnet.shaws.com/gifs/shawline.gif" align=bottom>

<html:form action="/Billing.do">

<br>

<TABLE BORDER="0" CELLPADDING="0" WIDTH="56%" >
  <tr>
     <td WIDTH="20%">
	     <FONT COLOR="#008050" face="arial,helvetica" SIZE=+2>
	     <B>
		 DAILY STORE BILLINGS
		 </B>
		 </FONT>
	 </td>
     <td WIDTH="12%"align="left">
	     <FONT SIZE="2">
		 &nbsp;&nbsp;&nbsp;&nbsp;
		 &nbsp;&nbsp;&nbsp;&nbsp;
		 Run Date:
		 &nbsp;
	     <%
           SimpleDateFormat sdf = new SimpleDateFormat ("MM/dd/yy 'at' h:mm a");
           out.print(sdf.format(new java.util.Date()));
         %>
		 </FONT>
	 </td>
  </tr>
</TABLE> 

<TABLE BGCOLOR="#DDEEFF" BORDER="0" CELLSPACING="0" WIDTH="56%">
    
	<tr>

        <td align="right">&nbsp;</td>
        <td align="right">&nbsp;</td>
		<td align="right">&nbsp;</td>
        
	</tr>
	
	<tr>

	    <td align="right">
		    &nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;
		    <strong>
			Store:
		    </strong>
		    &nbsp;
		</td>
        <td align="left">
		<html:select property="store" 
		                 size="1" 
						 name="BillingForm"> 
		     <bean:define id="pair1" name="BillingForm" property="storelistColl" />
	         <html:options collection="pair1" property="storeKey" labelProperty="storeValue" />
        </html:select>
		</td>
		<td align="right">&nbsp;</td>
	
	</tr>
  	
	<tr>

        <td width="30%" align="right">
		    &nbsp;&nbsp;&nbsp;
			<strong>
			Issue Date:
			</strong>&nbsp;
		</td>
        				
		<td width="21%" align="left">
		<html:text property="date"
                       size="8"
                  maxlength="10"
				      value="02/03/2002"
					 onblur="isValidDate(this.form.date.value,'%mm/%dd/%yyyy')"/>
		<A HREF="javascript:show_calendar('forms[0].date');"
		 onmouseover="window.status='';return true;" 
		 onmouseout="window.status='';return true;">
		<IMG SRC="CalendarIcon.gif" BORDER="0" WIDTH=24 HEIGHT=22><font size=1>Popup Calendar</font>
        </td>
						
	    <td align="right">&nbsp;</td>
	 
	</tr>
    
    <tr>
	    
		<td width="30%" align="right">
		    &nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;
			<strong>
			Department:
			</strong>&nbsp;
		</td>	
		<td width="21%" align="left">
		<html:select property="dept"
		                 size="5" 
					 multiple="true" 
					     name="BillingForm"> 
		     <bean:define id="pair2" name="BillingForm" property="deptlistColl" />
	         <html:options collection="pair2" property="deptKey" labelProperty="deptValue" />
        </html:select>
		</td>	
		<td align="right">&nbsp;</td>
				
	</tr>
	
	<tr>
	    
		<td width="30%" align="right">
		    &nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;
			<strong>
			Distribution:
			</strong>&nbsp;
		</td>
		<td width="21%" align="left">
		<html:select property="dist" 
		                 size="5" 
					 multiple="true" 
					     name="BillingForm">
		     <bean:define id="pair3" name="BillingForm" property="distlistColl" />
	         <html:options collection="pair3" property="distKey" labelProperty="distValue" />
        </html:select>
		</td>	
		<td align="right">&nbsp;</td>
	
	</tr>
	
   	<tr>
	    
		<td align="right">&nbsp;</td>
        <td align="right">&nbsp;</td>
        <td align="right">&nbsp;</td>
	
	</tr>
	
     <!--<tr BGCOLOR="#3366CC"> -->
	 <tr BGCOLOR="C5C6FF"> 
    
	    <td align="right">&nbsp;</td>
		<td align="left"> 
		<html:submit property="method"
		                value="QUERY_DATA" 
				      onclick="ProcessingOutput()" >
		</html:submit>  
		<td align="right">&nbsp;</td>
	
	</tr>
	
	<tr>

        <td align="right">&nbsp;</td>
	    <td align="right">&nbsp;</td>
        <td align="right">&nbsp;</td>

	</tr>
	
</TABLE>

<br>

</html:form>

<html:img page="/struts-power.gif" alt="Powered by Struts"/>

</body>

</html:html>
 
