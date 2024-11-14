<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Portal_do_Bem._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link href="assents/Style/home.css" rel="stylesheet" />

      <!-- Deslize CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <main>
<div id="container-banner">
        <img src="assents/Img/Banner-HomePage.png" alt="banner"/>
      </div>

      <div id="container-seja-doador">
        <h2>SEJA UM <b>DOADOR</b> AGORA MESMO! PELO <b>PORTAL DO BEM</b>VOCÊ</h2>
        <h2> PARA AS CAUSAS MAIS RELEVANTES DO BRASIL E</h2>
        <h2>AJUDA A <b>TRANSFORMAR MILHARES DE VIDAS</b></h2>
        <h5>Veja alguns números e entenda a grandiosidade de nosso projeto para beneficiar vidas:</h5>

        <div class="imagem-info">
          <img class="img-cont-doacao" src="assents/Img/Contador-de-doações.png" alt="contador doações"/>
          <img src="assents/Img/Contador-Valor.png" alt="contador valor"/>
          <img src="assents/Img/Contador-de-ONGs.png" alt="contador ONGs"/>
          <img class="img-cont-doadores" src="assents/Img/Contador-de-Doadores.png" alt="contador doadores"/>
        </div>
      </div>

<section>
    <h2>CONHEÇA AS <b>ONGs</b></h2>
    <div id="container-carrosel">
        <div #swiperRef="" class="swiper slide-container">

            <asp:Repeater ID="repeater" runat="server">
                <HeaderTemplate>
                    <div class="slide-content">
                        <div class="card-wrapper swiper-wrapper">
                </HeaderTemplate>

                <ItemTemplate>
                    <div class="card swiper-slide">
                        <div class="image-content">
                            <div class="card-image">
                                <img src="<%# Eval("FOTO") %>" alt="card-img" class="card-img">
                                <hr>
                            </div>
                        </div>
                        <div class="card-content">
                            <button class="button">Saiba Mais</button>
                        </div>
                    </div>
                </ItemTemplate>

                <FooterTemplate>
                    </div>
                    </div> 
                </FooterTemplate>
            </asp:Repeater>

            
            <div class="swiper-button-next swiper-navBtn"></div>
            <div class="swiper-button-prev swiper-navBtn"></div>
            <div class="swiper-pagination"></div>
        </div>
    </div>
</section>


      <div id="container-quemSomos">
        <h2>QUEM SOMOS</h2>
        <h5  style="color: #3581B8;">Uma plataforma que conecta doadores à instuições que precisam.</h5>

        <div class="quadrado">

          <div class="squares">
            <h3>Instuição</h3>
            <h5>O <b>Portal do Bem</b> oferece um espaço de conexão e solidariedade, onde aproxima mais o doar com as instuições. </h5>
          </div>

          <div class="squares">
            <h3>Doador</h3>
            <h5>O doador com alguns cliques, irá selecionar a institução a receber a doação</h5>
          </div>

          <div class="squares">
            <h3>Doação</h3>
            <h5>Todo mundo sai ganhando. Quem doa ganha praticidade para fazer uma boa ação, que recebe multiplca doações e carinhos.</h5>
          </div>
        </div>
      </div>

      <div id="container-contatos">
        <h2>CONTATOS</h2>

        <div class="wrapper">
          <ul>
            <li class="facebook">
         <i class="fa fa-facebook" aria-hidden="true"></i>
              <div class="slider">
                <p>facebook</p>
              </div>
            </li>
            
            <li class="twitter">
              <i class="fa fa-twitter" aria-hidden="true"></i>
              <div class="slider">
                <p>twitter</p>
              </div>
            </li>
            
            <li class="instagram">
              <i class="fa fa-instagram" aria-hidden="true"></i>
              <div class="slider">
                <p>instagram</p>
              </div>
            </li>
                        
            <li class="whatsapp">
              <i class="fa fa-whatsapp" aria-hidden="true"></i>
              <div class="slider">
                <p>whatsapp</p>
              </div>
            </li>
          </ul>
        </div>
      </div> 
    </main>

  <script src="assents/Js/menu.js"></script>
   <!-- Swiper JS -->
  <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
  <!-- Initialize Swiper -->
  <script src="assents/Js/carrosel.js"></script>
</asp:Content>
