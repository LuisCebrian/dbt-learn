with payments as (

    select
        id as payment_id,
        orderid as order_id,
        amount,
        status

    from dbt-tutorial.stripe.payment

)

select * from payments