-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 10 2020 г., 16:37
-- Версия сервера: 5.7.25
-- Версия PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `tdna2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`, `parent_id`) VALUES
(1, 'транспотрные средства', 0),
(2, 'автомобили', 1),
(3, 'Япония\r\n', 2),
(4, 'Европа', 2),
(5, 'США', 2),
(6, 'передний привод', 3),
(7, 'задний привод', 4),
(8, 'бензин', 4),
(9, 'дизель', 2),
(10, 'электричество', 2),
(11, 'полный привод', 2),
(12, 'седан', 4),
(13, 'хэтчбек', 4),
(14, 'бензин', 3),
(15, 'седан', 3),
(16, 'SUV', 3),
(17, 'бензин', 5),
(18, 'SUV', 5),
(19, 'электричество', 5),
(20, 'мото', 1),
(21, 'Европа', 20),
(22, 'США', 20),
(23, 'Индия', 20),
(24, 'бензин', 21),
(25, 'до 200 кг', 21),
(26, 'naked bike', 21),
(27, 'дорожный байк', 21),
(28, 'спорт байк', 21),
(29, 'электро байк', 22);

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `name`, `price`) VALUES
(1, 'KTM Duke 390', '4790.90'),
(2, 'BMW 320', '30090.30'),
(3, 'Volkswagen Golf', '21599.99'),
(4, 'BMW GS310', '13000.00'),
(5, 'Honda Accord', '21569.19'),
(6, 'Harley Davidson Livewire', '30500.50'),
(7, 'Suzuki Jimny', '21700.70'),
(9, 'Ford Raptor', '90000.90'),
(10, 'Buick Encore', '12000.12'),
(12, 'Ducati monster 696', '25000.25'),
(13, 'Aprilia rsv4', '17000.17');

-- --------------------------------------------------------

--
-- Структура таблицы `product_to_category`
--

CREATE TABLE `product_to_category` (
  `product_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_to_category`
--

INSERT INTO `product_to_category` (`product_id`, `category_id`) VALUES
(2, 7),
(2, 8),
(2, 12),
(3, 6),
(3, 9),
(3, 13),
(5, 14),
(5, 15),
(7, 14),
(7, 16),
(9, 17),
(9, 18),
(10, 19),
(10, 18),
(10, 17),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(4, 24),
(4, 25),
(4, 27),
(6, 29),
(12, 24),
(12, 28),
(13, 28),
(13, 24);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
