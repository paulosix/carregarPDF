using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics;
using System.Drawing.Printing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace carregarPDF
{
    public partial class PesquisaBoleto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected string retornaImagem()
        {
            return @"~\download.png";
        }

        protected string imprimirImagem()
        {
            return @"~\imprimir.png";
        }        

        protected void Button1_Click(object sender, EventArgs e)
        {
            string pathArquivos = ConfigurationManager.AppSettings["pathArquivos"].ToString();


            var query = from files in Directory.GetFiles(@pathArquivos + "\\" + txtCPF.Text , "*.*", SearchOption.TopDirectoryOnly)
                        let file = new FileInfo(files)
                        select new
                        {
                            Caminho = file.FullName,
                            NomeArquivo = file.Name,
                        };

            GridView1.DataSource = query;
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {

                int index = Convert.ToInt32(e.CommandArgument);

                string path = GridView1.Rows[index].Cells[0].Text;
                Response.ContentType = ContentType;
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(path));
                Response.WriteFile(path);
                Response.End();
            }
            else if (e.CommandName == "Imprimir")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                string path = GridView1.Rows[index].Cells[0].Text;
                Imprimir(path);
            }
        }

        private void Imprimir(string p_pathFilePdf)
        {
            try
            {
                System.Diagnostics.Process.Start(@p_pathFilePdf);
            }
            catch (Exception ex)
            {
            }
        }
    }
}