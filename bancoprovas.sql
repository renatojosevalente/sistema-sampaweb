-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20/02/2025 às 02:03
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bancoprovas`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno`
--

CREATE TABLE `aluno` (
  `idAluno` int(11) NOT NULL,
  `nomeAluno` varchar(100) NOT NULL,
  `idClasse` int(11) NOT NULL,
  `idEscola` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `aluno`
--

INSERT INTO `aluno` (`idAluno`, `nomeAluno`, `idClasse`, `idEscola`) VALUES
(1, '5A-1-AILTON BERNARDO GOMES DA SILVA', 13, 1),
(2, '5A-2-DEIVISON LUCAS DOS ANJOS ARCINI', 13, 1),
(3, '5A-3-DIOGO SEIJI VEIGA SUZUKI', 13, 1),
(4, '5A-4-EDSON SOARES DOS SANTOS', 13, 1),
(5, '5A-5-EMELY DA SILVA VERDE', 13, 1),
(6, '5A-6-HELLOA FERNANDES DE MENDONCA', 13, 1),
(7, '5A-7-JOAO ICARO SANTOS RIBEIRO', 13, 1),
(8, '5A-8-KAYLA ELIZABETH DE LIMA LARAEDSON SOARES DOS SANTOS', 13, 1),
(9, '5A-9-LIVIA VERDE DA SILVA', 13, 1),
(10, '5A-10-MARIA EDUARDA RIBEIRO DE SOUZA', 13, 1),
(11, '5A-11-MIGUEL DOS SANTOS FREITAS', 13, 1),
(12, '5A-12-NICOLLY DE SOUZA REZENDE', 13, 1),
(13, '5A-13-PALOMA VEIGA DE LARA', 13, 1),
(14, '5A-14-RAQUEL DANTAS FERREIRA DE MENDONCA', 13, 1),
(15, '5A-15-RAUAN MENDONCA VEIGA', 13, 1),
(16, '5A-16-YAGO DOS SANTOS FERMINO PEREIRA', 13, 1),
(17, '5A-17-CAROLINE DE SANTANA GUIMARAES', 13, 1),
(18, '1A-1-ALICE ASSUMPCAO PRADO NEBERSKI', 16, 2),
(19, '1A-2-CALEBE ALVES ASSUMPÇÃO', 16, 2),
(20, '1A-3-CHRISTYNE VITORIA PEREIRA DE OLIVEIRA', 16, 2),
(21, '1A-4-ENZO GABRIEL LOPES DOS SANTOS ', 16, 2),
(22, '1A-5-ESTHER VICTORIA MARTINS BARROS', 16, 2),
(23, '1A-6-GABRIEL DIAS PEREIRA', 16, 2),
(24, '1A-7-ISAAK ANTONIO MARQUES DOMINGUES', 16, 2),
(25, '1A-8-JOAO PAULO DE OLIVEIRA MARINHO', 16, 2),
(26, '1A-9-LORENZO ALVES SANTOS', 16, 2),
(27, '1A-10-MANUELA ANTUNES GOMES', 16, 2),
(28, '1A-11-MATHEUS APARECIDO RIBEIRO PEREIRA', 16, 2),
(29, '1A-12-MICAELLA KAMILLY RAMOS DE OLIVEIRA', 16, 2),
(30, '1A-13-MIKAEL DA SILVA RIBEIRO', 16, 2),
(31, '1A-14-NICOLLY CRISTINNI VIEIRA DOS SANTOS', 16, 2),
(32, '1A-15-PEDRO HENRIQUE PRADO DE OLIVEIRA NEBERSKI', 16, 2),
(33, '1A-16-RICARDO DIAS PINTO', 16, 2),
(34, '1A-18-IZAQUE ALVES RIBEIRO ', 16, 2),
(35, '1A-19-THEO DE MACEDO ALMEIDA OLIVEIRA ', 16, 2),
(36, '1A-20-ENZO GABRIEL DE SOUZA ALMEIDA', 16, 2),
(37, '2A-2-ANA VITORIA OLIVEIRA DE JESUS', 19, 2),
(38, '2A-3-DAVID LUCCA DE ALMEIDA DOMINGUES', 19, 2),
(39, '2A-4-ELOAH AZEVEDO DA SILVA', 19, 2),
(40, '2A-5-EMANUELLY TEIXEIRA PRADO', 19, 2),
(41, '2A-6-HELOISA LORENA QUEIROZ DAS NEVES', 19, 2),
(42, '2A-7-ISADORA ALVES DE OLIVEIRA', 19, 2),
(43, '2A-8-JOAO LUCCA ARMESTRONG ASSUMPCAO', 19, 2),
(44, '2A-9-JOHNI LUCCA RIBEIRO DA SILVA', 19, 2),
(45, '2A-10-MARIA HELOIZA LOPES RIBEIRO', 19, 2),
(46, '2A-11-MARIA LUIZA FONSECA GONCALVES', 19, 2),
(47, '2A-12-NICOLLY HELENA RIBEIRO HANZAWA', 19, 2),
(48, '2A-13-PEDRO HENRIQUE ALVES CARDOSO', 19, 2),
(49, '2A-15-RYAN LUCAS RIBEIRO', 19, 2),
(50, '2A-16-THOMAS RODRIGUES NEBERSKI', 19, 2),
(51, '2A-17-VIVIAN KELLY MICENA MENDONCA', 19, 2),
(52, '2A-18-HENRY PIETRO FERREIRA DA SILVA', 19, 2),
(53, '2A-19-ÁUREA ASHLEY CORREIA DA SILVA', 19, 2),
(54, '1A-1-ALINE MONTEIRO ARAUJO', 1, 1),
(55, '1A-2-EMANOEL LORENZO RIBEIRO DE SOUZA', 1, 1),
(56, '1A-3-ENZO GABRIEL ARAUJO DE MONTE', 1, 1),
(57, '1A-4-HELOISA GASPARELLI GONCALVES DIAS', 1, 1),
(58, '1A-5-JOAO LUCAS TOBIAS', 1, 1),
(59, '1A-6-JULIA MENDONCA DE ARAUJO', 1, 1),
(60, '1A-7-MYKAELLA MARTINS RIBEIRO', 1, 1),
(61, '1A-8-NICOLLAS BERNARDO MENDONCA FERMINO', 1, 1),
(62, '1A-9-VINICIOS AGUIAR RIBEIRO', 1, 1),
(63, '1A-10-VIVIAN ELIZABETH DE LIMA', 1, 1),
(64, '2A-1-ANA LAURA DE LIMA PEDROSO', 4, 1),
(65, '2A-2-DIOGO DE LIMA MENDONCA', 4, 1),
(66, '2A-3-GILMAR DA VEIGA JUNIOR', 4, 1),
(67, '2A-4-MARIA EDUARDA DE SOUZA CORREA', 4, 1),
(68, '2A-5-MIGUEL DOS ANJOS VEIGA', 4, 1),
(69, '2A-6-MUNIK EMILY DIAS MENDONCA', 4, 1),
(70, '2A-7-SAMUEL RODRIGUES DE ARAUJO', 4, 1),
(71, '2A-8-TIFFFANY SOPHIA MARTINS ROSENO', 4, 1),
(72, '3A-1-LARISSA MANUELI DE SOUZA DIAS', 7, 1),
(73, '3A-2-LUCCAS MARCIEL ALVES DE SOUZA', 7, 1),
(74, '3A-3-MARIA EDUARDA DIAS MENDONCA PC', 7, 1),
(75, '3A-4-MARIAN FERNANDES DE LIMA COSTA', 7, 1),
(76, '3A-5-MELISSA DA VEIGA MENDONCA', 7, 1),
(77, '3A-6-MICAELLY VICTORIA BRITO SOUZA', 7, 1),
(78, '3A-7-PEDRO HENRIQUE DIAS MENDONCA', 7, 1),
(79, '3A-8-PIETRO DE LIMA', 7, 1),
(80, '3A-9-SAMUEL WILLIAN MENDONCA', 7, 1),
(81, '4A-1-DAVI LUCAS MIRANDA PINTO', 10, 1),
(82, '4A-2-FERNANDA DE ARAUJO SILVA', 10, 1),
(83, '4A-3-GUSTAVO HENRIQUE MARTINS SILVA', 10, 1),
(84, '4A-4-HENRIQUE DE SOUZA TOBIAS', 10, 1),
(85, '4A-5-HILLARY VICTORIA DOS ANJOS VEIGA', 10, 1),
(86, '4A-6-ISABELLY VITORIA DE OLIVEIRA ALVES', 10, 1),
(87, '4A-7-KAILLAYNE EDUARDA SOARES DE LIMA', 10, 1),
(88, '4A-8-KAUE GABRIEL MOTA FERNANDES PEREIRA', 10, 1),
(89, '4A-9-KHETELYN VICTORIA DIAS GOMES', 10, 1),
(90, '4A-10-LORENA GASPARELLI GONÇALVES DIAS', 10, 1),
(91, '4A-11-MAYA SANTOS LIMA RIBEIRO', 10, 1),
(92, '4A-12-MILENA DE MENDONÇA DIAS', 10, 1),
(93, '4A-13-NICOLLY CAROLLINE SANTOS DOS ANJOS', 10, 1),
(94, '2A-1-ALANA VITORIA ALVES GOMES', 34, 3),
(95, '2A-2-BRAYAN RAMOS LIMA', 34, 3),
(96, '2A-3-FABIO ALMEIDA NUNES', 34, 3),
(97, '2A-4-FERNANDA MACIEL DE VASCONCELOS', 34, 3),
(98, '2A-5-GABRIEL PIETRO VICENTE MENEZES', 34, 3),
(99, '2A-6-HELENA KOZINSKI DO ESPIRITO SANTO', 34, 3),
(100, '2A-7-ISAAC NATHAN DE LARA LIMA', 34, 3),
(101, '2A-8-ISABELLA SOARES KOZINSKI', 34, 3),
(102, '2A-9-ISABELLA VITORIA PEREIRA DE VASCONCELOS', 34, 3),
(103, '2A-10-JHENIFER VITORIA RIBEIRO MILLER ALVES', 34, 3),
(104, '2A-11-JOAO LUCAS GALDINO BRETAS', 34, 3),
(105, '2A-12-LARAH STEFANIE RIBEIRO DE MORAES', 34, 3),
(106, '2A-13-LAUREN VITORIA ALMEIDA DIAS', 34, 3),
(107, '2A-14-MARIA IZABEL DA SILVA FERREIRA LIMA', 34, 3),
(108, '2A-15-NICOLLAS CAMPOS MORAES (cadeirante)', 34, 3),
(109, '3B-1-ALLAN PATRICK RAMALHO DE AZEVEDO', 38, 3),
(110, '3B-2-DAVID LUCCA SILVA RIBEIRO', 38, 3),
(111, '3B-3-GUSTAVO HENRIQUE ALVES PEREIRA', 38, 3),
(112, '3B-4-LAVINIA CRISTINA YNOJORA SOUZA', 38, 3),
(113, '3B-5-MARIA EDUARDA RAMOS DE ASSIS MILLER', 38, 3),
(114, '3B-6-MIGUEL ALVES MOAES', 38, 3),
(115, '3B-7-VALENTINA VITORIA SILVA GOMES', 38, 3),
(116, '1A-1-ARTHUR MICAEL MARTINS BRITO', 31, 3),
(117, '1A-2-JOANA MANUELLY SANTANA BRESSA', 31, 3),
(118, '1A-3-JOAO LUCAS VICENTE MENEZES', 31, 3),
(119, '1A-4-JOSE CARLOS COSTA DERCULE', 31, 3),
(120, '1A-5-KENDRICK ROBERTO DOS SANTOS BONIFÁCIO', 31, 3),
(121, '1A-6-LUCAS DANIEL BRETAS ALVES', 31, 3),
(122, '1A-7-MURILO DOMINGUES SABINO DA SILVA', 31, 3),
(123, '1A-8-PEDRO HENRIQUE NUNES DIAS', 31, 3),
(124, '1A-9-PHYETRA VITORIA DOS SANTOS ROSA', 31, 3),
(125, '1A-10-RAFAEL CHALEGRE DOS SANTOS', 31, 3),
(126, '1A-11-SARA SOARES RODRIGUES', 31, 3),
(127, '1A-12-SARA VICTORIA FRANCO SILVA', 31, 3),
(128, '1A-13-THEO RODRIGUES DE ALMEIDA', 31, 3),
(129, '1A-14-LAURA MARYA MENDONCA DOS SANTOS JULIO', 31, 3),
(130, '1A-15-LORENZO LEMOS DA SILVA', 31, 3),
(131, '1A-16-ISADORA RAYANE FUCCINA BRITO', 31, 3),
(132, '3A-1-ARIELA VENTURA MORAES', 37, 3),
(133, '3A-2-BERNARDO DUARTE DE AZEVEDO', 37, 3),
(134, '3A-3-EDSON MIGUEL MARTINS BRITO', 37, 3),
(135, '3A-4-EMANUELLY AMANDA SILVA DIAS', 37, 3),
(136, '3A-5-EMANUELLY VALENTINA MARQUES DE ALMEIDA', 37, 3),
(137, '3A-6-EMILY VITORIA DE FREITAS SOUZA', 37, 3),
(138, '3A-7-ENZO MIGUEL ALVES DOS SANTOS', 37, 3),
(139, '3A-8-ESTER VICENTE MENEZES', 37, 3),
(140, '3A-9-EZEQUIEL CHALEGRE DOS SANTOS', 37, 3),
(141, '3A-10-GUILHERME MANSANO DE SOUZA', 37, 3),
(142, '3A-11-KAIO LORENZO DIAS SILVA', 37, 3),
(143, '3A-12-KEMILLY MAIARA INOJOSA DAS NEVES', 37, 3),
(144, '3A-13-LORENA DE LIMA MACIEL DOS SANTOS', 37, 3),
(145, '3A-14-LORENA FERREIRA SANTOS COSTA', 37, 3),
(146, '3A-15-LORENNA ALVES ASSUMPCAO', 37, 3),
(147, '3A-16-LUIZA CAROLINE PIOKER', 37, 3),
(148, '3A-17-MARIA EDUARDA DOS SANTOS NARCISO', 37, 3),
(149, '3A-18-MURILO GABRIEL MARTINS BATISTA', 37, 3),
(150, '3A-19-NICOLAS DAVI MUNIZ ABDIAS', 37, 3),
(151, '3A-20-RUAN RIBEIRO MILLER ALVES', 37, 3),
(152, '3A-21-SOPHIA SANTOS ARAUJO', 37, 3),
(153, '3A-22-STEPHANE VICTORIA SOUZA DA SILVA DOMINGUES', 37, 3),
(154, '3A-23-VITOR AUGUSTO MARTINS RIBEIRO', 37, 3),
(155, '3A-24-ANA VITORIA MILLER DA SILVA', 37, 3),
(156, '3A-25-EMANUELLY SOFHIA CABRAL DE LIMA', 37, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `alunodisciplina`
--

CREATE TABLE `alunodisciplina` (
  `idAluno` int(11) NOT NULL,
  `idDisciplina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `alunodisciplina`
--

INSERT INTO `alunodisciplina` (`idAluno`, `idDisciplina`) VALUES
(1, 5),
(1, 10),
(2, 5),
(2, 10),
(3, 5),
(3, 10),
(4, 5),
(4, 10),
(5, 5),
(5, 10),
(6, 5),
(6, 10),
(7, 5),
(7, 10),
(8, 5),
(8, 10),
(9, 5),
(9, 10),
(10, 5),
(10, 10),
(11, 5),
(11, 10),
(12, 5),
(12, 10),
(13, 5),
(13, 10),
(14, 5),
(14, 10),
(15, 5),
(15, 10),
(16, 5),
(16, 10),
(17, 5),
(17, 10),
(18, 1),
(18, 6),
(19, 1),
(19, 6),
(20, 1),
(20, 6),
(21, 1),
(21, 6),
(22, 1),
(22, 6),
(23, 1),
(23, 6),
(24, 1),
(24, 6),
(25, 1),
(25, 6),
(26, 1),
(26, 6),
(27, 1),
(27, 6),
(28, 1),
(28, 6),
(29, 1),
(29, 6),
(30, 1),
(30, 6),
(31, 1),
(31, 6),
(32, 1),
(32, 6),
(33, 1),
(33, 6),
(34, 1),
(34, 6),
(35, 1),
(35, 6),
(36, 1),
(36, 6),
(37, 2),
(37, 7),
(38, 2),
(38, 7),
(39, 2),
(39, 7),
(40, 2),
(40, 7),
(41, 2),
(41, 7),
(42, 2),
(42, 7),
(43, 2),
(43, 7),
(44, 2),
(44, 7),
(45, 2),
(45, 7),
(46, 2),
(46, 7),
(47, 2),
(47, 7),
(48, 2),
(48, 7),
(49, 2),
(49, 7),
(50, 2),
(50, 7),
(51, 2),
(51, 7),
(52, 2),
(52, 7),
(53, 2),
(53, 7),
(54, 1),
(54, 6),
(55, 1),
(55, 6),
(56, 1),
(56, 6),
(57, 1),
(57, 6),
(58, 1),
(58, 6),
(59, 1),
(59, 6),
(60, 1),
(60, 6),
(61, 1),
(61, 6),
(62, 1),
(62, 6),
(63, 1),
(63, 6);

-- --------------------------------------------------------

--
-- Estrutura para tabela `autentic`
--

CREATE TABLE `autentic` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `paginaRestrita` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `autentic`
--

INSERT INTO `autentic` (`id`, `email`, `senha`, `paginaRestrita`) VALUES
(1, 'renatovalente@adm.com', '5678', 'paginaRestrita.php'),
(2, 'escolaelvira@educacao.com', '1234', 'prova_LP_Elvira/inserirResp.php'),
(3, 'escolacamilo@educacao.com', '1223', 'prova_LP_Camilo/inserirResp.php');

-- --------------------------------------------------------

--
-- Estrutura para tabela `classe`
--

CREATE TABLE `classe` (
  `idClasse` int(11) NOT NULL,
  `nomeClasse` varchar(100) NOT NULL,
  `idEscola` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `classe`
--

INSERT INTO `classe` (`idClasse`, `nomeClasse`, `idEscola`) VALUES
(1, '1A-ELV', 1),
(2, '1B-ELV', 1),
(3, '1C-ELV', 1),
(4, '2A-ELV', 1),
(5, '2B-ELV', 1),
(6, '2C-ELV', 1),
(7, '3A-ELV', 1),
(8, '3B-ELV', 1),
(9, '3C-ELV', 1),
(10, '4A-ELV', 1),
(11, '4B-ELV', 1),
(12, '4C-ELV', 1),
(13, '5A-ELV', 1),
(14, '5B-ELV', 1),
(15, '5C-ELV', 1),
(16, '1A-CAM', 2),
(17, '1B-CAM', 2),
(18, '1C-CAM', 2),
(19, '2A-CAM', 2),
(20, '2B-CAM', 2),
(21, '2C-CAM', 2),
(22, '3A-CAM', 2),
(23, '3B-CAM', 2),
(24, '3C-CAM', 2),
(25, '4A-CAM', 2),
(26, '4B-CAM', 2),
(27, '4C-CAM', 2),
(28, '5A-CAM', 2),
(29, '5B-CAM', 2),
(30, '5C-CAM', 2),
(31, '1A-MAN', 3),
(32, '1B-MAN', 3),
(33, '1C-MAN', 3),
(34, '2A-MAN', 3),
(35, '2B-MAN', 3),
(36, '2C-MAN', 3),
(37, '3A-MAN', 3),
(38, '3B-MAN', 3),
(39, '3C-MAN', 3),
(40, '4A-MAN', 3),
(41, '4B-MAN', 3),
(42, '4C-MAN', 3),
(43, '5A-MAN', 3),
(44, '5B-MAN', 3),
(45, '5C-MAN', 3),
(46, '1A-VAR', 4),
(47, '1B-VAR', 4),
(48, '1C-VAR', 4),
(49, '2A-VAR', 4),
(50, '2B-VAR', 4),
(51, '2C-VAR', 4),
(52, '3A-VAR', 4),
(53, '3B-VAR', 4),
(54, '3C-VAR', 4),
(55, '4A-VAR', 4),
(56, '4B-VAR', 4),
(57, '4C-VAR', 4),
(58, '5A-VAR', 4),
(59, '5B-VAR', 4),
(60, '5C-VAR', 4),
(61, '1A-MIL', 5),
(62, '1B-MIL', 5),
(63, '1C-MIL', 5),
(64, '2A-MIL', 5),
(65, '2B-MIL', 5),
(66, '2C-MIL', 5),
(67, '3A-MIL', 5),
(68, '3B-MIL', 5),
(69, '3C-MIL', 5),
(70, '4A-MIL', 5),
(71, '4B-MIL', 5),
(72, '4C-MIL', 5),
(73, '5A-MIL', 5),
(74, '5B-MIL', 5),
(75, '5C-MIL', 5),
(76, '1A-MOA', 6),
(77, '1B-MOA', 6),
(78, '1C-MOA', 6),
(79, '2A-MOA', 6),
(80, '2B-MOA', 6),
(81, '2C-MOA', 6),
(82, '3A-MOA', 6),
(83, '3B-MOA', 6),
(84, '3C-MOA', 6),
(85, '4A-MOA', 6),
(86, '4B-MOA', 6),
(87, '4C-MOA', 6),
(88, '5A-MOA', 6),
(89, '5B-MOA', 6),
(90, '5C-MOA', 6),
(91, '1A-SID', 7),
(92, '1B-SID', 7),
(93, '1C-SID', 7),
(94, '2A-SID', 7),
(95, '2B-SID', 7),
(96, '2C-SID', 7),
(97, '3A-SID', 7),
(98, '3B-SID', 7),
(99, '3C-SID', 7),
(100, '4A-SID', 7),
(101, '4B-SID', 7),
(102, '4C-SID', 7),
(103, '5A-SID', 7),
(104, '5B-SID', 7),
(105, '5C-SID', 7),
(106, 'CLASS-MULT', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `disciplina`
--

CREATE TABLE `disciplina` (
  `idDisciplina` int(11) NOT NULL,
  `nomeDisciplina` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `disciplina`
--

INSERT INTO `disciplina` (`idDisciplina`, `nomeDisciplina`) VALUES
(1, 'Língua Portuguesa-1'),
(2, 'Língua Portuguesa-2'),
(3, 'Língua Portuguesa-3'),
(4, 'Língua Portuguesa-4'),
(5, 'Língua Portuguesa-5'),
(6, 'Matemática-1'),
(7, 'Matemática-2'),
(8, 'Matemática-3'),
(9, 'Matemática-4'),
(10, 'Matemática-5');

-- --------------------------------------------------------

--
-- Estrutura para tabela `escola`
--

CREATE TABLE `escola` (
  `idEscola` int(11) NOT NULL,
  `nomeEscola` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `escola`
--

INSERT INTO `escola` (`idEscola`, `nomeEscola`) VALUES
(4, 'EMEF Presidente Vargas'),
(2, 'EMEIF Camilo Gomes'),
(1, 'EMEIF Elvira Fernandes Lourenço'),
(3, 'EMEIF Manuel José Martins'),
(5, 'EMEIF Prof Milcio Bazoli'),
(6, 'EMEIF Prof Moacyr Pinto Santiago'),
(7, 'EMEIF Prof Sidney C. M. Egydio');

-- --------------------------------------------------------

--
-- Estrutura para tabela `gabarito`
--

CREATE TABLE `gabarito` (
  `idGabarito` int(11) NOT NULL,
  `idDisciplina` int(11) NOT NULL,
  `gabarito1` char(1) DEFAULT NULL,
  `gabarito2` char(1) DEFAULT NULL,
  `gabarito3` char(1) DEFAULT NULL,
  `gabarito4` char(1) DEFAULT NULL,
  `gabarito5` char(1) DEFAULT NULL,
  `gabarito6` char(1) DEFAULT NULL,
  `gabarito7` char(1) DEFAULT NULL,
  `gabarito8` char(1) DEFAULT NULL,
  `gabarito9` char(1) DEFAULT NULL,
  `gabarito10` char(1) DEFAULT NULL,
  `gabarito11` char(1) DEFAULT NULL,
  `gabarito12` char(1) DEFAULT NULL,
  `gabarito13` char(1) DEFAULT NULL,
  `gabarito14` char(1) DEFAULT NULL,
  `gabarito15` char(1) DEFAULT NULL,
  `gabarito16` char(1) DEFAULT NULL,
  `gabarito17` char(1) DEFAULT NULL,
  `gabarito18` char(1) DEFAULT NULL,
  `gabarito19` char(1) DEFAULT NULL,
  `gabarito20` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `gabarito`
--

INSERT INTO `gabarito` (`idGabarito`, `idDisciplina`, `gabarito1`, `gabarito2`, `gabarito3`, `gabarito4`, `gabarito5`, `gabarito6`, `gabarito7`, `gabarito8`, `gabarito9`, `gabarito10`, `gabarito11`, `gabarito12`, `gabarito13`, `gabarito14`, `gabarito15`, `gabarito16`, `gabarito17`, `gabarito18`, `gabarito19`, `gabarito20`) VALUES
(1, 1, 'A', 'D', 'A', 'B', 'D', 'A', 'A', 'B', 'A', 'C', 'B', 'C', 'C', 'B', 'C', 'D', 'X', 'X', 'X', 'X'),
(2, 2, 'A', 'D', 'C', 'B', 'D', 'C', 'B', 'C', 'A', 'D', 'A', 'C', 'D', 'A', 'D', 'X', 'X', 'X', 'X', 'X'),
(3, 3, 'A', 'B', 'D', 'C', 'D', 'A', 'B', 'C', 'C', 'B', 'D', 'C', 'B', 'C', 'X', 'X', 'X', 'X', 'X', 'X'),
(4, 4, 'A', 'D', 'B', 'A', 'C', 'D', 'C', 'C', 'B', 'C', 'D', 'D', 'B', 'A', 'B', 'X', 'X', 'X', 'X', 'X'),
(5, 5, 'B', 'D', 'C', 'D', 'B', 'A', 'C', 'B', 'D', 'A', 'D', 'B', 'A', 'D', 'C', 'D', 'X', 'X', 'X', 'X'),
(6, 6, 'A', 'C', 'B', 'C', 'D', 'A', 'B', 'C', 'A', 'B', 'D', 'B', 'C', 'X', 'X', 'X', 'X', 'X', 'X', 'X'),
(7, 7, 'C', 'A', 'D', 'C', 'A', 'B', 'A', 'D', 'A', 'D', 'B', 'A', 'B', 'D', 'X', 'X', 'X', 'X', 'X', 'X'),
(8, 8, 'D', 'B', 'C', 'D', 'A', 'B', 'C', 'A', 'C', 'A', 'D', 'B', 'A', 'C', 'B', 'X', 'X', 'X', 'X', 'X'),
(9, 9, 'C', 'A', 'B', 'C', 'B', 'D', 'C', 'B', 'A', 'D', 'B', 'A', 'C', 'B', 'A', 'D', 'B', 'X', 'X', 'X'),
(10, 10, 'C', 'A', 'B', 'C', 'B', 'C', 'A', 'B', 'A', 'D', 'C', 'D', 'B', 'D', 'A', 'B', 'C', 'X', 'X', 'X');

-- --------------------------------------------------------

--
-- Estrutura para tabela `questoes_lp`
--

CREATE TABLE `questoes_lp` (
  `idQuestao` int(11) NOT NULL,
  `idAluno` int(11) NOT NULL,
  `idDisciplina` int(11) NOT NULL,
  `idEscola` int(11) NOT NULL,
  `resposta1` char(1) DEFAULT NULL,
  `resposta2` char(1) DEFAULT NULL,
  `resposta3` char(1) DEFAULT NULL,
  `resposta4` char(1) DEFAULT NULL,
  `resposta5` char(1) DEFAULT NULL,
  `resposta6` char(1) DEFAULT NULL,
  `resposta7` char(1) DEFAULT NULL,
  `resposta8` char(1) DEFAULT NULL,
  `resposta9` char(1) DEFAULT NULL,
  `resposta10` char(1) DEFAULT NULL,
  `resposta11` char(1) DEFAULT NULL,
  `resposta12` char(1) DEFAULT NULL,
  `resposta13` char(1) DEFAULT NULL,
  `resposta14` char(1) DEFAULT NULL,
  `resposta15` char(1) DEFAULT NULL,
  `resposta16` char(1) DEFAULT NULL,
  `resposta17` char(1) DEFAULT NULL,
  `resposta18` char(1) DEFAULT NULL,
  `resposta19` char(1) DEFAULT NULL,
  `resposta20` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `questoes_lp`
--

INSERT INTO `questoes_lp` (`idQuestao`, `idAluno`, `idDisciplina`, `idEscola`, `resposta1`, `resposta2`, `resposta3`, `resposta4`, `resposta5`, `resposta6`, `resposta7`, `resposta8`, `resposta9`, `resposta10`, `resposta11`, `resposta12`, `resposta13`, `resposta14`, `resposta15`, `resposta16`, `resposta17`, `resposta18`, `resposta19`, `resposta20`) VALUES
(1, 1, 5, 1, 'C', 'D', 'C', 'D', 'B', 'A', 'D', 'C', 'D', 'A', 'B', 'B', 'A', 'C', 'C', 'D', 'A', 'A', 'A', 'A'),
(2, 2, 5, 1, 'C', 'C', 'B', 'C', 'A', 'A', 'B', 'B', 'C', 'D', 'C', 'A', 'B', 'B', 'A', 'C', 'A', 'C', 'B', 'B'),
(3, 3, 5, 1, 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A'),
(4, 4, 5, 1, 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A'),
(5, 5, 5, 1, 'B', 'D', 'C', 'D', 'B', 'A', 'C', 'B', 'D', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'X'),
(6, 6, 5, 1, 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A'),
(7, 7, 5, 1, 'B', 'D', 'C', 'D', 'B', 'A', 'C', 'B', 'D', 'A', 'D', 'B', 'A', 'D', 'C', 'D', 'X', 'X', 'X', 'X'),
(8, 18, 1, 2, 'B', 'C', 'A', 'A', 'A', 'A', 'A', 'A', 'C', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A'),
(26, 37, 2, 2, 'B', 'C', 'D', 'D', 'D', 'A', 'B', 'B', 'A', 'B', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A'),
(27, 36, 1, 2, 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A'),
(28, 44, 2, 2, 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A');

-- --------------------------------------------------------

--
-- Estrutura para tabela `resultado_lp`
--

CREATE TABLE `resultado_lp` (
  `idResultado` int(11) NOT NULL,
  `idAluno` int(11) NOT NULL,
  `idDisciplina` int(11) NOT NULL,
  `idClasse` int(11) NOT NULL,
  `idEscola` int(11) NOT NULL,
  `acertos` int(11) NOT NULL,
  `erros` int(11) NOT NULL,
  `pontuacaoAluno` int(11) NOT NULL,
  `classificacao` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `resultado_lp`
--

INSERT INTO `resultado_lp` (`idResultado`, `idAluno`, `idDisciplina`, `idClasse`, `idEscola`, `acertos`, `erros`, `pontuacaoAluno`, `classificacao`) VALUES
(8, 1, 5, 13, 1, 11, 9, 55, 'Regular'),
(9, 2, 5, 13, 1, 2, 18, 10, 'Insatisfatório'),
(10, 3, 5, 13, 1, 3, 17, 15, 'Insatisfatório'),
(11, 4, 5, 13, 1, 3, 17, 15, 'Insatisfatório'),
(12, 5, 5, 13, 1, 12, 8, 60, 'Regular'),
(13, 6, 5, 13, 1, 3, 17, 15, 'Insatisfatório'),
(14, 7, 5, 13, 1, 20, 0, 100, 'Plenamente Satisfatório'),
(15, 18, 1, 16, 2, 3, 17, 15, 'Insatisfatório'),
(16, 36, 1, 16, 2, 5, 15, 25, 'Insatisfatório'),
(17, 37, 2, 19, 2, 5, 15, 25, 'Insatisfatório'),
(18, 44, 2, 19, 2, 4, 16, 20, 'Insatisfatório');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`idAluno`),
  ADD KEY `idClasse` (`idClasse`),
  ADD KEY `idEscola` (`idEscola`);

--
-- Índices de tabela `alunodisciplina`
--
ALTER TABLE `alunodisciplina`
  ADD PRIMARY KEY (`idAluno`,`idDisciplina`),
  ADD KEY `idDisciplina` (`idDisciplina`);

--
-- Índices de tabela `autentic`
--
ALTER TABLE `autentic`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`email`);

--
-- Índices de tabela `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`idClasse`),
  ADD KEY `idEscola` (`idEscola`);

--
-- Índices de tabela `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`idDisciplina`),
  ADD UNIQUE KEY `nomeDisciplina` (`nomeDisciplina`);

--
-- Índices de tabela `escola`
--
ALTER TABLE `escola`
  ADD PRIMARY KEY (`idEscola`),
  ADD UNIQUE KEY `nomeEscola` (`nomeEscola`);

--
-- Índices de tabela `gabarito`
--
ALTER TABLE `gabarito`
  ADD PRIMARY KEY (`idGabarito`),
  ADD KEY `idDisciplina` (`idDisciplina`);

--
-- Índices de tabela `questoes_lp`
--
ALTER TABLE `questoes_lp`
  ADD PRIMARY KEY (`idQuestao`),
  ADD KEY `idAluno` (`idAluno`),
  ADD KEY `idDisciplina` (`idDisciplina`),
  ADD KEY `idEscola` (`idEscola`);

--
-- Índices de tabela `resultado_lp`
--
ALTER TABLE `resultado_lp`
  ADD PRIMARY KEY (`idResultado`),
  ADD KEY `idAluno` (`idAluno`),
  ADD KEY `idDisciplina` (`idDisciplina`),
  ADD KEY `idClasse` (`idClasse`),
  ADD KEY `idEscola` (`idEscola`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aluno`
--
ALTER TABLE `aluno`
  MODIFY `idAluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT de tabela `autentic`
--
ALTER TABLE `autentic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `classe`
--
ALTER TABLE `classe`
  MODIFY `idClasse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT de tabela `disciplina`
--
ALTER TABLE `disciplina`
  MODIFY `idDisciplina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `escola`
--
ALTER TABLE `escola`
  MODIFY `idEscola` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `gabarito`
--
ALTER TABLE `gabarito`
  MODIFY `idGabarito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `questoes_lp`
--
ALTER TABLE `questoes_lp`
  MODIFY `idQuestao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `resultado_lp`
--
ALTER TABLE `resultado_lp`
  MODIFY `idResultado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `aluno_ibfk_1` FOREIGN KEY (`idClasse`) REFERENCES `classe` (`idClasse`),
  ADD CONSTRAINT `aluno_ibfk_2` FOREIGN KEY (`idEscola`) REFERENCES `escola` (`idEscola`);

--
-- Restrições para tabelas `alunodisciplina`
--
ALTER TABLE `alunodisciplina`
  ADD CONSTRAINT `alunodisciplina_ibfk_1` FOREIGN KEY (`idAluno`) REFERENCES `aluno` (`idAluno`) ON DELETE CASCADE,
  ADD CONSTRAINT `alunodisciplina_ibfk_2` FOREIGN KEY (`idDisciplina`) REFERENCES `disciplina` (`idDisciplina`) ON DELETE CASCADE;

--
-- Restrições para tabelas `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `classe_ibfk_1` FOREIGN KEY (`idEscola`) REFERENCES `escola` (`idEscola`);

--
-- Restrições para tabelas `gabarito`
--
ALTER TABLE `gabarito`
  ADD CONSTRAINT `gabarito_ibfk_1` FOREIGN KEY (`idDisciplina`) REFERENCES `disciplina` (`idDisciplina`);

--
-- Restrições para tabelas `questoes_lp`
--
ALTER TABLE `questoes_lp`
  ADD CONSTRAINT `questoes_lp_ibfk_1` FOREIGN KEY (`idAluno`) REFERENCES `aluno` (`idAluno`),
  ADD CONSTRAINT `questoes_lp_ibfk_2` FOREIGN KEY (`idDisciplina`) REFERENCES `disciplina` (`idDisciplina`),
  ADD CONSTRAINT `questoes_lp_ibfk_3` FOREIGN KEY (`idEscola`) REFERENCES `escola` (`idEscola`);

--
-- Restrições para tabelas `resultado_lp`
--
ALTER TABLE `resultado_lp`
  ADD CONSTRAINT `resultado_lp_ibfk_1` FOREIGN KEY (`idAluno`) REFERENCES `aluno` (`idAluno`),
  ADD CONSTRAINT `resultado_lp_ibfk_2` FOREIGN KEY (`idDisciplina`) REFERENCES `disciplina` (`idDisciplina`),
  ADD CONSTRAINT `resultado_lp_ibfk_3` FOREIGN KEY (`idClasse`) REFERENCES `classe` (`idClasse`),
  ADD CONSTRAINT `resultado_lp_ibfk_4` FOREIGN KEY (`idEscola`) REFERENCES `escola` (`idEscola`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
