<%@ Page Title="Lista de ONGs" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="pageONGS.aspx.cs" Inherits="Portal_do_Bem.pageONGS" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;500;700&family=Karla:ital,wght@0,200..800;1,200..800&display=swap" rel="stylesheet">

    <link href="assents/Style/listaONGS.css" rel="stylesheet" />
    <link href="assents/Style/menu.css" rel="stylesheet" />

    <main>
        <div id="container-banner">
            <img src="assents/Img/BANNER ONG.png" alt="BANNER" />
        </div>
        <div id="container-cards">
            <!-- H1 TITULO -->
            <p id="titulo">CONHEÇA AS <strong>ONGs</strong></p>

            <asp:Repeater ID="repeater" runat="server">

                <HeaderTemplate>
                    <div class="cards-ongs">
                </HeaderTemplate>

                <ItemTemplate>
                    <div class="cards">
                        <img src="<%# Eval("FOTO") %>" class="card-img" />
                        <button class="btn-saibamais">SAIBA MAIS</button>
                        <button class="btn-querodoar">QUERO DOAR</button>
                    </div>
                </ItemTemplate>

                <FooterTemplate>
                    </div>
                </FooterTemplate>

            </asp:Repeater>

        </div>
        <div id="pai">
            <p id="titulo">VEJA ALGUNS DEPOIMENTOS </p>
            <div id="container-card-depoimentos">
                <div class="card-depoimento">
                    <img src="assents/Img/casa Mc 01.png" alt="">
                </div>
                <div class="card-depoimento">
                    <img src=".assents/Img/cardDepoimento.png" alt="">
                </div>
                <div class="card-depoimento">
                    <img src="assents/Img/casa Mc 03.png" alt="">
                </div>
                <div class="card-depoimento">
                    <img src="assents/Img/Hospital da Criança.png" alt="">
                </div>

            </div>
        </div>
    </main>

    <script src="assents/Js/menu.js"></script>
    <script src="assents/Js/redirecionamento.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


</asp:Content>
