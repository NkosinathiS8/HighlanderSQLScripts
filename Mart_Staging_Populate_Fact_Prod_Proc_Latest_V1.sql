
USE AbsaCustomerValueManagementMartH
GO

--Exec SPLoad.AbsaCustomerDimensionsUpdateFactLoad 20210630

ALTER PROCEDURE SPLoad.AbsaCustomerDimensionsUpdateFactLoad1 ( @Monthdate INT = NULL)
AS

BEGIN

IF(@Monthdate IS NULL)
BEGIN
	SET @Monthdate =  (SELECT DISTINCT CAST (CONVERT(VARCHAR(8),(SELECT MAX(INFORMATIONDATESK) FROM AbsaCustomerValueManagementMartH.Report.[CustomerView_LatestTest]),112) AS INT)) 
END

 
--//////////////////////////////////////////////////////////////////////////////////////////////
--////////////////////////  INSERT NEW VALUES IN CUSTOMERTYPE DIMENSION  /////////////////////// 
--//////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO  AbsaCustomerValueManagementMartH.[Dimension].[CustomerType] 

SELECT	DISTINCT  A.CustomerTypeCode, A.customertypedesc 
FROM	AbsaCustomerValueManagementMartH.Report.[CustomerView_LatestTest] A
WHERE	NOT EXISTS (SELECT	CustomerTypeCode,customertypedesc
					FROM	AbsaCustomerValueManagementMartH.[Dimension].[CustomerType] B
					WHERE	A.CustomerTypeCode = B.CustomerTypeCode 
							AND A.CustomerTypeDesc = B.CustomerTypeDesc)
		AND A.INFORMATIONDATESK = @Monthdate


--//////////////////////////////////////////////////////////////////////////////////////////////
--////////////////  INSERT NEW VALUES IN RELATIONSHIPINDICATOR DIMENSION  ////////////////////// 
--//////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO  AbsaCustomerValueManagementMartH.[Dimension].RelationshipIndicator 

SELECT	DISTINCT RelationshipPrimacy 
FROM	AbsaCustomerValueManagementMartH.Report.[CustomerView_LatestTest] A
WHERE	NOT EXISTS (SELECT	RelationshipPrimacy
					FROM	AbsaCustomerValueManagementMartH.[Dimension].RelationshipIndicator B
					WHERE	A.RelationshipPrimacy = B.RelationshipPrimacy)
		AND A.INFORMATIONDATESK = @Monthdate


--//////////////////////////////////////////////////////////////////////////////////////////////
--////////////////////  INSERT NEW VALUES IN CUSTOMERBANDS DIMENSION  ////////////////////////// 
--//////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO AbsaCustomerValueManagementMartH.[Dimension].CustomerBands 

SELECT	DISTINCT CustomerAgeBand, CustomerTenureBand 
FROM	AbsaCustomerValueManagementMartH.Report.[CustomerView_LatestTest] A
WHERE	NOT EXISTS (SELECT CustomerAgeBand, CustomerTenureBand 
					FROM	AbsaCustomerValueManagementMartH.[Dimension].CustomerBands B
					WHERE	A.CustomerAgeBand = B.CustomerAgeBand
							AND A.CustomerTenureBand = B.CustomerTenureBand)
		AND A.INFORMATIONDATESK = @Monthdate



--//////////////////////////////////////////////////////////////////////////////////////////////
--////////////////////  INSERT NEW VALUES IN CUSTOMERSTATS DIMENSION  ////////////////////////// 
--//////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO AbsaCustomerValueManagementMartH.[Dimension].CustomerStatus

SELECT	DISTINCT CustomerStat
FROM	AbsaCustomerValueManagementMartH.Report.[CustomerView_LatestTest] A
WHERE	NOT EXISTS (SELECT	CustomerStat
					FROM	AbsaCustomerValueManagementMartH.[Dimension].CustomerStatus B
					WHERE	A.CustomerStat = B.CustomerStatus)
		AND A.INFORMATIONDATESK = @Monthdate


--////////////////////////////////////////////////////////////////////////////////////////////////////////
--////////////////////////    UPDATE [ACTIVEABSACBLITE] DIMENSION    /////////////////////////////////////
--////////////////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO AbsaCustomerValueManagementMartH.[Dimension].[ActiveAbsaCBLite]

