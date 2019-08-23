/*
 * BillingDeptPair.java
 * 
 * Created on 
 */

<!---

Module Name:   BillingDeptPair.java - BillingDeptPair
--->   

package daily.billings;


/**
 *
 * @author  Larry Landrum
 */
public class BillingDeptPair
{
    private String     depKey;
    private String     value2;
    
	/*
	public BillingValuePair(String strKey, String value2)
	{
            
    }
	*/
	
	
    /** Getter for property DepKey.
     * @return Value of property depKey.
     */
	public java.lang.String getDepKey() 
	{
        return depKey;
    }
      
    /** Getter for property Value.
     * @return Value of property value.
     */
	public java.lang.String getValue2() 
	{
        return value2;
    }
	
  /** Setter for property DepKey.
   * @param store New value of property depKey.
   */  
  public void setDepKey (String depKey)
  {
      this.depKey = depKey;
  }
  
  /** Setter for property Value2.
   * @param store New value of property value2.
   */  
  public void setValue2 (String value2)
  {
      this.value2 = value2;
  }
         
}
