
with quarterly_sales as (
    select
        nifty_app_company.ticker,
        date(nifty_app_quarterlyresult.year || '-' || printf('%02d', month) || '-01') as full_date,
        nifty_app_quarterlyresult.sales
    from nifty_app_company
    join nifty_app_quarterlyresult on nifty_app_company.id = nifty_app_quarterlyresult.company_id
),

pivoted_quarterly_sales as (
    select
        quarterly_sales.ticker,

        max(case when quarterly_sales.full_date = date('2011-12-01') then quarterly_sales.sales else null end) as '2011-12-01',
        max(case when quarterly_sales.full_date = date('2019-03-01') then quarterly_sales.sales else null end) as '2019-03-01',
        max(case when quarterly_sales.full_date = date('2019-06-01') then quarterly_sales.sales else null end) as '2019-06-01',
        max(case when quarterly_sales.full_date = date('2019-09-01') then quarterly_sales.sales else null end) as '2019-09-01',
        max(case when quarterly_sales.full_date = date('2021-12-01') then quarterly_sales.sales else null end) as '2021-12-01',
        max(case when quarterly_sales.full_date = date('2022-03-01') then quarterly_sales.sales else null end) as '2022-03-01',
        max(case when quarterly_sales.full_date = date('2022-06-01') then quarterly_sales.sales else null end) as '2022-06-01',
        max(case when quarterly_sales.full_date = date('2022-09-01') then quarterly_sales.sales else null end) as '2022-09-01',
        max(case when quarterly_sales.full_date = date('2022-12-01') then quarterly_sales.sales else null end) as '2022-12-01',
        max(case when quarterly_sales.full_date = date('2023-03-01') then quarterly_sales.sales else null end) as '2023-03-01',
        max(case when quarterly_sales.full_date = date('2023-06-01') then quarterly_sales.sales else null end) as '2023-06-01',
        max(case when quarterly_sales.full_date = date('2023-09-01') then quarterly_sales.sales else null end) as '2023-09-01',
        max(case when quarterly_sales.full_date = date('2023-12-01') then quarterly_sales.sales else null end) as '2023-12-01',
        max(case when quarterly_sales.full_date = date('2024-03-01') then quarterly_sales.sales else null end) as '2024-03-01',
        max(case when quarterly_sales.full_date = date('2024-06-01') then quarterly_sales.sales else null end) as '2024-06-01',
        max(case when quarterly_sales.full_date = date('2024-09-01') then quarterly_sales.sales else null end) as '2024-09-01',
        max(case when quarterly_sales.full_date = date('2024-12-01') then quarterly_sales.sales else null end) as '2024-12-01',
        max(case when quarterly_sales.full_date = date('2025-03-01') then quarterly_sales.sales else null end) as '2025-03-01'

    from quarterly_sales
    group by quarterly_sales.ticker
),

quarterly_expenses as (
    select
        nifty_app_company.ticker,
        date(nifty_app_quarterlyresult.year || '-' || printf('%02d', month) || '-01') as full_date,
        nifty_app_quarterlyresult.expenses
    from nifty_app_company
    join nifty_app_quarterlyresult on nifty_app_company.id = nifty_app_quarterlyresult.company_id
),

