<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AuxEmergencial._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet" />

    <div class="jumbotron">
        <br />
            <p class="text-center" style="font-size:30px">Serviço de Auxílio Emergencial</p>
        <br />
    </div>

    <br />
    <span class="fa-pull-right"><asp:LinkButton CssClass="btn btn-success" runat="server" ID="btnAdd" OnClick="btnAdd_Click" >Cadastrar&nbsp;<i class="fas fa-plus"></i></asp:LinkButton>&nbsp;
    <asp:LinkButton CssClass="btn btn-primary" runat="server" ID="bntRelatorio" OnClick="bntRelatorio_Click" >Relatório&nbsp;<i class="fas fa-print"></i></asp:LinkButton></span>
    
    <br />
    <br />
    <br />
    <br />


    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" />
    <!-- jQuery CDN - Slim version (=without AJAX) -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
<!-- Popper.JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>

<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

<!-- jQuery Data Tables CDN -->
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js" type="text/javascript" charset="utf8"></script>

<!-- Bootstrap Data Tables JS -->
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js" type="text/javascript" charset="utf8"></script>

    

    <div class="table-responsive">

    <asp:GridView ID="grid" class="table table-striped table-hover table-sm" runat="server"  AutoGenerateColumns="False" EmptyDataText="Não exitem dados cadastrados!!">
        <Columns>
            <asp:BoundField DataField="dataCadastro" dataformatstring="{0:dd/MM/yyyy}"  HeaderText="Data de Cadastro" SortExpression="dataCadastro" />
            <asp:BoundField DataField="nirsas" HeaderText="N.IRSAS" />
            <asp:BoundField DataField="nome" HeaderText="Nome" />
            <asp:BoundField DataField="cpf" HeaderText="CPF" />
            <asp:BoundField DataField="pmtr" HeaderText="PMTR" />
            <asp:BoundField DataField="bee" HeaderText="BEE" />
            <asp:BoundField DataField="cesta" HeaderText="Cesta" />
            <asp:BoundField DataField="bf" HeaderText="BF" />
            <asp:BoundField DataField="bpc" HeaderText="BPC" />
            <asp:BoundField DataField="urgente" HeaderText="Urgente" />
            
            <asp:TemplateField HeaderText="Ações">
                <ItemTemplate>
                    <asp:Button CssClass="btn btn-warning" Text="Ver" ID="btnVer" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="btnVer_Click" />
                    <asp:Button class="btn btn-info" Text="Editar" ID="btnEditar" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="btnEditar_Click" />
                    <asp:Button CssClass="btn btn-danger" Text="Excluir" ID="btnExcluir" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="btnExcluir_Click" OnClientClick="return confirm('A exclusão desde cadastro é irreversível,  Certeza que deseja Excluir ?')" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    </div>
    <style>
        .jumbotron{
    position: relative;
    padding:0 !important;
    margin-top:40px !important;
    background: #eee;
    margin-top: 28px;
    text-align:center;
    margin-bottom: 0 !important;
}
        
   th, td {
    white-space: nowrap;
}
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet" />
    <script src="https://rawgit.com/RobinHerbots/Inputmask/3.x/dist/jquery.inputmask.bundle.js"></script>


    <script>
            $(document).ready(function () {
            $('#<%= grid.ClientID%>').prepend($("<thead></thead>").append($("#<%= grid.ClientID%>").find("tr:first"))).DataTable({
                "bJQueryUI": true,
                "autoWidth": true,
                "order": [[ 0, "desc" ]],
                 
                "oLanguage": {
                    "sProcessing":   "Processando...",
                    "sLengthMenu":   "Mostrar _MENU_ registros",
                    "sZeroRecords":  "Não foram encontrados resultados",
                    "sInfo":         "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                    "sInfoEmpty":    "Mostrando de 0 até 0 de 0 registros",
                    "sInfoFiltered": "",
                    "sInfoPostFix":  "",
                    "sSearch":       "Pesquisar:",
                    "sUrl":          "",
                    "oPaginate": {
                        "sFirst":    "Primeiro",
                        "sPrevious": "Anterior",
                        "sNext":     "Seguinte",
                        "sLast":     "Último"
                    }
                }
            }) 
            });
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
            toastr["success"]("Excluido com Sucesso !!!", "Sucesso")
        };
    </script>

</asp:Content>
