-- new line
USE AbsaCustomerValueManagementMartH

--//////////////////////////////////////////////////////////////////////////////////////////////
--////////////////////////  INSERT NEW VALUES IN CUSTOMERTYPE DIMENSION  /////////////////////// 
--//////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO  AbsaCustomerValueManagementMartH.[Dimension].[CustomerType] 

SELECT	DISTINCT  A.CustomerTypeCode, A.customertypedesc 
FROM	[AbsaCustomerValueManagementMartH].[Report].[CustomerViewSource] A
WHERE	NOT EXISTS (SELECT	CustomerTypeCode,customertypedesc
					FROM	AbsaCustomerValueManagementMartH.[Dimension].[CustomerType] B
					WHERE	A.CustomerTypeCode = B.CustomerTypeCode 
							AND A.CustomerTypeDesc = B.CustomerTypeDesc)
				

--//////////////////////////////////////////////////////////////////////////////////////////////
--////////////////  INSERT NEW VALUES IN RELATIONSHIPINDICATOR DIMENSION  ////////////////////// 
--//////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO  AbsaCustomerValueManagementMartH.[Dimension].RelationshipIndicator 

SELECT	DISTINCT RelationshipPrimacy 
FROM	[AbsaCustomerValueManagementMartH].[Report].[CustomerViewSource] A
WHERE	NOT EXISTS (SELECT	RelationshipPrimacy
					FROM	AbsaCustomerValueManagementMartH.[Dimension].RelationshipIndicator B
					WHERE	A.RelationshipPrimacy = B.RelationshipPrimacy)


--//////////////////////////////////////////////////////////////////////////////////////////////
--////////////////////  INSERT NEW VALUES IN CUSTOMERBANDS DIMENSION  ////////////////////////// 
--//////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO AbsaCustomerValueManagementMartH.[Dimension].CustomerBands 

SELECT	DISTINCT CustomerAgeBand, CustomerTenureBand 
FROM	[AbsaCustomerValueManagementMartH].[Report].[CustomerViewSource] A
WHERE	NOT EXISTS (SELECT CustomerAgeBand, CustomerTenureBand 
					FROM	AbsaCustomerValueManagementMartH.[Dimension].CustomerBands B
					WHERE	A.CustomerAgeBand = B.CustomerAgeBand
							AND A.CustomerTenureBand = B.CustomerTenureBand)


--//////////////////////////////////////////////////////////////////////////////////////////////
--////////////////////  INSERT NEW VALUES IN CUSTOMERSTATS DIMENSION  ////////////////////////// 
--//////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO AbsaCustomerValueManagementMartH.[Dimension].CustomerStats

SELECT	DISTINCT CustomerStat
FROM	[AbsaCustomerValueManagementMartH].[Report].[CustomerViewSource] A
WHERE	NOT EXISTS (SELECT	CustomerStat
					FROM	AbsaCustomerValueManagementMartH.[Dimension].CustomerStats B
					WHERE	A.CustomerStat = B.CustomerStat)



--////////////////////////////////////////////////////////////////////////////////////////////////////////
--////////////////////////    UPDATE [ACTIVEABSACBLITE] DIMENSION    /////////////////////////////////////
--////////////////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO AbsaCustomerValueManagementMartH.[Dimension].[ActiveAbsaCBLite]

SELECT DISTINCT	[Active Absa CB Lite]
FROM			[AbsaCustomerValueManagementMartH].[Report].[CustomerViewSource] A
WHERE NOT EXISTS (SELECT	[Active Absa CB Lite]
				  FROM		AbsaCustomerValueManagementMartH.[Dimension].[ActiveAbsaCBLite] B
				  WHERE		(A.[Active Absa CB Lite] = B.[Active Absa CB Lite]))

--////////////////////////////////////////////////////////////////////////////////////////////////////////
--////////////////////////    UPDATE [ACTIVEABSAONLINE] DIMENSION    /////////////////////////////////////
--////////////////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO AbsaCustomerValueManagementMartH.[Dimension].[ActiveAbsaOnline]