pivoted_quarterly_expenses as (
    select
        quarterly_expenses.ticker,

        max(case when quarterly_expenses.full_date = date('2011-12-01') then quarterly_expenses.expenses else null end) as '2011-12-01',
        max(case when quarterly_expenses.full_date = date('2019-03-01') then quarterly_expenses.expenses else null end) as '2019-03-01',
        max(case when quarterly_expenses.full_date = date('2019-06-01') then quarterly_expenses.expenses else null end) as '2019-06-01',
        max(case when quarterly_expenses.full_date = date('2019-09-01') then quarterly_expenses.expenses else null end) as '2019-09-01',
        max(case when quarterly_expenses.full_date = date('2021-12-01') then quarterly_expenses.expenses else null end) as '2021-12-01',
        max(case when quarterly_expenses.full_date = date('2022-03-01') then quarterly_expenses.expenses else null end) as '2022-03-01',
        max(case when quarterly_expenses.full_date = date('2022-06-01') then quarterly_expenses.expenses else null end) as '2022-06-01',
        max(case when quarterly_expenses.full_date = date('2022-09-01') then quarterly_expenses.expenses else null end) as '2022-09-01',
        max(case when quarterly_expenses.full_date = date('2022-12-01') then quarterly_expenses.expenses else null end) as '2022-12-01',
        max(case when quarterly_expenses.full_date = date('2023-03-01') then quarterly_expenses.expenses else null end) as '2023-03-01',
        max(case when quarterly_expenses.full_date = date('2023-06-01') then quarterly_expenses.expenses else null end) as '2023-06-01',
        max(case when quarterly_expenses.full_date = date('2023-09-01') then quarterly_expenses.expenses else null end) as '2023-09-01',
        max(case when quarterly_expenses.full_date = date('2023-12-01') then quarterly_expenses.expenses else null end) as '2023-12-01',
        max(case when quarterly_expenses.full_date = date('2024-03-01') then quarterly_expenses.expenses else null end) as '2024-03-01',
        max(case when quarterly_expenses.full_date = date('2024-06-01') then quarterly_expenses.expenses else null end) as '2024-06-01',
        max(case when quarterly_expenses.full_date = date('2024-09-01') then quarterly_expenses.expenses else null end) as '2024-09-01',
        max(case when quarterly_expenses.full_date = date('2024-12-01') then quarterly_expenses.expenses else null end) as '2024-12-01',
        max(case when quarterly_expenses.full_date = date('2025-03-01') then quarterly_expenses.expenses else null end) as '2025-03-01'

    from quarterly_expenses
    group by quarterly_expenses.ticker
),

quarterly_pbt as (
    select
        nifty_app_company.ticker,
        date(nifty_app_quarterlyresult.year || '-' || printf('%02d', month) || '-01') as full_date,
        nifty_app_quarterlyresult.pbt
    from nifty_app_company
    join nifty_app_quarterlyresult on nifty_app_company.id = nifty_app_quarterlyresult.company_id
),

pivoted_quarterly_pbt as (
    select
        quarterly_pbt.ticker,

        max(case when quarterly_pbt.full_date = date('2011-12-01') then quarterly_pbt.pbt else null end) as '2011-12-01',
        max(case when quarterly_pbt.full_date = date('2019-03-01') then quarterly_pbt.pbt else null end) as '2019-03-01',
        max(case when quarterly_pbt.full_date = date('2019-06-01') then quarterly_pbt.pbt else null end) as '2019-06-01',
        max(case when quarterly_pbt.full_date = date('2019-09-01') then quarterly_pbt.pbt else null end) as '2019-09-01',
        max(case when quarterly_pbt.full_date = date('2021-12-01') then quarterly_pbt.pbt else null end) as '2021-12-01',
        max(case when quarterly_pbt.full_date = date('2022-03-01') then quarterly_pbt.pbt else null end) as '2022-03-01',
        max(case when quarterly_pbt.full_date = date('2022-06-01') then quarterly_pbt.pbt else null end) as '2022-06-01',
        max(case when quarterly_pbt.full_date = date('2022-09-01') then quarterly_pbt.pbt else null end) as '2022-09-01',
        max(case when quarterly_pbt.full_date = date('2022-12-01') then quarterly_pbt.pbt else null end) as '2022-12-01',
        max(case when quarterly_pbt.full_date = date('2023-03-01') then quarterly_pbt.pbt else null end) as '2023-03-01',
        max(case when quarterly_pbt.full_date = date('2023-06-01') then quarterly_pbt.pbt else null end) as '2023-06-01',
        max(case when quarterly_pbt.full_date = date('2023-09-01') then quarterly_pbt.pbt else null end) as '2023-09-01',
        max(case when quarterly_pbt.full_date = date('2023-12-01') then quarterly_pbt.pbt else null end) as '2023-12-01',
        max(case when quarterly_pbt.full_date = date('2024-03-01') then quarterly_pbt.pbt else null end) as '2024-03-01',
        max(case when quarterly_pbt.full_date = date('2024-06-01') then quarterly_pbt.pbt else null end) as '2024-06-01',
        max(case when quarterly_pbt.full_date = date('2024-09-01') then quarterly_pbt.pbt else null end) as '2024-09-01',
        max(case when quarterly_pbt.full_date = date('2024-12-01') then quarterly_pbt.pbt else null end) as '2024-12-01',
        max(case when quarterly_pbt.full_date = date('2025-03-01') then quarterly_pbt.pbt else null end) as '2025-03-01'

    from quarterly_pbt
    group by quarterly_pbt.ticker
),

