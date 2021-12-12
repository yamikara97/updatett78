using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
namespace TT78_replaceTool
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                string fileName;

                fileName = openFileDialog1.FileName;
                duongdanTxt.Text = fileName;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if(duongdanTxt.Text == "")
            {
                MessageBox.Show("Mời chọn đường dẫn");

            }
            else
            {
                try
                {

                    String FilePath;
                    FilePath = "\\Db\\tt78.db";
                  
                    string[] lines = System.IO.File.ReadAllLines(duongdanTxt.Text);
                    string content = "giá trị: \n";
                    foreach (var item in lines)
                    {
                        content += item;
                    }
                    result.Text = content;

                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private void result_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
