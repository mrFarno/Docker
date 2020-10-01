TYPE=VIEW
query=select `u`.`id` AS `uid`,`u`.`upn` AS `upn`,`ws`.`id` AS `pid`,`ws`.`full_label` AS `label`,`ws`.`count_to_validate` AS `count_to_validate`,count(`cslmanager`.`workshop_attempt`.`id`) AS `count` from ((`cslmanager`.`user` `u` join `cslmanager`.`workshop` `ws`) join `cslmanager`.`workshop_attempt`) where ((`cslmanager`.`workshop_attempt`.`id_workshop` = `ws`.`id`) and (`cslmanager`.`workshop_attempt`.`id_user` = `u`.`id`)) group by `u`.`id`,`ws`.`id` having (`count` > `ws`.`count_to_validate`) order by `u`.`upn`,`ws`.`label`
md5=ac6c35c8584a81ae434faa20a27d369e
updatable=0
algorithm=0
definer_user=root
definer_host=localhost
suid=1
with_check_option=0
timestamp=2020-02-04 09:47:10
create-version=1
source=select `u`.`id` AS `uid`,`u`.`upn` AS `upn`,`ws`.`id` AS `pid`,`ws`.`full_label` AS `label`,`ws`.`count_to_validate` AS `count_to_validate`,count(`workshop_attempt`.`id`) AS `count` from ((`user` `u` join `workshop` `ws`) join `workshop_attempt`) where ((`workshop_attempt`.`id_workshop` = `ws`.`id`) and (`workshop_attempt`.`id_user` = `u`.`id`)) group by `u`.`id`,`ws`.`id` having (`count` > `ws`.`count_to_validate`) order by `u`.`upn`,`ws`.`label`
client_cs_name=utf8mb4
connection_cl_name=utf8mb4_general_ci
view_body_utf8=select `u`.`id` AS `uid`,`u`.`upn` AS `upn`,`ws`.`id` AS `pid`,`ws`.`full_label` AS `label`,`ws`.`count_to_validate` AS `count_to_validate`,count(`cslmanager`.`workshop_attempt`.`id`) AS `count` from ((`cslmanager`.`user` `u` join `cslmanager`.`workshop` `ws`) join `cslmanager`.`workshop_attempt`) where ((`cslmanager`.`workshop_attempt`.`id_workshop` = `ws`.`id`) and (`cslmanager`.`workshop_attempt`.`id_user` = `u`.`id`)) group by `u`.`id`,`ws`.`id` having (`count` > `ws`.`count_to_validate`) order by `u`.`upn`,`ws`.`label`