SELECT DISTINCT	[Active Absa Online]
FROM			[AbsaCustomerValueManagementMartH].[Report].[CustomerViewSource] A
WHERE NOT EXISTS (SELECT	[Active Absa Online]
				  FROM		AbsaCustomerValueManagementMartH.[Dimension].[ActiveAbsaOnline] B
				  WHERE		(A.[Active Absa Online] = B.[Active Absa Online]))


--////////////////////////////////////////////////////////////////////////////////////////////////////////
--////////////////////////     UPDATE [ACTIVEBANKINGAPP] DIMENSION     /////////////////////////////////////
--////////////////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO AbsaCustomerValueManagementMartH.[Dimension].[ActiveBankingApp]

SELECT DISTINCT	[Active Banking App]
FROM			[AbsaCustomerValueManagementMartH].[Report].[CustomerViewSource] A
WHERE NOT EXISTS (SELECT	[Active Banking App]
				  FROM		AbsaCustomerValueManagementMartH.[Dimension].[ActiveBankingApp] B
				  WHERE		(A.[Active Banking App] = B.[Active Banking App]))


--////////////////////////////////////////////////////////////////////////////////////////////////////////
--////////////////////////     UPDATE [ACTIVESLINGPAY] DIMENSION     /////////////////////////////////////
--////////////////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO AbsaCustomerValueManagementMartH.[Dimension].[ActiveSlingPay]

SELECT DISTINCT	[Active Sling Pay]
FROM			[AbsaCustomerValueManagementMartH].[Report].[CustomerViewSource] A
WHERE NOT EXISTS (SELECT	[Active Sling Pay]
				  FROM		AbsaCustomerValueManagementMartH.[Dimension].[ActiveSlingPay] B
				  WHERE		(A.[Active Sling Pay] = B.[Active Sling Pay]))


--////////////////////////////////////////////////////////////////////////////////////////////////////////
--////////////////////////   UPDATE [ACTIVEWHATSAPPBANKING] DIMENSION   //////////////////////////////////
--////////////////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO AbsaCustomerValueManagementMartH.[Dimension].[ActiveWhatsAppBanking]

SELECT DISTINCT	[Active WhatsApp Banking]
FROM			[AbsaCustomerValueManagementMartH].[Report].[CustomerViewSource] A
WHERE NOT EXISTS (SELECT	[Active WhatsApp Banking]
				  FROM		AbsaCustomerValueManagementMartH.[Dimension].[ActiveWhatsAppBanking] B
				  WHERE		(A.[Active WhatsApp Banking] = B.[Active WhatsApp Banking]))


--////////////////////////////////////////////////////////////////////////////////////////////////////////
--////////////////////////   UPDATE [ACTIVEFACEBOOKBANKING] DIMENSION   //////////////////////////////////
--////////////////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO AbsaCustomerValueManagementMartH.[Dimension].[ActiveFacebookBanking]

SELECT DISTINCT	[Active Facebook Banking]
FROM			[AbsaCustomerValueManagementMartH].[Report].[CustomerViewSource] A
WHERE NOT EXISTS (SELECT	[Digitally Active]
				  FROM		AbsaCustomerValueManagementMartH.[Dimension].[ActiveFacebookBanking] B
				  WHERE		(A.[Active Facebook Banking] = B.[Active Facebook Banking]))


--////////////////////////////////////////////////////////////////////////////////////////////////////////
--////////////////////////   UPDATE [DIGITALLYACTIVE] DIMENSION   ////////////////////////////////////////
--////////////////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO		AbsaCustomerValueManagementMartH.[Dimension].[DigitallyActive]

SELECT DISTINCT	[Digitally Active]
FROM			[AbsaCustomerValueManagementMartH].[Report].[CustomerViewSource] A
WHERE NOT EXISTS (SELECT	[Digitally Active]
				  FROM		AbsaCustomerValueManagementMartH.[Dimension].[DigitallyActive] B
				  WHERE		(A.[Digitally Active] = B.[Digitally Active]))


--////////////////////////////////////////////////////////////////////////////////////////////////////////
--////////////////////////  UPDATE [DIGITALLYREGISTERED] DIMENSION  //////////////////////////////////////
--////////////////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO		AbsaCustomerValueManagementMartH.[Dimension].[DigitallyRegistered]

