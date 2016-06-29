TRUNCATE TABLE admin.datatransfer_tables;

INSERT INTO admin.datatransfer_tables(source_database_name, source_table_name, source_select_clause, source_where_clause, target_schema_name, target_table_name, target_excluded_columns)
VALUES
 ('Merlin', 'Log_Import_Raw', '*', NULL, 'allocation', 'log_import_raw', '{}'::TEXT[]) 
,('Merlin', 'DataRaw_Layer3', '*', NULL, 'allocation', 'data_raw_layer3', '{}'::TEXT[])
;

INSERT INTO admin.datatransfer_tables(source_database_name, source_table_name, source_select_clause, source_where_clause, target_schema_name, target_table_name, target_excluded_columns)
VALUES
 ('sau_geo', 'geo.simple_area_cell_assignment_raw', '*', NULL, 'geo', 'simple_area_cell_assignment_raw', '{}'::TEXT[]) 
,('sau_geo', 'geo.cell', '*', NULL, 'geo', 'cell', '{}'::TEXT[])
;