quarterly_pat as (
    select
        nifty_app_company.ticker,
        date(nifty_app_quarterlyresult.year || '-' || printf('%02d', month) || '-01') as full_date,
        nifty_app_quarterlyresult.pat
    from nifty_app_company
    join nifty_app_quarterlyresult on nifty_app_company.id = nifty_app_quarterlyresult.company_id
),

pivoted_quarterly_pat as (
    select
        quarterly_pat.ticker,

        max(case when quarterly_pat.full_date = date('2011-12-01') then quarterly_pat.pat else null end) as '2011-12-01',
        max(case when quarterly_pat.full_date = date('2019-03-01') then quarterly_pat.pat else null end) as '2019-03-01',
        max(case when quarterly_pat.full_date = date('2019-06-01') then quarterly_pat.pat else null end) as '2019-06-01',
        max(case when quarterly_pat.full_date = date('2019-09-01') then quarterly_pat.pat else null end) as '2019-09-01',
        max(case when quarterly_pat.full_date = date('2021-12-01') then quarterly_pat.pat else null end) as '2021-12-01',
        max(case when quarterly_pat.full_date = date('2022-03-01') then quarterly_pat.pat else null end) as '2022-03-01',
        max(case when quarterly_pat.full_date = date('2022-06-01') then quarterly_pat.pat else null end) as '2022-06-01',
        max(case when quarterly_pat.full_date = date('2022-09-01') then quarterly_pat.pat else null end) as '2022-09-01',
        max(case when quarterly_pat.full_date = date('2022-12-01') then quarterly_pat.pat else null end) as '2022-12-01',
        max(case when quarterly_pat.full_date = date('2023-03-01') then quarterly_pat.pat else null end) as '2023-03-01',
        max(case when quarterly_pat.full_date = date('2023-06-01') then quarterly_pat.pat else null end) as '2023-06-01',
        max(case when quarterly_pat.full_date = date('2023-09-01') then quarterly_pat.pat else null end) as '2023-09-01',
        max(case when quarterly_pat.full_date = date('2023-12-01') then quarterly_pat.pat else null end) as '2023-12-01',
        max(case when quarterly_pat.full_date = date('2024-03-01') then quarterly_pat.pat else null end) as '2024-03-01',
        max(case when quarterly_pat.full_date = date('2024-06-01') then quarterly_pat.pat else null end) as '2024-06-01',
        max(case when quarterly_pat.full_date = date('2024-09-01') then quarterly_pat.pat else null end) as '2024-09-01',
        max(case when quarterly_pat.full_date = date('2024-12-01') then quarterly_pat.pat else null end) as '2024-12-01',
        max(case when quarterly_pat.full_date = date('2025-03-01') then quarterly_pat.pat else null end) as '2025-03-01'

    from quarterly_pat
    group by quarterly_pat.ticker
),

quarterly_eps as (
    select
        nifty_app_company.ticker,
        date(nifty_app_quarterlyresult.year || '-' || printf('%02d', month) || '-01') as full_date,
        nifty_app_quarterlyresult.eps
    from nifty_app_company
    join nifty_app_quarterlyresult on nifty_app_company.id = nifty_app_quarterlyresult.company_id
),

