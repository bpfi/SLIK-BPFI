SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
GO
ALTER procedure xsp_pengurus_getrows
(
 @p_dateMonth nvarchar(50),
 @p_dateYear nvarchar(50),
 @p_user nvarchar(50),
 @p_ip nvarchar(50)
)
as
begin
;with		ListCustomer AS (SELECT z.CustomerID, z.BranchID, z.AgreementNo,p.PrepaymentStatus, MAX(REPLACE(RTRIM(z.KodeDATI),'','0000')) KodeDati, c.Name
							 FROM dbo.Agreement z INNER JOIN dbo.Customer c ON c.CustomerID = z.CustomerID
							LEFT OUTER JOIN dbo.Prepayment p ON p.BranchId = z.BranchID AND p.ApplicationID = z.ApplicationID
		                   WHERE c.CustomerType = 'C' AND ((z.ContractStatus IN ('AKT','OSP') AND z.DefaultStatus = 'NM'
							AND dbo.fnGetOutstandingPrincipalbyPostingDate(z.BranchID, z.ApplicationID,GETDATE())>0) 
								OR (z.ContractStatus IN ('SSD','LNS') AND YEAR(p.statusdate)=@p_dateYear AND MONTH(statusdate)=@p_dateMonth))
						   GROUP BY z.CustomerID, z.BranchID, p.PrepaymentStatus, c.Name, z.AgreementNo),
			jabatanpemilik AS (SELECT csh.CustomerID, MIN(csh.CSHSeqNo) CSHSeqNo  FROM ListCustomer lc INNER JOIN dbo.CompanyShareHolders csh ON csh.CustomerID = lc.CustomerID GROUP BY csh.CustomerID),
			pemilik	AS (SELECT csh.CustomerID, (csh.CSHSeqNo), csh.JobPositionID,csh.Gender, csh.Address, csh.IDNumber, csh.Name    FROM ListCustomer lc 
			             INNER JOIN dbo.CompanyShareHolders csh ON csh.CustomerID = lc.CustomerID 
						 INNER JOIN	jabatanpemilik p ON p.CustomerID = csh.CustomerID AND p.CSHSeqNo = csh.CSHSeqNo)
SELECT  DISTINCT
		ROW_NUMBER() OVER(ORDER BY hdr.CustomerID)									AS Row,
		'D' AS FLAG ,
        hdr.AgreementNo AS NO_IDENTITAS_PENGURUSAN ,
        hdr.CustomerID AS CIF ,
        CASE WHEN csh.IDNumber IS NOT NULL THEN '1'
             ELSE '3'
        END AS KD_JS_IDENTITAS,
		CASE WHEN RTRIM(csh.Name) IS NOT NULL THEN RTRIM(csh.Name) ELSE hdr.Name end AS NAMA_PENGURUS,
		CASE WHEN csh.Gender = 'M' THEN 'L'
		WHEN csh.Gender = 'F' THEN 'P' ELSE	'L' END AS JS_KELAMIN,
		ISNULL(CASE WHEN RTRIM(csh.Address) IS NOT NULL THEN RTRIM(csh.Address) ELSE RTRIM(cc.CompanyAddress) END,'-') AS ALAMAT,
		'' AS KELURAHAN,
		'' AS KECAMATAN,
		'' AS KD_SANDI_KOTA,
		CASE WHEN csh.JobPositionID IN ('PRESDIR','SHAREHLDR') THEN '01'
			 WHEN csh.JobPositionID='DIRECTOR'	THEN '02'
			 WHEN csh.JobPositionID='PRESCOM' THEN '03'
			 WHEN csh.JobPositionID='COMMISIO' THEN '04'
		ELSE '69' end AS KD_JABATAN,
		'0' AS PANGSA_KEPEMILIKAN,
		'1' AS STATUS_PENGURUS,
		hdr.BranchID AS KD_CABANG,
		 'C' AS OPERASI_DATA,
		 '0' AS IS_NEW,
			'0' AS IS_SENDED,
			GETDATE() AS CRE_DATE,
			'1' AS CRE_IP,
			'1' AS CRE_BY,
			GETDATE() AS MOD_DATE,
			'1' AS MOD_IP,
			'1' AS MOD_BY
FROM    ListCustomer hdr 
		LEFT JOIN pemilik csh ON csh.CustomerID = hdr.CustomerID
		LEFT JOIN dbo.CompanyCustomer cc ON cc.CustomerID = hdr.CustomerID


end


GO





