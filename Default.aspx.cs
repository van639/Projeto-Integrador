using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal_do_Bem
{
    public partial class _Default : Page
    {
        private static string _connection = @"Data Source=NII\MSSQLSERVER01;Initial Catalog=db_projeto;User ID=nicollas;Password=lala1219";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CarregarONGS();
            }
        }

        private void CarregarONGS()
        {
            string query = @"SELECT ID_ONG, NOME_ONG, SUBSTRING(FOTO, CHARINDEX('Arquivos Salvos', FOTO), LEN(FOTO)) AS FOTO, SITE_URL FROM ONG";

            using (SqlConnection conn = new SqlConnection(_connection))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);

                    DataTable dataTable = new DataTable();

                    try
                    {
                        adapter.Fill(dataTable);
                        repeater.DataSource = dataTable;
                        repeater.DataBind();
                    }

                    catch (Exception ex)
                    {
                        string script = "Swal.fire({title: 'Erro ao Carregar', text: '" + ex + @"', icon: 'error', confirmButtonText: 'Ok'})";
                        ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script, true);
                    }
                }
            }
        }
    }
}