pivoted_quarterly_eps as (
    select
        quarterly_eps.ticker,

        max(case when quarterly_eps.full_date = date('2011-12-01') then quarterly_eps.eps else null end) as '2011-12-01',
        max(case when quarterly_eps.full_date = date('2019-03-01') then quarterly_eps.eps else null end) as '2019-03-01',
        max(case when quarterly_eps.full_date = date('2019-06-01') then quarterly_eps.eps else null end) as '2019-06-01',
        max(case when quarterly_eps.full_date = date('2019-09-01') then quarterly_eps.eps else null end) as '2019-09-01',
        max(case when quarterly_eps.full_date = date('2021-12-01') then quarterly_eps.eps else null end) as '2021-12-01',
        max(case when quarterly_eps.full_date = date('2022-03-01') then quarterly_eps.eps else null end) as '2022-03-01',
        max(case when quarterly_eps.full_date = date('2022-06-01') then quarterly_eps.eps else null end) as '2022-06-01',
        max(case when quarterly_eps.full_date = date('2022-09-01') then quarterly_eps.eps else null end) as '2022-09-01',
        max(case when quarterly_eps.full_date = date('2022-12-01') then quarterly_eps.eps else null end) as '2022-12-01',
        max(case when quarterly_eps.full_date = date('2023-03-01') then quarterly_eps.eps else null end) as '2023-03-01',
        max(case when quarterly_eps.full_date = date('2023-06-01') then quarterly_eps.eps else null end) as '2023-06-01',
        max(case when quarterly_eps.full_date = date('2023-09-01') then quarterly_eps.eps else null end) as '2023-09-01',
        max(case when quarterly_eps.full_date = date('2023-12-01') then quarterly_eps.eps else null end) as '2023-12-01',
        max(case when quarterly_eps.full_date = date('2024-03-01') then quarterly_eps.eps else null end) as '2024-03-01',
        max(case when quarterly_eps.full_date = date('2024-06-01') then quarterly_eps.eps else null end) as '2024-06-01',
        max(case when quarterly_eps.full_date = date('2024-09-01') then quarterly_eps.eps else null end) as '2024-09-01',
        max(case when quarterly_eps.full_date = date('2024-12-01') then quarterly_eps.eps else null end) as '2024-12-01',
        max(case when quarterly_eps.full_date = date('2025-03-01') then quarterly_eps.eps else null end) as '2025-03-01'

    from quarterly_eps
    group by quarterly_eps.ticker
),

annual_sales as (
    select
        nifty_app_company.ticker,
        nifty_app_annualresult.year as result_year,
        nifty_app_annualresult.sales
    from nifty_app_company
    join nifty_app_annualresult on nifty_app_company.id = nifty_app_annualresult.company_id
),

pivoted_annual_sales as (
    select
        annual_sales.ticker,

        max(case when annual_sales.result_year = '2011' then annual_sales.sales else null end) as '2011',
        max(case when annual_sales.result_year = '2012' then annual_sales.sales else null end) as '2012',
        max(case when annual_sales.result_year = '2013' then annual_sales.sales else null end) as '2013',
        max(case when annual_sales.result_year = '2014' then annual_sales.sales else null end) as '2014',
        max(case when annual_sales.result_year = '2015' then annual_sales.sales else null end) as '2015',
        max(case when annual_sales.result_year = '2016' then annual_sales.sales else null end) as '2016',
        max(case when annual_sales.result_year = '2017' then annual_sales.sales else null end) as '2017',
        max(case when annual_sales.result_year = '2018' then annual_sales.sales else null end) as '2018',
        max(case when annual_sales.result_year = '2019' then annual_sales.sales else null end) as '2019',
        max(case when annual_sales.result_year = '2020' then annual_sales.sales else null end) as '2020',
        max(case when annual_sales.result_year = '2021' then annual_sales.sales else null end) as '2021',
        max(case when annual_sales.result_year = '2022' then annual_sales.sales else null end) as '2022',
        max(case when annual_sales.result_year = '2023' then annual_sales.sales else null end) as '2023',
        max(case when annual_sales.result_year = '2024' then annual_sales.sales else null end) as '2024',
        max(case when annual_sales.result_year = '2025' then annual_sales.sales else null end) as '2025'

    from annual_sales
    group by annual_sales.ticker
),

