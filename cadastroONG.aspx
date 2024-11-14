<%@ Page Title="Cadastro de ONG" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cadastroONG.aspx.cs" Inherits="Portal_do_Bem.cadastroONG" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link href="assents/Style/cadastroONG.css" rel="stylesheet" />
    <link href="assents/Style/menu.css" rel="stylesheet" />

    <!-- Importação do SweetAlert2 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>

    <div id="container-conteudo">
        <h1>CADASTRO ONG</h1>
        <p>
            Por favor, conclua o cadastro com suas informações . Sua colaboração é fundamental para garantir que possamos processar sua doação com eficiência. Agradecemos antecipadamente por sua contribuição e por fazer a diferença na vida daqueles que precisam
        </p>
        <div id="container-cadastro-ong">
            <div id="container-esquerdo-cadastro">
                <label>
                    CNPJ:
                    <asp:TextBox ID="txtCNPJ" runat="server" CssClass="form-text"></asp:TextBox>
                </label>
                <label>
                    Nome:
                    <asp:TextBox ID="txtNome" runat="server" CssClass="form-text"></asp:TextBox>
                </label>
                <label>
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


                <label>
                    Foto
                    <input type="button" value="Selecionar" class="custom-file-button" onclick="document.getElementById('<%= flArquivos.ClientID %>').click();" />
                    <asp:FileUpload style="display:none;" runat="server" ID="flArquivos" AllowMultiple="true" Multiple="Multiple" class="hidden-file-upload" onchange="handleFiles(this)" />
                </label>

                <!-- Lista de arquivos -->
                <ul id="fileList" class="file-list"></ul>


                <label>
                    História:
                    <asp:TextBox ID="txtHistoria" runat="server" CssClass="form-text" TextMode="MultiLine"></asp:TextBox>
                </label>
            </div>
            <div id="container-direito-cadastro">
                <label>
                    Site:
                    <asp:TextBox ID="txtSite" runat="server" CssClass="form-text"></asp:TextBox>
                </label>
                <div id="container-cep-numero">
                    <label>
                        Cep:
                        <asp:TextBox ID="txtCEP" runat="server" CssClass="form-text" placeholder="_____-___"></asp:TextBox>
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
                    Bairro:
                    <asp:TextBox ID="txtBairro" runat="server" CssClass="form-text"></asp:TextBox>
                </label>
                <label>
                    Complemento:
                    <asp:TextBox ID="txtComplemento" runat="server" CssClass="form-text"></asp:TextBox>
                </label>
                <label>
                    Missão:
                    <asp:TextBox ID="txtMissao" runat="server" CssClass="form-text"></asp:TextBox>
                </label>
                <label>
                    Visão:
                    <asp:TextBox ID="txtVisao" runat="server" CssClass="form-text"></asp:TextBox>
                </label>
                <label>
                    Valores:
                   <asp:TextBox ID="txtValores" runat="server" CssClass="form-text"></asp:TextBox>
                </label>
                <asp:LinkButton ID="lnkCadastrar" OnClick="lnkCadastrar_Click" CssClass="button-cadastrar" runat="server">CADASTRAR</asp:LinkButton>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        let selectedFiles = []; // Armazena os arquivos selecionados

        function handleFiles(input) {
            const fileList = document.getElementById("fileList");
            selectedFiles = Array.from(input.files); // Armazena os arquivos

            fileList.innerHTML = ""; // Limpa a lista de arquivos antes de exibir

            selectedFiles.forEach((file, index) => {
                // Cria um item de lista para cada arquivo
                const listItem = document.createElement("li");
                listItem.className = "file-item";
                listItem.innerHTML = `
            ${file.name} 
            <button onclick="removeFile(${index})">Remover</button>
        `;
                fileList.appendChild(listItem);
            });
        }

        // Função para remover um arquivo da lista
        function removeFile(index) {
            selectedFiles.splice(index, 1); // Remove o arquivo do array
            const fileList = document.getElementById("fileList");

            fileList.innerHTML = ""; // Limpa a lista para atualização

            selectedFiles.forEach((file, newIndex) => {
                // Re-renderiza a lista sem o arquivo removido
                const listItem = document.createElement("li");
                listItem.className = "file-item";
                listItem.innerHTML = `
            ${file.name} 
            <button onclick="removeFile(${newIndex})">Remover</button>
        `;
                fileList.appendChild(listItem);
            });
        }

    </script>
</asp:Content>
