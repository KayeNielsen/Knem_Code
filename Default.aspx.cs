using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetProducts();
        }
    }

    /// <summary>
    /// Allows the user to display list of suppliers from a listview control.
    /// 
    /// Write something here.
    /// </summary>
    void GetProducts()
    {
        using (SqlConnection con = new SqlConnection(Util.GetConnection()))
        {
            con.Open();
            string SQL = @"SELECT Products.ProductID, Products.Name, Categories.Category, Products.Code, Products.Description, Products.Image, Products.Price, Products.IsFeatured, Products.CriticalLevel, Products.Maximum, Products.Status, Products.DateAdded, Products.DateModified FROM Products " + "INNER JOIN Categories ON Products.CatID = Categories.CatID";
            using (SqlCommand cmd = new SqlCommand(SQL, con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Products");

                    lvProduct.DataSource = ds;
                    lvProduct.DataBind();
                }
            }
        }
    }

    /// <summary>
    /// Allows the user to display list of products to a listview based from a keyword
    /// </summary>
    /// <param name="keyword">Any keyword</param>
    void GetProducts(string keyword)
    {
        using (SqlConnection con = new SqlConnection(Util.GetConnection()))
        {
            con.Open();
            string SQL = @"SELECT Products.ProductID, Products.Name, Categories.Category, Products.Code, Products.Description, " +
                "Products.Price, Products.IsFeatured, Products.CriticalLevel, Products.Maximum FROM Products " +
                "INNER JOIN Categories ON Products.CatID = Categories.CatID" +
                "WHERE Products.ProductID LIKE @keyword OR Products.Name LIKE @keyword OR Categories.Category Like @keyword OR " +
                "Products.Description Like @keyword OR Products.Price Like @keyword OR Products.IsFeatured Like @keyword " +
                "OR Products.CriticalLevel Like @keyword OR Products.Maximum Like @keyword";

            using (SqlCommand cmd = new SqlCommand(SQL, con))
            {
                cmd.Parameters.AddWithValue("@keyword", "%" + keyword + "%");

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Products");

                    lvProduct.DataSource = ds;
                    lvProduct.DataBind();
                }
            }
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtKeyword.Text == "")
        {
            GetProducts();
        }
        else
        {
            GetProducts(txtKeyword.Text);
        }
    }

    protected void lvProduct_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpProduct.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        if (txtKeyword.Text == "")
        {
            GetProducts();
        }
        else
        {
            GetProducts(txtKeyword.Text);
        }
    }


}