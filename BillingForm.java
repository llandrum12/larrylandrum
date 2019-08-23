/*
 * BillingForm.java
 * 
 * Created on 
 */

<!---

Module Name:   BillingForm.java - BillingForm
--->   

package daily.billings;

import java.sql.*;
import java.util.*;

import org.apache.struts.action.*; 

public class BillingForm extends ActionForm 
{ 
    
  // Collections for Store, Depts and Dist.
  private  Collection storelistColl;
  private  Collection deptlistColl;
  private  Collection distlistColl;
   
  // Collection for Detailed output in resulting JSP.
  private  Collection dbdetailColl;
  
  // Parameters that will be used in the database procedure.
  protected String store;
  protected String date;
  protected String dept;
  protected String dist;
  
  // Default BillingForm constructor.
  public BillingForm() 
  {
  
     storelistColl = BillingAction.getStoreColl();
	 setStorelistColl(storelistColl);
	 getStorelistColl();
	 
	 deptlistColl  = BillingAction.getDeptColl();
	 setDeptlistColl(deptlistColl);
	 getDeptlistColl(); 
	 
	  Iterator itr = distlistColl.iterator();
	
			
     while (itr.hasNext ())
	 {
	 BillingDistPair bd = (BillingDistPair) itr.next();
	 System.out.println(  "Contents of Collection = " + distlistColl); 
	 System.out.println(bd.getDistKey   () 
	            + " " + bd.getDistValue ());
	 } 
	
	       
	       
  }
   
  /** Getter for property StorelistColl.
   * @return Value fo property StorelistColl.
   */  
  public java.util.Collection getStorelistColl()
  {
      return storelistColl;
  }
  
  /** Getter for property DeptlistColl.
   * @return Value fo property DeptlistColl.
   */  
  public java.util.Collection getDeptlistColl()
  {
      return deptlistColl;
  }
  
  /** Getter for property DistlistColl.
   * @return Value fo property DistlistColl.
   */  
  public java.util.Collection getDistlistColl()
  {
      return distlistColl;
  }
  
  /** Getter for property DbdetailColl.
   * @return Value fo property DbdetailColl.
   */  
  public java.util.Collection getDbdetailColl()
  {
      return dbdetailColl;
  }
  
  /** Getter for property Store.
   * @return Value fo property Store.
   */  
  public String getStore()
  {
      return store;
  }
  
  /** Getter for property Date.
   * @return Value fo property Date.
   */  
  public String getDate()
  {
      return date;
  }
  
  /** Getter for property Dept.
   * @return Value fo property Dept.
   */  
  public String getDept()
  {
      return dept;
  }
  
  /** Getter for property Dist.
   * @return Value fo property Dist.
   */  	  
  public String getDist()
  {
      return dist;	  
  }
  
  /** Setter for property StorelistColl.
   * @param dbdetailColl New value of property storelistColl.
   */  
  public void setStorelistColl (java.util.Collection storelistColl)
  {
      this.storelistColl = storelistColl;
  }
    
  /** Setter for property DeptlistColl.
   * @param dbdetailColl New value of property deptlistColl.
   */  
  public void setDeptlistColl (java.util.Collection deptlistColl)
  {
      this.deptlistColl = deptlistColl;
  }
   
  /** Setter for property DistlistColl.
   * @param dbdetailColl New value of property distlistColl.
   */  
  public void setDistlistColl (java.util.Collection distlistColl)
  {
      this.distlistColl = distlistColl;
  }
  
  /** Setter for property DbdetailColl.
   * @param dbdetailColl New value of property dbdetailColl.
   */  
  public void setDbdetailColl (java.util.Collection dbdetailColl)
  {
      this.dbdetailColl = dbdetailColl;
  }
  
  /** Setter for property Store.
   * @param store New value of property store.
   */  
  public void setStore (String store)
  {
      this.store = store;
  }
  
  /** Setter for property Date.
   * @param date New value of property date.
   */  
  public void setDate (String date)
  {
      this.date = date;
  }
  
  /** Setter for property Dept.
   * @param dept New value of property dept.
   */  
  public void setDept (String dept)
  {
      this.dept = dept;
  }
  
  /** Setter for property Dist.
   * @param dist New value of property dist.
   */  
  public void setDist (String dist)
  {
     this.dist = dist;
  }

}  
