TYPE=VIEW
query=select `i`.`iglesia` AS `iglesia`,`s`.`servicio` AS `servicio`,`s`.`id_servicio` AS `id_servicio`,date_format(`a`.`fecha`,\'%Y%m\') AS `mes`,`a`.`fecha` AS `fecha`,`pc`.`clasificacion` AS `clasificacion`,count(1) AS `asistencia` from (((`iglesias`.`asistencia` `a` join `iglesias`.`personas_clasificacion` `pc` on((`a`.`id_clasificacion` = `pc`.`id_clasificacion`))) join `iglesias`.`servicios` `s` on((`a`.`id_servicio` = `s`.`id_servicio`))) join `iglesias`.`iglesias` `i` on((`s`.`id_iglesia` = `i`.`id_iglesia`))) group by `i`.`iglesia`,`s`.`servicio`,`s`.`id_servicio`,date_format(`a`.`fecha`,\'%Y%m\'),`a`.`fecha`,`pc`.`clasificacion` order by `i`.`iglesia`,`s`.`servicio`,date_format(`a`.`fecha`,\'%Y%m\'),`a`.`fecha`,`pc`.`clasificacion`
md5=98b92743dc51b155daaff880838f7ad6
updatable=0
algorithm=0
definer_user=root
definer_host=%
suid=1
with_check_option=0
timestamp=2019-05-15 13:15:49
create-version=1
source=select `i`.`iglesia` AS `iglesia`,`s`.`servicio` AS `servicio`,`s`.`id_servicio` AS `id_servicio`,date_format(`a`.`fecha`,\'%Y%m\') AS `mes`,`a`.`fecha` AS `fecha`,`pc`.`clasificacion` AS `clasificacion`,count(1) AS `asistencia` from (((`asistencia` `a` join `personas_clasificacion` `pc` on(`a`.`id_clasificacion` = `pc`.`id_clasificacion`)) join `servicios` `s` on(`a`.`id_servicio` = `s`.`id_servicio`)) join `iglesias` `i` on(`s`.`id_iglesia` = `i`.`id_iglesia`)) group by `i`.`iglesia`,`s`.`servicio`,`s`.`id_servicio`,date_format(`a`.`fecha`,\'%Y%m\'),`a`.`fecha`,`pc`.`clasificacion` order by `i`.`iglesia`,`s`.`servicio`,date_format(`a`.`fecha`,\'%Y%m\'),`a`.`fecha`,`pc`.`clasificacion`
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `i`.`iglesia` AS `iglesia`,`s`.`servicio` AS `servicio`,`s`.`id_servicio` AS `id_servicio`,date_format(`a`.`fecha`,\'%Y%m\') AS `mes`,`a`.`fecha` AS `fecha`,`pc`.`clasificacion` AS `clasificacion`,count(1) AS `asistencia` from (((`iglesias`.`asistencia` `a` join `iglesias`.`personas_clasificacion` `pc` on((`a`.`id_clasificacion` = `pc`.`id_clasificacion`))) join `iglesias`.`servicios` `s` on((`a`.`id_servicio` = `s`.`id_servicio`))) join `iglesias`.`iglesias` `i` on((`s`.`id_iglesia` = `i`.`id_iglesia`))) group by `i`.`iglesia`,`s`.`servicio`,`s`.`id_servicio`,date_format(`a`.`fecha`,\'%Y%m\'),`a`.`fecha`,`pc`.`clasificacion` order by `i`.`iglesia`,`s`.`servicio`,date_format(`a`.`fecha`,\'%Y%m\'),`a`.`fecha`,`pc`.`clasificacion`
