-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 08-Out-2018 às 21:20
-- Versão do servidor: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `projeto_mmn`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `patentes`
--

CREATE TABLE IF NOT EXISTS `patentes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `min` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `patentes`
--

INSERT INTO `patentes` (`id`, `nome`, `min`) VALUES
(1, 'Iniciante', 0),
(2, 'Junior', 1),
(3, 'Diretor', 3),
(4, 'Diretor Senior', 5),
(5, 'Executivo', 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pai` int(11) DEFAULT NULL,
  `patente` int(11) NOT NULL COMMENT '1',
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `id_pai`, `patente`, `nome`, `email`, `senha`) VALUES
(1, 0, 5, 'cpdrenato', 'cpdrenato@gmail.com', '698dc19d489c4e4db73e28a713eab07b'),
(2, 0, 3, 'teste', 'teste@teste.com', '698dc19d489c4e4db73e28a713eab07b'),
(3, 1, 4, 'silas', 'silastj@hotmail.com', '698dc19d489c4e4db73e28a713eab07b'),
(4, 1, 3, 'amos', 'silastj@gmail.com', '698dc19d489c4e4db73e28a713eab07b'),
(5, 3, 2, 'samara', 'samara@samara.com', '698dc19d489c4e4db73e28a713eab07b'),
(6, 3, 2, 'bonito', 'bonito@bonito.com', '698dc19d489c4e4db73e28a713eab07b'),
(7, 6, 1, 'feio', 'feio@feio.com', '698dc19d489c4e4db73e28a713eab07b'),
(8, 2, 1, 'hoje', 'hoje@hoje.com', '698dc19d489c4e4db73e28a713eab07b'),
(9, 2, 1, 'amanha', 'amanha@amanha.com', '698dc19d489c4e4db73e28a713eab07b'),
(10, 2, 1, 'depois', 'depois@depois.com', '698dc19d489c4e4db73e28a713eab07b'),
(11, 5, 1, 'mae', 'mae@mae.com', '698dc19d489c4e4db73e28a713eab07b'),
(12, 5, 1, 'pai', 'pai@pai.com', '698dc19d489c4e4db73e28a713eab07b'),
(13, 2, 1, 'novo', 'novo@novo.com', '698dc19d489c4e4db73e28a713eab07b'),
(14, 1, 2, 'nikolas', 'nikolas@oi.com.br', '698dc19d489c4e4db73e28a713eab07b'),
(15, 14, 1, 'danilo', 'danilo@vivo.com.br', '698dc19d489c4e4db73e28a713eab07b'),
(16, 4, 2, 'seije', 'seije@seije.com', 'f32307f7e74d5b9a2be324a67926cfb0'),
(17, 4, 1, 'lindo', 'lindo@bonito.com', '9e1c2754001a041b3f35b16b5db50c55'),
(18, 16, 1, 'paz', 'paz@paz.com', '1725dd676a95026c24f95556299841d6'),
(21, 1, 0, 'jair', 'jair@jair.com', '1dcb7811160c72c3da404d32214e9cd8'),
(22, 21, 0, 'bolsonaro', 'bolsonaro@bolsonaro.com', '698dc19d489c4e4db73e28a713eab07b'),
(24, 1, 0, 'Messias', 'messias@messias.com', '698dc19d489c4e4db73e28a713eab07b'),
(25, 1, 0, 'santos', 'santos@santos.com', '698dc19d489c4e4db73e28a713eab07b'),
(26, 25, 0, 'paulo', 'paulo@teste.com', '698dc19d489c4e4db73e28a713eab07b'),
(27, NULL, 0, 'Pipa', 'pipa@pipa.com', 'c263ded68afbcf928ea873f39db2601a'),
(28, 2, 0, 'Mundial', 'mundial@mundial.com', '0c939cb0455c73941c0891a7fa8a5963');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
