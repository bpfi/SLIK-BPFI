using iConsole.DataAccessLayer.ApiServices.Entity;
using iConsole.DataAccessLayer.Services.Entity;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Web;

namespace iConsole.DataAccessLayer.Services.Control
{
    public class M01Controller
    {
        public bool ValidateM01(List<EntityM01> entity, List<Headers> headerEntity)
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

                foreach (EntityM01 item in entity)
                {
                    text =
                        item.flag + sparator +
                        item.no_identitas_pengurusan + sparator +
                        item.cif + sparator +
                        item.kd_js_identitas + sparator +
                        item.nama_pengurus + sparator +
                        item.js_kelamin + sparator +
                        item.alamat + sparator +
                        item.kelurahan + sparator +
                        item.kecamatan + sparator +
                        item.kd_sandi_kota + sparator +
                        item.kd_jabatan + sparator +
                        item.pangsa_kepemilikan + sparator +
                        item.status_pengurus + sparator +
                        item.kd_cabang + sparator +
                        item.operasi_data +
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
