<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PesquisaBoleto.aspx.cs" Inherits="carregarPDF.PesquisaBoleto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="stilo.css" rel="stylesheet" type="text/css" />
    <title></title>
    <style type="text/css">
        background:url("\logonova.png") repeat scroll 0 0 transparent;
        bottom:0;
        height:191px;
        left:0;
        position:fixed;
        width:100%;

        .txtclass
        {
            font-family: Tahoma,Arial, Helvetica, sans-serif;
            font-size: 11px;
            color: #000000;
            font-weight: normal;
            text-decoration: none;
            border: 1px solid #888888;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Informe CPF: "></asp:Label>
        <asp:TextBox ID="txtCPF" runat="server" CssClass="txtclass"></asp:TextBox>
        </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Pesquisa" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" CssClass="Grid">
            <Columns>
                <asp:BoundField DataField="Caminho" HeaderText="Caminho" />
                <%--<asp:TemplateField>
                   <ItemTemplate>
                      <asp:HiddenField ID="HiddenField1" runat="server"   
                             Value='<%# Eval("Caminho") %>' />
                    </ItemTemplate>
                </asp:TemplateField>--%>
                <asp:BoundField DataField="NomeArquivo" HeaderText="NomeArquivo" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:ImageButton ID="imgDownload" runat="server" CommandName="Download" ImageUrl="<%# retornaImagem() %>" 
                             CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ToolTip="Fazer Download do arquivo"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:ImageButton ID="imgImprimir" runat="server" CommandName="Imprimir" ImageUrl="<%# imprimirImagem() %>" 
                             CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ToolTip="Imprimir arquivo"/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/logonova.png" />
    </form>
</body>
</html>
