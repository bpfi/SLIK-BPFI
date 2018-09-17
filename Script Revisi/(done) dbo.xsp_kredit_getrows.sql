SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
GO
ALTER PROCEDURE [dbo].xsp_kredit_getrows
(
--declare
@p_dateMonth NVARCHAR(50) = '03',
@p_dateYear nvarchar(50) = '2018',
@p_user NVARCHAR(50) = '001',
@p_ip NVARCHAR(50) = '001'
)
as
BEGIN
DECLARE	@tanggal AS DATE

IF LEN(@p_dateMonth)=1
   BEGIN			
		SET @p_dateMonth='0'+@p_dateMonth
   end	

SET @tanggal=EOMONTH(@p_dateYear+@p_dateMonth+'01')

;WITH  ins
          AS ( SELECT   a.ApplicationID ,
                        a.BranchID ,
                        MAX(i.PaidDate) tglbyrakhir ,
                        MAX(i.InsSeqNo) PeriodeAkhir ,
                        MAX(i.PostingDate) tgltransaksi ,
                        MAX(i.DueDate) DueDate
               FROM     dbo.InstallmentSchedule i
                        INNER JOIN dbo.Agreement a ON a.BranchID = i.BranchId
                                                      AND a.ApplicationID = i.ApplicationID
               WHERE    PaidAmount > 0
                        AND ( PostingDate ) <= @tanggal
                        AND a.ContractStatus IN ( 'AKT', 'OSP' )
                        AND ( a.DefaultStatus = 'NM' )				
               GROUP BY a.ApplicationID ,
                        a.BranchID
             ),
        insdue
          AS ( SELECT   a.ApplicationID ,
                        a.BranchID ,
                        MIN(i.DueDate) DueDate ,
                        SUM(i.InstallmentAmount) nilaitunggakan_new ,
                        SUM(i.PrincipalAmount) AS TunggakanPokok ,
                        SUM(i.InterestAmount) AS TunggakanBunga
               FROM     dbo.InstallmentSchedule i
                        INNER JOIN dbo.Agreement a ON a.BranchID = i.BranchId
                                                      AND a.ApplicationID = i.ApplicationID
                        INNER JOIN ins ON ins.ApplicationID = i.ApplicationID
                                          AND ins.BranchID = i.BranchId
               WHERE    				
                        i.DueDate > ins.DueDate AND ins.DueDate<=@tanggal
                        AND a.ContractStatus IN ( 'AKT', 'OSP' )
                        AND ( a.DefaultStatus = 'NM'
                              AND dbo.fnGetOutstandingPrincipalbyPostingDate(a.BranchID,
                                                              a.ApplicationID,
                                                              @tanggal) > 0
                            )
               GROUP BY a.ApplicationID ,
                        a.BranchID
             ),
	ListCustomer AS (SELECT z.ApplicationID, z.AgreementNo, z.CustomerID, z.BranchID, p.PrepaymentStatus FROM dbo.Agreement z INNER JOIN dbo.Customer c ON c.CustomerID = z.CustomerID
							LEFT OUTER JOIN dbo.Prepayment p ON p.BranchId = z.BranchID AND p.ApplicationID = z.ApplicationID
		                   WHERE c.CustomerType = 'P' AND ((z.ContractStatus IN ('AKT','OSP') AND z.DefaultStatus = 'NM'
							AND dbo.fnGetOutstandingPrincipalbyPostingDate(z.BranchID, z.ApplicationID,GETDATE())>0)
								OR (z.ContractStatus IN ('SSD','LNS') AND YEAR(p.statusdate) = @p_dateYear and MONTH(p.statusdate) = @p_dateMonth)))				