SELECT DISTINCT	Registered
FROM			[AbsaCustomerValueManagementMartH].[Report].[CustomerViewSource] A
WHERE NOT EXISTS (SELECT	Registered
				  FROM		AbsaCustomerValueManagementMartH.[Dimension].[DigitallyRegistered] B
				  WHERE		(A.Registered = B.Registered))


--///////////////////////////////////////////////////////////////////////////////////////////////////////
--/////////////////////////////  UPDATE [PRODUCTATTRIBUTE] DIMENSION  ///////////////////////////////////
--///////////////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO		AbsaCustomerValueManagementMartH.[Dimension].[ProductAttribute]

SELECT DISTINCT	VAF,[HOME LOAN], [CARD CUSTOMER], [SAVINGS CUSTOMER], [CHEQ CUSTOMER],
				[SBA CUSTOMER], [FBook/BBook], [WIMI Invest customer Only]
FROM			[AbsaCustomerValueManagementMartH].[Report].[CustomerViewSource] A
WHERE NOT EXISTS (SELECT	VAF,[HOME LOAN], [CARD CUSTOMER], [SAVINGS CUSTOMER], [CHEQ CUSTOMER],
							[SBA CUSTOMER], [FBook/BBook], [WIMI Invest customer Only]
				  FROM		AbsaCustomerValueManagementMartH.[Dimension].[ProductAttribute] B
				  WHERE		(A.VAF = B.VAF AND A.[HOME LOAN] = B.[HOME LOAN] AND A.[CARD CUSTOMER] = B.[CARD CUSTOMER]
							AND A.[SAVINGS CUSTOMER] = B.[SAVINGS CUSTOMER] AND A.[CHEQ CUSTOMER] = B.[CHEQ CUSTOMER]
							AND A.[SBA CUSTOMER] = B.[SBA CUSTOMER] AND A.[FBook/BBook] = B.[FBook/BBook]
							AND A.[WIMI Invest customer Only] = B.[WIMI Invest customer Only]))


--////////////////////////////////////////////////////////////////////////////////////////////////////////
--//////////////////////////  UPDATE [SILENTATTRININGCUSTOMER] DIMENSION  ////////////////////////////////
--////////////////////////////////////////////////////////////////////////////////////////////////////////
INSERT INTO AbsaCustomerValueManagementMartH.[Dimension].[SilentAttriningCustomer]

SELECT DISTINCT SACustomer AS SilentAttriningCustomer
FROM			[AbsaCustomerValueManagementMartH].[Report].[CustomerViewSource] A 
WHERE NOT EXISTS (SELECT	SilentAttriningCustomer
				  FROM		AbsaCustomerValueManagementMartH.[Dimension].[SilentAttriningCustomer] B
				  WHERE		(A.SACustomer = B.SilentAttriningCustomer))


--/////////////////////////////////////////////////////////////////////////////////////
--/////////////////////  INSERT VALUES INTO THE FACT TABLE  ///////////////////////////
--///////////////////////////////////////////////////////////////////////////////////// 
INSERT INTO  AbsaCustomerValueManagementMartH.Report.[CustomerViewFact] 

SELECT 	CustomerSK, INFORMATIONDATESK, CustomerKey,ISNULL(DateCifOpenedsk,19000101) AS DateCifOpenedsk, CustomerSegmentSk, 
		ISNULL(CustomerTypeCodeSk,0) AS CustomerTypeCodeSk, 
		ISNULL(CustomerBandSK,0) AS CustomerBandSK, [RelationshipISK], [RiskExclusion], 
		[JointCustomer], [IncludeInCustCount], [SexCode], [customertenure], [CustomerAge], [CustomerStatSK], 
		[AVMS], [CARD], [CHEQ], [CLOAN], [CPF], [CTSAV], [FCALL], [FLEET], [LDP], [LOAN], [MLOAN], [MRCH], 
		[NFDEP], [RFIN], [SAVE], [TSAVE], [AVAF], [TDEP], [SBA], [Fiduciary_P], [Insurance_P], [Invest_P], 
		[Life_P], [DigitallyActiveSK], [RegisteredSK], [ActiveAbsaOnlineSK], [ActiveBankingAppSK], 
		[ActiveAbsaCBLiteSK], [ActiveSlingPaySK], [ActiveFacebookBankingSK], [ActiveWhatsAppBankingSK], 
		[DigitalChannel], [Rewards], [TopLineIncome], [NrAccounts], [nr of Products], [Transactional_Accounts], 
		ProductASk,[Customer count], [Excusion accounts], [SilentAttriningCuslSK], [SACustomer]

