-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2015. Máj 05. 03:44
-- Kiszolgáló verziója: 5.6.24
-- PHP verzió: 5.5.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Adatbázis: `info2`
--
CREATE DATABASE IF NOT EXISTS `info2` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `info2`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `asignal`
--

DROP TABLE IF EXISTS `asignal`;
CREATE TABLE IF NOT EXISTS `asignal` (
  `ID` int(11) NOT NULL,
  `Name` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  `Max` float NOT NULL,
  `Min` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- TÁBLA KAPCSOLATAI `asignal`:
--

--
-- A tábla adatainak kiíratása `asignal`
--

INSERT INTO `asignal` (`ID`, `Name`, `Max`, `Min`) VALUES
(2, 'Légnyomás', 3.5, 1),
(3, 'Fényerő', 500, 0),
(4, 'Páratart.', 100, 0),
(5, 'Hőmérséklet', 120, -40),
(7, 'CO2szint', 20, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `buildings`
--

DROP TABLE IF EXISTS `buildings`;
CREATE TABLE IF NOT EXISTS `buildings` (
  `ID` int(11) NOT NULL,
  `Name` varchar(10) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Adress` varchar(50) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Space` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- TÁBLA KAPCSOLATAI `buildings`:
--

--
-- A tábla adatainak kiíratása `buildings`
--

INSERT INTO `buildings` (`ID`, `Name`, `Adress`, `Space`) VALUES
(1, 'A', '8333 Gárdonyi utca 4.', 500),
(2, 'B', '8333 Gárdonyi utca 3.', 300),
(3, 'G', '1004 Ipar u. 8.', 400),
(4, 'H', '1004 Ipar u. 9.', 350);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `msignal`
--

DROP TABLE IF EXISTS `msignal`;
CREATE TABLE IF NOT EXISTS `msignal` (
  `ID` int(11) NOT NULL,
  `BID` int(11) NOT NULL,
  `RID` int(11) NOT NULL,
  `SID` int(11) NOT NULL,
  `Timepoint` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Data` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- TÁBLA KAPCSOLATAI `msignal`:
--   `BID`
--       `buildings` -> `ID`
--   `RID`
--       `room` -> `ID`
--   `SID`
--       `asignal` -> `ID`
--

--
-- A tábla adatainak kiíratása `msignal`
--

INSERT INTO `msignal` (`ID`, `BID`, `RID`, `SID`, `Timepoint`, `Data`) VALUES
(8, 1, 2, 2, '2015-05-04 13:05:39', 1.5),
(9, 1, 2, 3, '2015-05-04 13:05:39', 230),
(10, 1, 2, 4, '2015-05-04 13:05:39', 30),
(11, 2, 1, 4, '2015-05-04 13:05:39', 40),
(12, 3, 2, 3, '2015-05-04 13:05:39', 300),
(13, 4, 3, 2, '2015-05-04 13:05:39', 1.2),
(14, 3, 4, 1, '2015-05-04 13:05:39', 20),
(15, 1, 3, 5, '2015-04-01 04:21:32', 50),
(17, 2, 3, 7, '2015-05-04 12:09:31', 12),
(19, 1, 3, 5, '2015-05-05 04:33:15', 20),
(20, 1, 3, 2, '2015-04-05 04:33:15', 1.4),
(21, 2, 2, 3, '2015-05-05 04:33:35', 200),
(22, 3, 1, 4, '2015-03-05 05:33:15', 50),
(23, 4, 4, 5, '2015-05-05 05:33:15', 21),
(24, 3, 3, 4, '2015-06-05 04:23:15', 50),
(25, 1, 3, 3, '2015-05-05 04:13:15', 250),
(26, 1, 3, 2, '2015-07-05 04:03:14', 1.3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `ID` int(11) NOT NULL,
  `Floor` int(11) DEFAULT NULL,
  `Door` int(11) DEFAULT NULL,
  `Space` int(11) DEFAULT NULL,
  `Window` float DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- TÁBLA KAPCSOLATAI `room`:
--

--
-- A tábla adatainak kiíratása `room`
--

INSERT INTO `room` (`ID`, `Floor`, `Door`, `Space`, `Window`) VALUES
(1, 0, 4, 20, 1),
(2, 0, 1, 30, 1),
(3, 1, 2, 25, 2),
(4, 2, 3, 15, 1),
(5, 3, 4, 10, 2);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `asignal`
--
ALTER TABLE `asignal`
  ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `ID` (`ID`);

--
-- A tábla indexei `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `ID` (`ID`), ADD UNIQUE KEY `Name` (`Name`);

--
-- A tábla indexei `msignal`
--
ALTER TABLE `msignal`
  ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `ID` (`ID`);

--
-- A tábla indexei `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `ID` (`ID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `asignal`
--
ALTER TABLE `asignal`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT a táblához `buildings`
--
ALTER TABLE `buildings`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT a táblához `msignal`
--
ALTER TABLE `msignal`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT a táblához `room`
--
ALTER TABLE `room`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
