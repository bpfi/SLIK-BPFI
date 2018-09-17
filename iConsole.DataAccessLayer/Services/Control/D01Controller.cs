using iConsole.DataAccessLayer.ApiServices.Entity;
using iConsole.DataAccessLayer.Services.Entity;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Web;

namespace iConsole.DataAccessLayer.Services.Control
{
    public class D01Controller
    {
        // ini functionnya masukin tiap entyty D01 dan seterusnya tiap modul beda kontroler samaa beda entity
        public bool ValidateD01(List<EntityD01> entity, List<Headers> headerEntity)
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
                    (string)headerEntity[0].JUMLAH_DATA_SEGMEN+
                     Environment.NewLine;
                _listtext.Add(text);

                // looping isi yg ada di list isinya di taro di _listtext
                foreach (EntityD01 item in entity)
                {
                    text = 
                        (string)item.flag_detail + sparator + 
                        (string)item.cif + sparator + 
                        (string)item.j_identity + sparator + 
                        (string)item.nik + sparator + 
                        (string)item.nama + sparator +
                        (string)item.nama_lengkap + sparator + 
                        (string)item.gelar + sparator + 
                        (string)item.jenis_kelamin + sparator + 
                        (string)item.tempat_lahir + sparator + 
                        (string)item.tanggal_lahir + sparator +
                        (string)item.npwp + sparator + 
                        (string)item.alamat + sparator + 
                        (string)item.kelurahan + sparator + 
                        (string)item.kecamatan + sparator + 
                        (string)item.kode_kota + sparator +
                        (string)item.kode_kota + sparator + 
                        (string)item.kode_pos + sparator + 
                        (string)item.no_telepon + sparator + 
                        (string)item.no_selular + sparator + 
                        (string)item.alamat_email + sparator +
                        (string)item.kode_negara_domisili + sparator + 
                        (string)item.kode_pekerjaan + sparator + 
                        (string)item.tempat_bekerja + sparator + 
                        (string)item.kode_bidang_usaha + sparator + 
                        (string)item.alamat_tempat_bekerja + sparator +
                        item.penghasilan_kotor_tahunan.ToString() + sparator + 
                        (string)item.kode_sumber_penghasilan + sparator + 
                        item.jumlah_tanggungan.ToString() + sparator + 
                        (string)item.kode_hubungan_dengan_pelapor + sparator + 
                        (string)item.kode_golongan + sparator +
                        (string)item.status_perkawinan + sparator + 
                        (string)item.nomor_identitas_pasangan + sparator + 
                        (string)item.nama_pasangan + sparator + 
                        (string)item.tanggal_lahir_pasangan + sparator +
                        (string)item.perjanjian_pisah_harta + sparator +
                        (string)item.melanggar_bmpk + sparator +
                        (string)item.melampaui_bmpk + sparator + 
                        (string)item.nama_ibu_kandung + sparator + 
                        (string)item.kode_cabang + sparator + 
                        (string)item.operasi_data+
                         Environment.NewLine;
                    
                    //ditaro di sini
                    _listtext.Add(text);
                }

                foreach (string item in _listtext)
                {
                    _finaltext = _finaltext + item;
                }

                // ini nama filenya 
                String FileName = "0201.251220."+ headerEntity[0].TAHUN+"."+ headerEntity[0].BULAN+"."+ headerEntity[0].CODE_SEGMEN +".1.txt";
                string Path = HttpContext.Current.Server.MapPath("~/compress\\");

                if (File.Exists(Path+FileName))
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

                //HttpResponse response = System.Web.HttpContext.Current.Response;
                //response.Clear();
                //response.AppendHeader("Content-Disposition", "attachment; filename=" + FileName);
                //response.ContentType = "application/octet-stream";

                // ini dia prosesnya download terus ngisi loopingan yg td
                //response.Write(_finaltext);
                //response.Flush();
                //response.End();
            }
            catch (Exception e)
            {
                return false;
            }
            return true;
        }
    }
}
