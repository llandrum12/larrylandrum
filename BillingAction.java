/*
 * BillingAction.java
 * 
 * Created on 
 */

<!---

Module Name:   BillingAction.java - BillingAction
--->  

package daily.billings;

import java.io.*;
import java.sql.*;
import java.util.*;

import oracle.jdbc.driver.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import daily.billings.BillingValuePair;
import daily.billings.BillingDeptPair;
import daily.billings.BillingValueOne;


public class BillingAction extends Action 
{ 

// Connection parameter.
private static Connection conn;

public ActionForward perform (ActionMapping mapping, 
                              ActionForm form,
							  HttpServletRequest reg,
    						  HttpServletResponse res) 
	                                 				  
 {
  
   /* (1) Cast the form to the DailyoneForm */
  BillingForm bf           = (BillingForm) form;

  Collection dbdetailColl  = bf.getDbdetailColl();  		
  String store             = bf.getStore();
  String date              = bf.getDate();
  String dept              = bf.getDept();  
  String dist              = bf.getDist();
  
  /* Creating String objects and assigning values */
  String password         = "shakes";
  String username         = "gpi";
     
  /* (2) Apply business logic */
  if ( store != null &&
       date  != null &&
	   dept  != null &&
	   dist  != null ) 
  {
   /* get Collection from method */
   dbdetailColl = getBillingColl(store, 
                                 date ,
			                     dept ,
							     dist);
      				   
    bf.setDbdetailColl(dbdetailColl); 
   
   /*
	   	 
     System.out.println("Size of storelistColl = " + storelistColl.size()); 
   
     Iterator itr = storeColl.iterator();
	
     System.out.println(" ");
   
     System.out.println("Beginning of printed output.");
   
     System.out.println(" ");
			
     while (itr.hasNext ())
	 {
	 storeColl sr = (storeColl) itr.next();
	 System.out.println(sr.store());
	 }
	
    System.out.println(" ");
   
    System.out.println("Ending of printed output.");
		
    // print out a bunch of interesting things
    //System.out.println("Print this message Current Time"); 
   
    */ 
   
    /* 
      
    Iterator itr = dbdetailColl.iterator();
	
			
    while (itr.hasNext ())
	 {
	 BillingValueOne br = (BillingValueOne) itr.next();
	 System.out.println(br.getStorevar   ()
	            + " " + br.getDeptvar    () 
	            + " " + br.getItemvar    () 
				+ " " + br.getQtyvar     ()
				+ " " + br.getDescrvar   () 
	            + " " + br.getSizevar    () 
				+ " " + br.getPackvar    ()
				+ " " + br.getSellingvar () 
	            + " " + br.getCstunitvar () 
				+ " " + br.getCstextvar  ()
				+ " " + br.getRetunitvar () 
	            + " " + br.getRetextvar  () 
				+ " " + br.getGromarvar  ()
				+ " " + br.getDistvar    ());
	 }
	
   System.out.println(" ");
   
   System.out.println("Ending of printed output.");
   */	
     
   /* check contents of collection */ 
   if ( dbdetailColl.size() > 0 )
   {
    	    	
	 /* (3) Return ActionForward for success */	
     return mapping.findForward("billingfound");
     }
     else
     {
     /* (4) Return ActionForward for failure */
	 return mapping.findForward("failure");
    }
  }
  /* (4) Return ActionForward for failure */
  return mapping.findForward("failure");
 }

public static Collection getStoreColl()
{
  
      //Create an ArrayList object to store the results
       Collection storeColl             = new ArrayList();
	   BillingValuePair ValuePairRecord = null;
	   	   	   
		try
        {
           
		    //Register the Oracle JDBC Driver.
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
			// Creating String objects and assigning values.
            String url      = "jdbc:oracle:thin:@rsd3:1521:cfs3";
            String password = "shakes";
			String username = "gpi";
			
			
			//Select statement for store query.
            String query    = "SELECT /*+ RULE */ " +
			                  "       STORE_NUM   " +
			                  "FROM STORE_CHANGE  " +
						      "ORDER BY STORE_NUM ";
            			
			//Get a connection to the database.
			conn            = DriverManager.getConnection(url, username, password);
			
			//Create the statement object.
			Statement stmt  = conn.createStatement();
			
			//Run the sql statement and put the results 
            //into a ResultSet object.
            ResultSet rs    = stmt.executeQuery(query);
			
			int myKey = 0;            	           					
            
			//Loop through its contents.
            while (rs.next())
            {

               //System.out.println(store);
			   //Converting an Interger to a String while using the increment operator ++. 
               //ValuePairRecord.setStrKey  (Integer.toString(myKey++));
			   //storeColl.add(new BillingValuePair(Integer.toString(myKey++), store));
			   //storeColl.add(store);
			   
			   String storex   = rs.getString(1);
			   ValuePairRecord = new BillingValuePair();
			   ValuePairRecord.setStrKey (storex);
			   ValuePairRecord.setValue  (storex);
			   storeColl.add(ValuePairRecord);
			     
			}
			
			//Close the ResultSet and Statement Objects.
            rs.close();
			stmt.close();
        }
        catch (SQLException se)
        {
         System.err.println("SQLException caught: " + se.getMessage());
        }
        catch (ClassNotFoundException ce)
        {
         System.err.println("ClassNotFoundException caught: " + ce.getMessage());
	    }
		 
     return storeColl;
 } 
 
public static Collection getDeptColl()
{
  
      //Create an ArrayList object to store the results
       Collection deptColl             = new ArrayList();
	   BillingDeptPair DeptPairRecord  = null;
	   	   	   
		try
        {
           
		    //Register the Oracle JDBC Driver.
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
			// Creating String objects and assigning values.
            String url      = "jdbc:oracle:thin:@rsd3:1521:cfs3";
            String password = "shakes";
			String username = "gpi";
			
			
			//Select statement for the dept query.
            String query    = "SELECT /*+ RULE */                       " +
			                  " DISTINCT DEPT_NUM,                      " +
			                  "DESCR||'('||TO_CHAR(DEPT_NUM)||')' DESCR " +
		                      "FROM DEPT_HISTORY                        " + 
                              "WHERE EFF_DATE_TO IS NULL                " +
                              "ORDER BY DESCR                           ";
            			
			//Get a connection to the database.
			conn            = DriverManager.getConnection(url, username, password);
			
			//Create the statement object.
			Statement stmt  = conn.createStatement();
			
			//Run the sql statement and put the results 
            //into a ResultSet object
            ResultSet rs    = stmt.executeQuery(query);
			
			int myKey = 0;            	           					
            
			//Loop through its contents.
            while (rs.next())
            {

               //System.out.println(store);
			   //Converting an Interger to a String while using the increment operator ++. 
               //ValuePairRecord.setStrKey  (Integer.toString(myKey++));
			   //storeColl.add(new BillingValuePair(Integer.toString(myKey++), store));
			   //storeColl.add(store);
			   
			   String deptx   = rs.getString(1);
			   String descrx  = rs.getString(2);
			   DeptPairRecord = new BillingDeptPair();
			   DeptPairRecord.setDepKey (deptx);
			   DeptPairRecord.setValue2 (descrx);
			   deptColl.add(DeptPairRecord);
			     
			}
			
			//Close the ResultSet and Statement Objects.
            rs.close();
			stmt.close();
        }
        catch (SQLException se)
        {
         System.err.println("SQLException caught: " + se.getMessage());
        }
        catch (ClassNotFoundException ce)
        {
         System.err.println("ClassNotFoundException caught: " + ce.getMessage());
	    }
		 
     return deptColl;
 }  
 
public Collection getBillingColl(String store, 
                                 String date ,
							     String dept ,
							     String dist)
   						   
{
	   //Create an ArrayList object to store the results
       Collection finalColl          = new ArrayList();
	   BillingValueOne BillingRecord = null;
	   	   
		try
        {
           
			//Register the Oracle JDBC Driver
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
			// Creating String objects and assigning values
            String url          = "jdbc:oracle:thin:@rsd3:1521:cfs3";
            String password     = "shakes";
			String username     = "gpi";
			
			
			// call DEPTQUERYPACKAGE1.QueryDEPtrans(?,?,?,?,?)
            String query = "{call DEPTQUERYPACKAGE1.QueryDEPtrans (?,?,?,?,?)}";
            			
			//Get a connection to the database.
			Connection conn = DriverManager.getConnection(url, username, password);
			
			CallableStatement cstmt = conn.prepareCall(query);
            cstmt.registerOutParameter(1, OracleTypes.CURSOR); // cursor

            cstmt.setString(2, store);   // store
            cstmt.setString(3, date );   // date
            cstmt.setString(4, dept );   // dept
			cstmt.setString(5, dist );   // dist

            // execute CallableStatement
            cstmt.execute();

            // Cast the cstmt.getObject(1) into a workable object(ResultSet).
            ResultSet rs = (ResultSet) cstmt.getObject(1);
			           					
            //Loop through its contents.
            while (rs.next())
            {
               BillingRecord = new BillingValueOne();
               BillingRecord.setStorevar  (rs.getString(1));
			   BillingRecord.setDeptvar   (rs.getString(2));
			   BillingRecord.setItemvar   (rs.getString(3));
			   BillingRecord.setQtyvar    (rs.getString(4));
			   BillingRecord.setDescrvar  (rs.getString(5));
			   BillingRecord.setSizevar   (rs.getString(6));
			   BillingRecord.setPackvar   (rs.getString(7));
			   BillingRecord.setSellingvar(rs.getString(8));
			   BillingRecord.setCstunitvar(rs.getString(9));
			   BillingRecord.setCstextvar (rs.getString(10));
			   BillingRecord.setRetunitvar(rs.getString(11));
			   BillingRecord.setRetextvar (rs.getString(12));
			   BillingRecord.setGromarvar (rs.getString(13));
			   BillingRecord.setDistvar   (rs.getString(14));
			   finalColl.add(BillingRecord);
			}
			
			//Close the ResultSet and Statement Objects.
            rs.close();
        }
        catch (SQLException se)
        {
         System.err.println("SQLException caught: " + se.getMessage());
        }
        catch (ClassNotFoundException ce)
        {
         System.err.println("ClassNotFoundException caught: " + ce.getMessage());
	    }
		 
  return finalColl;

 } 
 
} 

