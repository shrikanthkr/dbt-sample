select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select legacy_id
from "postgres"."public__airbyte_quarantine"."users_scalar"
where legacy_id is null



      
    ) dbt_internal_test