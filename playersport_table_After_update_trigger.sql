CREATE DEFINER=`root`@`localhost` TRIGGER `playersport_AFTER_UPDATE` AFTER UPDATE ON `playersport` FOR EACH ROW BEGIN
	if (old.playerID != new.playerID) then
		call change_sport (old.playerID);
	end if;
    call change_sport (new.playerID);
END