<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditCadastro.aspx.cs" Inherits="AuxEmergencial.EditCadastro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h3>Editar Cadastro</h3>
    <br />
<div class="container">
<div class="form-row">
    <div class="form-group col-md-12">
      <label>FINALIDADE DO CADASTRO</label>
        <asp:DropDownList runat="server" CssClass="form-control" ID="cboxTipoCadastro">
            <asp:ListItem Text="SELECIONE" Value="selecione"/>
            <asp:ListItem Text="CADASTRO CADÚNICO"  Value="CADASTRO CADUNICO"/>
            <asp:ListItem Text="CADASTRO KIT CESTA BÁSICA" Value="CADASTRO KIT CESTA BASICA"/>
            <asp:ListItem Text="CADASTRO AUXÍLIO EMERGENCIAL" Value="CADASTRO AUXILIO EMERGENCIAL"/>
        </asp:DropDownList>
    </div>
</div>
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
        <asp:TextBox runat="server" CssClass="form-control" ID="dataNascimento" placeholder="Data de Nascimento" data-inputmask='"mask": "99/99/9999"' data-mask="" />
    </div>
    <div class="form-group col-md-2">
      <label for="telefone">Telefone</label>
      <asp:TextBox runat="server" CssClass="form-control" ID="telefone" placeholder="Telefone"/>
    </div>
    <div class="form-group col-md-2">
      <label for="cpf">CPF</label>
          <asp:TextBox runat="server" CssClass="form-control" ID="cpf" placeholder="CPF" data-inputmask='"mask": "999.999.999-99"' data-mask="" OnTextChanged="cpf_TextChanged" AutoPostBack="true"/>
    </div>
  </div>
<div class="form-row">
  <div class="form-group col-md-2">
    <label for="CEP">CEP</label>
      <asp:TextBox runat="server" CssClass="form-control" ID="cepe" OnTextChanged="cepe_TextChanged" AutoPostBack="true" placeholder="CEP"/>
      <asp:Label Text="" runat="server" ID="cepNotFound" Font-Bold="True" ForeColor="#CC0000" />
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
    <div class="form-group col-md-3">
      <label for="complemento">Complemento</label>
        <asp:TextBox runat="server" CssClass="form-control" ID="complemento" />  
    </div>
</div>
<div class="form-row">
  <div class="form-group col-md-12">
      <label for="observacoes">Informações Adicionais</label>
      <asp:TextBox runat="server" TextMode="MultiLine" Columns="10" Rows="5" ID="observacoes" CssClass="form-control" placeholder="Informações Adicionais"/>
  </div>
</div>
 <div class="form-row">
  <div class="form-group col-md-12">
      <label class="form-check-label" for="beneficios">
        BENEFÍCIOS
      </label>
    <div class="form-check">
        <asp:CheckBox Text="&nbsp; PMTR " runat="server" CssClass="form-check-input" ID="pmtr" />&nbsp;&nbsp;
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
        <asp:Button Text="Editar" runat="server" ID="btnSalvar" CssClass="btn btn-primary" OnClick="btnSalvar_Click" />
        <asp:Button Text="Cancelar" runat="server" ID="btnCancelar" CssClass="btn btn-danger" OnClick="btnCancelar_Click" OnClientClick="return confirm('Todos os dados preenchidos serão perdido,  Certeza que deseja Cancelar ?')"/>
      </div>
  </div>
 </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet" />
    <script src="https://rawgit.com/RobinHerbots/Inputmask/3.x/dist/jquery.inputmask.bundle.js"></script>
    <script>
        $('[data-mask]').inputmask()
    </script>
    <script type="text/javascript">
        function erroGeral() {
            toastr.options = {
              "closeButton": false,
              "debug": false,
              "newestOnTop": true,
              "progressBar": true,
              "positionClass": "toast-top-full-width",
              "preventDuplicates": true,
              "onclick": null,
              "showDuration": "300",
              "hideDuration": "1000",
              "timeOut": "8000",
              "extendedTimeOut": "1000",
              "showEasing": "swing",
              "hideEasing": "linear",
              "showMethod": "fadeIn",
              "hideMethod": "fadeOut"
            }
            toastr["error"]("<%= mensagem %>", "Erro")
        };
    </script>
    <script type="text/javascript">
        function sucesso() {
            toastr.options = {
              "closeButton": false,
              "debug": false,
              "newestOnTop": true,
              "progressBar": true,
              "positionClass": "toast-top-full-width",
              "preventDuplicates": true,
              "onclick": null,
              "showDuration": "300",
              "hideDuration": "1000",
              "timeOut": "8000",
              "extendedTimeOut": "1000",
              "showEasing": "swing",
              "hideEasing": "linear",
              "showMethod": "fadeIn",
              "hideMethod": "fadeOut"
            }
            toastr["success"]("Alterado com Sucesso !!!", "Sucesso")
        };
    </script>
</asp:Content>
