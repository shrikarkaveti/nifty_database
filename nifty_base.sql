-- Quarterly and Annual Count Data
-- with quarterlycount as (
--   select
--     nifty_app_company.ticker as ticker_name,
--     count(nifty_app_company.id) as quarter_count
--    from nifty_app_company
--    join nifty_app_quarterlyresult on nifty_app_company.id = nifty_app_quarterlyresult.company_id
--    group by nifty_app_company.ticker
--  ),
 
--  annualcount as (
--    select
--    	nifty_app_company.ticker as ticker_name,
--    	count(nifty_app_company.id) as annual_count
--    from nifty_app_company
--    join nifty_app_annualresult on nifty_app_company.id = nifty_app_annualresult.company_id
--    group by nifty_app_company.ticker
--  )
 
--  select
--  	nifty_app_company.ticker,
--   quarterlycount.quarter_count,
--   annualcount.annual_count
--  from nifty_app_company
--  join quarterlycount on nifty_app_company.ticker = quarterlycount.ticker_name
--  join annualcount on nifty_app_company.ticker = annualcount.ticker_name

 with quarter_sales as (
  select
    nifty_app_company.ticker,
    date(nifty_app_quarterlyresult.year || '-' || printf('%02d', month) || '-01') as full_date,
    nifty_app_quarterlyresult.sales
  from nifty_app_company
  join nifty_app_quarterlyresult on nifty_app_company.id = nifty_app_quarterlyresult.company_id
 ),
 
 pivoted_quarter_sales as (
 
   select
    quarter_sales.ticker,
    max(case when quarter_sales.full_date = date('2011-12-01') then quarter_sales.sales else null end) as '2011-12-01',

    max(case when quarter_sales.full_date = date('2019-03-01') then quarter_sales.sales else null end) as '2019-03-01',
    max(case when quarter_sales.full_date = date('2019-06-01') then quarter_sales.sales else null end) as '2019-06-01',
    max(case when quarter_sales.full_date = date('2019-09-01') then quarter_sales.sales else null end) as '2019-09-01',

    max(case when quarter_sales.full_date = date('2021-12-01') then quarter_sales.sales else null end) as '2021-12-01',

    max(case when quarter_sales.full_date = date('2022-03-01') then quarter_sales.sales else null end) as '2022-03-01',
    max(case when quarter_sales.full_date = date('2022-06-01') then quarter_sales.sales else null end) as '2022-06-01',
    max(case when quarter_sales.full_date = date('2022-09-01') then quarter_sales.sales else null end) as '2022-09-01',
    max(case when quarter_sales.full_date = date('2022-12-01') then quarter_sales.sales else null end) as '2022-12-01',

    max(case when quarter_sales.full_date = date('2023-03-01') then quarter_sales.sales else null end) as '2023-03-01',
    max(case when quarter_sales.full_date = date('2023-06-01') then quarter_sales.sales else null end) as '2023-06-01',
    max(case when quarter_sales.full_date = date('2023-09-01') then quarter_sales.sales else null end) as '2023-09-01',
    max(case when quarter_sales.full_date = date('2023-12-01') then quarter_sales.sales else null end) as '2023-12-01',

    max(case when quarter_sales.full_date = date('2024-03-01') then quarter_sales.sales else null end) as '2024-03-01',
    max(case when quarter_sales.full_date = date('2024-06-01') then quarter_sales.sales else null end) as '2024-06-01',
    max(case when quarter_sales.full_date = date('2024-09-01') then quarter_sales.sales else null end) as '2024-09-01',
    max(case when quarter_sales.full_date = date('2024-12-01') then quarter_sales.sales else null end) as '2024-12-01',

    max(case when quarter_sales.full_date = date('2025-03-01') then quarter_sales.sales else null end) as '2025-03-01',
    max(case when quarter_sales.full_date = date('2025-06-01') then quarter_sales.sales else null end) as '2025-06-01',
    max(case when quarter_sales.full_date = date('2025-09-01') then quarter_sales.sales else null end) as '2025-09-01',
    max(case when quarter_sales.full_date = date('2025-12-01') then quarter_sales.sales else null end) as '2025-12-01'
   from quarter_sales
   group by quarter_sales.ticker
  ),
  
  quarter_expenses as (
  select
    nifty_app_company.ticker,
    date(nifty_app_quarterlyresult.year || '-' || printf('%02d', month) || '-01') as full_date,
    nifty_app_quarterlyresult.expenses
  from nifty_app_company
  join nifty_app_quarterlyresult on nifty_app_company.id = nifty_app_quarterlyresult.company_id
 ),
 
 pivoted_quarter_expenses as (
 
   select
    quarter_expenses.ticker,
    max(case when quarter_expenses.full_date = date('2011-12-01') then quarter_expenses.expenses else null end) as '2011-12-01',

    max(case when quarter_expenses.full_date = date('2019-03-01') then quarter_expenses.expenses else null end) as '2019-03-01',
    max(case when quarter_expenses.full_date = date('2019-06-01') then quarter_expenses.expenses else null end) as '2019-06-01',
    max(case when quarter_expenses.full_date = date('2019-09-01') then quarter_expenses.expenses else null end) as '2019-09-01',

    max(case when quarter_expenses.full_date = date('2021-12-01') then quarter_expenses.expenses else null end) as '2021-12-01',

    max(case when quarter_expenses.full_date = date('2022-03-01') then quarter_expenses.expenses else null end) as '2022-03-01',
    max(case when quarter_expenses.full_date = date('2022-06-01') then quarter_expenses.expenses else null end) as '2022-06-01',
    max(case when quarter_expenses.full_date = date('2022-09-01') then quarter_expenses.expenses else null end) as '2022-09-01',
    max(case when quarter_expenses.full_date = date('2022-12-01') then quarter_expenses.expenses else null end) as '2022-12-01',

    max(case when quarter_expenses.full_date = date('2023-03-01') then quarter_expenses.expenses else null end) as '2023-03-01',
    max(case when quarter_expenses.full_date = date('2023-06-01') then quarter_expenses.expenses else null end) as '2023-06-01',
    max(case when quarter_expenses.full_date = date('2023-09-01') then quarter_expenses.expenses else null end) as '2023-09-01',
    max(case when quarter_expenses.full_date = date('2023-12-01') then quarter_expenses.expenses else null end) as '2023-12-01',

    max(case when quarter_expenses.full_date = date('2024-03-01') then quarter_expenses.expenses else null end) as '2024-03-01',
    max(case when quarter_expenses.full_date = date('2024-06-01') then quarter_expenses.expenses else null end) as '2024-06-01',
    max(case when quarter_expenses.full_date = date('2024-09-01') then quarter_expenses.expenses else null end) as '2024-09-01',
    max(case when quarter_expenses.full_date = date('2024-12-01') then quarter_expenses.expenses else null end) as '2024-12-01',

    max(case when quarter_expenses.full_date = date('2025-03-01') then quarter_expenses.expenses else null end) as '2025-03-01',
    max(case when quarter_expenses.full_date = date('2025-06-01') then quarter_expenses.expenses else null end) as '2025-06-01',
    max(case when quarter_expenses.full_date = date('2025-09-01') then quarter_expenses.expenses else null end) as '2025-09-01',
    max(case when quarter_expenses.full_date = date('2025-12-01') then quarter_expenses.expenses else null end) as '2025-12-01'
   from quarter_expenses
   group by quarter_expenses.ticker
  ),
  
  quarter_sales_mean as (
    select
      quarter_sales.ticker,
    	count(1) as n_quarters,
      avg(quarter_sales.sales) as sales_mean
    from quarter_sales
    group by quarter_sales.ticker
  ),
  
 quarter_sales_std as (
 	select
  	quarter_sales.ticker,
--     quarter_sales.full_date,
--     quarter_sales_mean.n_quarters,
--     quarter_sales.sales,
--     quarter_sales_mean.sales_mean,
    pow((sum(pow((quarter_sales.sales - quarter_sales_mean.sales_mean), 2)) / (quarter_sales_mean.n_quarters - 1)), 0.5) as std_dev
	from quarter_sales
 	join quarter_sales_mean on quarter_sales_mean.ticker = quarter_sales.ticker
  group by quarter_sales.ticker
 ),
 
 quarter_prev_curr_sales as (
    select
      quarter_sales.ticker,
      quarter_sales.full_date,
      quarter_sales.sales,
      lag(quarter_sales.sales) over (partition by quarter_sales.ticker order by quarter_sales.full_date) as prev_quarter_sales
    from quarter_sales
  ),
  
  sales_growth as (
    select
      quarter_prev_curr_sales.ticker,
      avg((quarter_prev_curr_sales.sales - quarter_prev_curr_sales.prev_quarter_sales) / cast(quarter_prev_curr_sales.prev_quarter_sales as real) * 100) as growth_percent
    from quarter_prev_curr_sales
    group by quarter_prev_curr_sales.ticker
   )
   
   select
   	sales_growth.ticker,
    (sales_growth.growth_percent / quarter_sales_std.std_dev) as sharpe_score
   from sales_growth
   join quarter_sales_std on sales_growth.ticker = quarter_sales_std.ticker
   order by sharpe_score desc