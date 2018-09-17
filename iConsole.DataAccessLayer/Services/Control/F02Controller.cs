using iConsole.DataAccessLayer.ApiServices.Entity;
using iConsole.DataAccessLayer.Services.Entity;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Web;

namespace iConsole.DataAccessLayer.Services.Control
{
    public class F02Controller
    {

        public bool ValidateF02(List<EntityF02> entity, List<Headers> headerEntity)
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

                foreach (EntityF02 item in entity)
                {
                    text =
                        item.no_rek_fasilitas + sparator +
                        item.flag_detail + sparator +
                        item.cif + sparator +
                        item.seq_dbt_anggota_ja + sparator +
                        item.kd_sifat_kredit + sparator +
                        item.kd_jenis_kredit + sparator +
                        item.kd_skim + sparator +
                        item.no_akad_awal + sparator +
                        item.tgl_akad_awal + sparator +
                        item.no_akad_akhir + sparator +
                        item.tgl_akad_akhir + sparator +
                        item.baru + sparator +
                        item.tgl_awal_kredit + sparator +
                        item.tgl_mulai + sparator +
                        item.tgl_jatuh_tempo + sparator +
                        item.kd_kategori_debitur + sparator +
                        item.kd_jenis_pengguna + sparator +
                        item.kd_orientasi_pengguna + sparator +
                        item.kd_sektor_ekonomi + sparator +
                        item.kd_kab + sparator +
                        item.nilai_proyek + sparator +
                        item.kd_valuta + sparator +
                        item.prs_suku_bunga + sparator +
                        item.jns_suku_bunga + sparator +
                        item.krdt_program_pemerintah + sparator +
                        item.take_over_dari + sparator +
                        item.sumber_dana + sparator +
                        item.plafon_awal + sparator +
                        item.plafon + sparator +
                        item.pencairan_bulan_berjalan + sparator +
                        item.denda + sparator +
                        item.baki_debet + sparator +
                        item.nilai_dalam_mata_uang_asal + sparator +
                        item.kd_kolektabilitas + sparator +
                        item.tgl_macet + sparator +
                        item.kode_sebab_macet + sparator +
                        item.tunggakan_pokok + sparator +
                        item.tunggakan_bunga + sparator +
                        item.jmlh_hari_tunggakan + sparator +
                        item.frekuensi_tunggakan + sparator +
                        item.frekuensi_restrukturisasi + sparator +
                        item.tgl_restrukturisasi_awal + sparator +
                        item.tgl_restrukturisasi_akhir + sparator +
                        item.kd_cara_restrukturisasi + sparator +
                        item.kd_kondisi + sparator +
                        item.tgl_kondisi + sparator +
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
            }
            catch (Exception e)
            {
                throw new Exception(e.Message, e);
            }
            return true;
        }

    }
}
