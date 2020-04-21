using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuxEmergencial
{
    public partial class ViewerRelatorio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            XtraReport1 report = new XtraReport1();
            report.Parameters["dataInicial"].Value = Session["dataInicial"].ToString();
            report.Parameters["dataFinal"].Value = Session["dataFinal"].ToString();
            report.RequestParameters = false;
            ASPxWebDocumentViewer1.OpenReport(report);
        }
    }
}