SELECT DISTINCT	[Active Absa CB Lite]
FROM			AbsaCustomerValueManagementMartH.Report.[CustomerView_LatestTest] A
WHERE NOT EXISTS (SELECT	[Active Absa CB Lite]
				  FROM		AbsaCustomerValueManagementMartH.[Dimension].[ActiveAbsaCBLite] B
				  WHERE		(A.[Active Absa CB Lite] = B.[Active Absa CB Lite]))
	  AND A.INFORMATIONDATESK = @Monthdate


--////////////////////////////////////////////////////////////////////////////////////////////////////////
--////////////////////////    UPDATE [ACTIVEABSAONLINE] DIMENSION    /////////////////////////////////////
--////////////////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO AbsaCustomerValueManagementMartH.[Dimension].[ActiveAbsaOnline]

SELECT DISTINCT	[Active Absa Online]
FROM			AbsaCustomerValueManagementMartH.Report.[CustomerView_LatestTest] A
WHERE NOT EXISTS (SELECT	[Active Absa Online]
				  FROM		AbsaCustomerValueManagementMartH.[Dimension].[ActiveAbsaOnline] B
				  WHERE		(A.[Active Absa Online] = B.[Active Absa Online]))
	  AND A.INFORMATIONDATESK = @Monthdate


--////////////////////////////////////////////////////////////////////////////////////////////////////////
--////////////////////////     UPDATE [ACTIVEBANKINGAPP] DIMENSION     /////////////////////////////////////
--////////////////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO AbsaCustomerValueManagementMartH.[Dimension].[ActiveBankingApp]

SELECT DISTINCT	[Active Banking App]
FROM			AbsaCustomerValueManagementMartH.Report.[CustomerView_LatestTest] A
WHERE NOT EXISTS (SELECT	[Active Banking App]
				  FROM		AbsaCustomerValueManagementMartH.[Dimension].[ActiveBankingApp] B
				  WHERE		(A.[Active Banking App] = B.[Active Banking App]))
	  AND A.INFORMATIONDATESK = @Monthdate

--////////////////////////////////////////////////////////////////////////////////////////////////////////
--////////////////////////     UPDATE [ACTIVESLINGPAY] DIMENSION     /////////////////////////////////////
--////////////////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO AbsaCustomerValueManagementMartH.[Dimension].[ActiveSlingPay]

SELECT DISTINCT	[Active Sling Pay]
FROM			AbsaCustomerValueManagementMartH.Report.[CustomerView_LatestTest] A
WHERE NOT EXISTS (SELECT	[Active Sling Pay]
				  FROM		AbsaCustomerValueManagementMartH.[Dimension].[ActiveSlingPay] B
				  WHERE		(A.[Active Sling Pay] = B.[Active Sling Pay]))
	  AND A.INFORMATIONDATESK = @Monthdate


--////////////////////////////////////////////////////////////////////////////////////////////////////////
--////////////////////////   UPDATE [ACTIVEWHATSAPPBANKING] DIMENSION   //////////////////////////////////
--////////////////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO AbsaCustomerValueManagementMartH.[Dimension].[ActiveWhatsAppBanking]

SELECT DISTINCT	[Active WhatsApp Banking]
FROM			AbsaCustomerValueManagementMartH.Report.[CustomerView_LatestTest] A
WHERE NOT EXISTS (SELECT	[Active WhatsApp Banking]
				  FROM		AbsaCustomerValueManagementMartH.[Dimension].[ActiveWhatsAppBanking] B
				  WHERE		(A.[Active WhatsApp Banking] = B.[Active WhatsApp Banking]))
	  AND A.INFORMATIONDATESK = @Monthdate


--////////////////////////////////////////////////////////////////////////////////////////////////////////
--////////////////////////   UPDATE [ACTIVEFACEBOOKBANKING] DIMENSION   //////////////////////////////////
--////////////////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO AbsaCustomerValueManagementMartH.[Dimension].[ActiveFacebookBanking]

SELECT DISTINCT	[Active Facebook Banking]
FROM			AbsaCustomerValueManagementMartH.Report.[CustomerView_LatestTest] A
WHERE NOT EXISTS (SELECT	[Digitally Active]
				  FROM		AbsaCustomerValueManagementMartH.[Dimension].[ActiveFacebookBanking] B
				  WHERE		(A.[Active Facebook Banking] = B.[Active Facebook Banking]))
	  AND A.INFORMATIONDATESK = @Monthdate


--////////////////////////////////////////////////////////////////////////////////////////////////////////
--////////////////////////   UPDATE [DIGITALLYACTIVE] DIMENSION   ////////////////////////////////////////
--////////////////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO		AbsaCustomerValueManagementMartH.[Dimension].[DigitallyActive]

