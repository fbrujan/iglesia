Select a.*, i.id_iglesia, ts.id_tipo_servicio, p.nombres, p.apellidos
		, p.nro_documento_identidad, ts.tipo_servicio, s.servicio, s.fecha_inicio
		, s.fecha_fin, i.iglesia
from asistencia a
            inner join personas p on a.id_persona = p.id_persona
            inner join servicios s on a.id_servicio = s.id_servicio
            inner join iglesias i on s.id_iglesia = i.id_iglesia
            inner join tipo_servicio ts on s.id_tipo_servicio = ts.id_tipo_servicio