-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 21 Des 2024 pada 16.21
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hackathon`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `Berada`
--

CREATE TABLE `Berada` (
  `id_kos` int(11) NOT NULL,
  `id_rw` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `Berada_Pemilik`
--

CREATE TABLE `Berada_Pemilik` (
  `id_kos` int(11) NOT NULL,
  `id_pemilik` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `Client`
--

CREATE TABLE `Client` (
  `id_client` int(11) NOT NULL,
  `nama_client` varchar(255) NOT NULL,
  `umur_client` int(11) DEFAULT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `email` varchar(255) NOT NULL,
  `kata_sandi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `Kos`
--

CREATE TABLE `Kos` (
  `id_kos` int(11) NOT NULL,
  `nama_kos` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `jumlah_kamar` int(11) NOT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `Memilih`
--

CREATE TABLE `Memilih` (
  `id_client` int(11) NOT NULL,
  `id_kos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `Pemilik`
--

CREATE TABLE `Pemilik` (
  `id_pemilik` int(11) NOT NULL,
  `nama_pemilik` varchar(255) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `Wilayah_RW`
--

CREATE TABLE `Wilayah_RW` (
  `id_rw` int(11) NOT NULL,
  `nama_rw` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `Berada`
--
ALTER TABLE `Berada`
  ADD PRIMARY KEY (`id_kos`,`id_rw`),
  ADD KEY `id_rw` (`id_rw`);

--
-- Indeks untuk tabel `Berada_Pemilik`
--
ALTER TABLE `Berada_Pemilik`
  ADD PRIMARY KEY (`id_kos`,`id_pemilik`),
  ADD KEY `id_pemilik` (`id_pemilik`);

--
-- Indeks untuk tabel `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`id_client`);

--
-- Indeks untuk tabel `Kos`
--
ALTER TABLE `Kos`
  ADD PRIMARY KEY (`id_kos`);

--
-- Indeks untuk tabel `Memilih`
--
ALTER TABLE `Memilih`
  ADD PRIMARY KEY (`id_client`,`id_kos`),
  ADD KEY `id_kos` (`id_kos`);

--
-- Indeks untuk tabel `Pemilik`
--
ALTER TABLE `Pemilik`
  ADD PRIMARY KEY (`id_pemilik`);

--
-- Indeks untuk tabel `Wilayah_RW`
--
ALTER TABLE `Wilayah_RW`
  ADD PRIMARY KEY (`id_rw`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `Client`
--
ALTER TABLE `Client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `Kos`
--
ALTER TABLE `Kos`
  MODIFY `id_kos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `Pemilik`
--
ALTER TABLE `Pemilik`
  MODIFY `id_pemilik` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `Wilayah_RW`
--
ALTER TABLE `Wilayah_RW`
  MODIFY `id_rw` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `Berada`
--
ALTER TABLE `Berada`
  ADD CONSTRAINT `berada_ibfk_1` FOREIGN KEY (`id_kos`) REFERENCES `Kos` (`id_kos`) ON DELETE CASCADE,
  ADD CONSTRAINT `berada_ibfk_2` FOREIGN KEY (`id_rw`) REFERENCES `Wilayah_RW` (`id_rw`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `Berada_Pemilik`
--
ALTER TABLE `Berada_Pemilik`
  ADD CONSTRAINT `berada_pemilik_ibfk_1` FOREIGN KEY (`id_kos`) REFERENCES `Kos` (`id_kos`) ON DELETE CASCADE,
  ADD CONSTRAINT `berada_pemilik_ibfk_2` FOREIGN KEY (`id_pemilik`) REFERENCES `Pemilik` (`id_pemilik`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `Memilih`
--
ALTER TABLE `Memilih`
  ADD CONSTRAINT `memilih_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `Client` (`id_client`) ON DELETE CASCADE,
  ADD CONSTRAINT `memilih_ibfk_2` FOREIGN KEY (`id_kos`) REFERENCES `Kos` (`id_kos`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
