using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuxEmergencial
{
    public partial class _Default : Page
    {
        int id;
        public string mensagem = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                grid.DataSource = GetAuxemergencials();
                grid.DataBind();
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            id= Convert.ToInt32((sender as Button).CommandArgument);
            Response.Redirect("EditCadastro.aspx?id=" + id);
        }

        protected void btnVer_Click(object sender, EventArgs e)
        {
            id = Convert.ToInt32((sender as Button).CommandArgument);
            Response.Redirect("ViewCadastro.aspx?id=" + id);
        }

        protected void btnExcluir_Click(object sender, EventArgs e)
        {
            try
            {
                id = Convert.ToInt32((sender as Button).CommandArgument);
                prefeituraEntities ctx = new prefeituraEntities();
                auxemergencial aux = ctx.auxemergencials.First(p => p.id == id);
                ctx.auxemergencials.Remove(aux);
                ctx.SaveChanges();
                mensagem = "Excluido com Sucesso!!";
                ClientScript.RegisterStartupScript(GetType(), "Popup", "sucesso();", true);
                grid.DataSource = GetAuxemergencials();
                grid.DataBind();
            }
            catch (Exception)
            {
                mensagem = "Erro ao excluir!!";
                ClientScript.RegisterStartupScript(GetType(), "Popup", "erroGeral();", true);
                //throw;
            }
        }
        public List<auxemergencial> GetAuxemergencials()
        {
            var ctx = new prefeituraEntities();
            return ctx.auxemergencials.Take(200).ToList();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add.aspx");
        }

        protected void bntRelatorio_Click(object sender, EventArgs e)
        {
            Response.Redirect("Relatorio.aspx");
        }

        
    }
}