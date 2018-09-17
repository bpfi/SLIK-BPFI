using iConsole.DataAccessLayer.ApiServices.Entity;
using iConsole.DataAccessLayer.Services.Entity;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Web;

namespace iConsole.DataAccessLayer.Services.Control
{
    public class D02Controller
    {

        public bool ValidateD02(List<EntityD02> entity, List<Headers> headerEntity)
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

                foreach (EntityD02 item in entity)
                {
                    text = item.flag_detail + sparator +
                            item.cif + sparator +
                            item.nomor_identitas + sparator +
                            item.nama_badan_usaha + sparator +
                            item.kode_jenis_usaha + sparator +
                            item.tempat_pendirian + sparator +
                            item.nomor_akta_pendirian + sparator +
                            item.tanggal_akta_pendirian + sparator +
                            item.nomor_akta_perubahan_terakhir + sparator +
                            item.tanggal_akta_perubahan_terakhir + sparator +
                            item.no_hp + sparator +
                            item.no_selular + sparator +
                            item.alamat_email + sparator +
                            item.alamat + sparator +
                            item.kelurahan + sparator +
                            item.kecamatan + sparator +
                            item.kode_sandi_kota + sparator +
                            item.kode_pos + sparator +
                            item.kode_negara_domisili + sparator +
                            item.kode_bidang_usaha + sparator +
                            item.kode_hubungan_dengan_pelapor + sparator +
                            item.melanggar_bmpk + sparator +
                            item.melampaui_bmpk + sparator +
                            item.go_public + sparator +
                            item.kode_golongan + sparator +
                            item.peringkat + sparator +
                            item.lembaga_pemeringkat + sparator +
                            item.tanggal_pemeringkat + sparator +
                            item.nama_group + sparator +
                            item.kode_cabang + sparator +
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