SELECT  TOP 100 ROW_NUMBER() OVER(ORDER BY hdr.CustomerID)									AS ROW_NUMBER,
		'D' AS FLAG_DETAIL ,
        dbo.Trim(ag.AgreementNo) AS NO_REKENING_FASILITAS ,
        dbo.Trim(ag.CustomerID) AS CIF ,
        '9' AS KD_SIFAT_KREDIT , -- 9 -> lainnya
        '05' AS KD_JENIS_KREDIT ,	-- 05 -> (Asset Pledge) === 10 -> Join Finance
        '00' AS KD_SKIM ,	-- 00 -> Konvensional
        dbo.Trim(ag.AgreementNo) AS NO_AKAD_AWAL ,
		cast(ag.GoLiveDate as date) AS TGL_AKAD_AWAL ,
        dbo.Trim(ag.AgreementNo) AS NO_AKAD_AKHIR ,
        cast(ag.GoLiveDate as date) AS TGL_AKAD_AKHIR ,
        '0' AS BARU ,
		cast(ag.firstinstallmentdate as date) AS TGL_AWAL_KREDIT,
		cast(ag.firstinstallmentdate as date) AS TGL_MULAI ,	
		cast(ag.maturitydate as date) AS TGl_JATUH_Tempo,	
        '99' AS KD_KATEGORI_DEBITUR , -- 99 -> Bukan Debitur Usaha Mikro, Kecil, dan Menengah 
        CASE WHEN ag.KegiatanUsaha = 'I' THEN '2'
             WHEN ag.KegiatanUsaha = 'M' THEN '1'
             WHEN ag.KegiatanUsaha = 'G' THEN '3'
        END AS KD_JENIS_PENGGUNAAN ,
        '3' AS KD_ORIENTASI_PENGGUNAAN ,
        '-' AS KD_SEKTOR_EKONOMI ,
        '0' AS KD_KAB ,
        '0' AS NILAI_PROYEK ,
        'IDR' AS KD_VALUTA ,
        CAST(ag.FlatRate AS NUMERIC(4,2)) AS PRS_SUKU_BUNGA ,
        '1' AS JNS_SUKU_BUNGA ,
        '001' AS KRDT_PRORAM_PEMERINTAH ,
        '' AS TAKE_OVER_DARI ,
        '600003' AS SUMBER_DANA ,
        cast(ag.NTF AS BIGINT) AS PLAFON_AWAL ,
        cast(ag.NTF AS BIGINT) AS PLAFON ,
        CAST(CASE WHEN YEAR(golivedate)=@p_dateYear AND MONTH(golivedate)=@p_dateMonth THEN ag.ntf ELSE 0 END AS NUMERIC(14,0))  AS REALISASI_BULAN ,
        CAST(dbo.fnGetDenda(ag.ApplicationID) AS BIGINT) AS DENDA ,
        CAST(dbo.fnGetOutstandingPrincipalbyPostingDate(ag.branchid, ag.ApplicationID,@tanggal) AS BIGINT) AS BAKI_DENDA ,
        '0' AS NILAI_UANG_ASAL ,
        CASE WHEN dbo.fnGetDataFromInstallmentSchedule(@tanggal, ag.ApplicationID, 'Due') <= 0 THEN 1
             WHEN dbo.fnGetDataFromInstallmentSchedule(@tanggal, ag.ApplicationID, 'Due') >= 1 AND dbo.fnGetDataFromInstallmentSchedule(@tanggal,ag.ApplicationID,'Due') <= 30 THEN 2
             WHEN dbo.fnGetDataFromInstallmentSchedule(@tanggal, ag.ApplicationID, 'Due') >= 31 AND dbo.fnGetDataFromInstallmentSchedule(@tanggal, ag.ApplicationID, 'Due') <= 60 THEN 3
             WHEN dbo.fnGetDataFromInstallmentSchedule(@tanggal, ag.ApplicationID, 'Due') >= 61 AND dbo.fnGetDataFromInstallmentSchedule(@tanggal, ag.ApplicationID, 'Due') <= 90 THEN 4
             WHEN dbo.fnGetDataFromInstallmentSchedule(@tanggal, ag.ApplicationID, 'Due') >= 91 THEN 5 ELSE 1 END AS KODE_KOLEKTIBILITAS ,

		CASE WHEN dbo.fnGetDataFromInstallmentSchedule(@tanggal, ag.ApplicationID, 'Due') <= 0 THEN '' ELSE cast(DueDate as date) END AS TGL_MACET,--ELSE CONVERT(VARCHAR(10),DueDate,112) END AS TGL_MACET,
        '99' AS KD_SEBAB_MACET ,
		CAST(CASE WHEN dbo.fnGetDataFromInstallmentSchedule(@tanggal,ag.ApplicationID,'Due') <= 0 THEN 0 ELSE ISNULL(insdue.TunggakanPokok,0) END AS BIGINT)  AS TUNGGAKAN_POKOK,
		CAST(CASE WHEN dbo.fnGetDataFromInstallmentSchedule(@tanggal,ag.ApplicationID,'Due') <= 0 THEN 0 ELSE ISNULL(insdue.TunggakanBunga,0) END AS BIGINT)  AS TUNGGAKAN_BUNGA,
        ISNULL(CASE WHEN dbo.fnGetDataFromInstallmentSchedule(@tanggal,ag.ApplicationID,'Due') <= 0 THEN 0
                    ELSE CAST(dbo.fnGetDataFromInstallmentSchedule(@tanggal,ag.ApplicationID,'Due') AS INT) END, '0') AS JUMLAH_HARI_TUNGGAKAN ,
		
		'0' AS FRK_TUNGGAKAN ,
        '0' AS FRK_REST ,
        '' AS TGL_REST_AWAL ,
        '' AS TGL_REST_AKHIR ,
        '' AS KD_CARA_REST ,
        CASE WHEN ag.ContractStatus = 'AKT'
                  OR ag.ContractStatus = 'OSP'
                  AND ag.DefaultStatus = 'NM' THEN '00'
             WHEN ag.ContractStatus = 'LNS'
                  AND ag.DefaultStatus = 'NM' THEN '02'
             WHEN ag.ContractStatus = 'INV' THEN '13'
			 else '-'
        END AS KD_KONDISI ,
        CASE WHEN YEAR(ag.closedate)=@p_dateYear AND MONTH(ag.CloseDate)=@p_datemonth AND ag.ContractStatus IN ('LNS','SSD') THEN cast(ag.closedate as date) --CONVERT(VARCHAR(10),ag.closedate,112) 
		     ELSE '' END AS TGL_KONDISI ,
        '' AS KET ,
        ag.BranchID KODE_CABANG,
		'C' OPERASI_DATA,
			'0' AS IS_NEW,
			'0' AS IS_SENDED,
			GETDATE() AS CRE_DATE,
			'1' AS CRE_BY,
			'1' AS CRE_IP,
			GETDATE() AS MOD_DATE,
			'1' AS MOD_BY,
			'1' AS MOD_IP
FROM    ListCustomer hdr INNER JOIN 
		dbo.Agreement ag WITH ( NOLOCK ) ON ag.AgreementNo = hdr.AgreementNo AND ag.BranchID = hdr.BranchID
        LEFT JOIN dbo.Customer cs WITH ( NOLOCK ) ON cs.CustomerID = ag.CustomerID
        INNER JOIN dbo.Branch br ON br.BranchID = ag.BranchID 
		LEFT JOIN insdue ON insdue.BranchID = br.BranchID AND insdue.ApplicationID = ag.ApplicationID


END

GO

