with orders as (
    select * from {{ ref('stg_orders') }}
),

payments as (
    select * from {{ ref('stg_payments') }}
),

payment_orders as (
    select
        order_id,
        sum(amount) as amount_paid,
        count(payment_id) as number_of_payments

    from payments

    where payments.status = "success"

    group by 1

),

final as (
    select 
        orders.order_id,
        orders.customer_id,
        coalesce(payment_orders.amount_paid, 0) as amount,
        orders.order_date

    from orders

    left join payment_orders using (order_id)
)

select * from final