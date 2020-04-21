<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewCadastro.aspx.cs" Inherits="AuxEmergencial.ViewCadastro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h3>Vizualizar Cadastro</h3>
    <br />
<div class="container">
  <div class="form-row">
    <div class="form-group col-md-2">
      <label>N.IRSAS</label>
        <asp:TextBox runat="server" TextMode="Number" CssClass="form-control" ID="nirsas" ReadOnly="true" /> 
    </div>
    <div class="form-group col-md-4">
      <label for="Nome">Nome</label>
        <asp:TextBox runat="server" CssClass="form-control" ID="nome" ReadOnly="true"/>
    </div>
      <div class="form-group col-md-2">
      <label for="dataNascimento">Data Nascimento</label>
        <asp:TextBox runat="server" CssClass="form-control" ID="dataNascimento" ReadOnly="true"/>
    </div>
    <div class="form-group col-md-2">
      <label for="telefone">Telefone</label>
      <asp:TextBox runat="server" CssClass="form-control" ID="telefone" ReadOnly="true"/>
    </div>
    <div class="form-group col-md-2">
      <label for="cpf">CPF</label>
          <asp:TextBox runat="server" CssClass="form-control" ID="cpf" ReadOnly="true"/>
    </div>
  </div>
<div class="form-row">
  <div class="form-group col-md-2">
    <label for="CEP">CEP</label>
      <asp:TextBox runat="server" CssClass="form-control" ID="cepe" ReadOnly="true"/>
  </div>
  <div class="form-group col-md-4">
    <label for="RUA">RUA</label>
        <asp:TextBox runat="server" CssClass="form-control" ID="rua" ReadOnly="true"/>
  </div>
    <div class="form-group col-md-1">
      <label for="numero">Numero</label>
        <asp:TextBox runat="server" CssClass="form-control" ID="numero" ReadOnly="true"/>  
    </div>
    <div class="form-group col-md-2">
      <label for="bairro">Bairro</label>
        <asp:TextBox runat="server" CssClass="form-control" ID="bairro" ReadOnly="true"/>
    </div>
    <div class="form-group col-md-2">
      <label for="cidade">Cidade</label>
        <asp:TextBox runat="server" CssClass="form-control" ID="cidade" ReadOnly="true"/>
    </div>
    <div class="form-group col-md-1">
      <label for="estado">Estado</label>
        <asp:TextBox runat="server" CssClass="form-control" ID="estado" ReadOnly="true"/>
    </div>
  </div>
<div class="form-row">
    <div class="form-group col-md-3">
      <label for="complemento">Complemento</label>
        <asp:TextBox runat="server" CssClass="form-control" ID="complemento" ReadOnly="true" />  
    </div>
</div>
<div class="form-row">
  <div class="form-group col-md-12">
      <label for="observacoes">Informações Adicionais</label>
      <asp:TextBox runat="server" TextMode="MultiLine" Columns="10" Rows="5" ID="observacoes" CssClass="form-control" ReadOnly="true"/>
  </div>
</div>
 <div class="form-row">
  <div class="form-group col-md-12">
      <label class="form-check-label" for="beneficios">
        BENEFÍCIOS
      </label>
    <div class="form-check">
        <asp:CheckBox Text="&nbsp; PMTR " runat="server" CssClass="form-check-input" ID="pmtr" readyonly="true" />&nbsp;&nbsp;
        <asp:CheckBox Text="&nbsp; BEE " runat="server" CssClass="form-check-input" ID="bee" />&nbsp;&nbsp;
        <asp:CheckBox Text="&nbsp; Cesta " runat="server" CssClass="form-check-input" ID="cesta" />&nbsp;&nbsp;
        <asp:CheckBox Text="&nbsp; BF " runat="server" CssClass="form-check-input" ID="bf" />&nbsp;&nbsp;
        <asp:CheckBox Text="&nbsp; BPC " runat="server" CssClass="form-check-input" ID="bpc" />&nbsp;&nbsp;
        <asp:CheckBox Text="&nbsp; URGENTE " runat="server" CssClass="form-check-input" ID="urgente" />&nbsp;&nbsp;
    </div>
  </div>
</div>
  
  <div class="form-row">
      <div class="form-group col-md-12">
          <label></label>
        <asp:Button Text="Voltar" runat="server" ID="btnCancelar" CssClass="btn btn-info" OnClick="btnCancelar_Click" />
      </div>
  </div>
 </div>
    
</asp:Content>
