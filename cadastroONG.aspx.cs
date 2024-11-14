using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal_do_Bem
{
    public partial class cadastroONG : System.Web.UI.Page
    {
        private static string _connection = @"Data Source=NII\MSSQLSERVER01;Initial Catalog=db_projeto;User ID=nicollas;Password=lala1219";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        private void InsertONG()
        {
            string filePath = "";

            if (HttpContext.Current.Request.Files.Count == 1)
            {
                //-------------------------------------
                // Define o path do arquivo
                string folderPath = @"C:\Users\nicol\source\repos\Portal do Bem\Arquivos Salvos\" + txtNome.Text + "\\";

                //-------------------------------------
                // Cria o diretório físico se não existir
                if (!System.IO.Directory.Exists(folderPath))
                    System.IO.Directory.CreateDirectory(folderPath);
                //-------------------------------------
                // Obtém o único arquivo
                HttpFileCollection httpArquivos = HttpContext.Current.Request.Files;
                HttpPostedFile userPostedFile = httpArquivos[0];  // Usando o índice 0 para acessar o único arquivo
                string fileName = Path.GetFileName(userPostedFile.FileName);

                // Define o caminho completo do arquivo, incluindo o nome e extensão
                filePath = Path.Combine(folderPath, fileName);

                //-------------------------------------
                // Grava o arquivo fisicamente
                userPostedFile.SaveAs(filePath);
            }



            string queryOng = @"INSERT INTO ONG (NOME_ONG, EMAIL, TELEFONE, CNPJ, RAZAO_SOCIAL, HISTORIA, FOTO, SITE_URL, MISSAO, VISAO, VALORES, DATA_CADASTRO, SENHA_ACESSO, STATUS_ONG) 
                                VALUES (@nome, @email, @telefone, @cnpj, @razaoSocial, @historia, @caminhoArquivo, @siteUrl, @missao, @visao, @valores, GETDATE(), @senha, 1); 
                                SELECT SCOPE_IDENTITY();";

            string queryEndereco = @"INSERT INTO ENDERECO (ID_ONG, RUA, BAIRRO, CEP, NUMERO, COMPLEMENTO, CIDADE, UF, DATA_CADASTRO)
                                    VALUES (@id_Ong, @rua, @bairro, @cep, @numero, @complemento, @cidade, @uf, GETDATE());";


            try
            {
                using (SqlConnection conn = new SqlConnection(_connection))
                {
                    conn.Open();

                    using (SqlTransaction transaction = conn.BeginTransaction())
                    {
                        try
                        {
                            using (SqlCommand cmdOng = new SqlCommand(queryOng, conn, transaction))
                            {
                                cmdOng.Parameters.AddWithValue("@nome", txtNome.Text);
                                cmdOng.Parameters.AddWithValue("@email", txtEmail.Text);
                                cmdOng.Parameters.AddWithValue("@telefone", txtTelefone.Text);
                                cmdOng.Parameters.AddWithValue("@cnpj", txtCNPJ.Text.Replace(".", "").Replace("/", "").Replace("-", ""));
                                cmdOng.Parameters.AddWithValue("@razaoSocial", txtRazaoSocial.Text);
                                cmdOng.Parameters.AddWithValue("@historia", txtHistoria.Text);
                                cmdOng.Parameters.AddWithValue("@caminhoArquivo", filePath);
                                cmdOng.Parameters.AddWithValue("@siteUrl", txtSite.Text);
                                cmdOng.Parameters.AddWithValue("@missao", txtMissao.Text);
                                cmdOng.Parameters.AddWithValue("@visao", txtVisao.Text);
                                cmdOng.Parameters.AddWithValue("@valores", txtValores.Text);
                                cmdOng.Parameters.AddWithValue("@senha", txtSenha.Text);

                                int idOng = Convert.ToInt32(cmdOng.ExecuteScalar());

                                using (SqlCommand cmdEndereco = new SqlCommand(queryEndereco, conn, transaction))
                                {
                                    cmdEndereco.Parameters.AddWithValue("@id_Ong", idOng);
                                    cmdEndereco.Parameters.AddWithValue("@rua", txtRua.Text);
                                    cmdEndereco.Parameters.AddWithValue("@bairro", txtBairro.Text);
                                    cmdEndereco.Parameters.AddWithValue("@cep", txtCEP.Text.Replace("-", ""));
                                    cmdEndereco.Parameters.AddWithValue("@numero", txtNumero.Text);
                                    cmdEndereco.Parameters.AddWithValue("@complemento", txtComplemento.Text);
                                    cmdEndereco.Parameters.AddWithValue("@cidade", txtCidade.Text);
                                    cmdEndereco.Parameters.AddWithValue("@uf", ddlEstados.SelectedValue);

                                    cmdEndereco.ExecuteNonQuery();
                                }
                            }

                            //confirma a transação
                            transaction.Commit();
                            string script = "Swal.fire({title: 'Concluído', text: 'ONG cadastrada com sucesso!', icon: 'success', confirmButtonText: 'Ok'})";
                            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script, true);
                        }

                        catch (Exception ex)
                        {
                            //reverte a transação em caso de erro
                            transaction.Rollback();
                            string script = "Swal.fire({title: 'Erro ao Cadastrar', text: '" + ex + @"', icon: 'error', confirmButtonText: 'Ok'})";
                            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script, true);
                        }
                    }

                    conn.Close();
                }
            }

            catch (Exception ex)
            {
                string script = "Swal.fire({title: 'Erro de Conexão', text: '" + ex + @"', icon: 'error', confirmButtonText: 'Ok'})";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script, true);
            }
        }

        private void LimparForm()
        {
            txtNome.Text = "";
            txtEmail.Text = "";
            txtTelefone.Text = "";
            txtCNPJ.Text = "";
            txtRazaoSocial.Text = "";
            txtHistoria.Text = "";
            txtSite.Text = "";
            txtMissao.Text = "";
            txtVisao.Text = "";
            txtValores.Text = "";
            txtSenha.Text = "";
            txtRua.Text = "";
            txtBairro.Text = "";
            txtCEP.Text = "";
            txtNumero.Text = "";
            txtComplemento.Text = "";
            txtCidade.Text = "";
            ddlEstados.SelectedValue = "SELECIONE";
        }

        protected void lnkCadastrar_Click(object sender, EventArgs e)
        {
            if(!string.IsNullOrWhiteSpace(txtNome.Text) && !string.IsNullOrWhiteSpace(txtSenha.Text))
            {
                InsertONG();
                LimparForm();
            }

            else
            {
                string script = "Swal.fire({title: 'Alerta', text: 'Preencha todos os campo', icon: 'warning', confirmButtonText: 'Ok'})";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script, true);
            }
        }
    }
}