TYPE=VIEW
query=select `u`.`id` AS `uid`,`u`.`upn` AS `upn`,`u`.`description` AS `promo`,count(`cslmanager`.`workshop_attempt`.`id`) AS `count`,date_format(`cslmanager`.`workshop_attempt`.`fin`,\'%M\') AS `month`,month(`cslmanager`.`workshop_attempt`.`fin`) AS `nmonth`,year(`cslmanager`.`workshop_attempt`.`fin`) AS `year` from (`cslmanager`.`workshop_attempt` join `cslmanager`.`user` `u`) where ((`cslmanager`.`workshop_attempt`.`fin` is not null) and (`cslmanager`.`workshop_attempt`.`id_user` = `u`.`id`)) group by `u`.`upn`,`u`.`id`,date_format(`cslmanager`.`workshop_attempt`.`fin`,\'%M\'),year(`cslmanager`.`workshop_attempt`.`fin`) order by `year`,month(`cslmanager`.`workshop_attempt`.`fin`)
md5=fa5b6619a8be689b2b9754f76e18018b
updatable=0
algorithm=0
definer_user=root
definer_host=localhost
suid=1
with_check_option=0
timestamp=2020-02-04 09:47:10
create-version=1
source=select `u`.`id` AS `uid`,`u`.`upn` AS `upn`,`u`.`description` AS `promo`,count(`workshop_attempt`.`id`) AS `count`,date_format(`workshop_attempt`.`fin`,\'%M\') AS `month`,month(`workshop_attempt`.`fin`) AS `nmonth`,year(`workshop_attempt`.`fin`) AS `year` from (`workshop_attempt` join `user` `u`) where ((`workshop_attempt`.`fin` is not null) and (`workshop_attempt`.`id_user` = `u`.`id`)) group by `u`.`upn`,`u`.`id`,date_format(`workshop_attempt`.`fin`,\'%M\'),year(`workshop_attempt`.`fin`) order by `year`,month(`workshop_attempt`.`fin`)
client_cs_name=utf8mb4
connection_cl_name=utf8mb4_general_ci
view_body_utf8=select `u`.`id` AS `uid`,`u`.`upn` AS `upn`,`u`.`description` AS `promo`,count(`cslmanager`.`workshop_attempt`.`id`) AS `count`,date_format(`cslmanager`.`workshop_attempt`.`fin`,\'%M\') AS `month`,month(`cslmanager`.`workshop_attempt`.`fin`) AS `nmonth`,year(`cslmanager`.`workshop_attempt`.`fin`) AS `year` from (`cslmanager`.`workshop_attempt` join `cslmanager`.`user` `u`) where ((`cslmanager`.`workshop_attempt`.`fin` is not null) and (`cslmanager`.`workshop_attempt`.`id_user` = `u`.`id`)) group by `u`.`upn`,`u`.`id`,date_format(`cslmanager`.`workshop_attempt`.`fin`,\'%M\'),year(`cslmanager`.`workshop_attempt`.`fin`) order by `year`,month(`cslmanager`.`workshop_attempt`.`fin`)
