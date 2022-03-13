CREATE DEFINER=`root`@`localhost` TRIGGER `playersport_AFTER_DELETE` AFTER DELETE ON `playersport` FOR EACH ROW BEGIN
	call change_sport (old.playerID);
END