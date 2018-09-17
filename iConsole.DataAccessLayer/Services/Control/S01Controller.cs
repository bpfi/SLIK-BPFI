using iConsole.DataAccessLayer.ApiServices.Entity;
using iConsole.DataAccessLayer.Services.Entity;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Web;

namespace iConsole.DataAccessLayer.Services.Control
{
    public class S01Controller
    {
        public bool ValidateS01(List<EntityS01> entity, List<Headers> headerEntity)
        {
            string sparator = "|";
            string text = "";
            List<string> _listtext = new List<string>();
            string _finaltext = "";
            try
            {
                text =
                   (string)headerEntity[0].FLAG_HEADER + sparator +
                   (string)headerEntity[0].CODE_JENIS_LJK + sparator +
                   (string)headerEntity[0].KODE_LJK + sparator +
                   (string)headerEntity[0].TAHUN + sparator +
                   (string)headerEntity[0].BULAN + sparator +
                   (string)headerEntity[0].CODE_SEGMEN + sparator +
                   (string)headerEntity[0].JUMLAH_DATA_FILE + sparator +
                   (string)headerEntity[0].JUMLAH_DATA_SEGMEN +
                   Environment.NewLine;

                _listtext.Add(text);

                foreach (EntityS01 item in entity)
                {
                    text =
                        item.flag + sparator +
                        item.no_rekening_fasilitas + sparator +
                        item.cif + sparator +
                        item.kd_js_segmen_fasilitas + sparator +
                        item.kd_kolektibilitas1 + sparator +
                        item.jml_hari_tunggakan1 + sparator +
                        item.kd_kolektabilitas2 + sparator +
                        item.jml_hari_tunggakan2 + sparator +
                        item.kd_kolektabilitas3 + sparator +
                        item.jml_hari_tunggakan3 + sparator +
                        item.kd_kolektabilitas4 + sparator +
                        item.jml_hari_tunggakan4 + sparator +
                        item.kd_kolektabilitas5 + sparator +
                        item.jml_hari_tunggakan5 + sparator +
                        item.kd_kolektabilitas6 + sparator +
                        item.jml_hari_tunggakan6 + sparator +
                        item.kd_kolektabilitas7 + sparator +
                        item.jml_hari_tunggakan7 + sparator +
                        item.kd_kolektabilitas8 + sparator +
                        item.jml_hari_tunggakan8 + sparator +
                        item.kd_kolektabilitas9 + sparator +
                        item.jml_hari_tunggakan9 + sparator +
                        item.kd_kolektabilitas10 + sparator +
                        item.jml_hari_tunggakan10 + sparator +
                        item.kd_kolektabilitas11 + sparator +
                        item.jml_hari_tunggakan11 + sparator +
                        item.kd_kolektabilitas12 + sparator +
                        item.jml_hari_tunggakan12 +
                        Environment.NewLine;

                    _listtext.Add(text);
                }

                foreach (string item in _listtext)
                {
                    _finaltext = _finaltext + item;
                }

                String FileName = "0201.251220." + headerEntity[0].TAHUN + "." + headerEntity[0].BULAN + "." + headerEntity[0].CODE_SEGMEN + ".1.txt";
                string Path = HttpContext.Current.Server.MapPath("~/compress\\");

                if (File.Exists(Path + FileName))
                {
                    // Note that no lock is put on the
                    // file and the possibility exists
                    // that another process could do
                    // something with it between
                    // the calls to Exists and Delete.
                    File.Delete(Path + FileName);
                }

                using (FileStream fs = File.Create(Path + FileName))
                {
                    Byte[] info = new UTF8Encoding(true).GetBytes(_finaltext);
                    // Add some information to the file.
                    fs.Write(info, 0, info.Length);
                }
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e);
            }
            return true;
        }

    }
}
