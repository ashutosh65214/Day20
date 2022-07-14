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
                using(SqlCommand cmd = new SqlCommand("usp_Display", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter adapter = new SqlDataAdapter();
                    adapter.SelectCommand=cmd;
                    DataSet ds = new DataSet();
                    adapter.Fill(ds,"Department");
                    GridDisplay.DataSource = ds.Tables["Department"];
                    GridDisplay.DataBind();
                }
            }
        }

       
    }
}