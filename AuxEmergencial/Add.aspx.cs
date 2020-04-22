using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuxEmergencial
{
    using ServiceCorreios;
    public partial class Add : System.Web.UI.Page
    {
        public string mensagem = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            cepNotFound.Visible = false;
        }

        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            if (cboxTipoCadastro.SelectedValue == "selecione")
            {
                mensagem = "Favor selecionar a Finalidade do Cadastro !!!";
                ClientScript.RegisterStartupScript(GetType(), "Popup", "erroGeral();", true);
                cboxTipoCadastro.Focus();
            }else
            if (nome.Text=="")
            {
                mensagem = "Campo Nome é obrigatório favor informar !!!";
                ClientScript.RegisterStartupScript(GetType(), "Popup", "erroGeral();", true);
                nome.Focus();
            }else
                if (observacoes.Text=="")
            {
                mensagem = "É obrigatório o preenchimento de informações adicionais Complementares!!";
                ClientScript.RegisterStartupScript(GetType(), "Popup", "erroGeral();", true);
                observacoes.Focus();
            }
            else
            {
                try
                {
                    auxemergencial aux = new auxemergencial();
                    aux.nirsas = int.Parse(nirsas.Text.Trim());
                    aux.nome = nome.Text.Trim();
                    aux.telefone = telefone.Text.Trim();
                    aux.cpf = cpf.Text.Trim();
                    aux.dataNascimento = Convert.ToDateTime(dataNascimento.Text.Trim());
                    aux.observacoes = observacoes.Text.Trim();
                    aux.cep = cep.Text.Trim();
                    aux.rua = rua.Text.Trim();
                    aux.numero = numero.Text.Trim();
                    aux.bairro = bairro.Text.Trim();
                    aux.cidade = cidade.Text.Trim();
                    aux.estado = estado.Text.Trim();
                    aux.complemento = complemento.Text.Trim();
                    aux.finalidade = cboxTipoCadastro.SelectedValue;
                    aux.dataCadastro = DateTime.Today;
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
                    prefeituraEntities ctx = new prefeituraEntities();
                    ctx.auxemergencials.Add(aux);
                    ctx.SaveChanges();
                    ClientScript.RegisterStartupScript(GetType(), "Popup", "sucesso();", true);
                    nirsas.Text = string.Empty;
                    nome.Text = string.Empty;
                    telefone.Text = string.Empty;
                    dataNascimento.Text = string.Empty;
                    cpf.Text = string.Empty;
                    observacoes.Text = string.Empty;
                    cep.Text = string.Empty;
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
                    cboxTipoCadastro.SelectedIndex = 0;

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
            Response.Redirect("Default.aspx");
        }

        public void getLogradouro(string cep)
        {
            using(var ws = new AtendeClienteClient())
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

        protected void cep_TextChanged(object sender, EventArgs e)
        {
            getLogradouro(cep.Text.Trim());
            numero.Focus();
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
    }
}