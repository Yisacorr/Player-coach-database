CREATE DEFINER=`root`@`localhost` TRIGGER `playersport_AFTER_INSERT` AFTER INSERT ON `playersport` FOR EACH ROW BEGIN
	update player set sports = changeSport(new.playerID)
                WHERE playerID= new.playerID;
END