using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuxEmergencial
{
    using ServiceCorreios;
    public partial class EditCadastro : System.Web.UI.Page
    {
        string id;
        public string mensagem;
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
            if (aux.pmtr=="SIM")
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

        protected void Cep_TextChanged(object sender, EventArgs e)
        {
            getLogradouro(cepe.Text.Trim());
            numero.Focus();
        }
        public void getLogradouro(string cep)
        {
            using (var ws = new AtendeClienteClient())
            {
                try
                {
                    var resposta = ws.consultaCEP(cep);
                    rua.Text = resposta.end;
                    bairro.Text = resposta.bairro;
                    cidade.Text = resposta.cidade;
                    estado.Text = resposta.uf;
                    cidade.Text = resposta.cidade;
                    complemento.Text = resposta.complemento2;
                    cepNotFound.Visible = false;
                }
                catch (System.Exception)
                {
                    cepNotFound.Visible = true;
                    cepNotFound.Text = "CEP NÃO ENCONTRADO";

                }


            }
        }

        protected void cpf_TextChanged(object sender, EventArgs e)
        {
            if (!ValidaCPF.ValidarCPF(cpf.Text))
            {
                mensagem = "O CPF digitado é Inválido, favor checar !!";
                ClientScript.RegisterStartupScript(GetType(), "Popup", "erroGeral();", true);
                cpf.Text = string.Empty;
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {

                if (nirsas.Text == "")
                {
                    mensagem = "Campo N.IRSAS é obrigatorio!!";
                    ClientScript.RegisterStartupScript(GetType(), "Popup", "erroGeral();", true);
                    nirsas.Focus();
                }
                else
                    if (nome.Text == "")
                {
                    mensagem = "Campo Nome é obrigatório favor informar !!!";
                    ClientScript.RegisterStartupScript(GetType(), "Popup", "erroGeral();", true);
                    nome.Focus();
                }
                else
                    if (cpf.Text == "")
                {
                    mensagem = "Campo CPF é obrigatório favor informar !!!";
                    ClientScript.RegisterStartupScript(GetType(), "Popup", "erroGeral();", true);
                    cpf.Focus();
                }
                else
                    if (telefone.Text == "")
                {
                    mensagem = "É obrigatório o preenchimento do campo Telefone!!";
                    ClientScript.RegisterStartupScript(GetType(), "Popup", "erroGeral();", true);
                    telefone.Focus();
                }
                else
                {
                    try
                    {
                        int auxID = int.Parse(id);
                        prefeituraEntities ctx = new prefeituraEntities();
                        auxemergencial aux = ctx.auxemergencials.First(p => p.id == auxID);
                        aux.nirsas = int.Parse(nirsas.Text.Trim());
                        aux.nome = nome.Text.Trim();
                        aux.telefone = telefone.Text.Trim();
                        aux.cpf = cpf.Text.Trim();
                        aux.dataNascimento = Convert.ToDateTime(dataNascimento.Text.Trim());
                        aux.observacoes = observacoes.Text.Trim();
                        aux.cep = cepe.Text.Trim();
                        aux.rua = rua.Text.Trim();
                        aux.numero = numero.Text.Trim();
                        aux.bairro = bairro.Text.Trim();
                        aux.cidade = cidade.Text.Trim();
                        aux.estado = estado.Text.Trim();
                        aux.complemento = complemento.Text.Trim();
                        
                        if (bee.Checked == true)
                        {
                            aux.bee = "SIM";
                        }
                        else
                        {
                            aux.bee = "ÑAO";
                        }
                        if (bf.Checked == true)
                        {
                            aux.bf = "SIM";
                        }
                        else
                        {
                            aux.bf = "NAO";
                        }
                        if (bpc.Checked == true)
                        {
                            aux.bpc = "SIM";
                        }
                        else
                        {
                            aux.bpc = "NAO";
                        }
                        if (cesta.Checked == true)
                        {
                            aux.cesta = "SIM";
                        }
                        else
                        {
                            aux.cesta = "NAO";
                        }
                        if (pmtr.Checked == true)
                        {
                            aux.pmtr = "SIM";
                        }
                        else
                        {
                            aux.pmtr = "NAO";
                        }
                        if (urgente.Checked == true)
                        {
                            aux.urgente = "SIM";
                        }
                        else
                        {
                            aux.urgente = "NAO";
                        }
                        
                        ctx.SaveChanges();
                        ClientScript.RegisterStartupScript(GetType(), "Popup", "sucesso();", true);
                        nirsas.Text = string.Empty;
                        nome.Text = string.Empty;
                        telefone.Text = string.Empty;
                        dataNascimento.Text = string.Empty;
                        cpf.Text = string.Empty;
                        observacoes.Text = string.Empty;
                        cepe.Text = string.Empty;
                        rua.Text = string.Empty;
                        numero.Text = string.Empty;
                        bairro.Text = string.Empty;
                        complemento.Text = string.Empty;
                        cidade.Text = string.Empty;
                        estado.Text = string.Empty;
                        bee.Checked = false;
                        bf.Checked = false;
                        bpc.Checked = false;
                        pmtr.Checked = false;
                        cesta.Checked = false;
                        urgente.Checked = false;
                        //Response.Redirect("Default.aspx");

                    }
                    catch (System.Exception)
                    {
                        mensagem = "Ocorreu um erro ao Cadastrar";
                        ClientScript.RegisterStartupScript(GetType(), "Popup", "erroGeral();", true);
                        //throw;
                    }
                }


        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {

        }

        protected void cepe_TextChanged(object sender, EventArgs e)
        {
            getLogradouro(cepe.Text.Trim());
            numero.Focus();
        }

        
    }
}