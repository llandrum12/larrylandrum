/*
 * BillingValuePair.java
 * 
 * Created on 
 */

<!---

Module Name:   BillingValuePair.java - BillingValuePair
--->   

package daily.billings;


/**
 *
 * @author  Larry Landrum
 */
public class BillingValuePair
{
    private String     strKey;
    private String     value;
    
	/*
	public BillingValuePair(String strKey, String value)
	{
            
    }
	*/
	
	
    /** Getter for property StrKey.
     * @return Value of property strKey.
     */
	public java.lang.String getStrKey() 
	{
        return strKey;
    }
      
    /** Getter for property Value.
     * @return Value of property value.
     */
	public java.lang.String getValue() 
	{
        return value;
    }
	
  /** Setter for property StrKey.
   * @param store New value of property strKey.
   */  
  public void setStrKey (String strKey)
  {
      this.strKey= strKey;
  }
  
  /** Setter for property Value.
   * @param store New value of property value.
   */  
  public void setValue (String value)
  {
      this.value = value;
  }
         
}
