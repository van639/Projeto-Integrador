<%@ Page Title="Cadastro Doador" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cadastroDoador.aspx.cs" Inherits="Portal_do_Bem.cadastroDoador" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link href="assents/Style/cadastroDoador.css" rel="stylesheet" />
    <link href="assents/Style/menu.css" rel="stylesheet" />

    <div id="container-conteudo">
        <h1>CADASTRO DOADOR</h1>

        <p>
            Por favor, conclua o cadastro com suas informações . Sua colaboração é fundamental para garantir que possamos processar sua doação com eficiência. Agradecemos antecipadamente por sua contribuição e por fazer a diferença na vida daqueles que precisam
        </p>
        <div id="container-cadastro-ong">
            <div id="container-esquerdo-cadastro">
                <label>
                    <div id="container-check">          
                        <span id="toggleLabel">CPF:</span>
                        <label class="switch">
                            <input type="checkbox" id="toggleSwitch" onclick="toggleCPF_CNPJ()">
                            <span class="slider"></span>
                        </label>
                    </div> 
                    <asp:TextBox ID="txtDocumento" runat="server" CssClass="form-text" MaxLength="14" ClientIDMode="Static" oninput="aplicarMascara()"></asp:TextBox>
                </label>
                <label>
                    Nome:
                    <asp:TextBox ID="txtNome" runat="server" CssClass="form-text"></asp:TextBox>
                </label>
                <label id="divRazaoSocial" style="display:none;">
                    Razão Social:
                    <asp:TextBox ID="txtRazaoSocial" runat="server" CssClass="form-text"></asp:TextBox>
                </label>
                <label>
                    Telefone:
                    <asp:TextBox ID="txtTelefone" runat="server" CssClass="form-text"></asp:TextBox>
                </label>
                <label>
                    E-mail:
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-text"></asp:TextBox>
                </label>
                <label>
                    Senha:
                    <asp:TextBox ID="txtSenha" runat="server" CssClass="form-text"></asp:TextBox>
                </label>
                <label id="divSexo">
                    Sexo:
                    <asp:DropDownList ID="ddlSexo" runat="server">
                        <asp:ListItem Value="SELECIONE">Selecione</asp:ListItem>
                        <asp:ListItem Value="M">Masculino</asp:ListItem>
                        <asp:ListItem Value="F">Feminino</asp:ListItem>
                        <asp:ListItem Value="O">Outros</asp:ListItem>
                    </asp:DropDownList>
                </label>
            </div>
            <div id="container-direito-cadastro">
                <div id="container-cep-numero">
                    <label>
                        Cep:
                        <asp:TextBox ID="txtCEP" runat="server" CssClass="form-text"></asp:TextBox>
                    </label>
                    <label>
                        Numero:
                        <asp:TextBox ID="txtNumero" runat="server" CssClass="form-text"></asp:TextBox>
                    </label>
                </div>
                <label>
                    Rua:
                    <asp:TextBox ID="txtRua" runat="server" CssClass="form-text"></asp:TextBox>
                </label>
                <label>
                    Estado:
                    <asp:DropDownList ID="ddlEstados" runat="server">
                        <asp:ListItem Value="SELECIONE">Selecione um estado</asp:ListItem>
                        <asp:ListItem Value="AC">Acre</asp:ListItem>
                        <asp:ListItem Value="AL">Alagoas</asp:ListItem>
                        <asp:ListItem Value="AP">Amapá</asp:ListItem>
                        <asp:ListItem Value="BA">Bahia</asp:ListItem>
                        <asp:ListItem Value="CE">Ceará</asp:ListItem>
                        <asp:ListItem Value="DF">Distrito Federal</asp:ListItem>
                        <asp:ListItem Value="ES">Espírito Santo</asp:ListItem>
                        <asp:ListItem Value="GO">Goiás</asp:ListItem>
                        <asp:ListItem Value="MA">Maranhão</asp:ListItem>
                        <asp:ListItem Value="MT">Mato Grosso</asp:ListItem>
                        <asp:ListItem Value="MS">Mato Grosso do Sul</asp:ListItem>
                        <asp:ListItem Value="MG">Minas Gerais</asp:ListItem>
                        <asp:ListItem Value="PA">Pará</asp:ListItem>
                        <asp:ListItem Value="PB">Paraíba</asp:ListItem>
                        <asp:ListItem Value="PR">Paraná</asp:ListItem>
                        <asp:ListItem Value="PE">Pernambuco</asp:ListItem>
                        <asp:ListItem Value="PI">Piauí</asp:ListItem>
                        <asp:ListItem Value="RJ">Rio de Janeiro</asp:ListItem>
                        <asp:ListItem Value="RN">Rio Grande do Norte</asp:ListItem>
                        <asp:ListItem Value="RS">Rio Grande do Sul</asp:ListItem>
                        <asp:ListItem Value="RO">Rondônia</asp:ListItem>
                        <asp:ListItem Value="RR">Roraima</asp:ListItem>
                        <asp:ListItem Value="SC">Santa Catarina</asp:ListItem>
                        <asp:ListItem Value="SP">São Paulo</asp:ListItem>
                        <asp:ListItem Value="SE">Sergipe</asp:ListItem>
                        <asp:ListItem Value="TO">Tocantins</asp:ListItem>
                    </asp:DropDownList>
                </label>
                <label>
                    Cidade:
                    <asp:TextBox ID="txtCidade" runat="server" CssClass="form-text"></asp:TextBox>
                </label>
                <label>
                    Complemento:
                    <asp:TextBox ID="txtComplemento" runat="server" CssClass="form-text"></asp:TextBox>
                </label>
                <asp:LinkButton ID="lnkCadastrar" OnClick="lnkCadastrar_Click" runat="server" CssClass="button-cadastrar"></asp:LinkButton>
            </div>
        </div>
    </div>

    <script>
        function toggleCPF_CNPJ() {
            const toggleLabel = document.getElementById("toggleLabel");
            const inputField = document.getElementById("txtDocumento");
            const isCNPJ = document.getElementById("toggleSwitch").checked;
            const divSexo = document.getElementById("divSexo");
            const divRazaoSocial = document.getElementById("divRazaoSocial");

            if (isCNPJ) {
                toggleLabel.textContent = "CNPJ:";
                inputField.placeholder = "Insira CNPJ";
                inputField.maxLength = 18; // Máximo de caracteres para CNPJ formatado
                divSexo.style.display = "none"; // Oculta o campo Sexo
                divRazaoSocial.style.display = "flex"; // Exibe o campo Razão Social
            } else {
                toggleLabel.textContent = "CPF:";
                inputField.placeholder = "Insira CPF";
                inputField.maxLength = 14; // Máximo de caracteres para CPF formatado
                divSexo.style.display = "flex"; // Exibe o campo Sexo
                divRazaoSocial.style.display = "none"; // Oculta o campo Razão Social
            }
            inputField.value = ""; // Limpa o campo ao alternar entre CPF e CNPJ
        }

        function aplicarMascara() {
            const inputField = document.getElementById("txtDocumento");
            const isCNPJ = document.getElementById("toggleSwitch").checked;
            let value = inputField.value.replace(/\D/g, ""); // Remove tudo que não é número

            if (isCNPJ) {
                // Máscara para CNPJ: 00.000.000/0000-00
                value = value.replace(/^(\d{2})(\d)/, "$1.$2");
                value = value.replace(/^(\d{2})\.(\d{3})(\d)/, "$1.$2.$3");
                value = value.replace(/\.(\d{3})(\d)/, ".$1/$2");
                value = value.replace(/(\d{4})(\d)/, "$1-$2");
            } else {
                // Máscara para CPF: 000.000.000-00
                value = value.replace(/^(\d{3})(\d)/, "$1.$2");
                value = value.replace(/\.(\d{3})(\d)/, ".$1.$2");
                value = value.replace(/(\d{3})(\d{1,2})$/, "$1-$2");
            }

            inputField.value = value;
        }
    </script>

</asp:Content>