FROM	  [AbsaCustomerValueManagementMartH].[Report].[CustomerViewSource] (NOLOCK) A 
LEFT JOIN AbsaCustomerValueManagementMartH.[Dimension].[CustomerSegment] (NOLOCK) B
	ON (A.SbuSubSegmentCode = B.SbuSubSegmentCode)
LEFT JOIN AbsaCustomerValueManagementMartH.[Dimension].[CustomerType] (NOLOCK) C
	ON (A.CustomerTypeCode = C.CustomerTypeCode)
LEFT JOIN AbsaCustomerValueManagementMartH.[Dimension].RelationshipIndicator (NOLOCK) E
	ON (A.RelationshipPrimacy = E.RelationshipPrimacy)
LEFT JOIN AbsaCustomerValueManagementMartH.[Dimension].CustomerBands (NOLOCK) D
	ON (A.CustomerTenureBand = D.CustomerTenureBand AND A.CustomerAgeBand = D.CustomerAgeBand)
LEFT JOIN AbsaCustomerValueManagementMartH.[Dimension].CustomerStats (NOLOCK) F
	ON (A.CustomerStat = F.CustomerStat)
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
LEFT JOIN AbsaCustomerValueManagementMartH.[Dimension].[SilentAttriningCustomer] (NOLOCK) P
	ON (A.SACustomer = P.SilentAttriningCustomer)
LEFT JOIN AbsaCustomerValueManagementMartH.[Dimension].[ProductAttribute] (NOLOCK) R
	ON (A.VAF = R.VAF AND A.[HOME LOAN] = R.[HOME LOAN] AND A.[CARD CUSTOMER] = R.[CARD CUSTOMER]
		AND A.[SAVINGS CUSTOMER] = R.[SAVINGS CUSTOMER] AND A.[CHEQ CUSTOMER] = R.[CHEQ CUSTOMER]
		AND A.[SBA CUSTOMER] =R.[SBA CUSTOMER] AND A.[FBook/BBook] = R.[FBook/BBook] 
		AND A.[WIMI Invest customer Only] = R.[WIMI Invest customer Only])
WHERE INFORMATIONDATESK IN (202,20190131,20190430,20190531,20190630)
-- WE NEED TO VALIDATE IF A RECORD ALREADY EXISTS ON THE FACT PRIOR INSERTING, WE WILL DO IT AFTER INSERTING THE HISTORICAL DATA
-- THIS WILL AVOID DUPLICATES EVEN DURING THE RERUN


--////////////////////////////////////////////////////////////////////////////////////////////////////////
--/////////////// ADD NON CLUSTERED INDEXES TO ALL RELATIONSHIP KEYS OF DIMENSIONS ///////////////////////
--////////////////////////////////////////////////////////////////////////////////////////////////////////
DROP INDEX Cust_IDX_Customer   ON [Report].[CustomerViewFact] 

CREATE NONCLUSTERED INDEX Cust_IDX_Customer 
ON [Report].[CustomerViewFact] 
(CustomerSK,INFORMATIONDATESK,CustomerKey,DateCifOpenedsk,CustomerSegmentSk,CustomerTypeCodeSk,CustomerBandSK,[RelationshipISK],
[CustomerStatSK],[DigitallyActiveSK],[RegisteredSK])

--DROP INDEX Cust_IDX_Customer_1   ON [Report].[CustomerViewFact] 

CREATE NONCLUSTERED INDEX Cust_IDX_Customer_1
ON [Report].[CustomerViewFact] 
([ActiveAbsaOnlineSK],[ActiveBankingAppSK],[ActiveAbsaCBLiteSK],[ActiveSlingPaySK],[ActiveFacebookBankingSK],
[ActiveWhatsAppBankingSK],ProductASk,[SilentAttriningCuslSK])


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


