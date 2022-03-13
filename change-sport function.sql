CREATE DEFINER=`root`@`localhost` FUNCTION `changeSport`(playerID_changed int) RETURNS varchar(1000) CHARSET utf8mb4
    READS SQL DATA
BEGIN
	declare player_count integer;
	SELECT count(*) into player_count
    FROM  player WHERE  playerID = playerID_changed;
    IF (player_count > 0) then
		return   (SELECT GROUP_CONCAT(distinct sportName ORDER BY sportName asc SEPARATOR ' | ')
		FROM   playersport WHERE playerID = playerID_changed);
	else
		return '';
    END IF;
END