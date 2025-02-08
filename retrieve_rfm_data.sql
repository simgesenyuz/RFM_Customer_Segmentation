-- Recency
with recency as (
    select user_key,
        current_date - max(date(updated)) as num_days_since_trx
    from orders
    where updated >= current_date - interval '3 month'
    group by user_key
),

-- Frequency
frequency as (
    select
        user_key,
        count(*) as num_transactions
    from orders
    where updated >= current_date - interval '3 month'
    group by user_key
),

-- MonetaryValue
monetary_value as (
    select
        user_key,
        sum(volume) as total_vol
    from orders
    where updated >= current_date - interval '3 month'
    group by user_key
    )

select
    r.user_key,
    r.num_days_since_trx as num_days_since_trx,
    f.num_transactions as num_transactions,
    mv.total_vol as total_vol
from recency r
left join frequency f on r.user_key = f.user_key
left join monetary_value mv on r.user_key = mv.user_key