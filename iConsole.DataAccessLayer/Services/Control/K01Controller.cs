using iConsole.DataAccessLayer.ApiServices.Entity;
using iConsole.DataAccessLayer.Services.Entity;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Web;

namespace iConsole.DataAccessLayer.Services.Control
{
    public class K01Controller
    {
        public bool ValidateK01(List<EntityK01> entity, List<Headers> headerEntity)
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

                foreach (EntityK01 item in entity)
                {
                    text =
                        item.flag + sparator +
                        item.cif + sparator +
                        item.ps_lp_keuangan_tahunan + sparator +
                        item.aset + sparator +
                        item.aset_lancar + sparator +
                        item.kas_aset_lancar + sparator +
                        item.piutang_aset_lancar + sparator +
                        item.investasi_aset_lancar + sparator +
                        item.aset_lancar_lainnya + sparator +
                        item.aset_tidak_lancar + sparator +
                        item.piutang_aset_tidak_lancar + sparator +
                        item.investasi_aset_tidak_lancar + sparator +
                        item.aset_tidak_lancar_lainnya + sparator +
                        item.liabilitas + sparator +
                        item.liabilitas_jangka_pendek + sparator +
                        item.pinjaman_jangka_pendek + sparator +
                        item.uu_jangka_pendek + sparator +
                        item.liabilitas_jangka_pendek_lainnya + sparator +
                        item.liabilitas_jangka_panjang + sparator +
                        item.pinjaman_jangka_panjang + sparator +
                        item.uu_jangka_panjang + sparator +
                        item.liabilitas_jangka_panjang_lainnya + sparator +
                        item.ekuitas + sparator +
                        item.pendapatan_usaha + sparator +
                        item.beban_pokok_pendapatan + sparator +
                        item.lr_bruto + sparator +
                        item.pendapatan_lain_lain + sparator +
                        item.beban_lain_lain + sparator +
                        item.lr_sebelum_pajak + sparator +
                        item.lr_tahun_berjalan + sparator +
                        item.kd_cabang + sparator +
                        item.operasi_data +
                         Environment.NewLine; ;

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