SELECT DISTINCT	[Digitally Active]
FROM			AbsaCustomerValueManagementMartH.Report.[CustomerView_LatestTest] A
WHERE NOT EXISTS (SELECT	[Digitally Active]
				  FROM		AbsaCustomerValueManagementMartH.[Dimension].[DigitallyActive] B
				  WHERE		(A.[Digitally Active] = B.[Digitally Active]))
	  AND A.INFORMATIONDATESK = @Monthdate



--////////////////////////////////////////////////////////////////////////////////////////////////////////
--////////////////////////  UPDATE [DIGITALLYREGISTERED] DIMENSION  //////////////////////////////////////
--////////////////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO		AbsaCustomerValueManagementMartH.[Dimension].[DigitallyRegistered]

SELECT DISTINCT	Registered
FROM			AbsaCustomerValueManagementMartH.Report.[CustomerView_LatestTest] A
WHERE NOT EXISTS (SELECT	Registered
				  FROM		AbsaCustomerValueManagementMartH.[Dimension].[DigitallyRegistered] B
				  WHERE		(A.Registered = B.Registered))
	  AND A.INFORMATIONDATESK = @Monthdate


--///////////////////////////////////////////////////////////////////////////////////////////////////////
--/////////////////////////////  UPDATE [PRODUCTATTRIBUTE] DIMENSION  ///////////////////////////////////
--///////////////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO		AbsaCustomerValueManagementMartH.[Dimension].[ProductAttribute]

SELECT DISTINCT	VAF,[HOME LOAN], [CARD CUSTOMER], [SAVINGS CUSTOMER], [CHEQ CUSTOMER],
				[SBA CUSTOMER], [FBook/BBook], [WIMI Invest customer Only]
FROM			AbsaCustomerValueManagementMartH.Report.[CustomerView_LatestTest] A
WHERE NOT EXISTS (SELECT	VAF,[HOME LOAN], [CARD CUSTOMER], [SAVINGS CUSTOMER], [CHEQ CUSTOMER],
							[SBA CUSTOMER], [FBook/BBook], [WIMI Invest customer Only]
				  FROM		AbsaCustomerValueManagementMartH.[Dimension].[ProductAttribute] B
				  WHERE		(A.VAF = B.VAF AND A.[HOME LOAN] = B.[HOME LOAN] AND A.[CARD CUSTOMER] = B.[CARD CUSTOMER]
							AND A.[SAVINGS CUSTOMER] = B.[SAVINGS CUSTOMER] AND A.[CHEQ CUSTOMER] = B.[CHEQ CUSTOMER]
							AND A.[SBA CUSTOMER] = B.[SBA CUSTOMER] AND A.[FBook/BBook] = B.[FBook/BBook]
							AND A.[WIMI Invest customer Only] = B.[WIMI Invest customer Only]))
	  AND A.INFORMATIONDATESK = @Monthdate

	  
--////////////////////////////////////////////////////////////////////////////////////////////////////////
--//////////////////////////  UPDATE [SILENTATTRININGCUSTOMER] DIMENSION  ////////////////////////////////
--////////////////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO AbsaCustomerValueManagementMartH.[Dimension].[SilentAttritingCustomer]

SELECT DISTINCT SACustomer AS SilentAttriningCustomer
FROM			AbsaCustomerValueManagementMartH.Report.[CustomerView_LatestTest] A 
WHERE NOT EXISTS (SELECT	SilentAttritingCustomer
				  FROM		AbsaCustomerValueManagementMartH.[Dimension].[SilentAttritingCustomer] B
				  WHERE		(A.SACustomer = B.SilentAttritingCustomer))
	  AND A.INFORMATIONDATESK = @Monthdate

--////////////////////////////////////////////////////////////////////////////////////////////////////////
--//////////////////////////  UPDATE [REWARDSEARNINGRANGE] DIMENSION  ////////////////////////////////
--////////////////////////////////////////////////////////////////////////////////////////////////////////
INSERT	INTO AbsaCustomerValueManagementMartH.[Dimension].[RewardsEarningRange]
SELECT	DISTINCT EarnMoreThanFee,	EarnLessThanFee,	ZeroEarn
FROM			AbsaCustomerValueManagementMartH.Report.[CustomerView_LatestTest] A
WHERE NOT EXISTS (SELECT	EarnMoreThanFee,	EarnLessThanFee,	ZeroEarn
				  FROM		AbsaCustomerValueManagementMartH.[Dimension].[RewardsEarningRange] B
				  WHERE		(A.EarnMoreThanFee = B.EarnMoreThanFee AND A.EarnLessThanFee = B.EarnLessThanFee AND A.ZeroEarn = B.ZeroEarn))
	  AND A.INFORMATIONDATESK = @Monthdate


