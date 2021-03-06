CREATE INDEX auth_group_name_idx ON recon.auth_group(name varchar_pattern_ops);

CREATE INDEX auth_group_permissions_group_id_idx ON recon.auth_group_permissions(group_id);

CREATE INDEX auth_group_permissions_permission_id_idx ON recon.auth_group_permissions(permission_id);

CREATE INDEX auth_permission_content_type_id_idx ON recon.auth_permission(content_type_id);

CREATE INDEX auth_user_groups_group_id_idx ON recon.auth_user_groups(group_id);

CREATE INDEX auth_user_groups_user_id_idx ON recon.auth_user_groups(user_id);

CREATE INDEX auth_user_user_permissions_permission_id_idx ON recon.auth_user_user_permissions(permission_id);

CREATE INDEX auth_user_user_permissions_user_id_idx ON recon.auth_user_user_permissions(user_id);

CREATE INDEX auth_user_username_username_idx ON recon.auth_user(username varchar_pattern_ops);

CREATE INDEX django_admin_log_content_type_id_idx ON recon.django_admin_log(content_type_id);

CREATE INDEX django_admin_log_user_id_idx ON recon.django_admin_log(user_id);

CREATE INDEX django_session_expire_date_idx ON recon.django_session(expire_date);

CREATE INDEX django_session_session_key_session_key_idx ON recon.django_session(session_key varchar_pattern_ops);

CREATE INDEX file_upload_user_id_idx ON recon.file_upload(user_id);

/* catch */
CREATE INDEX catch_eez_id_idx ON recon.catch(eez_id);

CREATE INDEX catch_nafo_division_id_idx ON recon.catch(nafo_division_id);

CREATE INDEX catch_reference_id_idx ON recon.catch(reference_id);

CREATE INDEX catch_fishing_entity_id_idx ON recon.catch(fishing_entity_id);

CREATE INDEX catch_original_country_fishing_id_idx ON recon.catch(original_country_fishing_id);

CREATE INDEX catch_original_fao_name_id_idx ON recon.catch(original_fao_name_id);

CREATE INDEX catch_sector_type_id_idx ON recon.catch(sector_type_id);

CREATE INDEX catch_fao_area_id_idx ON recon.catch(fao_area_id);

CREATE INDEX catch_catch_type_id_idx ON recon.catch(catch_type_id);

CREATE INDEX catch_taxon_key_idx ON recon.catch(taxon_key);

CREATE INDEX catch_original_taxon_name_id_idx ON recon.catch(original_taxon_name_id);

CREATE INDEX catch_ices_area_id_idx ON recon.catch(ices_area_id);

CREATE UNIQUE INDEX catch_raw_catch_id_idx ON recon.catch(raw_catch_id);

CREATE INDEX catch_amount_negative_idx ON recon.catch(id)
WHERE amount <= 0;

/* raw_catch */
CREATE INDEX raw_catch_source_file_id_idx ON recon.raw_catch(source_file_id);

CREATE INDEX raw_catch_user_id_idx ON recon.raw_catch(user_id);

CREATE INDEX raw_catch_fishing_entity_id_idx ON recon.raw_catch(fishing_entity_id);

CREATE INDEX raw_catch_eez_id_idx ON recon.raw_catch(eez_id);

CREATE INDEX raw_catch_fao_area_id_idx ON recon.raw_catch(fao_area_id);

CREATE INDEX raw_catch_year_idx ON recon.raw_catch(year);

CREATE INDEX raw_catch_taxon_key_idx ON recon.raw_catch(taxon_key);

CREATE INDEX raw_catch_reference_id_idx ON recon.raw_catch(reference_id);

CREATE INDEX raw_catch_required_field_idx ON recon.raw_catch(id) WHERE (fishing_entity || eez || fao_area || layer || sector || catch_type || reporting_status || "year" || amount || input_type) IS NULL;

CREATE INDEX raw_catch_taxon_name_is_null_idx ON recon.raw_catch(taxon_key) WHERE taxon_name IS NULL;

CREATE INDEX raw_catch_lookup_mismatch_idx ON recon.raw_catch(id) 
WHERE 0 = ANY(ARRAY[taxon_key, 
                     catch_type_id,
                     reporting_status_id,
                     fishing_entity_id, 
                     fao_area_id, 
                     sector_type_id, 
                     coalesce(input_type_id, -1), 
                     coalesce(reference_id, -1)]) 	
    OR eez_id IS NULL;

CREATE INDEX raw_catch_input_type_1_reporting_status_1_idx ON recon.raw_catch(id)
WHERE coalesce(input_type_id, 0) = 1 AND reporting_status_id = 1;

CREATE INDEX raw_catch_input_type_ne_1_reporting_status_2_idx ON recon.raw_catch(id)
WHERE coalesce(input_type_id, 0) != 1 AND reporting_status_id = 2;

CREATE INDEX raw_catch_amount_negative_idx ON recon.raw_catch(id)
WHERE amount <= 0;

CREATE INDEX raw_catch_peru_amount_greater_than_threshold_idx ON recon.raw_catch(id) WHERE amount > 15e6 AND eez_id IS NOT DISTINCT FROM 604;

CREATE INDEX raw_catch_amount_greater_than_threshold_idx ON recon.raw_catch(id) WHERE amount > 5e6 AND eez_id IS DISTINCT FROM 604;

CREATE INDEX raw_catch_taxon_key_amount_idx ON recon.raw_catch(taxon_key, amount);

/* raw layer3 catch data */
CREATE INDEX data_raw_layer3_taxon_key_idx ON recon.data_raw_layer3(taxon_key);
