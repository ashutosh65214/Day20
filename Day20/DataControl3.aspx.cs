using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Day20
{
    public partial class DataControl3 : System.Web.UI.Page
    {
        private SqlConnection con = null;
        private SqlDataAdapter adapter = null;
        private DataSet ds = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }

        }
        public void BindGrid()
        {
            using (con = new SqlConnection(ConfigurationManager.ConnectionStrings["HRConnectionString"].ConnectionString))
            {
                using (adapter = new SqlDataAdapter("Select cEmployeeCode,vFirstName,cCity from Employee", con))
                {
                  
                    ds = new DataSet();
                    adapter.Fill(ds, "Employee");

                    GridEmployee.DataSource = ds.Tables["Employee"];
                    GridEmployee.DataBind();
                }
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridEmployee.PageIndex=e.NewPageIndex;
            this.BindGrid();

        }
    }
}