--////////////////////////////////////////////////////////////////////////////////////////////////////////
--/////////////////////////////  UPDATE [CUSTOMERSEGMENT] DIMENSION  /////////////////////////////////////
--////////////////////////////////////////////////////////////////////////////////////////////////////////
--INSERT INTO AbsaCustomerValueManagementMartH.[Dimension].[CustomerSegment]

--SELECT DISTINCT [SbuSegmentCode],[SbuSegmentDesc],[SbuSubSegmentCode],[SbuSubSegmentDesc], CVMSEGMENT, CVMSegmentGroup
--FROM			[AbsaCustomerValueManagementMartH].[Dimension].[CustomerSegmentOld] A 
--WHERE NOT EXISTS (SELECT	[SbuSegmentCode],[SbuSegmentDesc],[SbuSubSegmentDesc], CVMSEGMENT, CVMSegmentGroup
--				  FROM		AbsaCustomerValueManagementMartH.[Dimension].[CustomerSegment] B
--				  WHERE		(A.[SbuSegmentCode] = B.[SbuSegmentCode] 
--							AND A.[SbuSegmentDesc] = B.[SbuSegmentDesc]
--							AND A.[SbuSubSegmentCode] = B.[SbuSubSegmentCode]
--							AND A.[SbuSubSegmentDesc] = B.[SbuSubSegmentDesc]
--							AND A.CVMSEGMENT = B.CVMSEGMENT
--							AND A.CVMSegmentGroup = B.CVMSegmentGroup))



INSERT INTO AbsaCustomerValueManagementMartH.[Dimension].[RewardsEarningRange]
SELECT DISTINCT EarnMoreThanFee,	EarnLessThanFee,	ZeroEarn
FROM AbsaCustomerValueManagementMartH.Report.[CustomerView_LatestTest] A
WHERE NOT EXISTS (SELECT	EarnMoreThanFee,	EarnLessThanFee,	ZeroEarn
				  FROM		AbsaCustomerValueManagementMartH.[Dimension].[RewardsEarningRange] B
				  WHERE		(A.EarnMoreThanFee = B.EarnMoreThanFee AND A.EarnLessThanFee = B.EarnLessThanFee AND A.ZeroEarn = B.ZeroEarn))
	  AND A.INFORMATIONDATESK = @Monthdate


INSERT INTO AbsaCustomerValueManagementMartH.[Dimension].[IncomeGroup]
SELECT DISTINCT CAST(IncomeGroupCode AS INT) IncomeGroupCode, IncomeGroupDesc
FROM AbsaCustomerValueManagementMartH.Report.[CustomerView_LatestTest] A
WHERE NOT EXISTS (SELECT	EarnMoreThanFee,	EarnLessThanFee,	ZeroEarn
				  FROM		AbsaCustomerValueManagementMartH.[Dimension].[IncomeGroup] B
				  WHERE		(CAST(A.IncomeGroupCode AS INT) = B.IncomeGroupCode AND A.IncomeGroupDesc = B.IncomeGroupDesc))
	  AND A.INFORMATIONDATESK = @Monthdate


	  
INSERT INTO AbsaCustomerValueManagementMartH.[Dimension].[RewardsTierNumber]
SELECT DISTINCT TierID 
FROM AbsaCustomerValueManagementMartH.Report.[CustomerView_LatestTest] A
WHERE NOT EXISTS (SELECT	RewardsTier
				  FROM		AbsaCustomerValueManagementMartH.[Dimension].[RewardsTierNumber] B
				  WHERE		A.TierID = B.RewardsTier)
	  AND A.INFORMATIONDATESK = @Monthdate
			
--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--/////////// DELETE CURRENTLY RUNNING CYCLE DATA IF EXISTS, AVOID INSERTING DUPLICATE RECORDS ////////////////////////////
--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////			 
	DELETE	FROM AbsaCustomerValueManagementMartH.Report.[CustomerViewLatestFact1]		
	WHERE	INFORMATIONDATESK = @Monthdate

--/////////////////////////////////////////////////////////////////////////////////////
--/////////////////////  INSERT VALUES INTO THE FACT TABLE  ///////////////////////////
--///////////////////////////////////////////////////////////////////////////////////// 
INSERT INTO AbsaCustomerValueManagementMartH.Report.[CustomerViewLatestFact1] 


