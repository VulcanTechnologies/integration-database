﻿ALTER TABLE distribution.taxon_habitat 
ADD COLUMN water_column_position character varying(255),
ADD COLUMN depth_comments text,
ADD COLUMN general_comments text;

SELECT admin.grant_access();