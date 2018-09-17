SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
GO

alter PROCEDURE xsp_AGUNAN_getrows(	

@p_dateMonth NVARCHAR(50) = '03',
@p_dateYear nvarchar(50) = '2018',
@p_user NVARCHAR(50) = '001',
@p_ip NVARCHAR(50) = '001'
)
AS
BEGIN

DECLARE @tanggal AS date
SET @tanggal=EOMONTH(@p_dateYear+@p_dateMonth+'01')


;WITH	ListCustomer AS (SELECT z.ApplicationID, z.AgreementNo, z.CustomerID, z.BranchID, p.PrepaymentStatus,
								z.TotalOTR, CAST(z.GoLiveDate AS DATE) Golivedate, z.FundingCoyID 
							FROM dbo.Agreement z INNER JOIN dbo.Customer c ON c.CustomerID = z.CustomerID
							LEFT OUTER JOIN dbo.Prepayment p ON p.BranchId = z.BranchID AND p.ApplicationID = z.ApplicationID
		                   WHERE c.CustomerType = 'P' AND ((z.ContractStatus IN ('AKT','OSP') AND z.DefaultStatus = 'NM'
							AND dbo.fnGetOutstandingPrincipalbyPostingDate(z.BranchID, z.ApplicationID,GETDATE())>0)
								OR (z.ContractStatus IN ('SSD','LNS') AND YEAR(p.statusdate) = @p_dateYear and MONTH(p.statusdate) = @p_dateMonth)))	
SELECT 
		ROW_NUMBER() OVER(ORDER BY hdr.CustomerID) AS ROW_NUMBER
		,'D'   FLAG_DETAIL
		,'AGN'+hdr.AgreementNo	AS KD_REGISTRASI
		,dbo.Trim(hdr.AgreementNo) AS NO_REKENING_FASILITAS 
	   ,dbo.Trim(hdr.CustomerID) AS CIF 	
	   ,'F01' AS  KD_JS_SEGMEN_FASILITAS
	   ,'1' AS KD_STATUS_AGUNAN
	   ,'189' AS KD_JENIS_AGUNAN
	   ,'' AS PERINGKAT_AGUNAN
	   ,'' AS KD_LEMBAGA_PEMERINGKAT
	   ,'06' AS KD_JENIS_PENGIKATAN
	   ,'' AS TGL_PENGIKATAN
	   ,ISNULL(aa.OwnerAsset,'-') AS NAMA_PEMILIK_AGUNAN
	   ,ISNULL(adc.DocumentNo,'-') AS BUKTI_KEPEMILIKAN
		,RTRIM(ISNULL(aa.OwnerAddress,'')) AS ALAMAT_AGUNAN
		,'9999' AS KD_KOTA   --RTRIM(ISNULL(aa.OwnerCity,''))
		,hdr.TotalOTR AS NILAI_AGUNAN_NJOP --,CAST(hdr.TotalOTR AS BIGINT) AS NILAI_AGUNAN_NJOP
		,hdr.TotalOTR AS NILAI_AGUNAN_LJK --CAST(hdr.TotalOTR AS BIGINT) AS NILAI_AGUNAN_LJK
		,hdr.Golivedate AS TGL_PENILAIAN_LJK --CAST(hdr.Golivedate AS date) as TGL_PENILAIAN_LJK
		,'0' AS NILAI_AGUNAN_INDEPENDEN
		,'' AS NAMA_INDEPENDEN
		,'' AS TGL_PENILAIAN_INDEPENDEN
		,'T' AS STATUS_PARIPASU
		,'0' AS PERSENTASE_PARIPASU
		,CASE WHEN hdr.FundingCoyID IS NOT NULL THEN 'Y' ELSE 'T' END AS STATUS_KREDIT_JOINT
		,CASE WHEN IA.MaskAssID IS NOT NULL THEN 'Y' ELSE 'T' END AS DI_ASURANSIKAN
		,'' AS KETERANGAN
		,aa.BranchID AS KD_CABANG
		,'C' OPERASI_DATA
		,'0' AS IS_NEW
		,'0' AS IS_SENDED
		,GETDATE() AS CRE_DATE
		,'1' AS CRE_IP
		,'1' AS CRE_B
		,'1' AS MOD_IP
		,'1' AS MOD_BY
		,GETDATE() AS MOD_DATE


FROM ListCustomer hdr INNER JOIN  dbo.Customer C ON C.CustomerID = hdr.CustomerID	
	 LEFT JOIN AssetDocumentContent adc  WITH(NOLOCK)  
	           ON hdr.ApplicationID=adc.ApplicationID AND adc.AssetDocID='BPKB' AND hdr.BranchID=adc.BranchId 
	left JOIN dbo.AgreementAsset AS aa WITH(NOLOCK) ON hdr.BranchID = aa.BranchID AND hdr.ApplicationID = aa.ApplicationID
	LEFT JOIN InsuranceAsset IA ON IA.ApplicationID = hdr.ApplicationID AND IA.BranchId = hdr.BranchID


END
GO


