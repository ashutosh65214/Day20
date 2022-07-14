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
    public partial class DataControlExample4 : System.Web.UI.Page
    {
        private SqlConnection con = null;
        private SqlDataAdapter adapter = null;
        private DataSet ds = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (con = new SqlConnection(ConfigurationManager.ConnectionStrings["HRConnectionString"].ConnectionString))
                {
                    using(adapter=new SqlDataAdapter("Select distinct vDepartmentName from Department", con))
                    {
                        ds = new DataSet();
                        adapter.Fill(ds, "DepartmentName");
                        DataTable dt = ds.Tables["DepartmentName"];
                        DdlDepartment.DataSource = dt;
                        DdlDepartment.DataTextField = "vDepartmentName";
                        DdlDepartment.DataValueField = "vDepartmentName";
                        DdlDepartment.DataBind();

                    }

                }
            }

        }
        public void DepGrid()
        {
            using (con = new SqlConnection(ConfigurationManager.ConnectionStrings["HRConnectionString"].ConnectionString))
            {
                using (adapter = new SqlDataAdapter("usp_SearchByDepartmentName", con))
                {
                    adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                    adapter.SelectCommand.Parameters.AddWithValue("@vDepartmentName", DdlDepartment.SelectedValue);
                    ds = new DataSet();
                    adapter.Fill(ds, "Dept");

                    GridDepartment.DataSource = ds.Tables["Dept"];
                    GridDepartment.DataBind();
                }

            }


        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            this.DepGrid();
        }
    }
}