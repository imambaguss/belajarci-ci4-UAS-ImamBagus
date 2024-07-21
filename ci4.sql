-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Jul 2024 pada 19.11
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci4`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2024-06-04-040234', 'App\\Database\\Migrations\\User', 'default', 'App', 1717473882, 1),
(2, '2024-06-04-040240', 'App\\Database\\Migrations\\Product', 'default', 'App', 1717473882, 1),
(3, '2024-06-04-040249', 'App\\Database\\Migrations\\Transaction', 'default', 'App', 1717473882, 1),
(4, '2024-06-04-040257', 'App\\Database\\Migrations\\TransactionDetail', 'default', 'App', 1717473882, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `harga` double NOT NULL,
  `jumlah` int(5) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id`, `nama`, `harga`, `jumlah`, `foto`, `created_at`, `updated_at`) VALUES
(1, 'ASUS TUF A15 FA506NF', 10899000, 5, 'asus_tuf_a15.jpg', '2024-06-04 04:06:46', NULL),
(2, 'Asus Vivobook 14 A1404ZA', 6899000, 7, 'asus_vivobook_14.jpg', '2024-06-04 04:06:46', NULL),
(3, 'Lenovo IdeaPad Slim 3-14IAU7', 6299000, 5, 'lenovo_idepad_slim_3.jpg', '2024-06-04 04:06:46', NULL),
(4, 'Alienware M15', 60000000, 50, '1719712192_3988b511ce3fd8b5574c.jpg', '2024-06-30 01:49:52', '2024-06-30 01:55:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `total_harga` double NOT NULL,
  `alamat` text NOT NULL,
  `ongkir` double DEFAULT NULL,
  `status` int(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `transaction`
--

INSERT INTO `transaction` (`id`, `username`, `total_harga`, `alamat`, `ongkir`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ratna16', 10957000, 'sdfsdfdfsdf', 58000, 0, '2024-07-20 13:16:15', '2024-07-20 13:16:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction_detail`
--

CREATE TABLE `transaction_detail` (
  `id` int(11) UNSIGNED NOT NULL,
  `transaction_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `jumlah` int(5) NOT NULL,
  `diskon` double DEFAULT NULL,
  `subtotal_harga` double NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `transaction_detail`
--

INSERT INTO `transaction_detail` (`id`, `transaction_id`, `product_id`, `jumlah`, `diskon`, `subtotal_harga`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 0, 10899000, '2024-07-20 13:16:15', '2024-07-20 13:16:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'jwacana', 'gunarto.karen@suartini.com', '$2y$10$7eLgE7B3qYZrgzzF6FUxVOvQJtqH56HQcjpRrDbZOrSG2pJNj9X2a', 'guest', '2024-06-04 04:07:29', NULL),
(2, 'ratna16', 'teguh.prabowo@kusmawati.biz.id', '$2y$10$oY5RU9nDYGl4W0XG8.DgvuuzNHOJuqkWEH1So1sU03j.Smluieqpe', 'admin', '2024-06-04 04:07:29', NULL),
(3, 'danuja96', 'tnamaga@gmail.co.id', '$2y$10$As7kiop/mtTzSdCrD5GDN.exs3JrKxCMThLalwkEFg6cC4Lrgo9re', 'guest', '2024-06-04 04:07:29', NULL),
(4, 'hsafitri', 'palastri.pangestu@gmail.com', '$2y$10$kXpPY4AezC9HzFdi5zCewu6ipWqePjeGIRapkDDT8aIrrGqir9h8y', 'admin', '2024-06-04 04:07:29', NULL),
(5, 'rahmi18', 'rahmat.natsir@mandala.desa.id', '$2y$10$g1EFAsqk4pEoC3HYiuxRieN0uusN8hcPkItUzmdeQW1bnopMH9E.y', 'guest', '2024-06-04 04:07:29', NULL),
(6, 'raihan47', 'mwijayanti@uwais.co', '$2y$10$e6H2FbQuQieqlUUoXkh2NuZ6p8RVb0xM5UY6dRlt9DvmCqOOHHNSO', 'admin', '2024-06-04 04:07:29', NULL),
(7, 'gsaptono', 'yhakim@putra.web.id', '$2y$10$ITF5csoeyfeD5JS5Yte2IOvTFHkmibOWTYV8yys51bUNddzAtwNWS', 'guest', '2024-06-04 04:07:29', NULL),
(8, 'keisha72', 'usamah.rina@riyanti.my.id', '$2y$10$D/v5U2gP4T2xuXECUF4WWem74hqxsxTB6DbyGQZATSGUouUucIf3u', 'guest', '2024-06-04 04:07:30', NULL),
(9, 'vuwais', 'apurnawati@yahoo.co.id', '$2y$10$zWDgPLNckKaAc/2SIN8aDOIfZfmgHPcYRs4bNNgTQiL.FzfcA0TCu', 'admin', '2024-06-04 04:07:30', NULL),
(10, 'usada.ozy', 'jailani.sadina@yahoo.com', '$2y$10$4OecH2fLgkJ8EBmN8sVkR.MocIIu7yu2NGazSXNP7V5Zto1s4coPO', 'admin', '2024-06-04 04:07:30', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaction_detail`
--
ALTER TABLE `transaction_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `transaction_detail`
--
ALTER TABLE `transaction_detail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
