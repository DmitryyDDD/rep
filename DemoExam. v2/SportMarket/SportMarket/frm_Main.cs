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
    public partial class frm_Main : Form
    {
        public frm_Main()
        {
            InitializeComponent();
        }

        private void frm_Main_Load(object sender, EventArgs e)
        {
            lbl_User_Name.Text = frm_login.UserName;
            
            using (SqlConnection connection = new SqlConnection(@"Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=SportMarket;Data Source=DESKTOP-872R2S1\SQLEXPRESS"))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select * from View_Product";
                
                
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);
                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                dgv_product.DataSource = dataTable;
                connection.Close();
            }
        }

        private void btn_Exit_Click(object sender, EventArgs e)
        {
            frm_login login = new frm_login();
            login.Show();
            Hide();
        }
    }
}
