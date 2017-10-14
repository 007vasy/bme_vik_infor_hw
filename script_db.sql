//epulet

CREATE TABLE `info2`.`Buildings` ( `ID` INT NOT NULL AUTO_INCREMENT , `Name` VARCHAR(10) NULL DEFAULT NULL , `Adress` VARCHAR(50) NULL DEFAULT NULL , `Space` INT NULL DEFAULT NULL , PRIMARY KEY (`ID`) ) ENGINE = InnoDB;

INSERT INTO `info2`.`buildings` (`ID`, `Name`, `Adress`, `Space`) VALUES (NULL, 'A', '8333 Gárdonyi utca 4.', '500')

//szoba

CREATE TABLE `info2`.`Room` ( `ID` INT NOT NULL AUTO_INCREMENT , `Floor` INT NULL DEFAULT NULL , `Door` INT NULL DEFAULT NULL , `Space` INT NULL DEFAULT NULL , `Window` INT NULL DEFAULT NULL , PRIMARY KEY (`ID`) ) ENGINE = InnoDB;

//mérhető jel



CREATE TABLE `info2`.`asingnal` ( `ID` INT NOT NULL AUTO_INCREMENT , `Name` VARCHAR(20) NOT NULL , `Max` INT NOT NULL , `Min` INT NOT NULL , PRIMARY KEY (`ID`) ) ENGINE = InnoDB;

//mértjel

CREATE TABLE `info2`.`msignal` ( `ID` INT NOT NULL AUTO_INCREMENT , `BID` INT NOT NULL , `RID` INT NOT NULL , `SID` INT NOT NULL , `Timepoint` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP , `Data` FLOAT NOT NULL , PRIMARY KEY (`ID`) ) ENGINE = InnoDB CHARACTER SET utf8 COLLATE utf8_hungarian_ci;


INSERT INTO `info2`.`msignal` (`ID`, `BID`, `RID`, `SID`, `Timepoint`, `Data`) VALUES (NULL, '1', '2', '2', CURRENT_TIMESTAMP, '1.5');
INSERT INTO `info2`.`msignal` (`ID`, `BID`, `RID`, `SID`, `Timepoint`, `Data`) VALUES (NULL, '1', '2', '3', CURRENT_TIMESTAMP, '230');
INSERT INTO `info2`.`msignal` (`ID`, `BID`, `RID`, `SID`, `Timepoint`, `Data`) VALUES (NULL, '1', '2', '4', CURRENT_TIMESTAMP, '30');
INSERT INTO `info2`.`msignal` (`ID`, `BID`, `RID`, `SID`, `Timepoint`, `Data`) VALUES (NULL, '2', '1', '4', CURRENT_TIMESTAMP, '40');
INSERT INTO `info2`.`msignal` (`ID`, `BID`, `RID`, `SID`, `Timepoint`, `Data`) VALUES (NULL, '3', '2', '3', CURRENT_TIMESTAMP, '300');
INSERT INTO `info2`.`msignal` (`ID`, `BID`, `RID`, `SID`, `Timepoint`, `Data`) VALUES (NULL, '4', '3', '2', CURRENT_TIMESTAMP, '1.2');
INSERT INTO `info2`.`msignal` (`ID`, `BID`, `RID`, `SID`, `Timepoint`, `Data`) VALUES (NULL, '3', '4', '1', CURRENT_TIMESTAMP, '20');