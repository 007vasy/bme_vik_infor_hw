-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2015. Máj 04. 15:07
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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `asingnal`
--
-- Létrehozva: 2015. Máj 04. 12:59
--

CREATE TABLE IF NOT EXISTS `asingnal` (
  `ID` int(11) NOT NULL,
  `Name` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  `Max` float NOT NULL,
  `Min` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- TÁBLA KAPCSOLATAI `asingnal`:
--

--
-- A tábla adatainak kiíratása `asingnal`
--

INSERT INTO `asingnal` (`ID`, `Name`, `Max`, `Min`) VALUES
(1, 'Hőmérséklet', -40, 100),
(2, 'Légnyomás', 1, 2),
(3, 'Fényerő', 0, 400),
(4, 'Páratart.', 0, 100);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `buildings`
--
-- Létrehozva: 2015. Máj 04. 12:59
--

CREATE TABLE IF NOT EXISTS `buildings` (
  `ID` int(11) NOT NULL,
  `Name` varchar(10) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Adress` varchar(50) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Space` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

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
-- Létrehozva: 2015. Máj 04. 13:04
--

CREATE TABLE IF NOT EXISTS `msignal` (
  `ID` int(11) NOT NULL,
  `BID` int(11) NOT NULL,
  `RID` int(11) NOT NULL,
  `SID` int(11) NOT NULL,
  `Timepoint` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Data` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- TÁBLA KAPCSOLATAI `msignal`:
--   `BID`
--       `buildings` -> `ID`
--   `RID`
--       `room` -> `ID`
--   `SID`
--       `asingnal` -> `ID`
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
(14, 3, 4, 1, '2015-05-04 13:05:39', 20);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `room`
--
-- Létrehozva: 2015. Máj 04. 12:59
--

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
-- A tábla indexei `asingnal`
--
ALTER TABLE `asingnal`
  ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `ID` (`ID`);

--
-- A tábla indexei `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `ID` (`ID`);

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
-- AUTO_INCREMENT a táblához `asingnal`
--
ALTER TABLE `asingnal`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT a táblához `buildings`
--
ALTER TABLE `buildings`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT a táblához `msignal`
--
ALTER TABLE `msignal`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT a táblához `room`
--
ALTER TABLE `room`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
