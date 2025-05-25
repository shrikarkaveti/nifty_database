dates = open('nifty_database\dates.csv', 'r').readlines()
del dates[0]
dates = [i.strip() for i in dates]

years = open('nifty_database\years.csv', 'r').readlines()
del years[0]
years = [i.strip() for i in years]

features  = ['sales', 'expenses', 'pbt', 'pat', 'eps']
cycles = ['quarterly', 'annual']

output_file = open('nifty_database/test_nifty_base.sql', 'w')

# Quarter Tables
quarter_base_cte = """
{1}{2}_{0} as (
    select
        nifty_app_company.ticker,
        date(nifty_app_{2}result.year || '-' || printf('%02d', month) || '-01') as full_date,
        nifty_app_{2}result.{0}
    from nifty_app_company
    join nifty_app_{2}result on nifty_app_company.id = nifty_app_{2}result.company_id
),
"""

quarter_pivoted_base = """
pivoted_{2}_{0} as (
    select
        {2}_{0}.ticker,

{1}
    from {2}_{0}
    group by {2}_{0}.ticker
),
"""
quarter_pivoted_base_sub = """        max(case when {3}_{0}.full_date = date('{1}') then {3}_{0}.{0} else null end) as '{1}'{2}\n"""

# Annula Tables
annual_base_cte = """
{1}_{0} as (
    select
        nifty_app_company.ticker,
        nifty_app_{1}result.year as result_year,
        nifty_app_{1}result.{0}
    from nifty_app_company
    join nifty_app_{1}result on nifty_app_company.id = nifty_app_{1}result.company_id
),
"""

annual_pivoted_base = """
pivoted_{2}_{0} as (
    select
        {2}_{0}.ticker,

{1}
    from {2}_{0}
    group by {2}_{0}.ticker
),
"""
annual_pivoted_base_sub = """        max(case when {3}_{0}.result_year = '{1}' then {3}_{0}.{0} else null end) as '{1}'{2}\n"""

first_cte = True

for cycle in cycles:
    if (cycle == 'quarterly'):
        for feature in features:
            if (first_cte == True):
                output_file.write(quarter_base_cte.format(feature, "with ", cycle))
            else:
                output_file.write(quarter_base_cte.format(feature, "", cycle))

            date_sql_columns = """"""
            for date_idx in range(len(dates)):
                if (date_idx == len(dates) - 1):
                    date_sql_columns += quarter_pivoted_base_sub.format(feature, dates[date_idx], "", cycle)
                else:
                    date_sql_columns += quarter_pivoted_base_sub.format(feature, dates[date_idx], ",", cycle)

            output_file.write(quarter_pivoted_base.format(feature, date_sql_columns, cycle))

            first_cte = False

    if (cycle == 'annual'):
        for feature in features:
            output_file.write(annual_base_cte.format(feature, cycle))

            year_sql_columns = """"""
            for year_idx in range(len(years)):
                if (year_idx == len(years) - 1):
                    year_sql_columns += annual_pivoted_base_sub.format(feature, years[year_idx], "", cycle)
                else:
                    year_sql_columns += annual_pivoted_base_sub.format(feature, years[year_idx], ",", cycle)

            output_file.write(annual_pivoted_base.format(feature, year_sql_columns, cycle))

