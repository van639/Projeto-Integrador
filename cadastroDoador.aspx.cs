using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal_do_Bem
{
    public partial class cadastroDoador : System.Web.UI.Page
    {
        private static string _connection = @"Data Source=NII\MSSQLSERVER01;Initial Catalog=db_projeto;User ID=nicollas;Password=lala1219";

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

            }
        }

        private void InsertDoador()
        {
            string queryDoador = @"INSERT INTO DOADOR (NOME, EMAIL, TELEFONE, SENHA_LOGIN, DATA_CADASTRO, SN_ATIVO, RUA, CEP, NUMERO, COMPLEMENTO, CIDADE, UF)
                                   VALUES (@nome, @email, @telefone, @senha, GETDATE(), 1, @rua, @cep, @numero, @complemento, @cidade, @uf)
                                   SELECT SCOPE_IDENTITY();";

            string queryPFisica = @"INSERT INTO PESSOA_FISICA (ID_DOADOR, CPF, SEXO)
                                    VALUES (@idDoador, @cpf, @sexo)";

            string queryPJuridica = @"INSERT INTO PESSOA_JURIDICA (ID_DOADOR, CNPJ, RAZAO_SOCIAL)
                                      VALUES (@idDoador, @cnpj, @razaoSocial)";


            try
            {
                using (SqlConnection conn = new SqlConnection(_connection))
                {
                    conn.Open();

                    using(SqlTransaction transaction = conn.BeginTransaction())
                    {
                        try
                        {
                            using (SqlCommand cmdDoador = new SqlCommand(queryDoador, conn, transaction))
                            {
                                cmdDoador.Parameters.AddWithValue("@nome", txtNome.Text);
                                cmdDoador.Parameters.AddWithValue("@email", txtEmail.Text);
                                cmdDoador.Parameters.AddWithValue("@telefone", txtTelefone.Text);
                                cmdDoador.Parameters.AddWithValue("@senha", txtSenha.Text);
                                cmdDoador.Parameters.AddWithValue("@rua", txtRua.Text);
                                cmdDoador.Parameters.AddWithValue("@cep", txtCEP.Text.Replace("-", ""));
                                cmdDoador.Parameters.AddWithValue("@numero", txtNumero.Text);
                                cmdDoador.Parameters.AddWithValue("@complemento", txtComplemento.Text);
                                cmdDoador.Parameters.AddWithValue("@cidade", txtCidade.Text);
                                cmdDoador.Parameters.AddWithValue("@uf", ddlEstados.SelectedValue);

                                int idDoador = Convert.ToInt32(cmdDoador.ExecuteScalar());

                                string documento = txtDocumento.Text.Replace(".", "").Replace("-", "").Replace("/", "");

                                // CPF - 11 Dígitos
                                if (documento.Length == 11)
                                {
                                    using (SqlCommand cmdCPF = new SqlCommand(queryPFisica, conn, transaction))
                                    {
                                        cmdCPF.Parameters.AddWithValue("@idDoador", idDoador);
                                        cmdCPF.Parameters.AddWithValue("@cpf", documento);
                                        cmdCPF.Parameters.AddWithValue("@sexo", ddlSexo.SelectedValue);

                                        cmdCPF.ExecuteNonQuery();
                                    }
                                }

                                //CNPJ - 14 Dígitos
                                else if (documento.Length == 14)
                                {
                                    using(SqlCommand cmdCNPJ = new SqlCommand (queryPJuridica, conn, transaction))
                                    {
                                        cmdCNPJ.Parameters.AddWithValue("@id", idDoador);
                                        cmdCNPJ.Parameters.AddWithValue("@cnpj", documento);
                                        cmdCNPJ.Parameters.AddWithValue("@razaoSocial", txtRazaoSocial.Text);

                                        cmdCNPJ.ExecuteNonQuery();
                                    }
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
            txtDocumento.Text = "";
            txtRazaoSocial.Text = "";
            txtSenha.Text = "";
            txtRua.Text = "";
            txtCEP.Text = "";
            txtNumero.Text = "";
            txtComplemento.Text = "";
            txtCidade.Text = "";
            ddlEstados.SelectedValue = "SELECIONE";
            ddlSexo.SelectedValue = "SELECIONE";
        }

        protected void lnkCadastrar_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtNome.Text) && !string.IsNullOrWhiteSpace(txtSenha.Text))
            {
                InsertDoador();
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