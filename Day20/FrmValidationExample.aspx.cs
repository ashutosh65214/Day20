using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Day20
{
    public partial class FrmValidationExample : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnReset_Click(object sender, EventArgs e)
        {
            TxtFirstName.Text = "";
            DdlGender.SelectedValue = "-1";
            TxtEmailId.Text = "";
            TxtSalary.Text = "";
        }

        protected void cvLocation_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int ctr = 0;
            for (int i = 0; i < ChkListLocation.Items.Count; i++)
            {
                if (ChkListLocation.Items[i].Selected)
                {
                    ctr++;
                }
            }

            if (ctr >= 2)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

            }
        }
    }
}