annual_expenses as (
    select
        nifty_app_company.ticker,
        nifty_app_annualresult.year as result_year,
        nifty_app_annualresult.expenses
    from nifty_app_company
    join nifty_app_annualresult on nifty_app_company.id = nifty_app_annualresult.company_id
),

pivoted_annual_expenses as (
    select
        annual_expenses.ticker,

        max(case when annual_expenses.result_year = '2011' then annual_expenses.expenses else null end) as '2011',
        max(case when annual_expenses.result_year = '2012' then annual_expenses.expenses else null end) as '2012',
        max(case when annual_expenses.result_year = '2013' then annual_expenses.expenses else null end) as '2013',
        max(case when annual_expenses.result_year = '2014' then annual_expenses.expenses else null end) as '2014',
        max(case when annual_expenses.result_year = '2015' then annual_expenses.expenses else null end) as '2015',
        max(case when annual_expenses.result_year = '2016' then annual_expenses.expenses else null end) as '2016',
        max(case when annual_expenses.result_year = '2017' then annual_expenses.expenses else null end) as '2017',
        max(case when annual_expenses.result_year = '2018' then annual_expenses.expenses else null end) as '2018',
        max(case when annual_expenses.result_year = '2019' then annual_expenses.expenses else null end) as '2019',
        max(case when annual_expenses.result_year = '2020' then annual_expenses.expenses else null end) as '2020',
        max(case when annual_expenses.result_year = '2021' then annual_expenses.expenses else null end) as '2021',
        max(case when annual_expenses.result_year = '2022' then annual_expenses.expenses else null end) as '2022',
        max(case when annual_expenses.result_year = '2023' then annual_expenses.expenses else null end) as '2023',
        max(case when annual_expenses.result_year = '2024' then annual_expenses.expenses else null end) as '2024',
        max(case when annual_expenses.result_year = '2025' then annual_expenses.expenses else null end) as '2025'

    from annual_expenses
    group by annual_expenses.ticker
),

annual_pbt as (
    select
        nifty_app_company.ticker,
        nifty_app_annualresult.year as result_year,
        nifty_app_annualresult.pbt
    from nifty_app_company
    join nifty_app_annualresult on nifty_app_company.id = nifty_app_annualresult.company_id
),

pivoted_annual_pbt as (
    select
        annual_pbt.ticker,

        max(case when annual_pbt.result_year = '2011' then annual_pbt.pbt else null end) as '2011',
        max(case when annual_pbt.result_year = '2012' then annual_pbt.pbt else null end) as '2012',
        max(case when annual_pbt.result_year = '2013' then annual_pbt.pbt else null end) as '2013',
        max(case when annual_pbt.result_year = '2014' then annual_pbt.pbt else null end) as '2014',
        max(case when annual_pbt.result_year = '2015' then annual_pbt.pbt else null end) as '2015',
        max(case when annual_pbt.result_year = '2016' then annual_pbt.pbt else null end) as '2016',
        max(case when annual_pbt.result_year = '2017' then annual_pbt.pbt else null end) as '2017',
        max(case when annual_pbt.result_year = '2018' then annual_pbt.pbt else null end) as '2018',
        max(case when annual_pbt.result_year = '2019' then annual_pbt.pbt else null end) as '2019',
        max(case when annual_pbt.result_year = '2020' then annual_pbt.pbt else null end) as '2020',
        max(case when annual_pbt.result_year = '2021' then annual_pbt.pbt else null end) as '2021',
        max(case when annual_pbt.result_year = '2022' then annual_pbt.pbt else null end) as '2022',
        max(case when annual_pbt.result_year = '2023' then annual_pbt.pbt else null end) as '2023',
        max(case when annual_pbt.result_year = '2024' then annual_pbt.pbt else null end) as '2024',
        max(case when annual_pbt.result_year = '2025' then annual_pbt.pbt else null end) as '2025'

    from annual_pbt
    group by annual_pbt.ticker
),

