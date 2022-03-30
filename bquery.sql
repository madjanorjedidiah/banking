update public.bnks as bks
set longitude = bk.long,
latitude = bk.lat
from (
	SELECT id, ST_X (ST_Transform (geom, 4326)) AS long,
	ST_Y (ST_Transform (geom, 4326)) AS lat
	FROM public.bnks
) as bk
where bks.id = bk.id


SELECT UpdateGeometrySRID('bnks','geom',4326);