SELECT  CustomerSK, INFORMATIONDATESK, CustomerKey,ISNULL(DateCifOpenedsk,19000101) AS DateCifOpenedsk, CustomerSegmentSk, 
		ISNULL(CustomerTypeCodeSk,0) AS CustomerTypeCodeSk, 
		ISNULL(CustomerBandSK,0) AS CustomerBandSK, [RelationshipISK], [RiskExclusion], 
		[JointCustomer], [IncludeInCustCount], [SexCode], [customertenure], [CustomerAge], [CustomerStatSK], 
		[AVMS], [CARD], [CHEQ], [CLOAN], [CPF], [CTSAV], [FCALL], [FLEET], [LDP], [LOAN], [MLOAN], [MRCH], 
		[NFDEP], [RFIN], [SAVE], [TSAVE], [AVAF], [TDEP], [SBA], [Fiduciary_P], [Insurance_P], [Invest_P], 
		[Life_P], [DigitallyActiveSK], [RegisteredSK], [ActiveAbsaOnlineSK], [ActiveBankingAppSK], 
		[ActiveAbsaCBLiteSK], [ActiveSlingPaySK], [ActiveFacebookBankingSK], [ActiveWhatsAppBankingSK], 
		[DigitalChannel], [NrAccounts], [nr of Products], [Transactional_Accounts], 
		ProductASk,[Customer count], [ExcLusion accounts], [SilentAttriningCuslSK], [SACustomer],IncomeGroupSK,
		[Non Interest Revenue], [Net Interest Income], TopLineIncome, [TierIDSK], Rewards, A.StatusID, EarnAmount, RewardsID, EarningRangeSk, RewardsBalance

		
FROM	  AbsaCustomerValueManagementMartH.Report.[CustomerView_LatestTest] (NOLOCK) A 
LEFT JOIN AbsaCustomerValueManagementMartH.[Dimension].[CustomerSegment] (NOLOCK) B
	ON (A.SbuSubSegmentCode = B.SbuSubSegmentCode)
LEFT JOIN AbsaCustomerValueManagementMartH.[Dimension].[CustomerType] (NOLOCK) C
	ON (A.CustomerTypeCode = C.CustomerTypeCode)
LEFT JOIN AbsaCustomerValueManagementMartH.[Dimension].RelationshipIndicator (NOLOCK) E
	ON (A.RelationshipPrimacy = E.RelationshipPrimacy)
LEFT JOIN AbsaCustomerValueManagementMartH.[Dimension].CustomerBands (NOLOCK) D
	ON (A.CustomerTenureBand = D.CustomerTenureBand AND A.CustomerAgeBand = D.CustomerAgeBand)
LEFT JOIN AbsaCustomerValueManagementMartH.[Dimension].CustomerStatus (NOLOCK) F
	ON (A.CustomerStat = F.CustomerStatus)
LEFT JOIN AbsaCustomerValueManagementMartH.[Dimension].[InformationDate] (NOLOCK) G 
	ON (A.INFORMATIONDATESK = G.DateSk)
LEFT JOIN AbsaCustomerValueManagementMartH.[Dimension].[ActiveAbsaCBLite] (NOLOCK) H
	ON (A.[Active Absa CB Lite] = H.[Active Absa CB Lite])
LEFT JOIN AbsaCustomerValueManagementMartH.[Dimension].[ActiveAbsaOnline] I
	ON (A.[Active Absa Online] = I.[Active Absa Online])
LEFT JOIN AbsaCustomerValueManagementMartH.[Dimension].[ActiveBankingApp] (NOLOCK) J
	ON (A.[Active Banking App] = J.[Active Banking App])
LEFT JOIN AbsaCustomerValueManagementMartH.[Dimension].[ActiveSlingPay] (NOLOCK) K
	ON (A.[Active Sling Pay] = K.[Active Sling Pay])
LEFT JOIN AbsaCustomerValueManagementMartH.[Dimension].[ActiveWhatsAppBanking] (NOLOCK) L
	ON (A.[Active WhatsApp Banking] = L.[Active WhatsApp Banking])
LEFT JOIN AbsaCustomerValueManagementMartH.[Dimension].[ActiveFacebookBanking] (NOLOCK) M
	ON (A.[Active Facebook Banking] = M.[Active Facebook Banking])
