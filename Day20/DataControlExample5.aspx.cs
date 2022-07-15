using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Day20
{
    public partial class DataControlExample5 : System.Web.UI.Page
    {
        private SqlConnection con = null;
        private SqlDataAdapter adapter = null;
        private DataSet ds = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.GridBind();
            }

        }
        public void GridBind()
        {
            using (con = new SqlConnection(ConfigurationManager.ConnectionStrings["HRConnectionString"].ConnectionString))
            {
                using(adapter=new SqlDataAdapter("usp_Display", con))
                {
                    adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                    ds = new DataSet();
                    adapter.Fill(ds,"Dept");
                    DataTable dt = ds.Tables["Dept"];
                    GridDisplay.DataSource = dt;
                    GridDisplay.DataBind();
                }
            }
        }

       
    }
}