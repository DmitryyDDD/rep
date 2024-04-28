using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SportMarket
{
    public partial class frm_login : Form
    {
        public frm_login()
        {
            InitializeComponent();
        }
        public static string UserName;
        private void btn_Login_as_Click(object sender, EventArgs e)
        {
            frm_Main frm = new frm_Main();
            frm.Show();
            Hide();
        }

        private void btn_Login_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(@"Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=SportMarket;Data Source=DESKTOP-872R2S1\SQLEXPRESS"))
            {
                try
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "Autorization_Proc";
                    cmd.Parameters.AddWithValue("@login", tb_Login.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", tb_Password.Text.Trim());
                    SqlDataReader reader = cmd.ExecuteReader();
                    reader.Read();
                    if (reader.HasRows)
                    {
                        UserName = reader.GetValue(2).ToString() + " " +
                            reader.GetValue(3).ToString() + " " +
                            reader.GetValue(4).ToString();
                        MessageBox.Show("Добро пожаловать!");
                        frm_Main frm = new frm_Main();
                        frm.Show();
                        Hide();
                    }
                    else
                    {
                        MessageBox.Show("Неправильный логин или пароль");
                    }
                }
                catch
                {
                    MessageBox.Show("Произошла непредвиденная ошибка");
                }
            }
        }
    }
}
