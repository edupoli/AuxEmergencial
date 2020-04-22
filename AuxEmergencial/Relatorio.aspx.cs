using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuxEmergencial
{
    public partial class Relatorio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRelatorio_Click(object sender, EventArgs e)
        {
            Session["dataInicial"] = dataInicial.Text;
            Session["dataFinal"] = dataFinal.Text;
            Session["finalidade"] = cboxTipoCadastro.SelectedValue;
            Response.Redirect("ViewerRelatorio.aspx");
        }
    }
}