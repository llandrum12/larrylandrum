/*
 * Billingfound.jsp
 *
 * Created on 
 */

<!---

Module Name:   Billingfound.jsp - Billingfound 
--->   


<!doctype html public "-//w3c//dtd html 4.0 transitional//en">

<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>

<%@ page import=" org.apache.struts.action.*" %>
<%@ page import=" daily.billings.BillingForm " %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested" %>

<%@ page language="java" import="java.text.SimpleDateFormat" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache");        //HTTP 1.0
response.setDateHeader ("Expires", 0);          //prevents caching at the proxy server
%>

<html:html>

<head>
<title> Displaying A Resulting JSP Page Via STRUTS "Forward" name parameter "success" ! 
</title> 

<STYLE TYPE="text/css">

a {color:#FFFFFF;text-decoration:none}
a:hover {color:#D7E0F7;text-decoration:none}
body {background-color:#FFFFFF;}
TD {color:#000000;text-decoration:none}

</STYLE>

<SCRIPT language="Javascript">
// document.body.childNodes.3.childNodes.0.rows.0.bgColor = 
//
function chhead(){
var i=0; 
for (i=0; document.getElementById("myTable").rows[i]; i=i+2) 
 {
tab = document.getElementById("myTable").rows[i];
tab.bgColor = "\#CCCCCC";
 }
}
</SCRIPT>

<SCRIPT language="Javascript">
// redirect control back to initial JSP page 
//
function InitialPage(){
document.forms[0].method ="post"; 
document.forms[0].action = "initialpage"; 
document.forms[0].submit(); 
}
</SCRIPT>

<!-- This example is from the book _JavaScript: The Definitive Guide_.     -->
<!-- Written by David Flanagan.  Copyright (c) 1996 O'Reilly & Associates. -->
<!-- This example is provided WITHOUT WARRANTY either expressed or implied.-->
<!-- You may study, use, modify, and distribute it for any purpose.        -->
<SCRIPT>
// a variable we use to ensure that each error window we create is unique
//
var error_count = 0;

// define the error handler.  It generates an HTML form so
// the user can report the error to the author.
//
function report_error(msg, url, line)
{
   var w = window.open("",                    // URL (none specified)
                       "error"+error_count++, // name (force it to be unique)
                       "resizable,status,width=625,height=400"); // features
   var d = w.document;    // We use this variable to save typing!

   // output an HTML document, including a form into the new window
   //
   d.write('<DIV align=center>');
   d.write('<FONT SIZE=7 FACE="helvetica"><B>');
   d.write('OOPS.... A JavaScript Error Has Occurred!');
   d.write('</B></FONT><BR><HR SIZE=4 WIDTH="80%">');
   d.write('<FORM ACTION="mailto:nobody@nowhere.com" METHOD=post');
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
//
self.onerror = report_error;
</SCRIPT>

</head>

<body onload="chhead();">

<html:form action="/initialpage.do">

<img src = "http://shawsnet.shaws.com/gifs/shawline.gif" align=bottom>

<TABLE BORDER="0" CELLPADDING="0" WIDTH="100%" >
  <tr>
     <td WIDTH="76%">
	     <FONT COLOR="#008050" face="arial,helvetica" SIZE=+3>
	     <B>
		 DAILY STORE BILLINGS
		 </B>
		 </FONT>
	 </td>
     <td WIDTH="24%"align="left">
	     <FONT SIZE="2">
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

<!-- Start of data -->
<TABLE WIDTH="95%" BORDER=0 CELLPADDING=2 CELLSPACING=2 ID="myTable">
<!-- Start of table headings -->
   <TH BGCOLOR="#3366CC"><FONT SIZE="2" COLOR="WHITE"> Store Number </FONT></TH>
   <TH BGCOLOR="#3366CC"><FONT SIZE="2" COLOR="WHITE"> Department   </FONT></TH>
   <TH BGCOLOR="#3366CC"><FONT SIZE="2" COLOR="WHITE"> Item Code    </FONT></TH>
   <TH BGCOLOR="#3366CC"><FONT SIZE="2" COLOR="WHITE"> Qty          </FONT></TH>
   <TH BGCOLOR="#3366CC"><FONT SIZE="2" COLOR="WHITE"> Description  </FONT></TH>
   <TH BGCOLOR="#3366CC"><FONT SIZE="2" COLOR="WHITE"> Size         </FONT></TH>
   <TH BGCOLOR="#3366CC"><FONT SIZE="2" COLOR="WHITE"> Pack         </FONT></TH>
   <TH BGCOLOR="#3366CC"><FONT SIZE="2" COLOR="WHITE"> Selling      </FONT></TH>
   <TH BGCOLOR="#3366CC"><FONT SIZE="2" COLOR="WHITE"> Cst_Unit     </FONT></TH>
   <TH BGCOLOR="#3366CC"><FONT SIZE="2" COLOR="WHITE"> Cst_Ext      </FONT></TH>
   <TH BGCOLOR="#3366CC"><FONT SIZE="2" COLOR="WHITE"> Ret_Unit     </FONT></TH>
   <TH BGCOLOR="#3366CC"><FONT SIZE="2" COLOR="WHITE"> Ret_Ext      </FONT></TH>
   <TH BGCOLOR="#3366CC"><FONT SIZE="2" COLOR="WHITE"> GM%          </FONT></TH>	
   <TH BGCOLOR="#3366CC"><FONT SIZE="2" COLOR="WHITE"> Distr/Center </FONT></TH> 	 
<!-- End of table headings -->

<!-- Start of table data -->
       
   <logic:present name="BillingForm" property="dbdetailColl"> 
    
     <logic:iterate id="DetailRows" name="BillingForm" property="dbdetailColl">
        			
	   <tr>	
			   
	       <logic:notEqual name="DetailRows" property="storevar" value="0">
              <td width="3%" align="center"><font size=-1><bean:write name="DetailRows" property="storevar"/></font></td>
 	       </logic:notEqual>
	       <logic:equal name="DetailRows" property="storevar" value="0">
	          <td width="3%" align="center" style="textBody">&nbsp;</td>   
 	       </logic:equal>
 	                      
	       <logic:notEqual name="DetailRows" property="deptvar" value="0">
              <td align="center" width="10%"><font size=-1><bean:write name="DetailRows" property="deptvar"/></font></td>
 	       </logic:notEqual>
	       <logic:equal name="DetailRows" property="deptvar" value="0">
	          <td align="center"  width="10%" style="textBody">&nbsp;</td>   
 	       </logic:equal>
         
		   <logic:notEqual name="DetailRows" property="itemvar" value="0">
              <td align="center" width="4%"><font size=-1><bean:write name="DetailRows" property="itemvar"/></font></td>
 	       </logic:notEqual>
	       <logic:equal name="DetailRows" property="itemvar" value="0">
	          <td width="4%" align="center" style="textBody">&nbsp;</td>   
 	       </logic:equal>

	       <logic:notEqual name="DetailRows" property="qtyvar" value="0">
              <td align="center"  width="3%"><font size=-1><bean:write name="DetailRows" property="qtyvar"/></font></td>
 	       </logic:notEqual>
	       <logic:equal name="DetailRows" property="qtyvar" value="0">
	          <td width="3%" align="center" style="textBody">&nbsp;</td>   
 	       </logic:equal>
              
	       <logic:notEqual name="DetailRows" property="descrvar" value="0">
              <td  width="10%" align="left"><font size=-1><bean:write name="DetailRows" property="descrvar"/></font></td>
 	       </logic:notEqual>
	       <logic:equal name="DetailRows" property="descrvar" value="0">
	          <td width="10%" align="left" style="textBody">&nbsp;</td>   
 	       </logic:equal>
 	                      
	       <logic:notEqual name="DetailRows" property="sizevar" value="0">
              <td align="center" width="7%"><font size=-1><bean:write name="DetailRows" property="sizevar"/></font></td>
 	       </logic:notEqual>
	       <logic:equal name="DetailRows" property="sizevar" value="0">
	          <td align="center"  width="7%" style="textBody">&nbsp;</td>   
 	       </logic:equal>
         
		   <logic:notEqual name="DetailRows" property="packvar" value="0">
              <td align="center" width="3%"><font size=-1><bean:write name="DetailRows" property="packvar"/></font></td>
 	       </logic:notEqual>
	       <logic:equal name="DetailRows" property="packvar" value="0">
	          <td width="3%" align="center" style="textBody">&nbsp;</td>   
 	       </logic:equal>

	       <logic:notEqual name="DetailRows" property="sellingvar" value="0">
              <td align="center"  width="3%"><font size=-1><bean:write name="DetailRows" property="sellingvar"/></font></td>
 	       </logic:notEqual>
	       <logic:equal name="DetailRows" property="sellingvar" value="0">
	          <td width="3%" align="center" style="textBody">&nbsp;</td>   
 	       </logic:equal>
		   
		   <logic:notEqual name="DetailRows" property="cstunitvar" value="0">
              <td align="center" width="4%"><font size=-1><bean:write name="DetailRows" property="cstunitvar"/></font></td>
 	       </logic:notEqual>
	       <logic:equal name="DetailRows" property="cstunitvar" value="0">
	          <td width="4%" align="center" style="textBody">&nbsp;</td>   
 	       </logic:equal>

	       <logic:notEqual name="DetailRows" property="cstextvar" value="0">
              <td align="center"  width="4%"><font size=-1><bean:write name="DetailRows" property="cstextvar"/></font></td>
 	       </logic:notEqual>
	       <logic:equal name="DetailRows" property="cstextvar" value="0">
	          <td width="4%" align="center" style="textBody">&nbsp;</td>   
 	       </logic:equal>
              
	       <logic:notEqual name="DetailRows" property="retunitvar" value="0">
              <td  width="4%" align="center"><font size=-1><bean:write name="DetailRows" property="retunitvar"/></font></td>
 	       </logic:notEqual>
	       <logic:equal name="DetailRows" property="retunitvar" value="0">
	          <td width="4%" align="center" style="textBody">&nbsp;</td>   
 	       </logic:equal>
 	                      
	       <logic:notEqual name="DetailRows" property="retextvar" value="0">
              <td align="center" width="4%"><font size=-1><bean:write name="DetailRows" property="retextvar"/></font></td>
 	       </logic:notEqual>
	       <logic:equal name="DetailRows" property="retextvar" value="0">
	          <td align="center"  width="4%" style="textBody">&nbsp;</td>   
 	       </logic:equal>
         
		   <logic:notEqual name="DetailRows" property="gromarvar" value="0">
              <td align="center" width="4%"><font size=-1><bean:write name="DetailRows" property="gromarvar"/></font></td>
 	       </logic:notEqual>
	       <logic:equal name="DetailRows" property="gromarvar" value="0">
	          <td width="4%" align="center" style="textBody">&nbsp;</td>   
 	       </logic:equal>

	       <logic:notEqual name="DetailRows" property="distvar" value="0">
              <td align="center"  width="12%"><font size=-1><bean:write name="DetailRows" property="distvar"/></font></td>
 	       </logic:notEqual>
	       <logic:equal name="DetailRows" property="distvar" value="0">
	          <td width="12%" align="center" style="textBody">&nbsp;</td>   
 	       </logic:equal>
		   
	   </tr>
		  
	  </logic:iterate> 
         
    </logic:present>   		 

</TABLE>
<!-- End of table data --> 
 	
<br>	
	  
<TABLE BORDER="0" CELLPADDING="0" WIDTH="100%" >
 
       <tr>
       	    
		      <td align="left"> 
		      <html:submit property="method"
		                      value="RETURN" >   
		      </html:submit>  
		      </td>
	
	   </tr> 
   
</TABLE>	  

<br>

<html:img page="/struts-power.gif" alt="Powered by Struts"/> 

</html:form>  
    
</body>

</html:html>
