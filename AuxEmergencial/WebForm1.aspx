<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="AuxEmergencial.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title></title>
    
</head>

<body>
    <form id="form1" runat="server">
     <div class="container body-content">
  <div class="form-row">
    <div class="form-group col-md-2">
      <label>N.IRSAS</label>
        <asp:TextBox runat="server" TextMode="Number" CssClass="form-control" ID="nirsas" placeholder="Numero IRSAS"/> 
    </div>
    <div class="form-group col-md-4">
      <label for="Nome">Nome</label>
        <asp:TextBox runat="server" CssClass="form-control" ID="nome" placeholder="Nome Completo"/>
    </div>
      <div class="form-group col-md-2">
      <label for="dataNascimento">Data Nascimento</label>
        <asp:TextBox runat="server" CssClass="form-control" ID="dataNascimento" placeholder="Data de Nascimento"/>
    </div>
    <div class="form-group col-md-2">
      <label for="telefone">Telefone</label>
      <asp:TextBox runat="server" CssClass="form-control" ID="telefone" placeholder="Telefone"/>
    </div>
    <div class="form-group col-md-2">
      <label for="cpf">CPF</label>
          <asp:TextBox runat="server" CssClass="form-control" ID="cpf" placeholder="CPF"/>
    </div>
  </div>
<div class="form-row">
  <div class="form-group col-md-2">
    <label for="CEP">CEP</label>
      <asp:TextBox runat="server" CssClass="form-control" ID="cep" placeholder="CEP"/>
  </div>
  <div class="form-group col-md-4">
    <label for="RUA">RUA</label>
        <asp:TextBox runat="server" CssClass="form-control" ID="rua" placeholder="Rua"/>
  </div>
    <div class="form-group col-md-1">
      <label for="numero">Numero</label>
        <asp:TextBox runat="server" CssClass="form-control" ID="numero" />  
    </div>
    <div class="form-group col-md-2">
      <label for="bairro">Bairro</label>
        <asp:TextBox runat="server" CssClass="form-control" ID="bairro" placeholder="Bairro"/>
    </div>
    <div class="form-group col-md-2">
      <label for="cidade">Cidade</label>
        <asp:TextBox runat="server" CssClass="form-control" ID="cidade" placeholder="Cidade"/>
    </div>
    <div class="form-group col-md-1">
      <label for="estado">Estado</label>
        <asp:TextBox runat="server" CssClass="form-control" ID="estado" placeholder="Estado"/>
    </div>
  </div>
<div class="form-row">
  <div class="form-group">
      <label class="form-check-label" for="beneficios">
        Benefícios
      </label>
    <div class="form-check">
        <asp:CheckBox Text=" PMTR " runat="server" CssClass="form-check-input" ID="pmtr" />
        <asp:CheckBox Text=" BEE " runat="server" CssClass="form-check-input" ID="bee" />
        <asp:CheckBox Text=" Cesta " runat="server" CssClass="form-check-input" ID="cesta" />
        <asp:CheckBox Text=" BF " runat="server" CssClass="form-check-input" ID="bf" />
        <asp:CheckBox Text=" BPC " runat="server" CssClass="form-check-input" ID="bpc" />
        <asp:CheckBox Text=" URGENTE " runat="server" CssClass="form-check-input" ID="urgente" />
    </div>
  </div>
</div>
  
  <button type="submit" class="btn btn-primary">Sign in</button>
         </div>
</form>
    
</body>
</html>
