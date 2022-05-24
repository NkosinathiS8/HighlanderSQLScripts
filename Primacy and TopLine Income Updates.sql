

use [AbsaCustomerValueManagementMartH]
go 

--updating primacy 
--Please make sure that you change the  Suffix of the Primacy file to the month in question
-- and also ensure that InformationDateSk on the Where clause is consistent with the above.  
UPDATE REPORT.CUSTOMERVIEW
SET RelationShipPrimacy = b.[RELATIONSHIP]
from REPORT.CUSTOMERVIEW a
inner join dimension.customersegment c
on a.sbusubsegmentcode = c.sbusubsegmentcode
inner join [dbo].[SAFETY_BUCKET_PRIMACY_OCT2021] b 
on a.CustomerKey = b.Customer_Key 
where a.InformationDateSk = 20211031 and c.CvmSegment <> 'WIMI ONLY'


---ENSURING THAT PRIMACY VALUES ARE CONSISTENT WITH THE CUSTOMER VIEW DATA

UPDATE REPORT.CUSTOMERVIEW
SET RelationShipPrimacy = CASE WHEN RelationShipPrimacy = 'P' then 'PRIMARY'
						  WHEN  RelationShipPrimacy = 'S' THEN 'SECONDARY'
						  WHEN RelationShipPrimacy = 'R' THEN 'RECOVERY'
						  ELSE RelationShipPrimacy END 
						  from REPORT.CUSTOMERVIEW
						  where InformationDateSk = 20211031

---updating topline income received from Naxian (This has ran already)

UPDATE REPORT.CUSTOMERVIEW 
set ToplineIncome = b.ToplineIncome
from REPORT.CUSTOMERVIEW a 
inner join [XZAOBCC2SQL0078\ESTPM_MAIN1_UAT4].[AbsaCustomerValueManagementMartH].[Report].[ToplineIncome] b
on a.CustomerKey = b.CustomerKey and a.INFORMATIONDATESK = cast (CONVERT(varchar(8), b.[InformationDate],112) as int)
where cast (CONVERT(varchar(8), b.[InformationDate],112) as int) in (20211031)


-------------------------------------------------------------------------------------------------------
--updating customer status fields for the said month
declare @InformationDateSk int
set @InformationDateSk = 20211031

UPDATE report.customerview
set Customerstat = case when Customerstat = 'UNKNOWN' and CustomerStatus = 'Migration In'
						 then 'Migration In' 
						 when Customerstat = 'UNKNOWN' and CustomerStatus = 'Migration Out'
						 then 'Migration Out' 
						 when Customerstat = 'UNKNOWN' and CustomerStatus = 'Moved from WIMI Only'
						 then 'Moved from WIMI Only' 
						  when Customerstat = 'UNKNOWN' and CustomerStatus = 'Moved to WIMI Only'
						 then 'Moved to WIMI Only' else Customerstat end 
						 from  report.customerview
						 where informationdatesk  = @informationdatesk







--updating primacy 
--Please make sure that you change the  Suffix of the Primacy file to the month in question
-- and also ensure that InformationDateSk on the Where clause is consistent with the above.  
UPDATE REPORT.CustomerView_LatestTest
SET RelationShipPrimacy = b.[RELATIONSHIP]
from REPORT.CustomerView_LatestTest a
inner join dimension.customersegment c
on a.sbusubsegmentcode = c.sbusubsegmentcode
inner join [dbo].[SAFETY_BUCKET_PRIMACY_FEB2022] b 
on a.CustomerKey = b.Customer_Key 
where a.InformationDateSk = 20220228 and c.CvmSegment <> 'WIMI ONLY'


---ENSURING THAT PRIMACY VALUES ARE CONSISTENT WITH THE CUSTOMER VIEW DATA

UPDATE REPORT.CustomerView_LatestTest
SET RelationShipPrimacy = CASE WHEN RelationShipPrimacy = 'P' then 'PRIMARY'
						  WHEN  RelationShipPrimacy = 'S' THEN 'SECONDARY'
						  WHEN RelationShipPrimacy = 'R' THEN 'RECOVERY'
						  ELSE RelationShipPrimacy END 
						  from REPORT.CustomerView_LatestTest
						  where InformationDateSk = 20220228

---updating topline income received from Naxian (This has ran already)

--UPDATE REPORT.CustomerView_LatestTest 
--set ToplineIncome = b.ToplineIncome
--from REPORT.CustomerView_LatestTest a 
--inner join [XZAOBCC2SQL0078\ESTPM_MAIN1_UAT4].[AbsaCustomerValueManagementMartH].[Report].[ToplineIncome] b
--on a.CustomerKey = b.CustomerKey and a.INFORMATIONDATESK = cast (CONVERT(varchar(8), b.[InformationDate],112) as int)
--where cast (CONVERT(varchar(8), b.[InformationDate],112) as int) in (20211031)


-------------------------------------------------------------------------------------------------------
--updating customer status fields for the said month
--declare @InformationDateSk int
--set @InformationDateSk = 20211031

UPDATE report.CustomerView_LatestTest
set Customerstat = case when Customerstat = 'UNKNOWN' and CustomerStatus = 'Migration In'
						 then 'Migration In' 
						 when Customerstat = 'UNKNOWN' and CustomerStatus = 'Migration Out'
						 then 'Migration Out' 
						 when Customerstat = 'UNKNOWN' and CustomerStatus = 'Moved from WIMI Only'
						 then 'Moved from WIMI Only' 
						  when Customerstat = 'UNKNOWN' and CustomerStatus = 'Moved to WIMI Only'
						 then 'Moved to WIMI Only' else Customerstat end 
						 from  report.CustomerView_LatestTest
						 where informationdatesk  = 20220228