LEFT JOIN AbsaCustomerValueManagementMartH.[Dimension].[DigitallyActive] (NOLOCK) N
	ON (A.[Digitally Active] = N.[Digitally Active])
LEFT JOIN AbsaCustomerValueManagementMartH.[Dimension].[DigitallyRegistered] (NOLOCK) O
	ON (A.Registered = O.Registered)
LEFT JOIN [AbsaCustomerValueManagementMartH].[Dimension].[SilentAttritingCustomer] (NOLOCK) P
	ON (A.SACustomer = P.SilentAttritingCustomer)
LEFT JOIN AbsaCustomerValueManagementMartH.[Dimension].[ProductAttribute] (NOLOCK) R
	ON (A.VAF = R.VAF AND A.[HOME LOAN] = R.[HOME LOAN] AND A.[CARD CUSTOMER] = R.[CARD CUSTOMER]
		AND A.[SAVINGS CUSTOMER] = R.[SAVINGS CUSTOMER] AND A.[CHEQ CUSTOMER] = R.[CHEQ CUSTOMER]
		AND A.[SBA CUSTOMER] =R.[SBA CUSTOMER] AND A.[FBook/BBook] = R.[FBook/BBook] 
		AND A.[WIMI Invest customer Only] = R.[WIMI Invest customer Only])
LEFT JOIN AbsaCustomerValueManagementMartH.[Dimension].[RewardsEarningRange] S
	ON (A.EarnMoreThanFee = S.EarnMoreThanFee AND A.EarnLessThanFee = S.EarnLessThanFee AND A.ZeroEarn = S.ZeroEarn)
LEFT JOIN [Dimension].[RewardsTierNumber] T
	ON (A.TierID = T.RewardsTier)
LEFT JOIN AbsaCustomerValueManagementMartH.[Dimension].[Status] U
	ON (A.[StatusID] = U.[StatusID])
LEFT JOIN [Dimension].[CustomerRewards] V
	ON (A.CustomerRewards = V.CustomerRewards)
LEFT JOIN [Dimension].[IncomeGroup] W
	ON (A.IncomeGroupCode = W.IncomeGroupCode AND A.IncomeGroupDesc = W.IncomeGroupDesc)
--WHERE A.INFORMATIONDATESK = @Monthdate
--WHERE A.INFORMATIONDATESK = 20210531


-- WE NEED TO VALIDATE IF A RECORD ALREADY EXISTS ON THE FACT PRIOR INSERTING, WE WILL DO IT AFTER INSERTING THE HISTORICAL DATA
-- THIS WILL AVOID DUPLICATES EVEN DURING THE RERUN



--////////////////////////////////////////////////////////////////////////////////////////////////////////
--/////////////// ADD NON CLUSTERED INDEXES TO ALL RELATIONSHIP KEYS OF DIMENSIONS ///////////////////////
--////////////////////////////////////////////////////////////////////////////////////////////////////////
--DROP INDEX Cust_IDX_Customer   ON [Report].[CustomerViewFact] 

--CREATE NONCLUSTERED INDEX Cust_IDX_Customer 
--ON [Report].[CustomerViewFact] 
--(CustomerSK,INFORMATIONDATESK,CustomerKey,DateCifOpenedsk,CustomerSegmentSk,CustomerTypeCodeSk,CustomerBandSK,[RelationshipISK],
--[CustomerStatSK],[DigitallyActiveSK],[RegisteredSK])


----DROP INDEX Cust_IDX_Customer_1   ON [Report].[CustomerViewFact] 

--CREATE NONCLUSTERED INDEX Cust_IDX_Customer_1
--ON [Report].[CustomerViewFact] 
--([ActiveAbsaOnlineSK],[ActiveBankingAppSK],[ActiveAbsaCBLiteSK],[ActiveSlingPaySK],[ActiveFacebookBankingSK],
--[ActiveWhatsAppBankingSK],ProductASk,[SilentAttriningCuslSK])


--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--//////////////////////////////////////    avoid unnecessary deletion of fact records  ////////////////////////////////////////
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--CREATE TRIGGER TR_RAISEERROR_INSTEADOFDELETE  
--ON  [Report].[CustomerViewFact]
--INSTEAD OF DELETE  
--AS  
--BEGIN  

--  BEGIN    
--   RAISERROR('YOU ARE DELETING RECORDS ON ABSA ACCOUNT NUMBERS FACT TABLE, IF THIS IS NOT A MISTAKE DROP THE TRIGGER AND TRY AGAIN!!!', 16, 1)    
--   RETURN 
--  END
--END
END


