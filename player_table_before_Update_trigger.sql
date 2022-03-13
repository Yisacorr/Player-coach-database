CREATE DEFINER=`root`@`localhost` TRIGGER `player_BEFORE_UPDATE` BEFORE UPDATE ON `player` FOR EACH ROW BEGIN
	if (new.sports != old.sports or old.sports is null) then
		set new.sports= changeSport(new.playerID);
	end if;
END