use project3;

create table Skill (
skillName varchar(20) not null primary key);

--

create table Coach (
coachID int not null primary key,
coachLastName varchar(20) not null,
coachFirstName varchar(20) not null,
coachEmail varchar(50) not null
);
insert into coach (coachID, coachLastName, coachFirstName, coachEmail)
values("4569", "last", "first", "eamil@eamil"),("8899", "lastn", "firstn", "emil@eamil");
--

create table CoachSkill (
skillName varchar(20) not null,
coachID int not null,
primary key (skillName, coachID),
constraint CoachSkill_FK1 foreign key (skillName) references Skill(skillName),
constraint CoachSkill_FK2 foreign key (coachID) references Coach(coachID)
);

--

create table HeadCoach (
coachID int not null,
headlineSkill varchar(20) not null,
primary key (coachID, headlineSkill),
constraint HC_FK1 foreign key(coachID) references Coach(coachID),
constraint HC_FK2 foreign key(coachID, headlineSkill) references CoachSkill(coachID, skillName)
);
--

create table AssistantCoach (
coachID int not null primary key,
assignedHC int not null,
constraint AC_FK1 foreign key(assignedHC) references HeadCoach(coachID)
);

--

create table Player (
playerID int not null primary key,
pLastName varchar(20) not null, 
pFirstName varchar(20) not null, 
playerEmail varchar(50) not null, 
dateofBirth varchar(10) not null, 
dateJoined varchar(10) not null,
sports varchar (1000) 
);

--
insert into player (playerID, pLastName, pFirstName, playerEmail, dateofBirth, dateJoined)
values ("129", "fdsfvff", "rfferfgh", "ccecewc@ffrftr", "12-23-2006", "12-23-2013"),
("126", "fds", "ffer", "cecewc@ffrf", "12-23-2001", "12-25-2020");



create table Sport (
sportName varchar(20) not null primary key);

insert into sport(sportName) values("basketball"),("soccer"),("football"),
("foot"),("tennis"),("cricket"),("bassball"),( "newsport"),("anotherSport"),("sportt"), ("rtry"), ("try");

--

create table SportCoaching(
coachID int not null,
sportName varchar(20) not null,
primary key (coachID, sportname),
constraint CoachSport_FK1 foreign key (coachID) references Coach(coachID),
constraint CoachSport_FK2 foreign key (sportname) references Sport(sportName)
);

insert into sportcoaching (coachID, sportName)
values("4569", "basketball"),("4569", "soccer"), ("4569", "football"),
("4569", "foot"),("8899", "tennis"), ("8899", "cricket"), ("8899","bassball"), 
("8899","newsport"),("8899","anotherSport"),("8899","sportt"), ("8899","rtry"), ("8899","try") ;
--

create table PlayerSport (
playerID int not null,
sportName varchar(20) not null,
coachID int not null,
primary key (playerID, sportname),
constraint PlayerSport_FK1 foreign key (playerID) references Player(playerID),
constraint PlayerSport_FK2 foreign key (sportname, coachID) references SportCoaching(sportname, coachID)
);
 
--


insert into playersport(playerID, sportName, coachID ) 
values 
("129", "sportt", "8899");
		
        
delete from playersport where playerID = 129 and sportName = "sportt"; 
--
update playersport set sportname = "sportt" where playerId = 126;

select *from player;