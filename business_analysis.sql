-- =====================================================
-- What were the order counts, sales, and AOV for Macbooks sold in North America for each quarter across all years?
-- =====================================================

select
  date_trunc(purchase_ts, quarter) as purchase_quarter,
  count(distinct order_id) as order_count,
  sum(usd_price) as total_sales,
  avg(usd_price) as aov
from `project-a459ee4d-aa3a-4c9e-bf7.elist.orders`
where (
  lower(product_name) like '%macbook%'
)
and (
  country_code = 'US'
)
group by purchase_quarter
order by purchase_quarter;


-- =====================================================
-- For products purchased in 2022 on the website or products purchased on mobile in any year, which region has the average highest time to deliver?
-- =====================================================

select
  country_code,
  round(avg(date_diff(delivery_ts, purchase_ts, day))) as avg_time_to_deliver
from `project-a459ee4d-aa3a-4c9e-bf7.elist.orders`
where (
  extract(year from purchase_ts) = 2022
  and purchase_platform = 'website'
)
or (
  purchase_platform = 'mobile app'
)
group by country_code
order by avg_time_to_deliver desc;


-- =====================================================
-- What was the refund rate and refund count for each product overall?
-- =====================================================

select
  product_name,
  round(count(refund_ts) / count(order_id) * 100, 2) as refund_rate_pct
from `project-a459ee4d-aa3a-4c9e-bf7.elist.orders`
group by product_name
order by refund_rate_pct desc;


-- =====================================================
-- Within each region, what is the most popular product?
-- =====================================================

select
  country_code,
  product_name,
  count(order_id) as order_count
from `project-a459ee4d-aa3a-4c9e-bf7.elist.orders`
group by
  country_code,
  product_name
qualify row_number() over (
  partition by country_code
  order by count(order_id) desc
) = 1
order by country_code;


-- =====================================================
-- How does the time to make a purchase differ between loyalty customers vs. non-loyalty customers?
-- =====================================================

select
  case
    when loyalty_program = 1 then 'yes'
    else 'no'
  end as loyalty_program,
  round(avg(date_diff(purchase_ts, created_on, day))) as avg_days_to_purchase
from `project-a459ee4d-aa3a-4c9e-bf7.elist.orders`
group by loyalty_program;