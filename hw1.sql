-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Nov 05, 2025 alle 13:17
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hw1`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `snippet` text DEFAULT NULL,
  `price` varchar(100) DEFAULT NULL,
  `thumbnail` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `title`, `snippet`, `price`, `thumbnail`) VALUES
(61, 20, 'Bershka Jeans Donna', '', '17.99', 'https://serpapi.com/searches/686c03f11290d97861e774ea/images/e7cdd25ca85abde7e68177dcdbcd886b5aae1f2353c3af08f45fd5ffad0ab21f.webp');

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(20, 'Marco', 'mark04sap@gmail.com', '$2y$10$PWrv/qmCq5NzsCWMEbrNr.MEeEYWVADORwSuNB.ASH6PfcFHkYRJK'),
(21, 'Domenico', 'domesap@gmail.com', '$2y$10$WJMAgGBHL6P3j7.1HtdO0u4dD1iueH1Ys9.3O.JLTinyMMBah40PG'),
(22, 'Mariella', 'mary@gmail.com', '$2y$10$uV2.DOpi.DOgCiA/SM1.OuiUSkzYGaTsrgUBilOaXtGOiq67e9V0y'),
(23, 'Jessica', 'jessicasap@gmail.com', '$2y$10$58yLOD67A4aSf2vkvTYyiunUzAIowOzF5ZOhD/6HfbV0esoZ57.ri'),
(24, 'Mattia', 'mattiatara@gmail.com', '$2y$10$KwqgIlOScoXq90YkIlUTKum5d/JhSi2oOmCa39L8hd/VXithftqhK');

-- --------------------------------------------------------

--
-- Struttura della tabella `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `snippet` text DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `thumbnail` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `title`, `snippet`, `price`, `thumbnail`) VALUES
(3, 21, 'Terranova Giacca Sfoderata Con Zip Uomo', '', '49.99', 'https://serpapi.com/searches/68446677de1f33efff5b5a6a/images/15215bcb31ce2b17c902149e5a15a3d8daf1bec8e02c5a733c2ef6893fe3eeae.webp'),
(14, 22, 'Only T-shirt Donna', '', '9.99', 'https://serpapi.com/searches/6845c8973d06ea9d49f7bd86/images/1549c98e220065bee7809847afe4c036a0e212e00e4ebb9a680036c85b6955ff.webp'),
(110, 20, 'Bershka Maglietta maniche corte stampa Uomo', '', '15.99', 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTxaDXiGhR_Eqnq5P1uh_eYorfKF0-s_KrpgqHww-ZWE9LQcQLIvbtt3hXC79GAe6QEsMXTt_sDT93N8qi8XUiGPqaWQME-W38DDIBDEHNtpwxM-lG5sxRIew'),
(111, 20, 'Bershka wide Multi Pantaloni cargo Uomo', '', '25.99', 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTszCaLcbrEVs1iN3MN6nfPUOeYmwHJ_8voDv8CgBw4PayPyRMoLbJKl0uwCPhhpP2rqVBTjmIaPUtR4rlbn4YQG_twAW1sgp6cXAbzYkuE93CLUMhbinhxtA'),
(115, 20, 'Bershka Maglietta Jennie a maniche corte Donna', '', '19.99', 'https://serpapi.com/searches/686138f088aca458eddcfc79/images/3a01637acbd17e679e6e426e0feb237a3b6c06194cef99178c219c8087102e34.webp'),
(116, 20, 'Bershka Pantaloni Donna', '', '29.99', 'https://serpapi.com/searches/686138f088aca458eddcfc79/images/3a01637acbd17e679e6e426e0feb237a2a6d264dc826224cead34f60e0555e5b.webp'),
(117, 20, 'Casa di legno Pisa - 10,2×7 m - 65 mq - 5 vani - pareti da 70 mm', '', '27489', 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRtdct8FYszKcp5GLu1i0fs5aPQ2Z7ftdsBALymU1O6Mfz851XWoEQfGpFZaHixlM2FVKiyQ7BSANgIqNgr4R20GvM9sHXple9-xsuy4bQ'),
(118, 20, 'Casa in legno ASTRID, 120 mq - Case prefabbricate in legno - Prezzi', '', '34899', 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQNDVvkxnalfLh52VZXt-bvZWAINqDAQiCNd3xcDNw9ZSzyz47FDF3b6OnZOEjcSxCxo7xqPTL-AyvJm9cvjKgyyfTcotrsweylCDHNCVVO');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indici per le tabelle `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`title`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT per la tabella `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