annual_pat as (
    select
        nifty_app_company.ticker,
        nifty_app_annualresult.year as result_year,
        nifty_app_annualresult.pat
    from nifty_app_company
    join nifty_app_annualresult on nifty_app_company.id = nifty_app_annualresult.company_id
),

pivoted_annual_pat as (
    select
        annual_pat.ticker,

        max(case when annual_pat.result_year = '2011' then annual_pat.pat else null end) as '2011',
        max(case when annual_pat.result_year = '2012' then annual_pat.pat else null end) as '2012',
        max(case when annual_pat.result_year = '2013' then annual_pat.pat else null end) as '2013',
        max(case when annual_pat.result_year = '2014' then annual_pat.pat else null end) as '2014',
        max(case when annual_pat.result_year = '2015' then annual_pat.pat else null end) as '2015',
        max(case when annual_pat.result_year = '2016' then annual_pat.pat else null end) as '2016',
        max(case when annual_pat.result_year = '2017' then annual_pat.pat else null end) as '2017',
        max(case when annual_pat.result_year = '2018' then annual_pat.pat else null end) as '2018',
        max(case when annual_pat.result_year = '2019' then annual_pat.pat else null end) as '2019',
        max(case when annual_pat.result_year = '2020' then annual_pat.pat else null end) as '2020',
        max(case when annual_pat.result_year = '2021' then annual_pat.pat else null end) as '2021',
        max(case when annual_pat.result_year = '2022' then annual_pat.pat else null end) as '2022',
        max(case when annual_pat.result_year = '2023' then annual_pat.pat else null end) as '2023',
        max(case when annual_pat.result_year = '2024' then annual_pat.pat else null end) as '2024',
        max(case when annual_pat.result_year = '2025' then annual_pat.pat else null end) as '2025'

    from annual_pat
    group by annual_pat.ticker
),

annual_eps as (
    select
        nifty_app_company.ticker,
        nifty_app_annualresult.year as result_year,
        nifty_app_annualresult.eps
    from nifty_app_company
    join nifty_app_annualresult on nifty_app_company.id = nifty_app_annualresult.company_id
),

pivoted_annual_eps as (
    select
        annual_eps.ticker,

        max(case when annual_eps.result_year = '2011' then annual_eps.eps else null end) as '2011',
        max(case when annual_eps.result_year = '2012' then annual_eps.eps else null end) as '2012',
        max(case when annual_eps.result_year = '2013' then annual_eps.eps else null end) as '2013',
        max(case when annual_eps.result_year = '2014' then annual_eps.eps else null end) as '2014',
        max(case when annual_eps.result_year = '2015' then annual_eps.eps else null end) as '2015',
        max(case when annual_eps.result_year = '2016' then annual_eps.eps else null end) as '2016',
        max(case when annual_eps.result_year = '2017' then annual_eps.eps else null end) as '2017',
        max(case when annual_eps.result_year = '2018' then annual_eps.eps else null end) as '2018',
        max(case when annual_eps.result_year = '2019' then annual_eps.eps else null end) as '2019',
        max(case when annual_eps.result_year = '2020' then annual_eps.eps else null end) as '2020',
        max(case when annual_eps.result_year = '2021' then annual_eps.eps else null end) as '2021',
        max(case when annual_eps.result_year = '2022' then annual_eps.eps else null end) as '2022',
        max(case when annual_eps.result_year = '2023' then annual_eps.eps else null end) as '2023',
        max(case when annual_eps.result_year = '2024' then annual_eps.eps else null end) as '2024',
        max(case when annual_eps.result_year = '2025' then annual_eps.eps else null end) as '2025'

    from annual_eps
    group by annual_eps.ticker
),
