using iConsole.DataAccessLayer.Services.Entity;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Web;

namespace iConsole.DataAccessLayer.Services.Control
{
    public class A01Controller
    {
        public bool ValidateA01(List<EntityA01> entity, List<Headers> headerEntity)
        {
            string sparator = "|";
            string text = "";
            List<string> _listtext = new List<string>();
            string _finaltext = "";
            try
            {
                // Header 

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

                foreach (EntityA01 item in entity)
                {
                    text =
                        item.flag_detail + sparator +
                        item.kd_registrasi + sparator +
                        item.no_rekening_fasilitas + sparator +
                        item.cif + sparator +
                        item.kd_js_segmen_fasilitas + sparator +
                        item.kd_status_agunan + sparator +
                        item.kd_jenis_agunan + sparator +
                        item.peringkat_agunan + sparator +
                        item.kd_lembaga_pemeringkat + sparator +
                        item.kd_jenis_pengikatan + sparator +
                        item.tgl_pengikatan + sparator +
                        item.nama_pemilik_agunan + sparator +
                        item.bukti_kepemilikan + sparator +
                        item.alamat_agunan + sparator +
                        item.kd_kota + sparator +
                        item.nilai_agunan_njop + sparator +
                        item.nilai_agunan_ljk + sparator +
                        item.tgl_penilaian_ljk + sparator +
                        item.nilai_agunan_independen + sparator +
                        item.nama_independen + sparator +
                        item.tgl_penilaian_independen + sparator +
                        item.status_paripasu + sparator +
                        item.persentase_paripasu + sparator +
                        item.status_kredit_join + sparator +
                        item.di_asuransikan + sparator +
                        item.keterangan + sparator +
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

                //System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
                //response.Clear();
                //response.AppendHeader("Content-Disposition", "attachment; filename=" + FileName);
                //response.ContentType = "application/octet-stream";
                //response.Write(_finaltext);
                //response.Flush();
                //response.End();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e);
            }
            return true;
        }

    }
}
