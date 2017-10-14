<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<link rel="shortcut icon" href="favicon.ico">
	<?php
	include('metahead.php');
	?>
</head>
<body>
<?php
include('basichead.php');
?>
				<h2>Épületüzemeltetés</h2>
				<p>
					Egy épületüzemeltetéssel foglalkozó cég elhatározta, hogy az általa felügyelt irodaházak hatékonyabb
					üzemeltetése céljából összegyűjti a különböző épületekben lehelyezett érzékelők jeleit és egy
					egységes elemző rendszert készít. A szobákban különböző érzékelő lehet elhelyezve (hőmérséklet,
					páratartalom, kívánt hőmérséklet, külső redőny állása, stb.) ezen érzékelők épületenként és
					szobánként sem egységesek, viszont közös jellemzőjük, hogy float adattípussal leírhatók és a
					méréshez egy időbélyeg is tartozik. A nyilvántartó rendszerben lehetőséget kell biztosítani több
					épület kezelésére is, egy épület több szobából állhat. Az alábbi alapadatokat kell nyilvántartásba
					venni: épület (név, cím, alapterület), szoba (emelet, ajtó, alapterület, ablakfelület nagysága),
					mérhető jel (név, minimum érték, maximum érték), mért jel (időpont, érték).
					A feladat megtervezni és megvalósítani egy webes rendszert, amely az alábbi követelményeknek felel
					meg.
				</p>
		<ul>
			<li>
			A rendszer nyitóoldala egy statikus HTML oldal, amelytől a különböző megvalósítandó
			funkciók érhetőek el linkek segítségével.
			</li>
			<li>
			Készítsen egy nyitóoldalról elérhető oldalt, mely kilistázza rendszerben rögzített mérhető
			jelek listáját táblázatosan.
			</li>
			<li>
			Egy jeltípusra kattintva az előző oldalon, betöltődik egy oldal, mely segítségével
			módosíthatók a jeltípus jellemzői. Itt valósítsa meg a törlés funkciót is!
			</li>
			<li>
			Készítsen egy nyitóoldalról elérhető oldalt, mely a mért jelek listázására szolgál. Keresés
			során ki kell választani az épületet és egy idő intervallumot. A mért értékeket szoba, jeltípus
			és idő szerint rendezve adja vissza táblázatosan!
			</li>
			<li>
			Minden oldalon legyen egységes fejléc és lábléc. A fejlécben menüként szerepeljen a többi
			megvalósított oldal elérhetősége. A láblécben szerepeljen a feladatot elkészítő hallgató és
			laborvezetőjének adatai.
			</li>
			<li>
			Beadandó az elkészített program (az adatbázist létrehozó és minta adatokkal feltöltő script, a
			html, php és css fájlok) és a dokumentáció hozzá (adatbázis terv, rendszerterv, funkcionális
			leírás).
			</li>
			<li>
			Az adatbázis az adatokat normalizált formában tárolja.
			</li>
		</ul>
<?php
include('basicfoot.php');
?>

</body>
</html>

