{{ config(materialized="users_scalar", schema="_airbyte_quarantine", tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema

select
    _airbyte_data['_id'] as legacy_id,
    (_airbyte_data->>'createdAt')::timestamptz AS start_date,
    (_airbyte_data->>'updatedAt')::timestamptz AS update_at,
    (_airbyte_data->>'name')::text  as name,
    (_airbyte_data->>'email')::text  as email,
    (_airbyte_data->>'status')::text  as status,
    (_airbyte_data->>'lastName')::text  as last_name,
    (_airbyte_data->>'firstName')::text  as first_name,
    (_airbyte_data->>'remoteCreatedAt')::timestamptz  as remote_created_at,
    (_airbyte_data->>'employmentStatus')::text  as employment_status,
    (_airbyte_data->>'organization')::text  as organization,
    (_airbyte_data->>'onboardingStep')::integer  as onboarding_step,
    _airbyte_emitted_at
from _airbyte_public._airbyte_raw_users
