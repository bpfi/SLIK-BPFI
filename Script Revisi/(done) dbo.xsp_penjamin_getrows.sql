SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
GO
alter procedure xsp_penjamin_getrows
(
 @p_dateMonth nvarchar(50),
 @p_dateYear nvarchar(50),
 @p_user nvarchar(50),
 @p_ip nvarchar(50)
)
as
begin
	;WITH	ListCustomer AS (SELECT z.ApplicationID, z.AgreementNo, z.CustomerID, z.BranchID, p.PrepaymentStatus,
									z.TotalOTR, CAST(z.GoLiveDate AS DATE) Golivedate, z.FundingCoyID 
								FROM dbo.Agreement z INNER JOIN dbo.Customer c ON c.CustomerID = z.CustomerID
								LEFT OUTER JOIN dbo.Prepayment p ON p.BranchId = z.BranchID AND p.ApplicationID = z.ApplicationID
							   WHERE c.CustomerType = 'P' AND ((z.ContractStatus IN ('AKT','OSP') AND z.DefaultStatus = 'NM'
								AND dbo.fnGetOutstandingPrincipalbyPostingDate(z.BranchID, z.ApplicationID,GETDATE())>0)
									OR (z.ContractStatus IN ('SSD','LNS') AND YEAR(p.statusdate) = @p_dateYear and MONTH(p.statusdate) = @p_dateMonth)))

	SELECT  ROW_NUMBER() OVER(ORDER BY hdr.CustomerID)									AS Row,
			'D' AS FLAG ,
			RTRIM(ISNULL(cg.NoDokument,''))  AS NO_IDENTITAS_PENJAMIN ,
			RTRIM(hdr.AgreementNo) AS NO_REKENING ,
			RTRIM(cs.CustomerID) AS CIF ,
			'F01' AS KD_JS_SEGMEN_FASILITAS ,
			CASE WHEN pc.IDType = 'KTP' THEN '1'
				 ELSE '3'
			END AS KD_JS_IDENTITAS_PENJAMIN ,
			RTRIM(cg.NamaGurantor) AS NAMA_PENJAMIN ,
			RTRIM(cg.NamaGurantor) AS NAMA_LENGKAP ,
			CASE WHEN pc.JobTypeID = 'WIRA' THEN '7190'
			ELSE '7290'
			END AS KD_GOL_PENJAMIN ,
			RTRIM(cg.Alamat) AS ALAMAT_PENJAMIN,
			'' AS PERSENTASE_DIJAMIN,
			'' AS KETERANGAN,
			RTRIM(hdr.BranchID) AS KD_CABANG,
			'C' AS OPERASI_DATA,
			'0' AS IS_NEW,
			'0' AS IS_SENDED,
			'1' AS CRE_BY,
			'1' AS CRE_IP,
			GETDATE() AS CRE_DATE,
			'1' AS MOD_BY,
			'1' AS MOD_IP,
			GETDATE() AS MOD_DATE
	FROM    ListCustomer hdr INNER JOIN dbo.Customer cs ON cs.CustomerID = hdr.CustomerID
			INNER JOIN dbo.PersonalCustomer pc ON pc.CustomerID = cs.CustomerID
			LEFT JOIN dbo.PersonalCustomerGuarantor cg ON cg.CustomerID = cs.CustomerID
	WHERE cg.NamaGurantor IS NOT NULL

end


GO


