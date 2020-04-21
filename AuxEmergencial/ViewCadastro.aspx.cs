using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuxEmergencial
{
    public partial class ViewCadastro : System.Web.UI.Page
    {
        string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request.QueryString["id"];
            if (!Page.IsPostBack)
            {
                getCadastro(id);
            }
        }
        private void getCadastro(string id)
        {
            prefeituraEntities ctx = new prefeituraEntities();
            int auxID = int.Parse(id);
            auxemergencial aux = ctx.auxemergencials.First(p => p.id == auxID);
            nirsas.Text = Convert.ToString(aux.nirsas);
            nome.Text = aux.nome;
            dataNascimento.Text = Convert.ToString(aux.dataNascimento);
            cpf.Text = aux.cpf;
            cepe.Text = aux.cep;
            rua.Text = aux.rua;
            numero.Text = aux.numero;
            bairro.Text = aux.bairro;
            complemento.Text = aux.complemento;
            cidade.Text = aux.cidade;
            estado.Text = aux.estado;
            telefone.Text = aux.telefone;
            if (aux.pmtr == "SIM")
            {
                pmtr.Checked = true;
            }
            if (aux.bee == "SIM")
            {
                bee.Checked = true;
            }
            if (aux.bf == "SIM")
            {
                bf.Checked = true;
            }
            if (aux.bpc == "SIM")
            {
                bpc.Checked = true;
            }
            if (aux.cesta == "SIM")
            {
                cesta.Checked = true;
            }
            if (aux.urgente == "SIM")
            {
                urgente.Checked = true;
            }
            observacoes.Text = aux.observacoes;

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}