
namespace Tool_update_TT78
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.openFilebtn = new System.Windows.Forms.Button();
            this.linkTxt = new System.Windows.Forms.Label();
            this.ExecuteBtn = new System.Windows.Forms.Button();
            this.result = new System.Windows.Forms.RichTextBox();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.button1 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // openFilebtn
            // 
            this.openFilebtn.Location = new System.Drawing.Point(45, 32);
            this.openFilebtn.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.openFilebtn.Name = "openFilebtn";
            this.openFilebtn.Size = new System.Drawing.Size(100, 28);
            this.openFilebtn.TabIndex = 0;
            this.openFilebtn.Text = "Chọn file";
            this.openFilebtn.UseVisualStyleBackColor = true;
            this.openFilebtn.Click += new System.EventHandler(this.openFilebtn_Click);
            // 
            // linkTxt
            // 
            this.linkTxt.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.linkTxt.Location = new System.Drawing.Point(153, 32);
            this.linkTxt.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.linkTxt.Name = "linkTxt";
            this.linkTxt.Size = new System.Drawing.Size(476, 28);
            this.linkTxt.TabIndex = 1;
            this.linkTxt.Text = "Đường dẫn ...";
            // 
            // ExecuteBtn
            // 
            this.ExecuteBtn.Location = new System.Drawing.Point(637, 32);
            this.ExecuteBtn.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.ExecuteBtn.Name = "ExecuteBtn";
            this.ExecuteBtn.Size = new System.Drawing.Size(100, 28);
            this.ExecuteBtn.TabIndex = 2;
            this.ExecuteBtn.Text = "Thực hiện";
            this.ExecuteBtn.UseVisualStyleBackColor = true;
            this.ExecuteBtn.Click += new System.EventHandler(this.ExecuteBtn_Click);
            // 
            // result
            // 
            this.result.Location = new System.Drawing.Point(45, 95);
            this.result.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.result.Name = "result";
            this.result.Size = new System.Drawing.Size(691, 393);
            this.result.TabIndex = 3;
            this.result.Text = "";
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(637, 68);
            this.button1.Margin = new System.Windows.Forms.Padding(4);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(100, 28);
            this.button1.TabIndex = 4;
            this.button1.Text = "TT32";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1067, 554);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.result);
            this.Controls.Add(this.ExecuteBtn);
            this.Controls.Add(this.linkTxt);
            this.Controls.Add(this.openFilebtn);
            this.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button openFilebtn;
        private System.Windows.Forms.Label linkTxt;
        private System.Windows.Forms.Button ExecuteBtn;
        private System.Windows.Forms.RichTextBox result;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.Button button1;
    }
}

