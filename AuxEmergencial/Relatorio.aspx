﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Relatorio.aspx.cs" Inherits="AuxEmergencial.Relatorio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h3>Relatório</h3>
    <br />
<div class="container">
  <div class="form-row">
    <div class="form-group col-md-12">
        <h4>Data de Cadastro</h4>
    </div>
  </div>
    <div class="form-row">
      <div class="form-group col-md-2">
      <label>De</label>
        <asp:TextBox runat="server"  CssClass="form-control" ID="dataInicial" placeholder="Inicio"/> 
    </div>
    <div class="form-group col-md-2">
      <label for="Nome">Ate</label>
        <asp:TextBox runat="server" CssClass="form-control" ID="dataFinal" placeholder="Fim"/>
    </div>
      <div class="form-group col-md-2">
          <asp:Label Text="&nbsp;" runat="server" />
          
          <asp:Button Text="Gerar Relatório" CssClass="form-control btn btn-primary" ID="btnRelatorio" runat="server" OnClick="btnRelatorio_Click"/>
    </div>

   </div>
</div>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css" type="text/css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js" type="text/javascript"></script>

    <script type="text/javascript">
    $(function () {
        $('[id*=dataInicial]').datepicker({
            changeMonth: true,
            changeYear: true,
            format: "yyyy-mm-dd",
            language: "pt-br"
        });
    });

    $(function () {
        $('[id*=dataFinal]').datepicker({
            changeMonth: true,
            changeYear: true,
            format: "yyyy-mm-dd",
            language: "pt-br"
        });
    });
    </script>
    
</asp:Content>