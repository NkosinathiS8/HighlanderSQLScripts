select b.InformationDateSk,glb.ExcoCode, b.GLAcctCode
,sum(b.HighlanderActualAmount) as HighlanderActualAmount, sum(b.MilActualAmount) MilActualAmount, sum(b.HighlanderActualAmount) - sum(b.MilActualAmount) ActualDiff
,sum(b.HighlanderAverageAmount) as HighlanderAverageAmount, sum(b.MilAverageAmount) MilAverageAmount , sum(b.HighlanderAverageAmount) - sum(b.MilAverageAmount) AvgDiff
from AbsaFinancialBalancingMart.Fact.BalanceSheet b
inner join AbsaMasterData.Dimension.GLBalanceSheetItems glb on glb.GLAccountSk = b.GLAccountSk and glb.ExcoCode = 'A060101'
inner join AbsaMasterData.Dimension.MillleniumFlat m on m.CostCentreSk = b.GLCostCentreSk and m.CostCentreCode1 = 'ACBBCL'
where b.InformationDateSk = 20211231
group by b.InformationDateSk,glb.ExcoCode,b.GLAcctCode
order by b.InformationDateSk