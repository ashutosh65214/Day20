using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Day20
{
    public partial class DataControlExample2 : System.Web.UI.Page
    {
        private SqlConnection con = null;
        private SqlDataAdapter adapter = null;
        private DataSet ds = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using(con=new SqlConnection(ConfigurationManager.ConnectionStrings["HRConnectionString"].ConnectionString))
                {
                    using(adapter=new SqlDataAdapter("Select distinct cCity from Employee", con))
                    {
                        ds = new DataSet();
                        adapter.Fill(ds, "EmployeeCities");
                        DataTable dt = ds.Tables["EmployeeCities"];
                        DdlCity.DataSource = dt;
                        DdlCity.DataTextField = "cCity";
                        DdlCity.DataValueField = "cCity";
                        DdlCity.DataBind();
                    }
                }
            }

        }
        public void BindGrid()
        {
            using (con = new SqlConnection(ConfigurationManager.ConnectionStrings["HRConnectionString"].ConnectionString))
            {
                using (adapter = new SqlDataAdapter("Select cEmployeeCode,vFirstName,cCity from Employee where cCity=@cCity", con))
                {
                    adapter.SelectCommand.Parameters.AddWithValue("@cCity", DdlCity.SelectedValue);
                    ds = new DataSet();
                    adapter.Fill(ds, "Employee");

                    GridEmployee.DataSource = ds.Tables["Employee"];
                    GridEmployee.DataBind();
                }
            }
        }

        protected void BtnGetData_Click(object sender, EventArgs e)
        {
            this.BindGrid();

        }
    }
}