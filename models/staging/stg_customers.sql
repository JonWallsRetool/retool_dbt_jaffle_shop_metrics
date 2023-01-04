with source as (

    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ ref('raw_customers') }}

),

renamed as (

    select
        current_timestamp() as _etl_loaded_at,
        id as customer_id,
        first_name,
        last_name

    from source

)

select * from renamed
