create database gm100;
use gm100;

SELECT * FROM gm100.`stock+market+dataset+for+case+2`;
alter table `stock+market+dataset+for+case+2`  rename stock_market;
select* from stock_market;
describe stock_market;

alter table stock_market
rename column `Market Cap` To market_cap;
select market_cap from stock_market;
alter table stock_market
rename column `PE Ratio` To pe_ratio;
alter table stock_market
rename column `Sub-Sector` To sub_sector;
select sub_sector from stock_market;
alter table stock_market
rename column `Close Price` To close_price;
alter table stock_market
rename column `5Y Historical Revenue Growth` To 5_year_past_growth;
alter table stock_market
rename column `1Y Forward Revenue Growth` To 1year_future_growth;
alter table stock_market
rename column `Total Revenue` To total_revenue;
alter table stock_market
rename column `Taxes & Other Items` To Taxes_others;
alter table stock_market
rename column `DII Holding ChangeÂ â€“Â 3M` To dii_holding;
alter table stock_market
rename column `FII Holding ChangeÂ â€“Â 3M` To fii_holding;
alter table stock_market
rename column `MF Holding ChangeÂ â€“Â 3M` To mf_holding;
alter table stock_market
rename column `Promoter Holding ChangeÂ â€“Â 3M` To promoter_holding;
alter table stock_market
rename column `Percentage Buy Recoâ€™s`to percentage_buy;
alter table stock_market
rename column `Percentage Upside`to percentage_upside;
alter table stock_market
rename column `No. of analysts with buy reco` to no_analyst_rec;



-- -- above we have renamed the column because that includes spaces hyphens so after changing the name it will be more clear to call the the particular columns
select* from stock_market;
-- below code is to check whether there is null values present in this column in auto parts sub sector

-- close price
select close_price
from stock_market
where close_price is null and sub_sector like '%auto parts%';

-- pe ratio

select pe_ratio
from stock_market
where pe_ratio is null and sub_sector like '%auto parts%';

-- market cap 

select market_cap
from stock_market
where market_cap is null and sub_sector like '%auto parts%';

-- 1 year future growth (in this column we have found null values in the auto parts sub sector)

select 1year_future_growth
from stock_market
where 1year_future_growth is null and sub_sector like '%auto parts%';

-- we will fill  the null values with average value of the column 
-- here we have calculated the average value 

select avg(1year_future_growth)
from stock_market
where sub_sector like '%auto parts%';

-- fill the average value in  place of NULL value  using case when then

update stock_market
set 1year_future_growth=
(case when 1year_future_growth is null then 7305
else 1year_future_growth
end)
where sub_sector like '%auto parts%';

-- This code is  to check that null values are filled with average value or not
select 1year_future_growth
from stock_market
where 1year_future_growth= 7305
and sub_sector like '%auto parts%';

-- 5 year past growth

select 5year_past_growth
from stock_market
where 5year_past_growth is null and sub_sector like '%auto parts%' ;

-- Average of 5 year past growth

select avg(5year_past_growth)
from stock_market
where sub_sector like '%auto parts%';

 -- fill the average value in  place of NULL value  using case when then

update stock_market
set 5year_past_growth=
(case when 5year_past_growth is null then 8.14
else 5year_past_growth
end)
where sub_sector like '%auto parts%';

-- This code is  to check that null values are filled with average value or not
select 5year_past_growth
from stock_market
where 5year_past_growth= 8.14
and sub_sector like '%auto parts%';

-- Total  Revenue

select total_revenue
from stock_market
where total_revenue is null and sub_sector like '%auto parts%' ;

-- PBT

select PBT
from stock_market
where PBT is null and sub_sector like '%auto parts%' ;

-- Taxes and Others

select Taxes_others
from stock_market
where Taxes_others is null and sub_sector like '%auto parts%' ;

-- mf holding

select mf_holding
from stock_market
where mf_holding is null and sub_sector like '%auto parts%' ;

-- Average of mf holding

select avg(mf_holding)
from stock_market
where sub_sector like '%auto parts%';

-- fill the average value in  place of NULL value  using case when then

update stock_market
set mf_holding=
( case when mf_holding is NULL then 0.068
else mf_holding
end)
where sub_sector like '%auto parts%';

-- This code is  to check that null values are filled with average value or not
select mf_holding
from stock_market
where mf_holding= 0.068
and sub_sector like '%auto parts%';

-- dii holding

select dii_holding
from stock_market
where dii_holding is null and sub_sector like '%auto parts%';

-- Average of dii holding

select avg(dii_holding)
from stock_market
where sub_sector like '%auto parts%';

-- fill the  average value in  place of NULL value  using case when then

update stock_market
set dii_holding=
( case when dii_holding is NULL then 0.05
else dii_holding
end)
where sub_sector like '%auto parts%';

-- This code is  to check that null values are filled with average value or not

select dii_holding
from stock_market
where dii_holding= 0.05
and sub_sector like '%auto parts%';

-- fii  holding

select fii_holding
from stock_market
where fii_holding is null and sub_sector like '%auto parts%' ;

-- Average of fii holding

 select avg(fii_holding)
 from stock_market
 where sub_sector like '%auto parts%';
 
 -- fill the average value in  place of NULL value  using case when then

update stock_market
set fii_holding=
( case when fii_holding is NULL then 0.016
else fii_holding
end)
where sub_sector like '%auto parts%';

-- This code is  to check that null values are filled with average value or not
select fii_holding
from stock_market
where fii_holding= 0.016
and sub_sector like '%auto parts%';

-- promoter holding

select promoter_holding
from stock_market
where promoter_holding is null and sub_sector like '%auto parts%' ;

-- Average of promoter holding

 select avg(promoter_holding)
 from stock_market
 where sub_sector like '%auto parts%';
 
 -- fill the average value in  place of NULL value  using case when then

update stock_market
set promoter_holding=
( case when promoter_holding is NULL then -0.076
else promoter_holding
end)
where sub_sector like '%auto parts%';

-- This code is  to check that null values are filled with average value or not

select promoter_holding
from stock_market
where promoter_holding= -0.076
and sub_sector like '%auto parts%';

-- percetage buy

select percentage_buy
from stock_market
where percentage_buy is null and sub_sector like '%auto parts%' ;

-- Average of percentage buy

 select avg(percentage_buy)
 from stock_market
 where sub_sector like '%auto parts%';

-- fill the average value in  place of NULL value  using case when then

 update stock_market
set percentage_buy=
(case when percentage_buy is null then 80.65
else percentage_buy 
 end)
where sub_sector like '%auto parts%';

-- This code is  to check that null values are filled with average value or not
select percentage_buy
from stock_market
where percentage_buy= 80.65
and sub_sector like '%auto parts%';

-- No. of analyst

select no_analyst_rec
from stock_market
where no_analyst_rec is null and sub_sector like '%auto parts%' ;

-- Percentage Upside

select percentage_upside
from stock_market
where percentage_upside is null and sub_sector like '%auto parts%' ;

-- Average of Percentage Upside

select avg(percentage_upside)
from stock_market
where sub_sector like '%auto parts%';

-- fill the average value in  place of NULL value  using case when then

update stock_market
set percentage_upside=
(case when percentage_upside is null then 17.45
else percentage_upside
end)
where sub_sector like '%auto parts%'; 


-- This code is  to check that null values are filled with average value or not
select percentage_upside
from stock_market
where percentage_upside= 17.45
and sub_sector like '%auto parts%';





