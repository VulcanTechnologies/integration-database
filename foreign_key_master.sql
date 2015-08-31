-- master.taxon
ALTER TABLE master.taxon ADD CONSTRAINT commercial_group_id_fk
FOREIGN KEY (commercial_group_id) REFERENCES master.commercial_groups(commercial_group_id) ON DELETE CASCADE;

ALTER TABLE master.taxon ADD CONSTRAINT functional_group_id_fk
FOREIGN KEY (functional_group_id) REFERENCES master.functional_groups(functional_group_id) ON DELETE CASCADE;

ALTER TABLE master.taxon ADD CONSTRAINT taxon_group_id_fk
FOREIGN KEY (taxon_group_id) REFERENCES master.taxon_group(taxon_group_id) ON DELETE CASCADE;

ALTER TABLE master.taxon ADD CONSTRAINT taxon_level_id_fk
FOREIGN KEY (taxon_level_id) REFERENCES master.taxon_level(taxon_level_id) ON DELETE CASCADE;

-- master.geo_entity
ALTER TABLE master.geo_entity ADD CONSTRAINT jurisdiction_id_fk
FOREIGN KEY (jurisdiction_id) REFERENCES master.jurisdiction(jurisdiction_id) ON DELETE CASCADE;

ALTER TABLE master.geo_entity ADD CONSTRAINT admin_geo_entity_id_fk
FOREIGN KEY (admin_geo_entity_id) REFERENCES master.geo_entity(geo_entity_id) ON DELETE CASCADE;

-- master.sub_geo_entity 
ALTER TABLE master.sub_geo_entity ADD CONSTRAINT geo_entity_id_fk
FOREIGN KEY (geo_entity_id) REFERENCES master.geo_entity(geo_entity_id) ON DELETE CASCADE;

-- master.mariculture_sub_entity
ALTER TABLE master.mariculture_sub_entity ADD CONSTRAINT mariculture_entity_id_fk
FOREIGN KEY (mariculture_entity_id) REFERENCES master.mariculture_entity(mariculture_entity_id) ON DELETE CASCADE;

-- master.eez 
ALTER TABLE master.eez ADD CONSTRAINT geo_entity_id_fk
FOREIGN KEY (geo_entity_id) REFERENCES master.geo_entity(geo_entity_id) ON DELETE CASCADE;

-- master.fishing_entity 
ALTER TABLE master.fishing_entity ADD CONSTRAINT geo_entity_id_fk
FOREIGN KEY (geo_entity_id) REFERENCES master.geo_entity(geo_entity_id) ON DELETE CASCADE;

-- master.access_agreement
ALTER TABLE master.access_agreement ADD CONSTRAINT access_type_id_fk
FOREIGN KEY (access_type_id) REFERENCES master.access_type(id) ON DELETE CASCADE;

ALTER TABLE master.access_agreement ADD CONSTRAINT agreement_type_id_fk
FOREIGN KEY (agreement_type_id) REFERENCES master.agreement_type(id) ON DELETE CASCADE;
