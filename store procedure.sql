CREATE DEFINER=`root`@`localhost` PROCEDURE `change_sport`(in playerID_changed integer)
BEGIN
	declare player_count integer;
	SELECT count(*) into player_count 
    FROM player
    WHERE  playerID = playerID_changed;
	If (player_count > 0) then 
		UPDATE player
		SET sports = (
			SELECT GROUP_CONCAT(distinct sportName SEPARATOR ' || ') 
			FROM playersport
			WHERE playerID = playerID_changed)
		WHERE playerID = playerID_changed;
	END IF;
END