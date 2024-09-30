SELECT COUNT(*) FROM Step1 --1084745
SELECT COUNT(1) FROM Step2 --945338

SELECT COUNT(*) FROM Step1 WHERE ISNULL(Consensus_Fcst,0)<>ISNULL(Final_Fcst,0) --694221

SELECT * INTO Step1_UnEqualFcst
FROM Step1
WHERE ISNULL(Consensus_Fcst,0)<>ISNULL(Final_Fcst,0)

SELECT 
	DISTINCT S2.Item_Item
FROM Step1_UnEqualFcst S1
	JOIN Step2 S2 ON S1.Channel_Planning_Channel = S2.Channel_Planning_Channel
	AND S1.Demand_Domain_Planning_Demand_Domain = S2.Demand_Domain_Planning_Demand_Domain
	AND S1.Account_Planning_Account  = S2.Account_Planning_Account
	AND S1.Region_Planning_Region = S2.Region_Planning_Region
	AND S1.PnL_Planning_PnL = S2.PnL_Planning_PnL
	AND S1.Location_Planning_Location = S2.Location_Planning_Location
	AND S1.Item_Planning_Item = S2.Item_Planning_Item


SELECT I.Item_Item, FORMAT(CONVERT(DATE,Item_Item_Intro_Date),'yyyy/MM/dd') AS Item_Item_Intro_Date,  FORMAT(CONVERT(DATE,Item_Item_Disc_Date),'yyyy/MM/dd') AS Item_Item_Disc_Date INTO Item_Disc_Intro_Dates_Aug22 
FROM Step3_Item I
JOIN ( SELECT 
	DISTINCT S2.Item_Item
FROM Step1_UnEqualFcst S1
	JOIN Step2 S2 ON S1.Channel_Planning_Channel = S2.Channel_Planning_Channel
	AND S1.Demand_Domain_Planning_Demand_Domain = S2.Demand_Domain_Planning_Demand_Domain
	AND S1.Account_Planning_Account  = S2.Account_Planning_Account
	AND S1.Region_Planning_Region = S2.Region_Planning_Region
	AND S1.PnL_Planning_PnL = S2.PnL_Planning_PnL
	AND S1.Location_Planning_Location = S2.Location_Planning_Location
	AND S1.Item_Planning_Item = S2.Item_Planning_Item
	) T ON T.Item_Item = I.Item_Item

SELECT DISTINCT  I.Item_Item, FORMAT(CONVERT(DATE,Item_Item_Intro_Date),'yyyy/MM/dd') AS Item_Item_Intro_Date,  FORMAT(CONVERT(DATE,Item_Item_Disc_Date),'yyyy/MM/dd') AS Item_Item_Disc_Date 
FROM Step3_Item I
JOIN Step2 t ON T.Item_Item = I.Item_Item

SELECT * FROM Step3_Item


	
