using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SQLite;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Tool_update_TT78
{
    public partial class Form1 : Form
    {
        
        public Form1()
        {
            InitializeComponent();
        }

        private void openFilebtn_Click(object sender, EventArgs e)
        {
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                string fileName;

                fileName = openFileDialog1.FileName;
                linkTxt.Text = fileName;
            }
        }

        private void ExecuteBtn_Click(object sender, EventArgs e)
        {
            if (linkTxt.Text == "")
            {
                MessageBox.Show("Mời chọn đường dẫn");

            }
            else
            {
                try
                {
                    SQLiteConnection sqlite_conn;
                    // Create a new database connection:
                    string path = Path.Combine(Environment.CurrentDirectory, "tt78.db");
                    MessageBox.Show(path);
                    sqlite_conn = new SQLiteConnection("Data Source= "+ path + "; Version = 3;");
                    sqlite_conn.Open();
                    SQLiteCommand sqlite_cmd;
                    sqlite_cmd = sqlite_conn.CreateCommand();
                    sqlite_cmd.CommandText = "SELECT * FROM TT78_value";
                    SQLiteDataReader sqlite_datareader;
                    sqlite_datareader = sqlite_cmd.ExecuteReader();


                    List<GTGT> listgtgt = new List<GTGT>();
                    string content = "";


                    while (sqlite_datareader.Read())
                    {
                        GTGT gtgt = new GTGT();

                       gtgt.TT32Pdf  = sqlite_datareader.GetString(0);
                       gtgt.TT32Web = sqlite_datareader.GetString(1);
                       gtgt.TT78 = sqlite_datareader.GetString(2);
                       listgtgt.Add(gtgt);
                    }
                    sqlite_conn.Close();

                    string[] lines = System.IO.File.ReadAllLines(linkTxt.Text);
                    foreach (var item in lines)
                    {
                        content += item + "\n";
                    }

                    foreach(var item in listgtgt)
                    {
                        while (content.Contains(item.TT32Pdf))
                        {
                            content = content.Replace(item.TT32Pdf, item.TT78);
                        }   
                    }
                    // match = "/invoice"
                    while (content.Contains("match=\"/invoice\""))
                    {
                        content = content.Replace("match=\"/invoice\"", "match=\"/HDon\"");
                    }
                    result.Text = content;

                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (linkTxt.Text == "")
            {
                MessageBox.Show("Mời chọn đường dẫn");

            }
            else
            {
                try
                {
                    SQLiteConnection sqlite_conn;
                    // Create a new database connection:
                    string path = Path.Combine(Environment.CurrentDirectory, "tt78.db");
                    MessageBox.Show(path);
                    sqlite_conn = new SQLiteConnection("Data Source= " + path + "; Version = 3;");
                    sqlite_conn.Open();
                    SQLiteCommand sqlite_cmd;
                    sqlite_cmd = sqlite_conn.CreateCommand();
                    sqlite_cmd.CommandText = "SELECT * FROM TT78_value";
                    SQLiteDataReader sqlite_datareader;
                    sqlite_datareader = sqlite_cmd.ExecuteReader();


                    List<GTGT> listgtgt = new List<GTGT>();
                    string content = "";


                    while (sqlite_datareader.Read())
                    {
                        GTGT gtgt = new GTGT();

                        gtgt.TT32Pdf = sqlite_datareader.GetString(0);
                        gtgt.TT32Web = sqlite_datareader.GetString(1);
                        gtgt.TT78 = sqlite_datareader.GetString(2);
                        listgtgt.Add(gtgt);
                    }
                    sqlite_conn.Close();

                    string[] lines = System.IO.File.ReadAllLines(linkTxt.Text);
                    foreach (var item in lines)
                    {
                        content += item + "\n";
                    }

                    foreach (var item in listgtgt)
                    {
                        while (content.Contains(item.TT32Web))
                        {
                            content = content.Replace(item.TT32Web, item.TT78);
                        }
                    }
                    // match = "/invoice"
                    while (content.Contains("match=\"inv:invoice\""))
                    {
                        content = content.Replace("match=\"inv:invoice\"", "match=\"/HDon\"");
                    }
                    result.Text = content;

                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }
    }
}
