using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
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
                grid.DataSource = getAux();
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
                grid.DataSource = getAux();
                grid.DataBind();
            }
            catch (Exception)
            {
                mensagem = "Erro ao excluir!!";
                ClientScript.RegisterStartupScript(GetType(), "Popup", "erroGeral();", true);
                //throw;
            }
        }
        

        private object getAux()
        {
            string conec = "SERVER=10.0.2.9;UID=ura;PWD=ask123;Allow User Variables=True;Pooling=False";
            MySqlConnection con = new MySqlConnection(conec);
            string sql = "SELECT * FROM prefeitura.auxemergencial order by dataCadastro desc limit 200";
            MySqlCommand cmd;
            con.Open();
            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter();
            cmd = new MySqlCommand(sql, con);
            da.SelectCommand = cmd;
            da.Fill(dt);
            int num = dt.Rows.Count;
            return dt;
            
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