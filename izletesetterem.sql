-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Már 18. 13:32
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `izletesetterem`
--
CREATE DATABASE IF NOT EXISTS `izletesetterem` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `izletesetterem`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `etelek`
--

CREATE TABLE `etelek` (
  `id` int(11) NOT NULL,
  `ar` int(11) NOT NULL,
  `kategoria` varchar(191) NOT NULL,
  `leiras` varchar(191) NOT NULL,
  `nev` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `etelek`
--

INSERT INTO `etelek` (`id`, `ar`, `kategoria`, `leiras`, `nev`) VALUES
(1, 2500, 'Tésztás', 'Bolognese szósz,Béchamel mártás,Sajt', 'Lasagne Bolognese'),
(2, 2200, 'Tésztás', 'Guanciale vagy Pancetta, Tojás, Parmezán sajt', 'Spaghetti Carbonara'),
(3, 1900, 'Tésztás', 'Paradicsomszósz, Chili, Olívaolaj ', 'Penne all Arrabbiata'),
(4, 2400, 'Tésztás', 'Tortellini, Panna,Prosciutto ', 'Tortellini Panna e Prosciutto'),
(5, 1890, 'Tésztás', 'Fettuccine tészta,Parmezán sajt,Tejszín ', 'Fettuccine Alfredo'),
(6, 2800, 'Pizza', 'Paradicsomszósz,Friss mozzarella sajt,Friss bazsalikom ', 'Margherita Pizza'),
(7, 2900, 'Pizza', 'Paradicsomszósz,Mozzarella sajt,Pepperoni ', 'Pepperoni Pizza'),
(8, 3200, 'Pizza', 'Barbecue szósz,Mozzarella sajt,Főtt csirkehús,Friss koriander ', 'BBQ Chicken Pizza'),
(9, 3100, 'Pizza', 'Paradicsomszósz,Mozzarella sajt,Sonka,Gomba,Articsóka  ', 'Capricciosa Pizza'),
(10, 3500, 'Pizza', 'Paradicsomszósz,Mozzarella sajt,Sonka,Szalámi,Pepperoni,Chorizo  ', 'Meat Lovers Pizza'),
(11, 3600, 'Pizza', 'Paradicsomszósz,Mozzarella sajt,Friss paradicsomok,Paprika,Gomba,Articsóka szívek  ', 'Veggie Supreme Pizza'),
(12, 3200, 'Pizza', 'Vegán paradicsomszósz,Vegán mozzarella sajt,Friss paradicsomok,Friss bazsalikom  ', 'Vegan Margherita Pizza'),
(13, 1900, 'Ázisai', 'Rizstészta,Tofu,Szójaszósz,Tamarin paszta vagy tamarind szósz,Főtt vagy sült földimogyoró  ', 'Pad Thai tofuval és rizstésztával'),
(14, 1500, 'Ázisai', 'Zöldségek,Kókusztej,Curry fűszerkeverék,Chili ,Rizs  ', 'Vegán zöldséges curry kókusztejjel'),
(15, 2650, 'Amerikai konyha', 'Steak,Burgonya,Zöldbab ,Friss petrezselyem  ', 'Steak sült burgonyával és zöldbabokkal'),
(16, 2490, 'Gourmet étel', 'Sertésszelet,Bor ,Sárgarépa, Zöldség alaplé  ', 'Sertésszelet borral párolva és párolt zöldségekkel'),
(17, 2700, 'Gourmet étel', 'Lazac filé,Citromos mártás ,Édesburgonya, Friss zöldfűszerek  ', 'Lazac filé citromos mártással és sült édesburgonyával'),
(18, 2380, 'Gourmet étel', 'Garnélarák,Quinoa ,Gyümölcs , Friss zöldségek  ', 'Garnélarák és quinoa saláta'),
(19, 2090, 'Gyros', 'Pita kenyér,Tzatziki szósz ,Feta sajt , Gyros hús,  ', 'Gyros Tál'),
(20, 2100, 'Gyros', 'Pita kenyér,Tzatziki szósz ,Feta sajt , Gyros hús, Sajt  ', 'Sajtos Gyros Tál'),
(21, 2200, 'Gyros', 'Pita kenyér,Tzatziki szósz ,Feta sajt , Növényi húsalternatíva, Gyros fűszerkeverék, Hummusz  ', 'Vegán Gyros'),
(22, 3400, 'Ázisa', 'Rizspapír tekercsek,Főtt rizstészta,Friss zöldségek,Hús vagy tenger gyümölcsei,Szószok', 'Tavaszi tekercs');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalok`
--

CREATE TABLE `felhasznalok` (
  `id` int(11) NOT NULL,
  `nev` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `telefonszam` varchar(191) NOT NULL,
  `cim` varchar(191) NOT NULL,
  `jelszo` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `felhasznalok`
--

INSERT INTO `felhasznalok` (`id`, `nev`, `email`, `telefonszam`, `cim`, `jelszo`) VALUES
(1, 'Balazs', 'krepszbalazs@taszi.hu', '067022586', 'Körösladányi utca 3', '$argon2id$v=19$m=65536,t=3,p=4$0cddD57O+jt8xQ0YZQgXiQ$mJMmZRN6jZUw7haWfmnZHVfxg5XOgIknYEdV5y/j4wg'),
(2, 'asddika', 'asd@gmail.com', '0670896416', 'asd utca 2', '$argon2id$v=19$m=65536,t=3,p=4$8EZbQU5yAcdTiCm1a+Wvvg$aOpX0HZfvHcT70QdEVbL6cX4INgjLanV/2OX6T5Gymo'),
(3, 'fekete kispista', 'feketekispista@nemfizetek.hu', '0630123124', 'nemakarokfizetni utca 12', '$argon2id$v=19$m=65536,t=3,p=4$ogpTpwfrdrbEWt1IPB9NcA$3zZfetOEE4O3NtH/0bv2gEx6jO5KrnJeVIAOWswKXao');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendelesek`
--

CREATE TABLE `rendelesek` (
  `id` int(11) NOT NULL,
  `ar` int(11) NOT NULL,
  `datum` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `etelid` int(11) NOT NULL,
  `felhasznalo_id` int(11) NOT NULL,
  `megjegyzes` varchar(191) NOT NULL,
  `statusz` varchar(191) NOT NULL DEFAULT 'Felvéve',
  `mennyiseg` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `rendelesek`
--

INSERT INTO `rendelesek` (`id`, `ar`, `datum`, `etelid`, `felhasznalo_id`, `megjegyzes`, `statusz`, `mennyiseg`) VALUES
(1, 2200, '2024-02-26 12:04:46.163', 2, 1, 'glutén mentes', 'Elkészült', 1),
(2, 2200, '2024-03-05 13:56:37.656', 2, 2, '', 'Elkészült', 6),
(3, 1890, '2024-03-05 13:58:34.755', 5, 2, '', 'Elkészült', 2),
(4, 2090, '2024-03-05 13:59:25.128', 19, 2, '', 'Elkészült', 1),
(5, 1900, '2024-03-06 07:29:43.975', 3, 2, '', 'Elkészült', 5),
(6, 1900, '2024-03-06 07:29:44.005', 13, 2, '', 'Elkészült', 4),
(7, 3400, '2024-03-06 07:29:44.015', 22, 2, '', 'Elkészült', 6),
(8, 2200, '2024-03-06 08:13:11.762', 2, 2, '', 'Elkészült', 4),
(9, 3200, '2024-03-11 11:41:08.641', 8, 2, '', 'Elkészült', 4),
(10, 2100, '2024-03-11 11:45:00.201', 20, 2, '', 'Elkészült', 1),
(11, 2800, '2024-03-12 07:14:51.339', 6, 2, '+ sajttal', 'Elkészült', 7),
(12, 1900, '2024-03-12 09:37:24.788', 3, 2, '', 'Felvéve', 10),
(13, 3400, '2024-03-12 11:52:25.732', 22, 2, '', 'Felvéve', 2),
(14, 2500, '2024-03-14 09:31:39.238', 1, 2, '', 'Felvéve', 4),
(15, 2900, '2024-03-14 09:32:38.444', 7, 2, '', 'Felvéve', 1),
(16, 3600, '2024-03-14 09:32:38.476', 11, 2, '', 'Felvéve', 1),
(17, 2700, '2024-03-14 09:32:38.503', 17, 2, '', 'Felvéve', 1),
(18, 2200, '2024-03-14 09:37:18.959', 2, 3, '', 'Felvéve', 2),
(19, 2400, '2024-03-14 11:44:23.477', 4, 3, '', 'Felvéve', 6);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `velemenyek`
--

CREATE TABLE `velemenyek` (
  `id` int(11) NOT NULL,
  `megjegyzes` varchar(191) NOT NULL,
  `rendeles_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('6a2d4d9d-2853-4e3b-8aaa-b6aa56fe4bfa', '8a42dd9023b3660da0b280540976baa8e1888a6094cf005991f02ade5f9959f9', '2024-02-26 11:53:51.574', '20240226115351_izletesettermem', NULL, NULL, '2024-02-26 11:53:51.561', 1),
('6f2b0147-0333-44bd-afaf-b698d8754700', '0ddaca0e9c6d91ed2a64d9202c0b57a01c886c260495631196a442fe1d909ea6', '2024-02-26 07:35:31.539', '20240226073531_izletesetteremproject', NULL, NULL, '2024-02-26 07:35:31.446', 1),
('8b8b76ec-48a3-4036-bfd8-505bc343ecff', '9acc89b5d7e5de7e99f10cacf97a83bc49bc26b50620b2b9c7eaa480fd99ffbd', '2024-03-05 13:49:42.981', '20240305134942_fixedrendeles', NULL, NULL, '2024-03-05 13:49:42.969', 1),
('9dd06b76-9d77-4284-853a-f301cc76ebaa', 'b1cd8c9252a26dedeba396063583dd0793f942bb0f8c3f4dcf35f408575691cd', '2024-02-21 13:28:42.309', '20240221132123_jani', NULL, NULL, '2024-02-21 13:28:42.297', 1),
('a338b479-d1dc-4e3a-bb8c-47deb944dc8e', 'ae9617a07a44db7d3e564025551b1d2cdf562787d9add4dfb6d842e5517af882', '2024-02-21 13:33:48.683', '20240221133348_janika', NULL, NULL, '2024-02-21 13:33:48.643', 1),
('fa882362-1cad-480f-91d3-f7fc5d9f50ab', '5a34b0435cee01361550878e63838db4df2583769013c73fc99a6610afa8c208', '2024-02-26 12:42:13.902', '20240226124213_jancsik', NULL, NULL, '2024-02-26 12:42:13.893', 1);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `etelek`
--
ALTER TABLE `etelek`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `felhasznalok`
--
ALTER TABLE `felhasznalok`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `felhasznalok_email_key` (`email`);

--
-- A tábla indexei `rendelesek`
--
ALTER TABLE `rendelesek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rendelesek_felhasznalo_id_fkey` (`felhasznalo_id`),
  ADD KEY `rendelesek_etelid_fkey` (`etelid`);

--
-- A tábla indexei `velemenyek`
--
ALTER TABLE `velemenyek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `velemenyek_rendeles_id_fkey` (`rendeles_id`);

--
-- A tábla indexei `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `etelek`
--
ALTER TABLE `etelek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT a táblához `felhasznalok`
--
ALTER TABLE `felhasznalok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `rendelesek`
--
ALTER TABLE `rendelesek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT a táblához `velemenyek`
--
ALTER TABLE `velemenyek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `rendelesek`
--
ALTER TABLE `rendelesek`
  ADD CONSTRAINT `rendelesek_etelid_fkey` FOREIGN KEY (`etelid`) REFERENCES `etelek` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rendelesek_felhasznalo_id_fkey` FOREIGN KEY (`felhasznalo_id`) REFERENCES `felhasznalok` (`id`) ON UPDATE CASCADE;

--
-- Megkötések a táblához `velemenyek`
--
ALTER TABLE `velemenyek`
  ADD CONSTRAINT `velemenyek_rendeles_id_fkey` FOREIGN KEY (`rendeles_id`) REFERENCES `rendelesek` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
