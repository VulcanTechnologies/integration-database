CREATE TABLE catalog.fao_rfb_catalog(
  rfb_fid smallint primary key,
  raw_data xml,
  raw_data_hash bigint not null,
  last_modified timestamp not null default now()
);

CREATE TABLE catalog.fao_country_membership_catalog(
  country_iso3 char(3) primary key,
  raw_data xml,
  raw_data_hash bigint not null,
  last_modified timestamp not null default now()
);

CREATE TABLE catalog.fao_rfmo_membership_catalog(
  rfmo_id int not null,
  country_iso3 char(3) not null,
  country_name varchar(256) not null,
  country_facp_url text,
  last_modified timestamp not null default now()
);

CREATE TABLE catalog.taxon_catalog(
  taxon_key int PRIMARY KEY,
  taxon_name varchar(255) NOT NULL,
  common_name varchar(255),
  type varchar(255),
  lineage ltree,
  genus varchar(255),
  species varchar(255),
  comments_names text,
  is_retired boolean not null default false,
  taxon_group_id int,
  taxon_level_id int,
  functional_group_id smallint NOT NULL,
  commercial_group_id smallint NOT NULL,
  commercial smallint,
  isscaap_id int,
  cell_id int,
  super_target smallint,
  fb_spec_code int,
  slb_spec_code int,  
  cla_code int,
  ord_code int,
  fam_code int,
  gen_code int,
  spe_code int,
  slb_cla_code int,
  slb_ord_code int,
  slb_fam_code int,
  slb_gen_code int,
  is_use boolean,
  is_taxa_used boolean,
  is_mariculture_only boolean,
  is_baltic_only boolean NOT NULL default false,
  sl_max float,
  slb_lmax_type varchar(10),	  
  sl_max2 float,
  comments_sl_max text,
  tl float,
  se_tl float,
  comments_tl text,
  lat_north int,
  lat_south int,                                        
  min_depth int,
  max_depth int,
  s_lin_f float,
  win_f float,
  k float,
  theta float,
  a float,
  b float,
  comments_growth text,
  has_habitat_index boolean NOT NULL,
  has_map boolean NOT NULL,
  map_year smallint,
  resilience text,
  vulnerability	text,
  updated_by varchar(255),
  date_updated date,
  x_min int,
  x_max int,
  y_min int,
  y_max int,    
  data_source_x text,
  data_source_y text,
  data_source_z text
);

CREATE TABLE catalog.geonames_country(
  iso char(2) primary key,
  iso3 char(3) not null,	
  iso_numeric int not null,
  fips char(2),	
  country varchar(256) not null,
  capital varchar(256),  
  area_sqkm	float,
  population float,
  continent_code char(2),
  tld varchar(20), 
  currency_code	varchar(10),
  currency_name	varchar(256),
  phone	varchar(20),
  postal_code_format varchar(256),	
  postal_code_regex varchar(256),	
  languages	varchar(256),
  geo_name_id int,	
  neighbours varchar(256),
  equivalent_fips_code varchar(20)
);
