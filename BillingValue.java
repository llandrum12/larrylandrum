/*
 * BillingValue.java
 * 
 * Created on 
 */

<!---

Module Name:   BillingValue.java - BillingValue
--->   

package daily.billings;

public class BillingValue
{
  
    private String storevar;
    private String deptvar;
    private String itemvar;
    private String qtyvar;
	private String descrvar;
    private String sizevar;
    private String packvar;
    private String sellingvar;
    private String cstunitvar;
    private String cstextvar;
    private String retunitvar;
    private String retextvar;
    private String gromarvar;
    private String distvar;

    // Constructor for Billing Value Object
    public BillingValue(String storevar, 
	                    String deptvar, 
						String itemvar, 
						String qtyvar, 
	                    String descrvar, 
						String sizevar, 
						String packvar, 
	                    String sellingvar, 
						String cstunitvar,
						String cstextvar, 
	                    String retunitvar, 
						String retextvar,
						String gromarvar, 
	                    String distvar)
    {
        this.storevar   = storevar;
        this.deptvar    = deptvar;
        this.itemvar    = itemvar;
        this.qtyvar     = qtyvar;
		this.descrvar   = descrvar;
        this.sizevar    = sizevar;
        this.packvar    = packvar;
        this.sellingvar = sellingvar;
		this.cstunitvar = cstunitvar;
        this.cstextvar  = cstextvar;
        this.retunitvar = retunitvar;
        this.retextvar  = retextvar;
		this.gromarvar  = gromarvar;
        this.distvar    = distvar;
    }

    public String getStorevar()
    {
        return storevar;
    }

    public String getDeptvar()
    {
        return deptvar;
    }

    public String getItemvar()
    {
        return itemvar;
    }

    public String getQtyvar()
    {
        return qtyvar;
    }
	
    public String getDescrvar()
    {
        return descrvar;
    }

    public String getSizevar()
    {
        return sizevar;
    }

    public String getPackvar()
    {
        return packvar;
    }

    public String getSellingvar()
    {
        return sellingvar;
    }
	
    public String getCstunitvar()
    {
        return cstunitvar;
    }

    public String getCstextvar()
    {
        return cstextvar;
    }

    public String getRetunitvar()
    {
        return retunitvar;
    }

    public String getRetextvar()
    {
        return retextvar;
    }
	
    public String getGromarvar()
    {
        return gromarvar;
    }

    public String getDistvar()
    {
        return distvar;
    }

}
