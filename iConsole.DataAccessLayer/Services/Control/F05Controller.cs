using iConsole.DataAccessLayer.ApiServices.Entity;
using iConsole.DataAccessLayer.Services.Entity;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Web;

namespace iConsole.DataAccessLayer.Services.Control
{
    public class F05Controller
    {
        public bool ValidateF05(List<EntityF05> entity, List<Headers> headerEntity)
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

                foreach (EntityF05 item in entity)
                {
                    text =
                        item.flag_detail + sparator +
                        item.no_rekening + sparator +
                        item.cif + sparator +
                        item.kd_jenis_garansi + sparator +
                        item.kd_tujuan_garansi + sparator +
                        item.tgl_penerbitan + sparator +
                        item.tgl_jatuh_tempo + sparator +
                        item.no_akad + sparator +
                        item.tgl_akad_awal + sparator +
                        item.no_akad_akhir + sparator +
                        item.tgl_akad_akhir + sparator +
                        item.nm_jaminan + sparator +
                        item.kd_valueta + sparator +
                        item.plafon + sparator +
                        item.nominal + sparator +
                        item.storan_jaminan + sparator +
                        item.kd_kolektabilitas + sparator +
                        item.tgl_wan_prestasi + sparator +
                        item.kd_kondisi + sparator +
                        item.tgl_kondisi + sparator +
                        item.keterangan + sparator +
                        item.kd_cabang + sparator +
                        item.op_data +
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
