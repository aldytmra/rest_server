-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2019 at 05:07 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trikphp`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kode_barang` varchar(6) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `kode_kategori` varchar(4) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kode_barang`, `nama_barang`, `kode_kategori`, `harga`) VALUES
('BR001', 'SEMINGGU JAGO PHP MYSQL', 'KD01', 90000),
('BR002', 'MEMBANGUN WEB APLIKASI DENGAN PHP MYSQLI', 'KD01', 95000),
('BR003', 'SEMINGGU JAGO CODEIGNITER DAN BOOSTRAP', 'KD02', 90000),
('BR004', 'TEKNIK AJAX JQUERY DALAM PENGOLAHAN DATA', 'KD02', 95000);

--
-- Triggers `barang`
--
DELIMITER $$
CREATE TRIGGER `before_barang_update` BEFORE UPDATE ON `barang` FOR EACH ROW BEGIN
    INSERT INTO log_harga_barang
    set kode_barang = OLD.kode_barang,
    harga_baru=new.harga,
    harga_lama=old.harga,
    waktu_perubahan = NOW(); 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `name` varchar(50) NOT NULL,
  `population` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`name`, `population`) VALUES
('india', 10),
('china', 12),
('united states', 3),
('indonesia', 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `data_barang`
-- (See below for the actual view)
--
CREATE TABLE `data_barang` (
`kode_barang` varchar(6)
,`nama_barang` varchar(50)
,`kode_kategori` varchar(4)
,`harga` int(11)
,`nama_kategori` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `kategori_barang`
--

CREATE TABLE `kategori_barang` (
  `kode_kategori` varchar(4) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_barang`
--

INSERT INTO `kategori_barang` (`kode_kategori`, `nama_kategori`) VALUES
('KD01', 'TUTORIAL PHP DASAR'),
('KD02', 'TUTORIAL CODEIGNITER');

-- --------------------------------------------------------

--
-- Table structure for table `log_harga_barang`
--

CREATE TABLE `log_harga_barang` (
  `log_id` int(11) NOT NULL,
  `kode_barang` varchar(6) NOT NULL,
  `harga_lama` int(11) NOT NULL,
  `harga_baru` int(11) NOT NULL,
  `waktu_perubahan` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_harga_barang`
--

INSERT INTO `log_harga_barang` (`log_id`, `kode_barang`, `harga_lama`, `harga_baru`, `waktu_perubahan`) VALUES
(1, 'BR001', 80000, 90000, '2016-10-27 04:04:28');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(12) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jurusan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `jurusan`) VALUES
('3434343', 'fdf', 'dfdfd'),
('RM002', 'JOHNi ANDREAN', 'Rekamedis'),
('TI102031', 'NURIS AKBAR', 'TEKNIK INFORMATIKA'),
('TI102134', 'IRMA MULIANA', 'TEKNIK INFORMATIKA'),
('TI102135', 'DESI HANDAYANI', 'TEKNIK INFORMATIKA'),
('TI102165', 'RISNA', 'AKUTANSI'),
('TI201213', 'MUHAMMAD H MUZAKI', 'TEKNIK INFORMATIKA');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(11) NOT NULL,
  `bulan` varchar(50) NOT NULL,
  `tahun` int(11) NOT NULL,
  `hasil_penjualan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `bulan`, `tahun`, `hasil_penjualan`) VALUES
(1, 'January', 2016, 10),
(2, 'February', 2016, 12),
(3, 'Maret', 2016, 13),
(4, 'April', 2016, 18),
(5, 'May', 2017, 16),
(6, 'Juni', 2016, 14),
(7, 'July', 2016, 15),
(8, 'Agustus', 2016, 12),
(9, 'September', 2016, 19),
(10, 'Oktober', 2016, 12),
(11, 'November', 2016, 12),
(12, 'Desember', 2016, 20);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `no_hp` varchar(12) NOT NULL,
  `otp` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `no_hp`, `otp`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '089699935552', '12dz');

-- --------------------------------------------------------

--
-- Structure for view `data_barang`
--
DROP TABLE IF EXISTS `data_barang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `data_barang`  AS  select `b`.`kode_barang` AS `kode_barang`,`b`.`nama_barang` AS `nama_barang`,`b`.`kode_kategori` AS `kode_kategori`,`b`.`harga` AS `harga`,`k`.`nama_kategori` AS `nama_kategori` from (`barang` `b` join `kategori_barang` `k`) where (`b`.`kode_kategori` = `k`.`kode_kategori`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  ADD PRIMARY KEY (`kode_kategori`);

--
-- Indexes for table `log_harga_barang`
--
ALTER TABLE `log_harga_barang`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log_harga_barang`
--
ALTER TABLE `log_harga_barang`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
