with payments as (

    select
        id as payment_id,
        amount

    from dbt-tutorial.jaffle_shop.payments

)

select * from payments