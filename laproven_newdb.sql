-- phpMyAdmin SQL Dump
-- version 4.0.10.12
-- http://www.phpmyadmin.net
--
-- Хост: laproven.mysql.ukraine.com.ua
-- Время создания: Июл 11 2016 г., 10:33
-- Версия сервера: 5.6.27-75.0-log
-- Версия PHP: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `laproven_newdb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Block_Widget`
--

CREATE TABLE IF NOT EXISTS `Block_Widget` (
  `Block_Widget_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Catalogue_ID` int(11) NOT NULL,
  `Priority` int(11) NOT NULL,
  `Checked` smallint(6) NOT NULL DEFAULT '1',
  `Widget_ID` int(11) NOT NULL,
  `Widget_Class_ID` int(11) NOT NULL,
  `Block_Key` varchar(64) NOT NULL DEFAULT '',
  `LastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Widget_Settings` text,
  PRIMARY KEY (`Block_Widget_ID`),
  KEY `Catalogue_ID` (`Catalogue_ID`),
  KEY `Block_Key` (`Block_Key`),
  KEY `Widget_ID` (`Widget_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `Catalogue`
--

CREATE TABLE IF NOT EXISTS `Catalogue` (
  `Catalogue_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Catalogue_Name` varchar(255) NOT NULL DEFAULT '',
  `Domain` varchar(128) NOT NULL DEFAULT '',
  `Template_ID` int(11) NOT NULL DEFAULT '1',
  `TemplateSettings` text,
  `Read_Access_ID` int(11) NOT NULL DEFAULT '0',
  `Write_Access_ID` int(11) NOT NULL DEFAULT '0',
  `Mirrors` text NOT NULL,
  `Priority` int(11) DEFAULT NULL,
  `Checked` smallint(6) NOT NULL DEFAULT '0',
  `Edit_Access_ID` int(11) NOT NULL DEFAULT '0',
  `Checked_Access_ID` int(11) NOT NULL DEFAULT '0',
  `Delete_Access_ID` int(11) NOT NULL DEFAULT '0',
  `Subscribe_Access_ID` int(11) NOT NULL DEFAULT '0',
  `Moderation_ID` int(11) NOT NULL DEFAULT '0',
  `Title_Sub_ID` int(11) NOT NULL DEFAULT '0',
  `E404_Sub_ID` int(11) NOT NULL DEFAULT '0',
  `Created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastModified` datetime DEFAULT NULL,
  `LastModifiedType` int(11) DEFAULT '1',
  `Robots` text,
  `DisallowIndexing` int(11) DEFAULT '0',
  `Description` text,
  `Keywords` text,
  `Language` varchar(255) NOT NULL DEFAULT 'en',
  `ncOfflineText` text,
  `ncMobile` int(1) DEFAULT NULL,
  `ncMobileSrc` int(4) DEFAULT NULL,
  `ncMobileRedirect` int(1) DEFAULT NULL,
  `ncMobileIdentity` varchar(255) NOT NULL DEFAULT 'ncUserScreen',
  `ncResponsive` int(1) unsigned NOT NULL DEFAULT '0',
  `DisplayType` enum('traditional','shortpage','longpage_vertical','longpage_horizontal') NOT NULL DEFAULT 'traditional',
  `DemoMode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Cache_Access_ID` int(11) unsigned NOT NULL DEFAULT '2',
  `Cache_Lifetime` int(11) unsigned NOT NULL DEFAULT '60',
  `Comment_Rule_ID` int(11) NOT NULL DEFAULT '0',
  `SitemapPriority` float DEFAULT '0.5',
  `SitemapChangefreq` enum('always','hourly','daily','weekly','monthly','yearly','never') DEFAULT 'daily',
  `IncludeInSitemap` int(11) DEFAULT '1',
  `linkVK` char(255) DEFAULT NULL,
  `linkOK` char(255) DEFAULT NULL,
  `linkFB` char(255) DEFAULT NULL,
  `linkIG` char(255) DEFAULT NULL,
  `Contacts` longtext,
  `OperatorEmail` char(255) DEFAULT NULL,
  `OrderEmail` char(255) DEFAULT NULL,
  PRIMARY KEY (`Catalogue_ID`),
  UNIQUE KEY `Domain` (`Domain`),
  KEY `Checked` (`Checked`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `Catalogue`
--

INSERT INTO `Catalogue` (`Catalogue_ID`, `Catalogue_Name`, `Domain`, `Template_ID`, `TemplateSettings`, `Read_Access_ID`, `Write_Access_ID`, `Mirrors`, `Priority`, `Checked`, `Edit_Access_ID`, `Checked_Access_ID`, `Delete_Access_ID`, `Subscribe_Access_ID`, `Moderation_ID`, `Title_Sub_ID`, `E404_Sub_ID`, `Created`, `LastUpdated`, `LastModified`, `LastModifiedType`, `Robots`, `DisallowIndexing`, `Description`, `Keywords`, `Language`, `ncOfflineText`, `ncMobile`, `ncMobileSrc`, `ncMobileRedirect`, `ncMobileIdentity`, `ncResponsive`, `DisplayType`, `DemoMode`, `Cache_Access_ID`, `Cache_Lifetime`, `Comment_Rule_ID`, `SitemapPriority`, `SitemapChangefreq`, `IncludeInSitemap`, `linkVK`, `linkOK`, `linkFB`, `linkIG`, `Contacts`, `OperatorEmail`, `OrderEmail`) VALUES
(1, 'LaProvance', 'new.laprovence.com.ua', 2, '', 1, 3, '', 0, 1, 3, 3, 3, 0, 1, 1, 2, '2016-07-03 09:56:34', '2016-07-09 10:49:38', NULL, 1, '# NetCat Robots file\r\nUser-agent: *\r\nDisallow: /install/\r\nSitemap: /sitemap.xml', 0, NULL, NULL, 'ru', '', 0, 0, 0, '0', 0, 'traditional', 0, 2, 60, 0, 0.5, 'daily', 1, 'http://vk.com/23423', 'http://ok.ru', 'http://facebook.com', 'http://instagram.com', '<ul class="contact">\r\n<li class="title">Контакты</li>\r\n<li>Тел: 067 971 22 33</li>\r\n<li>Тел: 096 704 62 13</li>\r\n<li class="adress">Украина, г. Кривой Рог, пр.Мира, д. 27</li></ul>', 'test@mail.ru', 'test@mail.ru');

-- --------------------------------------------------------

--
-- Структура таблицы `Class`
--

CREATE TABLE IF NOT EXISTS `Class` (
  `Class_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Class_Name` varchar(255) NOT NULL DEFAULT '',
  `Class_Group` varchar(64) NOT NULL DEFAULT 'Main',
  `Keyword` varchar(64) NOT NULL DEFAULT '',
  `DaysToHold` int(11) NOT NULL DEFAULT '0',
  `AllowTags` smallint(6) NOT NULL DEFAULT '0',
  `FormPrefix` text,
  `FormSuffix` text,
  `RecordTemplate` text,
  `RecordsPerPage` int(11) NOT NULL DEFAULT '20',
  `SortBy` varchar(255) NOT NULL DEFAULT '',
  `RecordTemplateFull` text,
  `TitleTemplate` varchar(255) DEFAULT NULL,
  `TitleList` varchar(255) DEFAULT NULL,
  `UseAltTitle` tinyint(4) DEFAULT '0',
  `AddTemplate` text NOT NULL,
  `EditTemplate` text NOT NULL,
  `AddActionTemplate` text NOT NULL,
  `EditActionTemplate` text NOT NULL,
  `SearchTemplate` text NOT NULL,
  `FullSearchTemplate` text NOT NULL,
  `SubscribeTemplate` text NOT NULL,
  `System_Table_ID` int(11) NOT NULL DEFAULT '0',
  `Settings` text NOT NULL,
  `AddCond` text NOT NULL,
  `EditCond` text NOT NULL,
  `SubscribeCond` text NOT NULL,
  `DeleteCond` text NOT NULL,
  `NL2BR` tinyint(4) NOT NULL DEFAULT '1',
  `UseCaptcha` tinyint(4) NOT NULL DEFAULT '0',
  `CheckActionTemplate` text NOT NULL,
  `DeleteActionTemplate` text NOT NULL,
  `CustomSettingsTemplate` text,
  `ClassDescription` text,
  `DeleteTemplate` text NOT NULL,
  `ClassTemplate` int(10) unsigned NOT NULL DEFAULT '0',
  `Type` enum('rss','useful','admin_mode','inside_admin','xml','trash','title','mobile','multi_edit','responsive') DEFAULT 'useful',
  `File_Mode` tinyint(1) NOT NULL DEFAULT '0',
  `File_Path` varchar(255) DEFAULT NULL,
  `File_Hash` char(32) NOT NULL DEFAULT '',
  `Priority` int(11) NOT NULL DEFAULT '0',
  `FieldsInTableView` text NOT NULL,
  `IsAuxiliary` tinyint(1) NOT NULL DEFAULT '0',
  `CacheForUser` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Class_ID`),
  KEY `Class_Group` (`Class_Group`),
  KEY `ClassTemplate` (`ClassTemplate`),
  KEY `Keyword` (`Keyword`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Дамп данных таблицы `Class`
--

INSERT INTO `Class` (`Class_ID`, `Class_Name`, `Class_Group`, `Keyword`, `DaysToHold`, `AllowTags`, `FormPrefix`, `FormSuffix`, `RecordTemplate`, `RecordsPerPage`, `SortBy`, `RecordTemplateFull`, `TitleTemplate`, `TitleList`, `UseAltTitle`, `AddTemplate`, `EditTemplate`, `AddActionTemplate`, `EditActionTemplate`, `SearchTemplate`, `FullSearchTemplate`, `SubscribeTemplate`, `System_Table_ID`, `Settings`, `AddCond`, `EditCond`, `SubscribeCond`, `DeleteCond`, `NL2BR`, `UseCaptcha`, `CheckActionTemplate`, `DeleteActionTemplate`, `CustomSettingsTemplate`, `ClassDescription`, `DeleteTemplate`, `ClassTemplate`, `Type`, `File_Mode`, `File_Path`, `File_Hash`, `Priority`, `FieldsInTableView`, `IsAuxiliary`, `CacheForUser`) VALUES
(25, 'Режим администрирования', 'Шаблоны компонентов', '', 0, 0, NULL, NULL, NULL, 0, '', NULL, '', '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, '', '', '', '', '', 24, 'inside_admin', 1, '/24/25/', 'fb359e4910469b8384fda69442d13a77', 0, '', 0, 0),
(23, 'Поиск', 'Шаблоны компонентов', '', 0, 0, NULL, NULL, NULL, 10, '', NULL, '', '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, '', '', '', '', '', 8, 'useful', 1, '/8/23/', 'd6daca267e6fd4a5dfa2f30687fbc4f2', 0, '', 0, 0),
(22, 'Скидки на главную', 'Шаблоны компонентов', '', 0, 0, NULL, NULL, NULL, 4, 'RAND()', NULL, '', '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, '', '', '', '', '', 8, 'useful', 1, '/8/22/', '122da845f3cece118e79c8b9c13bf2ae', 0, '', 0, 0),
(4, 'Статья', 'Базовые', '', 0, 0, NULL, NULL, NULL, 20, '', NULL, '', '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, '', '', '', '', '', 0, 'useful', 1, '/4/', '63ae21b85a832466d445eba8ad606a12', 0, '', 0, 0),
(8, 'Товар', 'Базовые', '', 0, 0, NULL, NULL, NULL, 10, '', NULL, '$f_Name', '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, '', '', '', '', '', 0, 'useful', 1, '/8/', '43de4608a38e78902c71daa500c14cb7', 0, '', 0, 0),
(11, 'Контакты', 'Базовые', '', 0, 0, NULL, NULL, NULL, 20, '', NULL, '', '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, '', '', '', '', '', 0, 'useful', 1, '/11/', '0fa5dec2611151d16f6be30934a13013', 0, '', 0, 0),
(17, 'Новости', 'Базовые', '', 0, 0, NULL, NULL, NULL, 10, '', NULL, '$f_Name', '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, '', '', '', '', '', 0, 'useful', 1, '/17/', '2bdef295320027c5109f3384348f1a23', 0, '', 0, 0),
(24, 'Заказ', 'Базовые', '', 0, 0, NULL, NULL, NULL, 20, '', NULL, '', '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, '', '', '', '', '', 0, 'useful', 1, '/24/', 'b438f542f805d90618106c8435c51e5c', 0, '', 0, 0),
(26, 'Баннер [ новый ]', 'Базовые', '', 0, 0, NULL, NULL, NULL, 20, '', NULL, '', '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, '', '', '', '', '', 0, 'useful', 1, '/26/', '47a9d112e6c29ffd0c5b2be0a872b736', 0, '', 0, 0),
(2, 'Режим администрирования', 'Шаблоны компонентов', '', 0, 0, NULL, NULL, NULL, 0, '', NULL, '', '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, '', '', '', '', '', 1, 'inside_admin', 1, '/1/2/', 'd77aa10474792e4181166ad7c1df4530', 0, '', 0, 0),
(3, 'Для корзины удаленных объектов', 'Шаблоны компонентов', '', 0, 0, NULL, NULL, NULL, 0, '', NULL, '', '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, '', '', '', '', '', 1, 'trash', 1, '/1/3/', '45cc7f1796dff583a63384e3dbc79fe2', 0, '', 0, 0),
(5, 'Режим администрирования', 'Шаблоны компонентов', '', 0, 0, NULL, NULL, NULL, 0, '', NULL, '', '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, '', '', '', '', '', 4, 'inside_admin', 1, '/4/5/', '9dec17eaf97280f43e42eb8e389759a8', 0, '', 0, 0),
(6, 'Для корзины удаленных объектов', 'Шаблоны компонентов', '', 0, 0, NULL, NULL, NULL, 0, '', NULL, '', '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, '', '', '', '', '', 4, 'trash', 1, '/4/6/', '45cc7f1796dff583a63384e3dbc79fe2', 0, '', 0, 0),
(7, 'На главной', 'Шаблоны компонентов', '', 0, 0, NULL, NULL, NULL, 1, '', NULL, '', '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, '', '', '', '', '', 4, 'useful', 1, '/4/7/', 'dba62d8e83f9c438288214a5393edf08', 0, '', 0, 0),
(9, 'Режим администрирования', 'Шаблоны компонентов', '', 0, 0, NULL, NULL, NULL, 0, '', NULL, '', '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, '', '', '', '', '', 8, 'inside_admin', 1, '/8/9/', '61a029e3fbc62ab9b6d1ed667eef400a', 0, '', 0, 0),
(10, 'Для корзины удаленных объектов', 'Шаблоны компонентов', '', 0, 0, NULL, NULL, NULL, 0, '', NULL, '', '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, '', '', '', '', '', 8, 'trash', 1, '/8/10/', '45cc7f1796dff583a63384e3dbc79fe2', 0, '', 0, 0),
(12, 'Режим администрирования', 'Шаблоны компонентов', '', 0, 0, NULL, NULL, NULL, 0, '', NULL, '', '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, '', '', '', '', '', 11, 'inside_admin', 1, '/11/12/', '4daa9a465503b30f5c158457794ae95a', 0, '', 0, 0),
(13, 'Для корзины удаленных объектов', 'Шаблоны компонентов', '', 0, 0, NULL, NULL, NULL, 0, '', NULL, '', '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, '', '', '', '', '', 11, 'trash', 1, '/11/13/', '45cc7f1796dff583a63384e3dbc79fe2', 0, '', 0, 0),
(14, 'Корень каталога', 'Шаблоны компонентов', '', 0, 0, NULL, NULL, NULL, 10, '', NULL, '', '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, '', '', '', '', '', 8, 'useful', 1, '/8/14/', 'b3429e904b7260d9d9e136c2868ae76e', 0, '', 0, 0),
(15, 'Корень группы', 'Шаблоны компонентов', '', 0, 0, NULL, NULL, NULL, 10, '', NULL, '', '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, '', '', '', '', '', 8, 'useful', 1, '/8/15/', 'f51da4b0e6c427daf98d290f8247a09f', 0, '', 0, 0),
(16, 'Скидки', 'Шаблоны компонентов', '', 0, 0, NULL, NULL, NULL, 10, '', NULL, '', '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, '', '', '', '', '', 8, 'useful', 1, '/8/16/', '04df3f7d09eb8aedfb84be453b9621e8', 0, '', 0, 0),
(18, 'Режим администрирования', 'Шаблоны компонентов', '', 0, 0, NULL, NULL, NULL, 0, '', NULL, '', '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, '', '', '', '', '', 17, 'inside_admin', 1, '/17/18/', '4daa9a465503b30f5c158457794ae95a', 0, '', 0, 0),
(19, 'Для корзины удаленных объектов', 'Шаблоны компонентов', '', 0, 0, NULL, NULL, NULL, 0, '', NULL, '', '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, '', '', '', '', '', 17, 'trash', 1, '/17/19/', '45cc7f1796dff583a63384e3dbc79fe2', 0, '', 0, 0),
(21, 'Новинки на главную', 'Шаблоны компонентов', '', 0, 0, NULL, NULL, NULL, 4, 'RAND()', NULL, '', '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, '', '', '', '', '', 8, 'useful', 1, '/8/21/', 'e38b561e0e1add23e05a10efb5d18acd', 0, '', 0, 0),
(1, 'Баннер', 'Базовые', '', 0, 0, NULL, NULL, NULL, 20, '', NULL, '', '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, '', '', '', '', '', 0, 'useful', 1, '/1/', 'f23ac9d759d4cfaa43087a9b88058857', 0, '', 0, 0),
(27, 'Режим администрирования', 'Шаблоны компонентов', '', 0, 0, NULL, NULL, NULL, 0, '', NULL, '', '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, '', '', '', '', '', 26, 'inside_admin', 1, '/26/27/', 'ac40552ebcb49a7f6e8b02f3a9ee14af', 0, '', 0, 0),
(28, 'Для корзины удаленных объектов', 'Шаблоны компонентов', '', 0, 0, NULL, NULL, NULL, 0, '', NULL, '', '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, '', '', '', '', '', 26, 'trash', 1, '/26/28/', '45cc7f1796dff583a63384e3dbc79fe2', 0, '', 0, 0),
(29, 'Вывод на внутреннюю', 'Шаблоны компонентов', '', 0, 0, NULL, NULL, NULL, 0, '', NULL, '', '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', 0, 0, '', '', '', '', '', 17, 'useful', 1, '/17/29/', '75b3c43b625060eea0ba1a5a22356ec2', 0, '', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `Classificator`
--

CREATE TABLE IF NOT EXISTS `Classificator` (
  `Classificator_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Classificator_Name` char(32) NOT NULL DEFAULT '',
  `Table_Name` char(32) NOT NULL DEFAULT '',
  `System` smallint(6) NOT NULL DEFAULT '0',
  `Sort_Type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Sort_Direction` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Classificator_ID`),
  UNIQUE KEY `Table_Name` (`Table_Name`),
  KEY `System` (`System`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `Classificator`
--

INSERT INTO `Classificator` (`Classificator_ID`, `Classificator_Name`, `Table_Name`, `System`, `Sort_Type`, `Sort_Direction`) VALUES
(1, 'Тип данных', 'TypeOfData', 1, 0, 0),
(2, 'Публикация объектов', 'TypeOfModeration', 1, 0, 0),
(3, 'Тип прав', 'TypeOfRight', 1, 0, 0),
(4, 'Группы пользователей', 'UserGroup', 1, 0, 0),
(5, 'Тип редактирования поля', 'TypeOfEdit', 1, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `Classificator_TypeOfData`
--

CREATE TABLE IF NOT EXISTS `Classificator_TypeOfData` (
  `TypeOfData_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TypeOfData_Name` char(64) NOT NULL DEFAULT '',
  `TypeOfData_Priority` int(11) DEFAULT NULL,
  `Value` text,
  `Checked` int(1) DEFAULT '1',
  PRIMARY KEY (`TypeOfData_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `Classificator_TypeOfData`
--

INSERT INTO `Classificator_TypeOfData` (`TypeOfData_ID`, `TypeOfData_Name`, `TypeOfData_Priority`, `Value`, `Checked`) VALUES
(1, 'Строка', 1, NULL, 1),
(2, 'Целое число', 2, NULL, 1),
(3, 'Текстовый блок', 3, NULL, 1),
(4, 'Список', 4, NULL, 1),
(5, 'Логическая переменная (истина или ложь)', 5, NULL, 1),
(6, 'Файл', 6, NULL, 1),
(7, 'Число с плавающей запятой', 7, NULL, 1),
(8, 'Дата и время', 8, NULL, 1),
(9, 'Множественный список', 9, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Classificator_TypeOfEdit`
--

CREATE TABLE IF NOT EXISTS `Classificator_TypeOfEdit` (
  `TypeOfEdit_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TypeOfEdit_Name` char(64) NOT NULL DEFAULT '',
  `TypeOfEdit_Priority` int(11) DEFAULT NULL,
  `Value` text,
  `Checked` int(1) DEFAULT '1',
  PRIMARY KEY (`TypeOfEdit_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `Classificator_TypeOfEdit`
--

INSERT INTO `Classificator_TypeOfEdit` (`TypeOfEdit_ID`, `TypeOfEdit_Name`, `TypeOfEdit_Priority`, `Value`, `Checked`) VALUES
(1, 'Доступно всем', 1, NULL, 1),
(2, 'Доступно только администраторам', 2, NULL, 1),
(3, 'Недоступно никому', 3, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Classificator_TypeOfModeration`
--

CREATE TABLE IF NOT EXISTS `Classificator_TypeOfModeration` (
  `TypeOfModeration_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TypeOfModeration_Name` char(64) NOT NULL DEFAULT '',
  `TypeOfModeration_Priority` int(11) DEFAULT NULL,
  `Value` text,
  `Checked` int(1) DEFAULT '1',
  PRIMARY KEY (`TypeOfModeration_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `Classificator_TypeOfModeration`
--

INSERT INTO `Classificator_TypeOfModeration` (`TypeOfModeration_ID`, `TypeOfModeration_Name`, `TypeOfModeration_Priority`, `Value`, `Checked`) VALUES
(1, 'после добавления', 1, NULL, 1),
(2, 'после проверки администратором', 2, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Classificator_TypeOfRight`
--

CREATE TABLE IF NOT EXISTS `Classificator_TypeOfRight` (
  `TypeOfRight_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TypeOfRight_Name` char(64) NOT NULL DEFAULT '',
  `TypeOfRight_Priority` int(11) DEFAULT NULL,
  `Value` text,
  `Checked` int(1) DEFAULT '1',
  PRIMARY KEY (`TypeOfRight_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `Classificator_TypeOfRight`
--

INSERT INTO `Classificator_TypeOfRight` (`TypeOfRight_ID`, `TypeOfRight_Name`, `TypeOfRight_Priority`, `Value`, `Checked`) VALUES
(1, 'Директор', 1, NULL, 1),
(2, 'Супервизор', 2, NULL, 1),
(3, 'Администратор', 3, NULL, 1),
(4, 'Модератор', 4, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Classificator_UserGroup`
--

CREATE TABLE IF NOT EXISTS `Classificator_UserGroup` (
  `UserGroup_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserGroup_Name` char(64) NOT NULL DEFAULT '',
  `UserGroup_Priority` int(11) DEFAULT NULL,
  `Value` text,
  `Checked` int(1) DEFAULT '1',
  PRIMARY KEY (`UserGroup_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `Classificator_UserGroup`
--

INSERT INTO `Classificator_UserGroup` (`UserGroup_ID`, `UserGroup_Name`, `UserGroup_Priority`, `Value`, `Checked`) VALUES
(1, 'все', 1, NULL, 1),
(2, 'зарегистрированные', 2, NULL, 1),
(3, 'уполномоченные', 3, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Component_Revisions`
--

CREATE TABLE IF NOT EXISTS `Component_Revisions` (
  `Revision_ID` int(11) NOT NULL AUTO_INCREMENT,
  `File` varchar(255) NOT NULL DEFAULT '',
  `Subdivision_ID` int(11) NOT NULL DEFAULT '0',
  `Class_ID` int(11) NOT NULL DEFAULT '0',
  `Sub_Class_ID` int(11) NOT NULL DEFAULT '0',
  `Message_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`Revision_ID`),
  KEY `Subdivision_ID` (`Subdivision_ID`),
  KEY `Class_ID` (`Class_ID`),
  KEY `Sub_Class_ID` (`Sub_Class_ID`),
  KEY `Message_ID` (`Message_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `CronTasks`
--

CREATE TABLE IF NOT EXISTS `CronTasks` (
  `Cron_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Cron_Minutes` int(10) unsigned NOT NULL DEFAULT '0',
  `Cron_Hours` int(10) unsigned NOT NULL DEFAULT '0',
  `Cron_Days` int(10) unsigned NOT NULL DEFAULT '0',
  `Cron_Months` int(10) unsigned NOT NULL DEFAULT '0',
  `Cron_Weekdays` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Cron_Script_URL` varchar(255) NOT NULL DEFAULT '',
  `Cron_Launch` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`Cron_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `CronTasks`
--

INSERT INTO `CronTasks` (`Cron_ID`, `Cron_Minutes`, `Cron_Hours`, `Cron_Days`, `Cron_Months`, `Cron_Weekdays`, `Cron_Script_URL`, `Cron_Launch`) VALUES
(1, 1, 0, 0, 0, 0, '/netcat/admin/mailer.php?number=50', 1147433797);

-- --------------------------------------------------------

--
-- Структура таблицы `Csv_Import_History`
--

CREATE TABLE IF NOT EXISTS `Csv_Import_History` (
  `History_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Class_ID` int(11) NOT NULL DEFAULT '0',
  `Created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Rollbacked` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`History_ID`),
  KEY `Class_ID` (`Class_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `Csv_Import_History_Ids`
--

CREATE TABLE IF NOT EXISTS `Csv_Import_History_Ids` (
  `History_ID` int(11) NOT NULL DEFAULT '0',
  `Message_ID` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `History_ID` (`History_ID`),
  KEY `Message_ID` (`Message_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Documentation`
--

CREATE TABLE IF NOT EXISTS `Documentation` (
  `Documentation_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Type` enum('function','variable','macros','method','static') NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Signature` text NOT NULL,
  `ShortHelp` text NOT NULL,
  `FullHelp` text NOT NULL,
  `Module_ID` int(11) DEFAULT NULL,
  `Parent` varchar(255) NOT NULL,
  `Areas` varchar(255) NOT NULL,
  PRIMARY KEY (`Documentation_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=93 ;

--
-- Дамп данных таблицы `Documentation`
--

INSERT INTO `Documentation` (`Documentation_ID`, `Type`, `Name`, `Signature`, `ShortHelp`, `FullHelp`, `Module_ID`, `Parent`, `Areas`) VALUES
(1, 'function', 'browse_messages', 'browse_messages ( $cc_env, $range )', '<p>\r\n	Отображает блок навигации по страницам списка объектов компонента в формате «1 2 3 &gt;&gt;».</p>', '<p>Массив $cc_env является неизменным параметром данной функции и содержит переменные окружения текущего компонента раздела. Параметр $range определяет количество выводимых страниц. Вместо этой переменной обычно пишется число. Подразумевается, что из множества страниц одновременно будет показываться только список из $range страниц. Например, ваш листинг состоит из 20 страниц. Если $range=10, то, находясь на первой странице, вы будете видеть страницы с 1 по 10, находясь на 15-й странице, вы будете видеть страницы 10-20. Для настройки формата отображения используется массив $browse_msg[], значения которого указываются в настройках макета дизайна. Макропеременная %PAGE обозначает номер страницы, макропеременная %URL – ссылку на соответствующие страницы. Возможно также использование макропеременных %FROM и %TO, соответственно обозначающих номера начального и конечного объекта на странице.</p>\r\n<pre><code class=''language-php''>$browse_msg[prefix] = ""; // Префикс перед блоком навигации\r\n$browse_msg[suffix] = ""; // Суффикс после блока навигации\r\n$browse_msg[active] = "%PAGE"; // Формат вывода текущей страницы\r\n$browse_msg[unactive] = "<a href=%URL>%PAGE</a>"; // Формат вывода ссылок\r\n$browse_msg[divider] = " "; // Разделитель между ссылками</code></pre>', NULL, '', 'ClassForm_FormPrefix ClassForm_RecordTemplate ClassForm_FormSuffix ClassForm_RecordTemplateFull ClassForm_Settings'),
(2, 'function', 'nc_browse_cc', 'nc_browse_cc ( $template )', 'Выводит список ссылок по компонентам раздела в соответствии с шаблоном $template.', '', NULL, '', 'TemplateForm'),
(3, 'function', 'nc_browse_sub', 'nc_browse_sub( $browse_parent_sub, $browse_template, $ignore_check = 0, $where_cond = "", $level = 0 )', 'Выводит список подразделов раздела $parent_sub в соответствии с шаблоном $template.', 'C помощью флага $ignore_check можно игнорировать вывод только включённых разделов ( если $ignore_check равен 1, то выведутся все разделы ). С помощью $where_cond можно дополнить запрос в секции WHERE.', NULL, '', 'TemplateForm'),
(4, 'function', 'nc_browse_level', 'nc_browse_level( $level, $browse_template )', 'Выводит список разделов уровня $level в соответствии с шаблоном $template.', 'Обратите внимание, что нумерация уровней начинается с нуля, т.е. Для вывода списка разделов верхнего уровня первый параметр функции должна быть равен нулю.', NULL, '', 'TemplateForm'),
(5, 'function', 'nc_browse_path', 'nc_browse_path( $browse_template )', 'Выводит навигацию типа "хлебные крошки" (путь до текущей страницы) в соответствии с шаблоном $template.', '', NULL, '', 'TemplateForm'),
(6, 'function', 'nc_browse_catalogue', 'nc_browse_catalogue( $browse_template )', 'Функция выводит список сайтов (блок навигации) в соответствии с\r\nшаблоном, описанным в хэш-массиве $template', '<div>\r\n	Массив должен иметь&nbsp;элементы со следующими индексами:</div>\r\n<div>\r\n	<table>\r\n		<thead>\r\n			<tr>\r\n				<th scope="col">\r\n					Индексы</th>\r\n				<th scope="col">\r\n					Описание</th>\r\n			</tr>\r\n		</thead>\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					prefix</td>\r\n				<td>\r\n					выводится перед списком</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					suffix</td>\r\n				<td>\r\n					выводится после списка</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					active</td>\r\n				<td>\r\n					шаблон вывода активного элемента списка (а данном случае это&nbsp;касается текущего сайта)</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					active_link</td>\r\n				<td>\r\n					шаблон вывода активного элемента списка в том случае, если ссылка&nbsp;на этот элемент идентична адресу текущей страницы</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					unactive</td>\r\n				<td>\r\n					<div>\r\n						шаблон вывода неактивного элемента списка (в данном случае это&nbsp;касается всех сайтов, кроме текущего)</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					divider</td>\r\n				<td>\r\n					шаблон разделителя между элементами списка</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					sortby</td>\r\n				<td>\r\n					признак сортировки элементов</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<p>\r\n	&nbsp;</p>', NULL, '', 'TemplateForm'),
(7, 'function', 'nc_browse_path_range', 'nc_browse_path_range( $from, $to, $browse_template, $reverse = 0, $show = 0 )', 'Функция аналогична s_browse_path(), но выводит только путь указанного\r\nдиапазона (минимальное значение $from – (-1), максимальное значение\r\n$to - $sub_level_count), в соответствии с шаблоном, описанным в\r\nмассиве $template.', '', NULL, '', 'TemplateForm'),
(8, 'function', 'nc_put_field', 'nc_put_field (string $field_name, [string $style, [int $classID, [bool $caption]]] )', 'Функция генерирует поле любого типа.', '<div>\r\n	<table>\r\n		<thead>\r\n			<tr>\r\n				<th scope="col">\r\n					Параметры&nbsp;</th>\r\n				<th scope="col">\r\n					Описание</th>\r\n			</tr>\r\n		</thead>\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					$field_name</td>\r\n				<td>\r\n					имя поля в текущем компоненте или компоненте $classID</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$style&nbsp;(опционально)</td>\r\n				<td>\r\n					параметры отображения поля, например: «size=''50'' class=''my_field''»</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$classID&nbsp;(опционально)</td>\r\n				<td>\r\n					<div>\r\n						идентификатор компонента, используется например, при выводе&nbsp;формы через функцию s_list_class() его следует указывать, по&nbsp;умолчанию этот параметр можно не задавать</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$caption&nbsp;(опционально)</td>\r\n				<td>\r\n					<div>\r\n						выводить или не выводить описание над генерируемым полем</div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>', NULL, '', 'ClassForm_AddTemplate ClassForm_AddCond ClassForm_AddActionTemplate ClassForm_EditTemplate ClassForm_EditCond ClassForm_EditActionTemplate ClassForm_CheckActionTemplate'),
(9, 'function', 'nc_list_field', 'nc_list_field ( string $field_name, [string $style, [int $classID, [bool $caption, [mixed $selected, [mixed $disabled, [bool $ignore_check]]]]]] )', 'Функция генерирует поле типа «Список».', '<div>\r\n	<table>\r\n		<thead>\r\n			<tr>\r\n				<th scope="col">\r\n					Параметры</th>\r\n				<th scope="col">\r\n					Описание</th>\r\n			</tr>\r\n		</thead>\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					$field_name</td>\r\n				<td>\r\n					имя поля в текущем компоненте или компоненте $classID</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$style&nbsp;(опционально)</td>\r\n				<td>\r\n					<div>\r\n						параметры отображения поля, например:&nbsp;«class=''my_field''»</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$classID&nbsp;(опционально)</td>\r\n				<td>\r\n					<div>\r\n						идентификатор компонента, используется например, при выводе&nbsp;формы через функцию s_list_class() его следует указывать, по&nbsp;умолчанию этот параметр можно не задавать</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$caption&nbsp;(опционально)</td>\r\n				<td>\r\n					выводить или не выводить описание над генерируемым полем</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$selected&nbsp;(опционально)&nbsp;</td>\r\n				<td>\r\n					выбранный элемент списка</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$disabled&nbsp;(опционально)</td>\r\n				<td>\r\n					выключенный элемент списка</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$ignore_check&nbsp;(опционально)</td>\r\n				<td>\r\n					игнорировать выборку только включенных</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<p>\r\n	&nbsp;</p>', NULL, '', 'ClassForm_AddTemplate ClassForm_AddCond ClassForm_AddActionTemplate ClassForm_EditTemplate ClassForm_EditCond ClassForm_EditActionTemplate ClassForm_CheckActionTemplate'),
(10, 'function', 'nc_file_field', 'nc_file_field ( string $field_name, [string $style, [int $classID, [bool $caption]]] )', 'Функция генерирует поле типа «Файл».', '<div>\r\n	В большинстве случаев она</div>\r\n<div>\r\n	применяется в альтернативных формах компонента, чтобы вывести информацию о поле типа Файл.</div>\r\n<div>\r\n	<table>\r\n		<thead>\r\n			<tr>\r\n				<th scope="col">\r\n					Параметры</th>\r\n				<th scope="col">\r\n					Описание</th>\r\n			</tr>\r\n		</thead>\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					$field_name</td>\r\n				<td>\r\n					имя поля в текущем компоненте или компоненте $classID</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$style&nbsp;(опционально)</td>\r\n				<td>\r\n					параметры отображения поля, например:&nbsp;«size=''50''»</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$classID&nbsp;(опционально)</td>\r\n				<td>\r\n					идентификатор компонента, используется например, при выводе&nbsp;формы через функцию s_list_class() его следует указывать, по&nbsp;умолчанию этот параметр можно не задавать</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$caption&nbsp;(опционально)</td>\r\n				<td>\r\n					выводить или не выводить описание над генерируемым полем</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$selected&nbsp;(опционально)</td>\r\n				<td>\r\n					выбранный элемент списка</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$disabled&nbsp;(опционально)</td>\r\n				<td>\r\n					выключенный элемент списка</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$ignore_check&nbsp;(опционально)</td>\r\n				<td>\r\n					игнорировать выборку только включенных</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>', NULL, '', 'ClassForm_AddTemplate ClassForm_AddCond ClassForm_AddActionTemplate ClassForm_EditTemplate ClassForm_EditCond ClassForm_EditActionTemplate ClassForm_CheckActionTemplate'),
(11, 'function', 'nc_bool_field', 'nc_bool_field ( string $field_name, [string $style, [int $classID, [bool $caption]]] )', 'Функция генерирует поле типа «Логическая переменная».', '<div>\r\n	<table>\r\n		<thead>\r\n			<tr>\r\n				<th scope="col">\r\n					Параметры</th>\r\n				<th scope="col">\r\n					Описание</th>\r\n			</tr>\r\n		</thead>\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					$field_name</td>\r\n				<td>\r\n					имя поля в текущем компоненте или компоненте $classID</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$style&nbsp;(опционально)</td>\r\n				<td>\r\n					параметры отображения поля, например:&nbsp;«size=''50''»</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$classID&nbsp;(опционально)</td>\r\n				<td>\r\n					идентификатор компонента, используется например, при выводе&nbsp;формы через функцию s_list_class() его следует указывать, по&nbsp;умолчанию этот параметр можно не задавать</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$caption&nbsp;(опционально)</td>\r\n				<td>\r\n					выводить или не выводить описание над генерируемым полем</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>', NULL, '', 'ClassForm_AddTemplate ClassForm_AddCond ClassForm_AddActionTemplate ClassForm_EditTemplate ClassForm_EditCond ClassForm_EditActionTemplate ClassForm_CheckActionTemplate'),
(12, 'function', 'nc_date_field', 'nc_date_field ( string $field_name, [string $style, [int $classID, [bool $caption, [string $dateDiv, [string $timeDiv]]]]] )', 'Функция генерирует поле типа «Дата и время».', '<div>\r\n	<table>\r\n		<thead>\r\n			<tr>\r\n				<th scope="col">\r\n					Параметры</th>\r\n				<th scope="col">\r\n					Описание</th>\r\n			</tr>\r\n		</thead>\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					$field_name</td>\r\n				<td>\r\n					имя поля в текущем компоненте или компоненте $classID</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$style&nbsp;(опционально)</td>\r\n				<td>\r\n					параметры отображения поля, например:&nbsp;«size=''50''»</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$classID&nbsp;(опционально)</td>\r\n				<td>\r\n					идентификатор компонента, используется например, при выводе&nbsp;формы через функцию s_list_class() его следует указывать, по&nbsp;умолчанию этот параметр можно не задавать</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$caption&nbsp;(опционально)</td>\r\n				<td>\r\n					выводить или не выводить описание над генерируемым полем</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$dateDiv&nbsp;(опционально)</td>\r\n				<td>\r\n					разделитель полей для даты, по умолчанию "-"</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$timeDiv&nbsp;(опционально)</td>\r\n				<td>\r\n					разделитель полей для времени, по умолчанию ":"</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>', NULL, '', 'ClassForm_AddTemplate ClassForm_AddCond ClassForm_AddActionTemplate ClassForm_EditTemplate ClassForm_EditCond ClassForm_EditActionTemplate ClassForm_CheckActionTemplate'),
(13, 'function', 'nc_text_field', 'nc_text_field ( string $field_name, [string $style, [int $classID, [bool $caption, [bool $bbcode]]]] )', 'Функция генерирует поле типа «Текстовый блок».', '<div>\r\n	<table>\r\n		<thead>\r\n			<tr>\r\n				<th scope="col">\r\n					Параметры</th>\r\n				<th scope="col">\r\n					Описание</th>\r\n			</tr>\r\n		</thead>\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					$field_name</td>\r\n				<td>\r\n					имя поля в текущем компоненте или компоненте $classID</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$style&nbsp;(опционально)</td>\r\n				<td>\r\n					параметры отображения поля, например:&nbsp;«size=''50''»</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$classID&nbsp;(опционально)</td>\r\n				<td>\r\n					идентификатор компонента, используется например, при выводе&nbsp;формы через функцию s_list_class() его следует указывать, по&nbsp;умолчанию этот параметр можно не задавать</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$caption&nbsp;(опционально)</td>\r\n				<td>\r\n					выводить или не выводить описание над генерируемым полем</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$bbcode&nbsp;(опционально)</td>\r\n				<td>\r\n					выводить панельку с BB-кодами (для панельки нужны стили CSS в&nbsp;макете дизайна!), по умолчанию отключено</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>', NULL, '', 'ClassForm_AddTemplate ClassForm_AddCond ClassForm_AddActionTemplate ClassForm_EditTemplate ClassForm_EditCond ClassForm_EditActionTemplate ClassForm_CheckActionTemplate'),
(14, 'function', 'nc_string_field', 'nc_string_field ( string $field_name, [string $style, [int $classID, [bool $caption]]] )', 'Функция генерирует поле типа «Строка».', '<div>\r\n	<table>\r\n		<thead>\r\n			<tr>\r\n				<th scope="col">\r\n					Параметры</th>\r\n				<th scope="col">\r\n					Описание</th>\r\n			</tr>\r\n		</thead>\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					$field_name</td>\r\n				<td>\r\n					имя поля в текущем компоненте или компоненте $classID</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$style&nbsp;(опционально)</td>\r\n				<td>\r\n					параметры отображения поля, например:&nbsp;«size=''50''»</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$classID&nbsp;(опционально)</td>\r\n				<td>\r\n					идентификатор компонента, используется например, при выводе&nbsp;формы через функцию s_list_class() его следует указывать, по&nbsp;умолчанию этот параметр можно не задавать</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$caption&nbsp;(опционально)</td>\r\n				<td>\r\n					выводить или не выводить описание над генерируемым полем</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>', NULL, '', 'ClassForm_AddTemplate ClassForm_AddCond ClassForm_AddActionTemplate ClassForm_EditTemplate ClassForm_EditCond ClassForm_EditActionTemplate ClassForm_CheckActionTemplate'),
(15, 'function', 'nc_int_field', 'nc_int_field ( string $field_name, [string $style, [int $classID, [bool $caption]]] )', 'Функция генерирует поле типа «Целое число».', '<div>\r\n	<table>\r\n		<thead>\r\n			<tr>\r\n				<th scope="col">\r\n					Параметры</th>\r\n				<th scope="col">\r\n					Описание</th>\r\n			</tr>\r\n		</thead>\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					$field_name</td>\r\n				<td>\r\n					имя поля в текущем компоненте или компоненте $classID</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$style&nbsp;(опционально)</td>\r\n				<td>\r\n					параметры отображения поля, например:&nbsp;«size=''50''»</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$classID&nbsp;(опционально)</td>\r\n				<td>\r\n					идентификатор компонента, используется например, при выводе&nbsp;формы через функцию s_list_class() его следует указывать, по&nbsp;умолчанию этот параметр можно не задавать</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					$caption&nbsp;(опционально)</td>\r\n				<td>\r\n					выводить или не выводить описание над генерируемым полем</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>', NULL, '', 'ClassForm_AddTemplate ClassForm_AddCond ClassForm_AddActionTemplate ClassForm_EditTemplate ClassForm_EditCond ClassForm_EditActionTemplate ClassForm_CheckActionTemplate'),
(16, 'function', 'nc_float_field', 'nc_float_field ( string $field_name, [string $style, [int $classID, [bool $caption]]] )', 'Функция генерирует поле типа «Число с плавающей запятой».', '<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope="col">\r\n				Параметры</th>\r\n			<th scope="col">\r\n				Описание</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				$field_name</td>\r\n			<td>\r\n				имя поля в текущем компоненте или компоненте $classID</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$style&nbsp;(опционально)</td>\r\n			<td>\r\n				параметры отображения поля, например:&nbsp;«size=''50''»</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$classID</td>\r\n			<td>\r\n				идентификатор компонента, используется например, при выводе&nbsp;формы через функцию s_list_class() его следует указывать, по&nbsp;умолчанию этот параметр можно не задавать</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$caption</td>\r\n			<td>\r\n				выводить или не выводить описание над генерируемым полем</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', NULL, '', 'ClassForm_AddTemplate ClassForm_AddCond ClassForm_AddActionTemplate ClassForm_EditTemplate ClassForm_EditCond ClassForm_EditActionTemplate ClassForm_CheckActionTemplate'),
(17, 'function', 'nc_multilist_field', 'nc_multilist_field ( string $field_name, [string $style, [string $type, [int $classID, [bool $caption, [string $selected, [bool $disabled, [bool $getData]]]]]] )', 'Функция генерирует поле типа «Множественный выбор»', '<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope="col">\r\n				Параметры</th>\r\n			<th scope="col">\r\n				Описание</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				$field_name</td>\r\n			<td>\r\n				имя поля в текущем компоненте или компоненте $classID</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$style&nbsp;(опционально)</td>\r\n			<td>\r\n				параметры отображения поля, например:&nbsp;«size=''50''»</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$type (опционально)</td>\r\n			<td>\r\n				тип: "select", "select:N", "checkbox", по умолчанию - "select:3"</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$classID (опционально)</td>\r\n			<td>\r\n				идентификатор компонента, используется например, при выводе&nbsp;формы через функцию s_list_class() его следует указывать, по&nbsp;умолчанию этот параметр можно не задавать</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$caption (опционально)</td>\r\n			<td>\r\n				&nbsp;выводить или не выводить описание над генерируемым полем</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$selected (опционально)</td>\r\n			<td>\r\n				выбранные элементы. Передаются через строку, где id выбранных&nbsp;элементов разделены между собой символами ''[пробел]'', ''.'', '','' , '';''</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$disabled &nbsp;(опционально)</td>\r\n			<td>\r\n				недоступные&nbsp;элементы.&nbsp;Формат&nbsp;аргумента&nbsp;аналогичен</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<div>\r\n					$getData&nbsp;(опционально)</div>\r\n			</td>\r\n			<td>\r\n				принудительно вытаскивать из базы</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', NULL, '', 'ClassForm_AddTemplate ClassForm_AddCond ClassForm_AddActionTemplate ClassForm_EditTemplate ClassForm_EditCond ClassForm_EditActionTemplate ClassForm_CheckActionTemplate'),
(18, 'function', 'nc_list_select', 'nc_list_select (string $classificator_name, [string $field_name, [int $current_value, [int $sort_type, [int $sort_direction, [string $template_prefix, [string $template_object, [string $template_suffix, [string $template_any, [bool $ignore_check]]]]]]]]])', 'Данная функция позволяет генерировать HTML списки из Списков\r\nNetCat.', '<p>\r\n	В большинстве случаев она применяется в альтернативных формах компонента, чтобы вывести информацию о поле типа Список.</p>\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope="col">\r\n				Параметры</th>\r\n			<th scope="col">\r\n				Описание</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				$classificator_name</td>\r\n			<td>\r\n				имя списка, например, Gallery, обязательный параметр</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$field_name имя&nbsp;(опционально)</td>\r\n			<td>\r\n				поля в компоненте (без префикса f_, например, Field)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$current_value (опционально)</td>\r\n			<td>\r\n				выбранный элемент списка&nbsp;(например, $f_Field_id, если мы используем функцию в&nbsp;альтернативной форме добавления/изменения)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$sort_type (опционально)</td>\r\n			<td>\r\n				поле сортировки: 0 – ID (по умолчанию), 1 – имя, 2 - приоритет</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$sort_direction (опционально)</td>\r\n			<td>\r\n				порядок сортировки: 0 – восходящий (по умолчанию), 1 –&nbsp;нисходящий)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$template_prefix (опционально)</td>\r\n			<td>\r\n				темплейт префикса списка, по умолчанию: "&lt;select name=''f_\\$field_name''&gt;\\r\\n"</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$template_suffix (опционально)</td>\r\n			<td>\r\n				темплейт суффикса списка, по умолчанию: "&lt;/select&gt;\\r\\n"</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$template_any (опционально)</td>\r\n			<td>\r\n				темплейт для первого нулевого элемента списка, если поле&nbsp;может быть пустым, по умолчанию:&nbsp;&lt;option value=''''&gt;--выбрать--&lt;/option&gt;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$ignore_check</td>\r\n			<td>\r\n				игнорировать выборку только включенных</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	<strong>Внимание!</strong> Не забывайте экранировать кавычки!</p>\r\n<div>\r\n	<div>\r\n		Поле $template_prefix имеет «константу». Переменная, а точнее запись</div>\r\n	<div>\r\n		вида «\\$field_name», автоматически заменится на указанный в вызове</div>\r\n	<div>\r\n		функции параметр $field_name.</div>\r\n	<div>\r\n		Поле $template_object имеет 3 «константы»: «\\$value_id», «\\</div>\r\n	<div>\r\n		$value_selected» и «\\$value_name», которые отвечают за подстановку ID,</div>\r\n	<div>\r\n		выбранной записи и название элемента.</div>\r\n</div>', NULL, '', 'ClassForm_AddTemplate ClassForm_AddCond ClassForm_AddActionTemplate ClassForm_EditTemplate ClassForm_EditCond ClassForm_EditActionTemplate ClassForm_CheckActionTemplate'),
(19, 'function', 'nc_message_link', 'nc_message_link ( int $message_id, int $class_id, [$action=''''] )', 'Функция позволяет получить относительный путь к объекту (без домена)\r\nпо номеру (ID) этого объекта и номеру (ID) компонента, которому он\r\nпринадлежит.', '<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope="col">\r\n				Параметры</th>\r\n			<th scope="col">\r\n				Описание</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				$message_id</td>\r\n			<td>\r\n				номер объекта</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$class_id</td>\r\n			<td>\r\n				номер компонента</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$action&nbsp;(опционально)</td>\r\n			<td>\r\n				действие с объектом:<br />\r\n				edit — редактирование<br />\r\n				delete — удаление<br />\r\n				drop — удаление без подтверждения<br />\r\n				checked — смена статуса,<br />\r\n				по умолчанию — просмотр&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	Будьте внимательны, не путайте номера компонента и номер компонента раздела. Номер компонента Вы можете узнать, например, в разделе «Список компонентов» системы администрирования.</p>', NULL, '', 'ClassForm TemplateForm'),
(20, 'function', 'parentofmessage', 'parentofmessage ( int $message_id, int $class_id )', 'Возвращает номер объекта – родителя «ветки» объектов (может\r\nиспользоваться в иерархическом форуме), в которой, в частности,\r\nсодержится объект с номером $message_id.', '<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope="col">\r\n				Параметры</th>\r\n			<th scope="col">\r\n				Описание</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				$message_id</td>\r\n			<td>\r\n				номер объекта</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$class_id</td>\r\n			<td>\r\n				номер компонента</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', NULL, '', 'ClassForm TemplateForm'),
(21, 'function', 's_list_class', 's_list_class ( int $sub, int $cc, [char $params, [bool $show_in_admin_mode]] )', '<div>\r\n	Функция выводит "верхние" объекты из раздела $sub компонента раздела $cc с параметрами $params.</div>', '<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope="col">\r\n				Параметры</th>\r\n			<th scope="col">\r\n				Описание</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				$sub</td>\r\n			<td>\r\n				номер раздела</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$cc</td>\r\n			<td>\r\n				номер компонента в разделе</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$params&nbsp;(опционально)</td>\r\n			<td>\r\n				может содержать произвольный состав параметров. Все они&nbsp;могут быть обработаны в тексте шаблона вывода объекта.&nbsp;Параметры подаются в URL-формате: &amp;param1=12&amp;param2=46.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$show_in_admin_mode (опционально)&nbsp;</td>\r\n			<td>\r\n				если он имеет значение TRUE (истина), этот блок будет выведен&nbsp;и в режиме администрирования, иначе только в обычном режиме&nbsp;работы сайта</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', NULL, '', 'ClassForm TemplateForm'),
(22, 'function', 'nc_usergroup_create', 'nc_usergroup_create ( string $name )', 'Функция создает группу пользователей именем $name.', '', NULL, '', 'ClassForm TemplateForm'),
(23, 'function', 'nc_usergroup_rename', 'nc_usergroup_rename ( int $PermissionGroupID, string $name )', 'Функция переименовывает группу пользователей.', '<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope="col">\r\n				Параметры</th>\r\n			<th scope="col">\r\n				Описание</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				$PermissionGroupID</td>\r\n			<td>\r\n				идентификатор группы</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$name</td>\r\n			<td>\r\n				имя группы</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', NULL, '', 'ClassForm TemplateForm'),
(24, 'function', 'nc_usergroup_delete', 'nc_usergroup_delete ( mixed $PermissionGroupID )', 'Функция удаляет группу(-ы) пользователей по идентификатору группы\r\nили массиву с идентификаторами групп $PermissionGroupID.', 'Группу нельзя удалить, если есть хотя бы один пользователь, который\r\nсостоит только в этой группе. Функция возвращает массив с номерами\r\nудаленных групп.', NULL, '', 'ClassForm TemplateForm'),
(25, 'function', 'nc_usergroup_add_to_group', 'nc_usergroup_add_to_group ( int $UserID, int $PermissionGroupID )', 'Функция добавляет пользователя в группу.', '<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope="col">\r\n				Параметры</th>\r\n			<th scope="col">\r\n				Описание</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				$UserID</td>\r\n			<td>\r\n				идентификатор пользователя</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$PermissionGroupID</td>\r\n			<td>\r\n				идентификатор группы&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', NULL, '', 'ClassForm TemplateForm'),
(26, 'function', 'nc_usergroup_remove_from_group', 'nc_usergroup_remove_from_group ( int $UserID, int $PermissionGroupID )', 'Функция исключает пользователя из группы. (Пользователь должен\r\nсостоять хотя бы в одной группе.)', '<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope="col">\r\n				Параметры</th>\r\n			<th scope="col">\r\n				Описание</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				$UserID</td>\r\n			<td>\r\n				идентификатор пользователя</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$PermissionGroupID</td>\r\n			<td>\r\n				идентификатор группы</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', NULL, '', 'ClassForm TemplateForm'),
(27, 'function', 'nc_usergroup_get_users_from_group', 'nc_usergroup_get_users_from_group ( int $PermissionGroupID , [int $output_type])', 'Функция возвращает всех пользователей, находящихся в группе\r\nPermissionGroupID.', '<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope="col">\r\n				Параметры</th>\r\n			<th scope="col">\r\n				Описание</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				$PermissionGroupID</td>\r\n			<td>\r\n				идентификатор группы</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$output_type&nbsp;(опционально)</td>\r\n			<td>\r\n				тип выходного массива:<br />\r\n				&nbsp;0: просто номера пользователей [0] =&gt; user1 id, [1] =&gt; user2&nbsp;id<br />\r\n				1: [group_id][user_id] =&gt; Login</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', NULL, '', 'ClassForm TemplateForm'),
(28, 'function', 'nc_usergroup_get_group_by_user', 'nc_usergroup_get_group_by_user ( int $UserID , int $output_type = 0 )', 'Функция возвращает все группы, в которых состоит пользователь.', '<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope="col">\r\n				Параметры</th>\r\n			<th scope="col">\r\n				Описание</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				$UserID</td>\r\n			<td>\r\n				идентификатор пользователя</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$output_type&nbsp;(опционально)</td>\r\n			<td>\r\n				тип выходного массива:<br />\r\n				0:&nbsp;на выходе одномерный числовой массив, значения&nbsp;элементов которых соответствует идентификатором групп<br />\r\n				1: на выходе одномерный массив, значения элементов&nbsp;которых соответствует названиям групп, а&nbsp;индекс -&nbsp;номерам групп</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', NULL, '', 'ClassForm TemplateForm'),
(29, 'function', 'is_even', 'is_even ( int $param )', '<p>Проверяет параметр на четность.</p>', '', NULL, '', 'ClassForm TemplateForm'),
(30, 'function', 'listQuery', 'listQuery (char $sql_query, [char $output_template, [char $divider]] )', '<p>Функция производит запрос $sql_query к базе данных, форматирует в\r\nсоответствии с шаблоном $output_template и выводит\r\nрезультаты\r\nзапроса.</p>', '<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope="col">\r\n				Параметры</th>\r\n			<th scope="col">\r\n				Описание</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				$sql_query</td>\r\n			<td>\r\n				запрос к БД</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$output_template&nbsp;(опционально)&nbsp;</td>\r\n			<td>\r\n				шаблон вывода результатов запроса</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$divider (опционально)&nbsp;</td>\r\n			<td>\r\n				разделитель между результатами</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	В шаблоне $output_template могут использоваться обращения к массиву $data[] с маскировочным слешем перед знаком $: \\$data[Name].</p>\r\n<p>\r\n	В качестве индексов массива используются названия столбцов таблиц, из которых происходит выборка.</p>', NULL, '', 'ClassForm TemplateForm'),
(31, 'function', 'nc_bbcode', 'nc_bbcode ( string $text, [string $cut_link, [bool $cut_full, [array $codes]]] )', 'Обрабатывает текст с BB-кодами.', '', NULL, '', 'ClassForm TemplateForm'),
(32, 'function', 'nc_bbcode_bar', 'nc_bbcode_bar ( string $winID, string $formID, string $textareaID, [bool $help, [array $codes="", [string $prefix="", [string $suffix=""]]]] )', 'Отображает панельку вставки BB-кодов.', '', NULL, '', 'ClassForm TemplateForm'),
(33, 'function', 'nc_bbcode_clear', 'nc_bbcode_clear ( string $text )', 'Функция очистки текста от BB-кодов (кроме URL).', '', NULL, '', 'ClassForm TemplateForm'),
(34, 'function', 'nc_array_to_string', 'nc_array_to_string ( array $arr, array $template )', 'Переводит массив в строку по шаблону.', '<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope="col">\r\n				Параметры</th>\r\n			<th scope="col">\r\n				Описание</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				$arr</td>\r\n			<td>\r\n				непосредственно сам массив</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$template</td>\r\n			<td>\r\n				массив с шаблонами, должен иметь следующие ключи:<br />\r\n				prefix<br />\r\n				element<br />\r\n				divider<br />\r\n				suffix</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div>\r\n	В элементе с ключом element можно использовать макропеременные:</div>\r\n<div>\r\n	1. %ELEMENT - текущий элемент массива $arr</div>\r\n<div>\r\n	2. %KEY - его ключ</div>\r\n<div>\r\n	3. %I - номер по порядку (отсчет начинается с 1 )</div>', NULL, '', 'ClassForm TemplateForm'),
(35, 'function', 'nc_mail2queue', 'nc_mail2queue ( string $recipient, string $from, string $subject, string $message )', 'Функция является частью функционала по рассылке писем. Указанное\r\nписьмо кладется в таблицу БД mail_queue, откуда в дальнейшем будет\r\nразослано скриптом /netcat/admin/mailer.php.', '<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope="col">\r\n				Параметры</th>\r\n			<th scope="col">\r\n				Описание</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				$recipient</td>\r\n			<td>\r\n				содержит адрес получателя</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$from</td>\r\n			<td>\r\n				содержит координаты отправителя</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$subject</td>\r\n			<td>\r\n				тема письма</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$message</td>\r\n			<td>\r\n				сообщение&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	При желании Вы можете отсылать даже письма с файлами – для этого при помощи каких-либо средств необходимо сгенерировать правильный $message. Однако учтите, что письмо кладется в БД ровно столько раз, сколько подписчиков его должны получить, и при большом вложенном файле размер БД может значительно вырасти.</p>\r\n<p>\r\n	Файл /netcat/admin/mailer.php, отвечает за порционную рассылку писем. Количество писем задается параметром number, если не указано – высылается 20 писем из очереди. Этот скрипт должен быть добавлен в CRON Вашего сервера (каждую минуту, /netcat/admin/mailer.php?number=20). При наличии писем в очереди они будут отсылаться порциями. При отсутствии писем скрипт ничего делать не будет.</p>', NULL, '', 'ClassForm TemplateForm'),
(36, 'function', 'nc_file_path', 'nc_file_path ( int $class_id, int $message_id, mixed $field_name, [string $file_name_prefix] )', 'Функция позволяет получить путь к файлу, указанному в определенном\r\nполе, по номеру (ID) этого объекта и номеру (ID) компонента, которому\r\nон принадлежит.', '<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope="col">\r\n				Параметры</th>\r\n			<th scope="col">\r\n				Описание</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				$class_id</td>\r\n			<td>\r\n				номер компонента (для системных таблиц – название&nbsp;таблицы, допустимые значения – “Catalogue”, “Subdivision”,&nbsp;“User”, “Template”)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$message_id</td>\r\n			<td>\r\n				номер объекта</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$field_name</td>\r\n			<td>\r\n				название поля или его идентификатор в компоненте</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				$file_name_prefix (опционально)&nbsp;</td>\r\n			<td>\r\n				укажите “h_”, если хотите получить ссылку для скачивания&nbsp;файла под оригинальным именем (подробнее см. в&nbsp;разделе «Файловая система» настоящего руководства)</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	Будьте внимательны, не путайте номера компонента и номер компонента в разделе. Номер компонента вы можете узнать, например, в разделе «Список компонентов» системы администрирования.</p>\r\n<p>\r\n	Если в указанном поле файл не был закачан, функция возвращает NULL. При неправильно указанном имени или идентификаторе поля функция сообщит об ошибке и вернет NULL.</p>', NULL, '', 'ClassForm TemplateForm'),
(37, 'function', 'nc_get_visual_settings', 'nc_get_visual_settings ( int $cc )', 'Функция возвращает текущие визуальные настройки компонента в\r\nразделе по его идентификатору $cc.', 'Возвращаемый результат — массив данных.', NULL, '', 'ClassForm TemplateForm'),
(38, 'function', 'opt', 'opt ( $flag, $string )', 'Функция выводит строку $string в случае если $flag не ложь, не имеет\r\nпустое значение или не ноль.', '', NULL, '', 'ClassForm TemplateForm'),
(39, 'function', 'opt_case', 'opt_case ( $flag, $string1, $string2 )', 'Выводит строку $string1 в случае если $flag не ложь, не имеет пустое\r\nзначение или не ноль; в противном случае выводит строку $string2.', '', NULL, '', 'ClassForm TemplateForm'),
(40, 'function', 'encode_host', 'encode_host ( string $host )', '<p>Функция возвращает закодированное в punycode значение параметра\r\n$host, содержащее доменное имя.</p>', '', NULL, '', 'ClassForm TemplateForm'),
(41, 'function', 'decode_host', 'decode_host ( string $host )', '<p>Функция возвращает декодированное значение параметра\r\n$host содержащее доменное имя в формате punycode.</p>', '', NULL, '', 'ClassForm TemplateForm'),
(42, 'variable', 'cc', 'cc', 'Номер (ID) текущего инфоблока.', 'Переменной присваивается значение поля Sub_Class_ID таблицы Sub_Class, соответствующее текущему инфоблоку.', NULL, '', 'ClassForm TemplateForm'),
(43, 'variable', 'cc_array[]', 'cc_array', 'Массив номеров инфоблоков в текущем разделе.', 'Массив индексов (номеров) компонентов текущего раздела, отсортированных по приоритету. Нулевой элемент ($cc_array[0]) – компонент с наименьшим приоритетом.', NULL, '', 'ClassForm TemplateForm');
INSERT INTO `Documentation` (`Documentation_ID`, `Type`, `Name`, `Signature`, `ShortHelp`, `FullHelp`, `Module_ID`, `Parent`, `Areas`) VALUES
(44, 'variable', 'admin_mode', 'admin_mode', 'Определение текущего режима страницы.', 'Логическая переменная. Если страница находится в режиме просмотра, то равна FALSE, если в режиме администирования - TRUE.', NULL, '', 'ClassForm TemplateForm'),
(45, 'variable', 'catalogue', 'catalogue', 'Номер (ID) текущего сайта.', 'Переменной присваивается значение поля Catalogue_ID таблицы Catalogue, соответствующее текущему сайту.', NULL, '', 'ClassForm TemplateForm'),
(46, 'variable', 'AUTH_USER_ID', 'AUTH_USER_ID', 'Номер авторизованного пользователя.', 'Номер (ID) в таблице User пользователя, авторизованного на странице. Если посетитель не авторизован, содержит 0.', NULL, '', 'ClassForm TemplateForm'),
(47, 'variable', 'current_catalogue[]', 'current_catalogue', 'Массив свойств текущего сайта.', 'Хэш-массив всех свойств текущего сайта (атрибутов таблицы Catalogue). Пример: $current_catalogue[''Catalogue_ID''].', NULL, '', 'ClassForm TemplateForm'),
(48, 'variable', 'current_cc[]', 'current_cc', 'Массив свойств текущего раздела.', 'Хэш-массив всех свойств текущего сайта (атрибутов таблицы Sub_Class). Пример: $current_cc[''Sub_Class_Name''].', NULL, '', 'ClassForm TemplateForm'),
(49, 'variable', 'current_sub[]', 'current_sub', 'Массив свойств текущего раздела.', 'Хэш-массив всех свойств текущего сайта (атрибутов таблицы Subdivision). Пример: $current_sub[''Subdivision_Name''].', NULL, '', 'ClassForm TemplateForm'),
(50, 'variable', 'current_user[]', 'current_user', 'Массив свойств текущего раздела.', 'Хэш-массив всех свойств текущего сайта (атрибутов таблицы User). Пример: $current_user[''Login'']. Массив определен только в случае, когда посетитель авторизован на сайте (то есть при наличии модуля "Личный кабинет"). Если модуля нет, номер авторизованного пользователя хранится в переменной $AUTH_USER_ID.', NULL, '', 'ClassForm TemplateForm'),
(51, 'variable', 'nc_parent_template_folder_path', 'nc_parent_template_folder_path', 'URI папки макета дизайна.', 'Переменная содержит относительную ссылку (URI) на папку текущего макета дизайна (или корневого макета, если текущий макет является дочерним, а не корневым). В этой папке и/или ее подпапках рекомендуется хранить картинки, CSS-файлы и пр., необходимые для работы макета.', NULL, '', 'TemplateForm'),
(52, 'variable', 'template_settings[]', 'template_settings', 'Массив, содержащий пользовательские настройки макета.', 'Если у макета заданы пользовательские настройки, этот хэш-массив содержит их значение (эти значения проставляются в настройках сайта или раздела, к которому подключен макет).', NULL, '', 'TemplateForm'),
(53, 'macros', 'NAME', 'NAME', 'Название раздела.', '', NULL, '', 'TemplateForm_Settings'),
(54, 'macros', 'Footer', 'Footer', 'Вывод футера родительского макета.', 'Если макет имеет родителя, эта макропеременная будет содержать текст футера (нижней части) родительского макета.', NULL, '', 'TemplateForm_Header TemplateForm_Footer'),
(55, 'macros', 'Header', 'Header', 'Вывод хедера родительского макета.', 'Если макет имеет родителя, эта макропеременная будет содержать текст хедера (верхней части) родительского макета.', NULL, '', 'TemplateForm_Header TemplateForm_Footer'),
(56, 'variable', 'begRow', 'begRow', 'Порядковый номер объекта, с которого начинается вывод списка объектов на текущей странице.', 'Нумерация начинается с первого объекта на первой странице. Таким образом, если объекты какого-либо компонента выводятся по 15 штук на странице, на второй странице листинга значение $begRow будет равно 16.', NULL, '', 'ClassForm_FormPrefix ClassForm_RecordTemplate ClassForm_FormSuffix ClassForm_RecordTemplateFull'),
(57, 'macros', 'URL', 'URL', 'Ссылка на сайт/раздел/компонент.', '', NULL, '', 'TemplateForm_Settings'),
(58, 'macros', 'PARENT_SUB', 'PARENT_SUB', 'Номер родительского раздела (только для разделов).', '', NULL, '', 'TemplateForm_Settings'),
(59, 'macros', 'KEYWORD', 'KEYWORD', 'Ключевое слово раздела (только для разделов).', '', NULL, '', 'TemplateForm_Settings'),
(60, 'macros', 'SUB', 'SUB', 'Номер раздела (только для разделов).', '', NULL, '', 'TemplateForm_Settings'),
(61, 'macros', 'COUNTER', 'COUNTER', 'Номер выводимого элемента в списке (начиная с нуля).', '', NULL, '', 'TemplateForm_Settings'),
(62, 'variable', 'ccLink', 'ccLink', 'Содержит путь (URI) к текущему инфоблоку.', '', NULL, '', 'ClassForm_RecordTemplate'),
(63, 'variable', 'f_AdminCommon', 'f_AdminCommon', 'Панелька управления инфоблоком.', 'В режиме администрирования выводит панельку операций с инфоблоком: добавление объекта, настройка инфоблока, редактирование текста шаблона компонента, удаления объектов. Если в шаблоне вывода объекта в списке эта переменная указана не будет, вы не сможете изменить или удалить объекты этого компонента стандартными средствами системы.', NULL, '', 'ClassForm_FormPrefix ClassForm_RecordTemplate ClassForm_FormSuffix ClassForm_RecordTemplateFull'),
(64, 'variable', 'endRow', 'endRow', 'Порядковый номер объекта, которым кончается вывод списка объектов на текущей странице.', 'Нумерация начинается с первого объекта на первой странице. Таким образом, если объекты какого-либо компонента выводятся по 15 штук на странице, на второй странице листинга значение $endRow будет равно 30.', NULL, '', 'ClassForm_FormPrefix ClassForm_RecordTemplate ClassForm_FormSuffix ClassForm_RecordTemplateFull'),
(65, 'variable', 'f_AdminButtons', 'f_AdminButtons', 'Панелька управления объектом.', 'В режиме администрирования выводит панельку операций с объектами: изменения, удаления, включения-выключения, копирования. Если в шаблоне вывода объекта в списке или объекта на одной странице эта переменная указана не будет, вы не сможете изменить или удалить объекты этого компонента стандартными средствами системы.', NULL, '', 'ClassForm_RecordTemplate ClassForm_RecordTemplateFull'),
(66, 'variable', 'f_Checked', 'f_Checked', 'Истина, если объект включен, и наоборот.', 'Используется в шаблоне вывода объекта в списке и на отдельной странице.', NULL, '', 'ClassForm_RecordTemplate ClassForm_RecordTemplateFull'),
(67, 'variable', 'f_Created', 'f_Created', 'Дата и время создания объекта.', 'Дата и время создания (добавления) объекта в формате "гггг-мм-дд чч:мм:сс". Помимо полного формата вывода даты и времени доступны переменные $f_Created_year, $f_Created_month, $f_Created_day, $f_Created_hours, $f_Created_minutes, $f_Created_seconds, содержащие соответственно год, месяц, день, час, минуту и секунду добавления объекта. Используется в шаблоне вывода объекта в списке и на отдельной странице.', NULL, '', 'ClassForm_RecordTemplate ClassForm_RecordTemplateFull'),
(68, 'variable', 'f_IP', 'f_IP', 'IP-адрес посетителя, добавившего объект.', 'Используется в шаблоне вывода объекта в списке и на отдельной странице.', NULL, '', 'ClassForm_RecordTemplate ClassForm_RecordTemplateFull'),
(69, 'variable', 'f_LastIP', 'f_LastIP', 'IP-адрес посетителя, последним изменившего объект.', '', NULL, '', 'ClassForm_RecordTemplate ClassForm_RecordTemplateFull'),
(70, 'variable', 'f_LastUpdated', 'f_LastUpdated', 'Дата и время последнего изменения этого объекта.', 'Используется в шаблоне вывода объекта в списке и на отдельной странице.', NULL, '', 'ClassForm_RecordTemplate ClassForm_RecordTemplateFull'),
(71, 'variable', 'f_LastUserAgent', 'f_LastUserAgent', 'UserAgent пользователя, последним изменившего объект.', 'Используется в шаблоне вывода объекта в списке и на отдельной странице.', NULL, '', 'ClassForm_RecordTemplate ClassForm_RecordTemplateFull'),
(72, 'variable', 'f_LastUserID', 'f_LastUserID', 'Номер пользователя, последним изменившего объект.', '', NULL, '', 'ClassForm_RecordTemplate ClassForm_RecordTemplateFull'),
(73, 'variable', 'f_RowID', 'f_RowID', 'Номер (ID) объекта в таблице БД (MessageXX).', 'Используется в шаблоне вывода объекта в списке и на отдельной странице.', NULL, '', 'ClassForm_RecordTemplate ClassForm_RecordTemplateFull'),
(74, 'variable', 'f_RowNum', 'f_RowNum', 'Порядковый номер объекта на странице.', 'Нумерация начинается с первого объекта, отображенного на странице. Используется в шаблоне вывода объекта в списке и на отдельной странице.', NULL, '', 'ClassForm_RecordTemplate'),
(75, 'variable', 'f_title', 'f_title', 'Заголовок текущей страницы.', 'Выводит название текущего раздела за исключением случая, когда текущая страница представляет собой вывод одного объекта на странице и поле «Заголовок страницы» данного компонента определено.', NULL, '', 'TemplateForm'),
(76, 'variable', 'nc_next_object', 'nc_next_object', 'Ссылка на следующий объект в списке.', 'Данная переменная содержит ссылку на "следующий" объект относительно текущего. Для определения порядка объектов используется переменная $query_order из системных настройках, а если она не задана — то значение поля "Сортировать объекты по" в настройках инфоблока.', NULL, '', 'ClassForm_RecordTemplate'),
(77, 'variable', 'nc_prev_object', 'nc_prev_object', 'Ссылка на предыдущий объект в списке.', 'Данная переменная содержит ссылку на "предыдущий" объект относительно текущего. Для определения порядка объектов используется переменная $query_order из системных настройках, а если она не задана — то значение поля "Сортировать объекты по" в настройках инфоблока.', NULL, '', 'ClassForm_RecordTemplate'),
(78, 'variable', 'fullDateLink ', 'fullDateLink', 'Ссылка на страницу с полным выводом объекта в виде\r\n«.../2002/02/02/message_2.html».', 'Устанавливается в случае если в компоненте имеется поле типа «Дата и время» с форматом «event»,иначе значение переменной идентично значению $fullLink.', NULL, '', 'ClassForm_RecordTemplate ClassForm_RecordTemplateFull'),
(79, 'variable', 'fullLink', 'fullLink', 'Ссылка на страницу с полным выводом объекта.', 'Ссылка формируется в «человеко-понятном» формате: /URLРаздела/КлючСловоКомпонентаРаздела_КлючСловоОбъекта.html или /URLРаздела/КлючСловоОбъекта.html, например, /about/team/ivanov.html', NULL, '', 'ClassForm_RecordTemplate ClassForm_RecordTemplateFull'),
(80, 'variable', 'editLink', 'editLink', 'Ссылка на страницу редактирования объекта.', '', NULL, '', 'ClassForm_RecordTemplate ClassForm_RecordTemplateFull'),
(81, 'variable', 'deleteLink', 'deleteLink', 'Ссылка на страницу удаления объекта.', '', NULL, '', 'ClassForm_RecordTemplate ClassForm_RecordTemplateFull'),
(82, 'variable', 'dropLink', 'dropLink', 'Ссылка на страницу удаления объекта без подтверждения.', '', NULL, '', 'ClassForm_RecordTemplate ClassForm_RecordTemplateFull'),
(83, 'variable', 'checkedLink', 'checkedLink', 'Ссылка на страницу включения-выключения объекта.', '', NULL, '', 'ClassForm_RecordTemplate ClassForm_RecordTemplateFull'),
(84, 'variable', 'prevLink', 'prevLink', 'Переменная содержит ссылку на следующую страницу в листинге компонента.', 'Если текущее положение в списке – его конец, то переменная пустая.', NULL, '', 'ClassForm_RecordTemplate'),
(85, 'variable', 'nextLink', 'nextLink', 'Переменная содержит ссылку на следующую страницу в листинге компонента.', 'Если текущее положение в списке – его конец, то\r\nпеременная пустая.', NULL, '', 'ClassForm_RecordTemplate'),
(86, 'variable', 'parent_sub_tree[]', 'parent_sub_tree', 'Массивы свойств раздела различных уровней вложенности в реверсивном порядке.', 'От текущего раздела $parent_sub_tree[0] до свойств головного сайта $parent_sub_tree[$sub_level_count-1].', NULL, '', 'ClassForm TemplateForm'),
(87, 'variable', 'recNum', 'recNum', 'Максимальное количество объектов для вывода.', 'Переменную можно подать в адресной строке (/news/?recNum=3), в функции s_list_class(), в системных настройках компонента.', NULL, '', 'ClassForm_RecordTemplate'),
(88, 'variable', 'sub', 'sub', 'Номер(ID) текущего раздела.', '', NULL, '', 'ClassForm TemplateForm'),
(89, 'variable', 'sub_level_count', 'sub_level_count', 'Переменная содержит текущий уровень вложенности навигации.', '', NULL, '', 'TemplateForm'),
(90, 'variable', 'subHost', 'subHost', 'Переменная содержит текущий хост (домен) вида «www.company.ru».', '', NULL, '', 'ClassForm TemplateForm'),
(91, 'variable', 'subLink', 'subLink', 'Переменная содержит URI текущего раздела вида «/about/news/».', '', NULL, '', 'ClassForm TemplateForm'),
(92, 'variable', 'totRows', 'totRows', 'Содержит общее количество объектов данного компонента раздела.', '', NULL, '', 'ClassForm_FormPrefix ClassForm_RecordTemplate ClassForm_FormSuffix ClassForm_RecordTemplateFull');

-- --------------------------------------------------------

--
-- Структура таблицы `Field`
--

CREATE TABLE IF NOT EXISTS `Field` (
  `Field_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Class_ID` int(11) NOT NULL DEFAULT '0',
  `Field_Name` char(64) NOT NULL DEFAULT '',
  `Description` char(255) NOT NULL DEFAULT '',
  `TypeOfData_ID` int(11) NOT NULL DEFAULT '1',
  `Format` text,
  `Extension` text NOT NULL,
  `NotNull` smallint(6) NOT NULL DEFAULT '1',
  `Priority` int(11) NOT NULL DEFAULT '0',
  `DoSearch` smallint(6) NOT NULL DEFAULT '1',
  `DefaultState` char(255) DEFAULT NULL,
  `Inheritance` smallint(6) NOT NULL DEFAULT '0',
  `System_Table_ID` int(11) NOT NULL DEFAULT '0',
  `Widget_Class_ID` int(11) NOT NULL DEFAULT '0',
  `TypeOfEdit_ID` int(11) NOT NULL DEFAULT '1',
  `Checked` tinyint(1) NOT NULL DEFAULT '1',
  `InTableView` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Field_ID`),
  KEY `TypeOfData_ID` (`TypeOfData_ID`),
  KEY `System_Table_ID` (`System_Table_ID`),
  KEY `Widget_Class_ID` (`Widget_Class_ID`),
  KEY `TypeOfEdit_ID` (`TypeOfEdit_ID`),
  KEY `Class_ID_2` (`Class_ID`,`TypeOfData_ID`),
  KEY `Checked` (`Checked`),
  KEY `netshop_field_index` (`Field_Name`,`Class_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- Дамп данных таблицы `Field`
--

INSERT INTO `Field` (`Field_ID`, `Class_ID`, `Field_Name`, `Description`, `TypeOfData_ID`, `Format`, `Extension`, `NotNull`, `Priority`, `DoSearch`, `DefaultState`, `Inheritance`, `System_Table_ID`, `Widget_Class_ID`, `TypeOfEdit_ID`, `Checked`, `InTableView`) VALUES
(16, 0, 'linkVK', 'Ссылка на профиль в Вконтакте', 1, ':', '', 0, 0, 1, '', 0, 1, 0, 1, 1, 0),
(17, 0, 'linkOK', 'Ссылка на профиль в одноклассниках', 1, ':', '', 0, 1, 1, '', 0, 1, 0, 1, 1, 0),
(18, 0, 'linkFB', 'Ссылка на профиль в Facebook', 1, ':', '', 0, 2, 1, '', 0, 1, 0, 1, 1, 0),
(19, 0, 'linkIG', 'Ссылка на профиль в Instagram', 1, ':', '', 0, 3, 1, '', 0, 1, 0, 1, 1, 0),
(23, 0, 'Contacts', 'Контакты (в подвале сайта)', 3, '5:60;html:1;br:2;fck:1;panel:0;typo:0;bbcode:0;', '', 0, 4, 1, '', 0, 1, 0, 1, 1, 0),
(28, 0, 'OperatorEmail', 'Email оператора (обратный звонок)', 1, ':', '', 0, 5, 1, '', 0, 1, 0, 1, 1, 0),
(36, 0, 'OrderEmail', 'Куда отправлять письма о заказах', 1, ':', '', 0, 6, 1, '', 0, 1, 0, 1, 1, 0),
(1, 0, 'Email', 'Email', 1, 'email', '', 1, 3, 1, '', 0, 3, 0, 1, 1, 0),
(2, 1, 'bannerText', 'Текст баннера', 1, ':', '', 0, 0, 0, '', 0, 0, 0, 1, 1, 0),
(3, 1, 'bannerPercents', 'Процент скидки', 1, ':', '', 0, 1, 0, '', 0, 0, 0, 1, 1, 0),
(4, 4, 'name', 'Заголовок статьи', 1, ':', '', 0, 0, 0, '', 0, 0, 0, 1, 1, 0),
(5, 4, 'text', 'Текст статьи', 3, '5:60;html:1;br:2;fck:1;panel:0;typo:0;bbcode:0;', '', 0, 1, 0, '', 0, 0, 0, 1, 1, 0),
(6, 8, 'Name', 'Наименование', 1, ':', '', 0, 0, 1, '', 0, 0, 0, 1, 1, 0),
(7, 8, 'Size', 'Размер', 1, ':', '', 0, 1, 0, '', 0, 0, 0, 1, 1, 0),
(8, 8, 'Code', 'Код', 1, ':', '', 0, 2, 1, '', 0, 0, 0, 1, 1, 0),
(9, 8, 'Vendor', 'Производитель', 1, ':', '', 0, 3, 0, '', 0, 0, 0, 1, 1, 0),
(10, 8, 'Price', 'Цена', 1, ':', '', 0, 4, 1, '', 0, 0, 0, 1, 1, 0),
(11, 8, 'Price_OLD', 'Старая цена', 1, ':', '', 0, 5, 0, '', 0, 0, 0, 1, 1, 0),
(12, 8, 'Description', 'Описание', 3, '5:60;html:1;br:1;fck:1;panel:0;typo:0;bbcode:0;', '', 0, 6, 0, '', 0, 0, 0, 1, 1, 0),
(13, 8, 'Image', 'Изображение', 6, 'fs2:inline;use_resize:0;resize_width:0;resize_height:0;use_crop:0;crop_mode:0;crop_width:0;crop_height:0;crop_x0:0;crop_y0:0;crop_x1:0;crop_y1:0;crop_ignore:0;crop_ignore_width:0;crop_ignore_height:0;use_preview:0;preview_use_resize:0;preview_width:0;preview_height:0;preview_use_crop:0;preview_crop_mode:0;preview_crop_width:0;preview_crop_height:0;preview_crop_x0:0;preview_crop_y0:0;preview_crop_x1:0;preview_crop_y1:0;preview_crop_ignore:0;preview_crop_ignore_width:0;preview_crop_ignore_height:0;multifile_min:0;multifile_max:0;', '', 0, 7, 0, '', 0, 0, 0, 1, 1, 0),
(14, 4, 'Image', 'Изображение', 6, 'fs2:inline;use_resize:0;resize_width:0;resize_height:0;use_crop:0;crop_mode:0;crop_width:0;crop_height:0;crop_x0:0;crop_y0:0;crop_x1:0;crop_y1:0;crop_ignore:0;crop_ignore_width:0;crop_ignore_height:0;use_preview:0;preview_use_resize:0;preview_width:0;preview_height:0;preview_use_crop:0;preview_crop_mode:0;preview_crop_width:0;preview_crop_height:0;preview_crop_x0:0;preview_crop_y0:0;preview_crop_x1:0;preview_crop_y1:0;preview_crop_ignore:0;preview_crop_ignore_width:0;preview_crop_ignore_height:0;multifile_min:0;multifile_max:0;', '', 0, 2, 0, '', 0, 0, 0, 1, 1, 0),
(15, 11, 'Text', 'Текст в верхней части', 3, '5:60;html:1;br:2;fck:1;panel:0;typo:0;bbcode:0;', '', 0, 0, 0, '', 0, 0, 0, 1, 1, 0),
(20, 11, 'MapCode', 'Код карты', 3, '5:60;html:1;br:2;fck:2;panel:0;typo:0;bbcode:0;', '', 0, 1, 0, '', 0, 0, 0, 1, 1, 0),
(21, 8, 'Link_OLD', 'Ссылка на товар - на старом сайте', 1, ':', '', 0, 8, 0, '', 0, 0, 0, 1, 1, 0),
(22, 8, 'ImageBig', 'Большое изображение', 6, 'fs2:inline;use_resize:0;resize_width:0;resize_height:0;use_crop:0;crop_mode:0;crop_width:0;crop_height:0;crop_x0:0;crop_y0:0;crop_x1:0;crop_y1:0;crop_ignore:0;crop_ignore_width:0;crop_ignore_height:0;use_preview:0;preview_use_resize:0;preview_width:0;preview_height:0;preview_use_crop:0;preview_crop_mode:0;preview_crop_width:0;preview_crop_height:0;preview_crop_x0:0;preview_crop_y0:0;preview_crop_x1:0;preview_crop_y1:0;preview_crop_ignore:0;preview_crop_ignore_width:0;preview_crop_ignore_height:0;multifile_min:0;multifile_max:0;', '', 0, 9, 0, '', 0, 0, 0, 1, 1, 0),
(24, 17, 'Name', 'Заголовок новости', 1, ':', '', 0, 0, 0, '', 0, 0, 0, 1, 1, 0),
(25, 17, 'Text', 'Текст новости', 3, '5:60;html:1;br:2;fck:1;panel:0;typo:0;bbcode:0;', '', 0, 1, 0, '', 0, 0, 0, 1, 1, 0),
(26, 17, 'Image', 'Изображение', 6, 'fs2:inline;use_resize:0;resize_width:0;resize_height:0;use_crop:0;crop_mode:0;crop_width:0;crop_height:0;crop_x0:0;crop_y0:0;crop_x1:0;crop_y1:0;crop_ignore:0;crop_ignore_width:0;crop_ignore_height:0;use_preview:0;preview_use_resize:0;preview_width:0;preview_height:0;preview_use_crop:0;preview_crop_mode:0;preview_crop_width:0;preview_crop_height:0;preview_crop_x0:0;preview_crop_y0:0;preview_crop_x1:0;preview_crop_y1:0;preview_crop_ignore:0;preview_crop_ignore_width:0;preview_crop_ignore_height:0;multifile_min:0;multifile_max:0;', '', 0, 2, 0, '', 0, 0, 0, 1, 1, 0),
(27, 17, 'Date', 'Дата', 8, 'event_date;calendar', '', 1, 3, 0, '', 0, 0, 0, 1, 1, 0),
(29, 0, 'ForumName', '', 1, ':', '', 0, 4, 1, '', 0, 3, 0, 1, 1, 0),
(30, 0, 'Phone', '', 1, ':', '', 0, 5, 1, '', 0, 3, 0, 1, 1, 0),
(31, 0, 'City', '', 1, ':', '', 0, 6, 1, '', 0, 3, 0, 1, 1, 0),
(32, 24, 'Goods', 'ID товаров в JSON -- ID, количество', 1, ':', '', 0, 0, 0, '', 0, 0, 0, 1, 1, 0),
(33, 24, 'Name', 'Имя', 1, ':', '', 0, 1, 0, '', 0, 0, 0, 1, 1, 0),
(34, 24, 'Phone', 'Телефон', 1, ':', '', 0, 2, 0, '', 0, 0, 0, 1, 1, 0),
(35, 24, 'Email', 'Email', 1, ':', '', 0, 3, 0, '', 0, 0, 0, 1, 1, 0),
(37, 8, 'MultiImage', 'Изображения для галереи', 11, ';use_resize:0;resize_width:0;resize_height:0;use_crop:0;crop_mode:0;crop_width:0;crop_height:0;crop_x0:0;crop_y0:0;crop_x1:0;crop_y1:0;crop_ignore:0;crop_ignore_width:0;crop_ignore_height:0;use_preview:0;preview_use_resize:0;preview_width:0;preview_height:0;preview_use_crop:0;preview_crop_mode:0;preview_crop_width:0;preview_crop_height:0;preview_crop_x0:0;preview_crop_y0:0;preview_crop_x1:0;preview_crop_y1:0;preview_crop_ignore:0;preview_crop_ignore_width:0;preview_crop_ignore_height:0;multifile_min:0;multifile_max:0;', '', 0, 10, 0, '', 0, 0, 0, 1, 1, 0),
(38, 17, 'MultiImage', 'Изображения для галереи', 11, ';use_resize:0;resize_width:0;resize_height:0;use_crop:0;crop_mode:0;crop_width:0;crop_height:0;crop_x0:0;crop_y0:0;crop_x1:0;crop_y1:0;crop_ignore:0;crop_ignore_width:0;crop_ignore_height:0;use_preview:0;preview_use_resize:0;preview_width:0;preview_height:0;preview_use_crop:0;preview_crop_mode:0;preview_crop_width:0;preview_crop_height:0;preview_crop_x0:0;preview_crop_y0:0;preview_crop_x1:0;preview_crop_y1:0;preview_crop_ignore:0;preview_crop_ignore_width:0;preview_crop_ignore_height:0;multifile_min:0;multifile_max:0;', '', 0, 4, 0, '', 0, 0, 0, 1, 1, 0),
(39, 26, 'Image', 'Изображение на баннере', 6, 'fs2:inline;use_resize:0;resize_width:0;resize_height:0;use_crop:0;crop_mode:0;crop_width:0;crop_height:0;crop_x0:0;crop_y0:0;crop_x1:0;crop_y1:0;crop_ignore:0;crop_ignore_width:0;crop_ignore_height:0;use_preview:0;preview_use_resize:0;preview_width:0;preview_height:0;preview_use_crop:0;preview_crop_mode:0;preview_crop_width:0;preview_crop_height:0;preview_crop_x0:0;preview_crop_y0:0;preview_crop_x1:0;preview_crop_y1:0;preview_crop_ignore:0;preview_crop_ignore_width:0;preview_crop_ignore_height:0;multifile_min:0;multifile_max:0;', '', 0, 0, 0, '', 0, 0, 0, 1, 1, 0),
(40, 26, 'URL', 'Ссылка при клике на баннере', 1, ':', '', 0, 1, 0, '', 0, 0, 0, 1, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `FieldFilter`
--

CREATE TABLE IF NOT EXISTS `FieldFilter` (
  `SubClass_ID` int(11) NOT NULL DEFAULT '0',
  `Field_Name` char(64) NOT NULL DEFAULT '',
  `DoSearch` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`SubClass_ID`,`Field_Name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Filetable`
--

CREATE TABLE IF NOT EXISTS `Filetable` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Real_Name` char(128) NOT NULL DEFAULT '',
  `Virt_Name` char(32) NOT NULL DEFAULT '',
  `File_Path` char(64) NOT NULL DEFAULT '',
  `File_Type` char(64) DEFAULT NULL,
  `File_Size` int(10) unsigned NOT NULL DEFAULT '0',
  `Message_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Field_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Content_Disposition` int(1) DEFAULT '0',
  `Download` int(11) NOT NULL DEFAULT '0',
  `Deleted` int(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `File_Path` (`File_Path`),
  KEY `Field_ID` (`Field_ID`),
  KEY `Message_ID_2` (`Message_ID`,`Field_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `MailTmp`
--

CREATE TABLE IF NOT EXISTS `MailTmp` (
  `MailTmp_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Subject` text,
  `Message` text,
  PRIMARY KEY (`MailTmp_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `Mail_Attachment`
--

CREATE TABLE IF NOT EXISTS `Mail_Attachment` (
  `Mail_Attachment_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(255) NOT NULL,
  `Filename` varchar(255) NOT NULL,
  `Extension` varchar(10) NOT NULL,
  `Content_Type` varchar(100) NOT NULL,
  `Path` varchar(255) NOT NULL,
  PRIMARY KEY (`Mail_Attachment_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `Mail_Queue`
--

CREATE TABLE IF NOT EXISTS `Mail_Queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `time_to_send` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sent_time` datetime DEFAULT NULL,
  `id_user` bigint(20) NOT NULL DEFAULT '0',
  `ip` varchar(20) NOT NULL DEFAULT 'unknown',
  `sender` varchar(50) NOT NULL DEFAULT '',
  `recipient` varchar(50) NOT NULL DEFAULT '',
  `headers` text NOT NULL,
  `body` longtext NOT NULL,
  `try_sent` tinyint(4) NOT NULL DEFAULT '0',
  `delete_after_send` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `time_to_send` (`time_to_send`),
  KEY `id_user` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `Message1`
--

CREATE TABLE IF NOT EXISTS `Message1` (
  `Message_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) NOT NULL,
  `Subdivision_ID` int(11) NOT NULL,
  `Sub_Class_ID` int(11) NOT NULL,
  `Priority` int(11) NOT NULL DEFAULT '0',
  `Keyword` char(255) NOT NULL,
  `ncTitle` varchar(255) DEFAULT NULL,
  `ncKeywords` varchar(255) DEFAULT NULL,
  `ncDescription` text,
  `ncSMO_Title` varchar(255) DEFAULT NULL,
  `ncSMO_Description` text,
  `ncSMO_Image` char(255) DEFAULT NULL,
  `Checked` tinyint(4) NOT NULL DEFAULT '1',
  `IP` char(15) DEFAULT NULL,
  `UserAgent` char(255) DEFAULT NULL,
  `Parent_Message_ID` int(11) NOT NULL DEFAULT '0',
  `Created` datetime NOT NULL,
  `LastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastUser_ID` int(11) NOT NULL,
  `LastIP` char(15) DEFAULT NULL,
  `LastUserAgent` char(255) DEFAULT NULL,
  `bannerText` char(255) DEFAULT NULL,
  `bannerPercents` char(255) DEFAULT NULL,
  PRIMARY KEY (`Message_ID`),
  UNIQUE KEY `Sub_Class_ID` (`Sub_Class_ID`,`Message_ID`,`Keyword`),
  KEY `User_ID` (`User_ID`),
  KEY `LastUser_ID` (`LastUser_ID`),
  KEY `Subdivision_ID` (`Subdivision_ID`),
  KEY `Parent_Message_ID` (`Parent_Message_ID`),
  KEY `Priority` (`Priority`,`LastUpdated`),
  KEY `Checked` (`Checked`),
  KEY `Created` (`Created`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `Message4`
--

CREATE TABLE IF NOT EXISTS `Message4` (
  `Message_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) NOT NULL,
  `Subdivision_ID` int(11) NOT NULL,
  `Sub_Class_ID` int(11) NOT NULL,
  `Priority` int(11) NOT NULL DEFAULT '0',
  `Keyword` char(255) NOT NULL,
  `ncTitle` varchar(255) DEFAULT NULL,
  `ncKeywords` varchar(255) DEFAULT NULL,
  `ncDescription` text,
  `ncSMO_Title` varchar(255) DEFAULT NULL,
  `ncSMO_Description` text,
  `ncSMO_Image` char(255) DEFAULT NULL,
  `Checked` tinyint(4) NOT NULL DEFAULT '1',
  `IP` char(15) DEFAULT NULL,
  `UserAgent` char(255) DEFAULT NULL,
  `Parent_Message_ID` int(11) NOT NULL DEFAULT '0',
  `Created` datetime NOT NULL,
  `LastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastUser_ID` int(11) NOT NULL,
  `LastIP` char(15) DEFAULT NULL,
  `LastUserAgent` char(255) DEFAULT NULL,
  `name` char(255) DEFAULT NULL,
  `text` longtext,
  `Image` char(255) DEFAULT NULL,
  PRIMARY KEY (`Message_ID`),
  UNIQUE KEY `Sub_Class_ID` (`Sub_Class_ID`,`Message_ID`,`Keyword`),
  KEY `User_ID` (`User_ID`),
  KEY `LastUser_ID` (`LastUser_ID`),
  KEY `Subdivision_ID` (`Subdivision_ID`),
  KEY `Parent_Message_ID` (`Parent_Message_ID`),
  KEY `Priority` (`Priority`,`LastUpdated`),
  KEY `Checked` (`Checked`),
  KEY `Created` (`Created`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `Message4`
--

INSERT INTO `Message4` (`Message_ID`, `User_ID`, `Subdivision_ID`, `Sub_Class_ID`, `Priority`, `Keyword`, `ncTitle`, `ncKeywords`, `ncDescription`, `ncSMO_Title`, `ncSMO_Description`, `ncSMO_Image`, `Checked`, `IP`, `UserAgent`, `Parent_Message_ID`, `Created`, `LastUpdated`, `LastUser_ID`, `LastIP`, `LastUserAgent`, `name`, `text`, `Image`) VALUES
(1, 1, 1, 2, 1, '', '', '', '', '', '', '', 1, '31.180.150.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 0, '2016-07-03 17:50:29', '2016-07-03 14:50:56', 1, '31.180.150.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 'Статья на главной', '<div class="hidden-xs hidden-sm col-md-12">\r\n<h2>Магазин домашнего текстиля &laquo;Ля Прованс&raquo; Предлагает экологичные, натуральные и красивые изделия для дома:</h2>\r\n<p>Продукция Оршанского льнокомбината (Беларусь).</p>\r\n<p>Разнообразное столовое и постельное белье, льняные махровые полотенца, рушники, наборы для сауны и кухни, покрывала и пледы, сумки.</p>\r\n<p>Льняные интерьерные игрушки ручной работы украсят дом и поднимут настроение.</p>\r\n<p>Французское постельное белье &quot;La Scala&quot;.</p>\r\n<p>Материал сатин (хлопок 100%) обеспечит здоровый сон.</p>\r\n<p>Мы предложим Вам товары высшего качества, которые наполнят жизнь гармонией и комфортом, создадут в доме праздник и будут прекрасным подарком к любому торжеству!</p>&nbsp;\r\n<p>Магазин домашнего текстиля &quot;Ля Прованс&quot; г. Кривой Рог, пр. Мира 27</p>\r\n<p>Заказ по телефону 067 971-22-35, 096 704-62-13.</p>\r\n<p>e-mail: 0967046213@mail.ru</p>&nbsp;\r\n<p>Синие, голубые, лиловые, порой розовые и белые цветки на длинных стеблях, ровно застилающие поля &ndash; фантастическую красоту нежнейших переливов цветущего льна можно увидеть только до полудня, под жарким солнцем цветки складываются или осыпаются. Лен цветет всего несколько дней, но то, что научились создавать из него люди, оказалось на редкость долговечным, надежным и прочным. Льняные ткани издавна применяются для изготовления нательного, постельного и столового белья.</p>\r\n<p>Лен имеет удивительные свойства: экологически чистый, прохладный в жару и теплый в холод, является антисептиком, хорошо впитывает влагу и быстро высыхает. Поэтому льняные ткани создают комфортную и здоровую обстановку, а сон на льняном белье считается лучшим способом восстановить силы и душевное равновесие. Этому, конечно, есть научное объяснение: химически необработанный лен содержит такие ценные элементы, как кремний и селен, и во время сна организм восполняет их дефицит. Но, несомненно и другое - лен обладает доброй энергетикой, не поддающейся никакому объяснению.</p>\r\n<p>Природные свойства льна прекрасно отвечают требованиям, необходимым для интерьерного текстиля: они не деформируются, не теряют яркости и блеска. Льняные ткани более стойки к механическим воздействиям и с каждой стиркой льняная ткань становится только мягче.</p>\r\n<p>Лён - материал настолько древний, что уже один этот факт вызывает интерес и уважение. То, что проверено веками и тысячелетиями, достойно внимательного изучения.</p></div>\r\n<div class="col-xs-12 hidden-md hidden-lg">\r\n<h2>Магазин домашнего текстиля &laquo;Ля Прованс&raquo; Предлагает экологичные, натуральные и красивые изделия для дома:</h2>\r\n<p class="pr">Продукция Оршанского льнокомбината (Беларусь).<br />\r\nРазнообразное столовое и постельное белье, льняные махровые полотенца, рушники, наборы для сауны и кухни, покрывала и пледы, сумки.<br />\r\nЛьняные интерьерные игрушки ручной работы украсят дом и поднимут настроение.<br />\r\nФранцузское постельное белье &quot;La Scala&quot;.<br />\r\nМатериал сатин (хлопок 100%) обеспечит здоровый сон.<br />\r\nМы предложим Вам товары высшего качества, которые наполнят жизнь гармонией и комфортом, создадут в доме праздник и будут прекрасным подарком к любому торжеству!<br />\r\n<br />\r\nМагазин домашнего текстиля &quot;Ля Прованс&quot; г. Кривой Рог, пр. Мира 27<br />\r\nЗаказ по телефону 067 971-22-35, 096 704-62-13.<br />\r\ne-mail: 0967046213@mail.ru<br />\r\n<br />\r\n<br />\r\nСиние, голубые, лиловые, порой розовые и белые цветки на длинных стеблях, ровно застилающие поля &ndash; фантастическую красоту нежнейших переливов цветущего льна можно увидеть только до полудня, под жарким солнцем цветки складываются или осыпаются. Лен цветет всего несколько дней, но то, что научились создавать из него люди, оказалось на редкость долговечным, надежным и прочным. Льняные ткани издавна применяются для изготовления нательного, постельного и столового белья.<br />\r\nЛен имеет удивительные свойства: экологически чистый, прохладный в жару и теплый в холод, является антисептиком, хорошо впитывает влагу и быстро высыхает. Поэтому льняные ткани создают комфортную и здоровую обстановку, а сон на льняном белье считается лучшим способом восстановить силы и душевное равновесие. Этому, конечно, есть научное объяснение: химически необработанный лен содержит такие ценные элементы, как кремний и селен, и во время сна организм восполняет их дефицит. Но, несомненно и другое - лен обладает доброй энергетикой, не поддающейся никакому объяснению.<br />\r\nПриродные свойства льна прекрасно отвечают требованиям, необходимым для интерьерного текстиля: они не деформируются, не теряют яркости и блеска. Льняные ткани более стойки к механическим воздействиям и с каждой стиркой льняная ткань становится только мягче.<br />\r\nЛён - материал настолько древний, что уже один этот факт вызывает интерес и уважение. То, что проверено веками и тысячелетиями, достойно внимательного изучения.</p></div>', ''),
(2, 1, 4, 3, 1, '', '', '', '', '', '', '', 1, '85.173.83.50', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 0, '2016-07-04 07:12:12', '2016-07-04 04:15:29', 1, '85.173.83.50', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 'Лен и здоровье', '<p>Лён — настоящая кладовая здоровья. Он имеет целый ряд уникальных качеств, которые способствуют сохранению жизненного тонуса и достижению долголетия. Вот не самый полный их список:\r\n					<br><br>\r\n					<i>1. Абсолютная совместимость с биологическими объектами и гипоаллергенность. </i>\r\n					<br><br>\r\n					Обширные клинические испытания (больше 700 операций, в т.ч. и на сердце), которые были проведены в Институте хирургии им. Вишневского, доказали, что хирургическая нить из чистого льна после заживления шва за 2–3 месяца рассасывается безо всяких последствий для организма.<br><br>\r\n					<i>2. Природные соединения, содержащиеся в составе льняных нитей, способны угнетать патогенную микрофлору.</i>\r\n					<br><br>\r\n					Исследованиями показано, что льняная ткань благодаря присутствию в составе волокон естественных соединений фенола может эффективно сдерживать рост и размножение бактерий и грибов, будучи природным антисептиком.\r\n					<br><br>\r\n					<i>3. Способность останавливать кровотечения.</i>\r\n					<br><br>\r\n					Данное свойство льна отметили еще в древней Греции. Ещё в рукописях Алкмеона Кротонского, предшественника Гиппократа, для остановки кровотечения рекомендовались льняные повязки.\r\n					<br><br>\r\n					<i>4. Благоприятное воздействие на терморегуляцию организма, повышение адаптационного потенциала человека.</i>\r\n					<br><br>\r\n					При работе средней тяжести под одеждой человека влажность воздуха через 10 минут увеличивается до 100 %, при этом температура кожных покровов возрастает на 3 гр. Высочайшая воздухопроницаемость, хорошая теплопроводность, жесткость льняных материалов делают оптимальными тепловые условия функционирования человеческого организма.\r\n					<br><br>\r\n					<i>5. Высокая способность к сорбции.</i>\r\n					<br><br>\r\n					Это свойство выражается в интенсивной сорбции разных загрязнений и микроорганизмов с кожных покровов.\r\n					<br><br>\r\n					<i>6. Возможность поглощать свободные радикалы.</i>\r\n					<br><br>\r\n					Льняные ткани имеют выраженную антиоксидантную активность и могут на контактной поверхности эффективно нейтрализовать свободные радикалы, предотвращая этим ускорение старения кожных покровов.\r\n					<br><br>\r\n					<i>7. Благоприятное воздействие на мышечную систему человека.</i>\r\n					<br><br>\r\n					Мышцы по своей физической сути — машины, которые преобразуют химическую энергию в механическую работу и теплоту. Проведенные исследования доказали, что льняные ткани оптимизируют процесс терморегуляции, что способствует поддержанию высокой производительности мышц, а также снижает утомляемость мышечных волокон.\r\n					<br><br>\r\n					<i>8. Благоприятное влияние на кожу и на иммунитет человека.</i>\r\n					<br><br>\r\n					Согласно результатам многочисленных исследований использование постельного белья изо льна достоверно повышает уровень иммуноглобулинов в крови и понижает риск развития инфекционных процессов.\r\n					<br><br>\r\n					<i>9. Поглощение ионизирующего мягкого излучения.</i>\r\n					<br><br>\r\n					Это абсолютно уникальное свойство льносодержащих текстильных материалов, которое обусловлено наличием лигноуглеводного комплекса в льняном волокне (2,5–5 %) и микропримесями солей редких и тяжелых металлов (в пределах ПДК).\r\n					<br><br>\r\n					<i>10. Понижение статического электричества.</i>\r\n					<br><br>\r\n					Один из немаловажных факторов, который способствует сохранению хорошего здоровья и созданию комфорта для жизнедеятельности организма — понижение зарядов статического электричества в помещениях и на поверхностях, контактирующих с организмом.\r\n					</p>', 'linen.png:image/png:283847:4/3/linen.png'),
(3, 1, 5, 4, 1, '', '', '', '', '', '', '', 1, '85.173.83.50', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 0, '2016-07-04 07:19:28', '2016-07-04 04:19:28', 0, NULL, NULL, 'Оплата', '<p><i>1. Оплата на карточку ПриватБанка.</i><br/>\r\n					<br/>\r\n					Оплату на карточку Вы сможете осуществить через терминал ПриватБанка или через услугу “приват24”<br/>\r\n					<br/>\r\n					Номер карточки и счет на оплату  Вы получите на свой электронный адрес.<br/>\r\n					Оплата производится только после  уточнения у наших менеджеров наличия заказанного товара на складе!<br/>\r\n					Формирование и отправка заказа производится после подтверждения факта оплаты.<br/>\r\n					Услуги фирмы по доставке заказа Вы оплачиваете на месте, при его получении, в офисе транспортной компании.<br/>\r\n					<br/>\r\n					<i>2. Оплата наложенным платежом.</i><br/>\r\n					<br/>\r\n					Оплата за товар при получении на складе Новой Почты (оплата за доставку + оплата за пересылку денег - 2% от суммы)<br/>\r\n					Товар возможно вернуть (обменять)  в течении 14-ти дней с момента покупки при условии что, товарный вид и целостность упаковки не нарушены  . Возврат (обмен) товара происходит за счет покупателя.\r\n					<br/><br/>\r\n					</p>\r\n					<h2 class="text-center"> Доставка </h2>\r\n					<p><br/>Доставка из г. Кривой Рог по Украине транспортной компанией "Новая почта"<br/>\r\n					<br/>\r\n					Отправка заказа в течение суток, после поступления денег на счет магазина. Доставка заказа осуществляется транспортной компанией в течение 1-2 дней, если выпадают выходные дни, то сроки увеличиваются.<br/>\r\n					<br/>\r\n					Обратите внимание на то, что Ваш заказ не будет отправлен, если мы не сможем связаться с Вами перед отправкой товара. После отправки посылки, наш менеджер отправит на Ваш e-mail, указанный при регистрации, номер транспортной декларации.<br/>\r\n					<br/>\r\n					Получить заказ Вы сможете в офисе транспортной компании в Вашем городе, предъявив паспорт и номер декларации.\r\n					</p>', 'box.png:image/png:240132:5/4/box.png');

-- --------------------------------------------------------

--
-- Структура таблицы `Message8`
--

CREATE TABLE IF NOT EXISTS `Message8` (
  `Message_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) NOT NULL,
  `Subdivision_ID` int(11) NOT NULL,
  `Sub_Class_ID` int(11) NOT NULL,
  `Priority` int(11) NOT NULL DEFAULT '0',
  `Keyword` char(255) NOT NULL,
  `ncTitle` varchar(255) DEFAULT NULL,
  `ncKeywords` varchar(255) DEFAULT NULL,
  `ncDescription` text,
  `ncSMO_Title` varchar(255) DEFAULT NULL,
  `ncSMO_Description` text,
  `ncSMO_Image` char(255) DEFAULT NULL,
  `Checked` tinyint(4) NOT NULL DEFAULT '1',
  `IP` char(15) DEFAULT NULL,
  `UserAgent` char(255) DEFAULT NULL,
  `Parent_Message_ID` int(11) NOT NULL DEFAULT '0',
  `Created` datetime NOT NULL,
  `LastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastUser_ID` int(11) NOT NULL,
  `LastIP` char(15) DEFAULT NULL,
  `LastUserAgent` char(255) DEFAULT NULL,
  `Name` char(255) DEFAULT NULL,
  `Size` char(255) DEFAULT NULL,
  `Code` char(255) DEFAULT NULL,
  `Vendor` char(255) DEFAULT NULL,
  `Price` char(255) DEFAULT NULL,
  `Price_OLD` char(255) DEFAULT NULL,
  `Description` longtext,
  `Image` char(255) DEFAULT NULL,
  `Link_OLD` char(255) DEFAULT NULL,
  `ImageBig` char(255) DEFAULT NULL,
  `MultiImage` char(255) DEFAULT NULL,
  PRIMARY KEY (`Message_ID`),
  UNIQUE KEY `Sub_Class_ID` (`Sub_Class_ID`,`Message_ID`,`Keyword`),
  KEY `User_ID` (`User_ID`),
  KEY `LastUser_ID` (`LastUser_ID`),
  KEY `Subdivision_ID` (`Subdivision_ID`),
  KEY `Parent_Message_ID` (`Parent_Message_ID`),
  KEY `Priority` (`Priority`,`LastUpdated`),
  KEY `Checked` (`Checked`),
  KEY `Created` (`Created`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=134 ;

--
-- Дамп данных таблицы `Message8`
--

INSERT INTO `Message8` (`Message_ID`, `User_ID`, `Subdivision_ID`, `Sub_Class_ID`, `Priority`, `Keyword`, `ncTitle`, `ncKeywords`, `ncDescription`, `ncSMO_Title`, `ncSMO_Description`, `ncSMO_Image`, `Checked`, `IP`, `UserAgent`, `Parent_Message_ID`, `Created`, `LastUpdated`, `LastUser_ID`, `LastIP`, `LastUserAgent`, `Name`, `Size`, `Code`, `Vendor`, `Price`, `Price_OLD`, `Description`, `Image`, `Link_OLD`, `ImageBig`, `MultiImage`) VALUES
(7, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 04:05:47', 1, '5.139.36.53', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 'Наволочка 70*70, лен 100%', '', '12с89', 'Белорусский Лен', '200', '230', '<p>Наволочка верхняя 70*70 (12с89) Настоящий стиль кантри! Льняная наволочка с кружевом то, что нужно для создания этого стиля! Красиво, стильно, экологично!Состав ткани: &nbsp;лен - 100%Производитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь &nbsp; Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции. &nbsp;Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье. &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>', '20_6_7.jpg:image/jpeg:12518:20/6/20_6_7.jpg', 'http://laprovence.com.ua/ru/34-комплект-постельного-белья-.html', '20_6_7_1.jpg:image/jpeg:12518:20/6/20_6_7_1.jpg', ''),
(8, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Комплект постельного белья, полутор, лен 100%', '', '11с384', 'Белорусский Лен \n                \n                \n', '1550', '', 'Коллекция "Цветочный мотив" (11с359)Комплект постельного белья полуторный размер. Очень нежный цветочный мотив на пододеяльнике и наволочках с белой простыней. Идеален для спален в стиле прованс, кантри, шебби шик.Состав ткани: 100 % ленУпаковка: плотный пакет ПВХ.Комплектация: пододеяльник, размер 215х148 смпростыня, размер 220х150 смнаволочка (2 штуки), размер 70х70Производитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции.  Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье.\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_8.jpg:image/jpeg:12518:20/6/20_6_8.jpg', 'http://laprovence.com.ua/ru/50-комплект-постельного-белья-.html\n', '20_6_8_1.jpg:image/jpeg:12518:20/6/20_6_8_1.jpg', NULL),
(9, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 1, '85.173.83.50', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 'Комплект постельного белья, двуспал, лен 100%', '', '12с102', 'Белорусский Лен', '2400', '2700', '<p>Коллекция &quot;Злато&quot; (12с102)Комплект постельного белья двуспальный размер.&nbsp;Состав ткани: 100 % ленУпаковка:&nbsp;плотный пакет ПВХ.Комплектация: пододеяльник, размер 215х175 смпростыня, размер 220х220 смнаволочка (2 штуки), размер 50х70Производитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь &nbsp; Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции. &nbsp;Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье. &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>', '20_6_9.jpg:image/jpeg:12518:20/6/20_6_9.jpg', 'http://laprovence.com.ua/ru/115-комплект-постельного-белья-.html', '20_6_9_1.jpg:image/jpeg:12518:20/6/20_6_9_1.jpg', NULL),
(10, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Простыня 220*150, лен100%', '', '12с194', 'Белорусский Лен \n                \n                \n', '400', '', 'Простыня голубая полоскаСостав ткани:  лен 100%Размаер: 220*150 смПроизводитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции.  Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье.\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_10.jpg:image/jpeg:12518:20/6/20_6_10.jpg', 'http://laprovence.com.ua/ru/126-комплект-постельного-белья-.html\n', '20_6_10_1.jpg:image/jpeg:12518:20/6/20_6_10_1.jpg', NULL),
(11, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Простыня 220*150, лен/хл', '', '08с365', 'Белорусский Лен \n                \n                \n', '350', '', 'Простыня голубая Состав ткани:  лен/хлРазмаер: 220*150 смПроизводитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции.  Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье.\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_11.jpg:image/jpeg:12518:20/6/20_6_11.jpg', 'http://laprovence.com.ua/ru/127-комплект-постельного-белья-.html\n', '20_6_11_1.jpg:image/jpeg:12518:20/6/20_6_11_1.jpg', NULL),
(12, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Простыня 220*150, лен/хл', '', '08с110', 'Белорусский Лен \n                \n                \n', '350', '', 'Простыня голубая меланжСостав ткани:  лен/хлРазмаер: 220*150 смПроизводитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции.  Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье.\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_12.jpg:image/jpeg:12518:20/6/20_6_12.jpg', 'http://laprovence.com.ua/ru/128-комплект-постельного-белья-.html\n', '20_6_12_1.jpg:image/jpeg:12518:20/6/20_6_12_1.jpg', NULL),
(13, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Простыня 220*150, лен/хл', '', '08с110', 'Белорусский Лен \n                \n                \n', '350', '', 'Простыня клеточкаСостав ткани:  лен/хлРазмаер: 220*150 смПроизводитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции.  Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье.\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_13.jpg:image/jpeg:12518:20/6/20_6_13.jpg', 'http://laprovence.com.ua/ru/130-комплект-постельного-белья-.html\n', '20_6_13_1.jpg:image/jpeg:12518:20/6/20_6_13_1.jpg', NULL),
(14, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Комплект постельного белья, семейн, лен 100%', '', '10с881', 'Белорусский Лен \n                \n                \n', '2800', '', 'Коллекция "Мозаика" (10с881)Комплект постельного белья семейный.Состав ткани: 100 % ленУпаковка:  плотный пакет ПВХ. Комплектация: пододеяльник,  215х148 см - 2 штпростыня,    220х235 см - 1 штнаволочка,   70х70 см - 2 штПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n       Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции.  Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье. \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_14.jpg:image/jpeg:12518:20/6/20_6_14.jpg', 'http://laprovence.com.ua/ru/131-комплект-постельного-белья-.html\n', '20_6_14_1.jpg:image/jpeg:12518:20/6/20_6_14_1.jpg', NULL),
(15, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 1, '85.173.83.50', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 'Комплект постельного белья, полутор, лен 100%', '', '12с415', 'Белорусский Лен', '1500', '1800', '<p>Коллекция &quot;Квартет&quot; (12с415)Комплект постельного белья полуторный размер.&nbsp;Состав ткани: 100 % ленУпаковка:&nbsp;плотный пакет ПВХ.Комплектация: пододеяльник, размер 215х148 смпростыня, размер 220х150 смнаволочка (2 штуки), размер 50х70Производитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь &nbsp; Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции. &nbsp;Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье. &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>', '20_6_15.jpg:image/jpeg:12518:20/6/20_6_15.jpg', 'http://laprovence.com.ua/ru/132-комплект-постельного-белья-.html', '20_6_15_1.jpg:image/jpeg:12518:20/6/20_6_15_1.jpg', NULL),
(16, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Наволочка 70*70, лен 100%', '', '12с91', 'Белорусский Лен \n                \n                \n', '200', '', 'Наволочка верхняя 70*70 (12с91)\r\nНастоящий стиль кантри! Льняная наволочка в клеточку то, что нужно для создания этого стиля! Красиво, стильно, экологично!Состав ткани:  лен - 100%Производитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции.  Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье.\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_16.jpg:image/jpeg:12518:20/6/20_6_16.jpg', 'http://laprovence.com.ua/ru/134-комплект-постельного-белья-.html\n', '20_6_16_1.jpg:image/jpeg:12518:20/6/20_6_16_1.jpg', NULL),
(17, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Наволочка 60*60, лен/хл', '', '11с590', 'Белорусский Лен \n                \n                \n', '120', '', 'Наволочка верхняя 60*60 (11с590)Состав ткани:  лен - 46%, хлопок - 54%Производитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции.  Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье.\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_17.jpg:image/jpeg:12518:20/6/20_6_17.jpg', 'http://laprovence.com.ua/ru/135-комплект-постельного-белья-.html\n', '20_6_17_1.jpg:image/jpeg:12518:20/6/20_6_17_1.jpg', NULL),
(18, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Наволочка 60*60, лен/хл', '', '11с590', 'Белорусский Лен \n                \n                \n', '120', '', 'Наволочка верхняя 60*60 (11с590)Состав ткани:  лен - 46%, хлопок - 54%Производитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции.  Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье.\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_18.jpg:image/jpeg:12518:20/6/20_6_18.jpg', 'http://laprovence.com.ua/ru/136-комплект-постельного-белья-.html\n', '20_6_18_1.jpg:image/jpeg:12518:20/6/20_6_18_1.jpg', NULL),
(19, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Наволочка 60*60, лен/хл', '', '09с22', 'Белорусский Лен \n                \n                \n', '100', '', 'Наволочка верхняя 60*60 (09с22)Состав ткани:  лен - 47%, хлопок - 53%Производитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции.  Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье.\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_19.jpg:image/jpeg:12518:20/6/20_6_19.jpg', 'http://laprovence.com.ua/ru/138-комплект-постельного-белья-.html\n', '20_6_19_1.jpg:image/jpeg:12518:20/6/20_6_19_1.jpg', NULL),
(20, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Н-р наволочек из 2-х шт "Розы"  70*70, лен 100%', '', '10с738', 'Белорусский Лен \n                \n                \n', '400', '', 'Н-р наволочек из 2-х шт " Розы" 70*70, (10с738)\r\nНаволочки с принтом "Розы" создадут в спальне романтичную обстановку. Красиво смотрятся и на белых, и на цветных простынях.\r\nСостав ткани:  лен - 100%Производитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции.  Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье.\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_20.jpg:image/jpeg:12518:20/6/20_6_20.jpg', 'http://laprovence.com.ua/ru/139-комплект-постельного-белья-.html\n', '20_6_20_1.jpg:image/jpeg:12518:20/6/20_6_20_1.jpg', NULL),
(21, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 1, '85.173.83.50', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 'Простыня 220*200, лен100%', '', '10с738', 'Белорусский Лен', '650', '800', '<p>Простыня в нежно зеленую полоскуСостав ткани: &nbsp;лен 100%Размаер: 220*200 смПроизводитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь &nbsp; Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции. &nbsp;Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье. &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>', '20_6_21.jpg:image/jpeg:12518:20/6/20_6_21.jpg', 'http://laprovence.com.ua/ru/151-комплект-постельного-белья-.html', '20_6_21_1.jpg:image/jpeg:12518:20/6/20_6_21_1.jpg', NULL),
(22, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Простыня 220*230, лен100%', '', '10с738', 'Белорусский Лен \n                \n                \n', '600', '', 'Простыня белаяСостав ткани:  лен 100%Размаер: 220*230 смПроизводитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции.  Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье.\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_22.jpg:image/jpeg:12518:20/6/20_6_22.jpg', 'http://laprovence.com.ua/ru/152-комплект-постельного-белья-.html\n', '20_6_22_1.jpg:image/jpeg:12518:20/6/20_6_22_1.jpg', NULL),
(23, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Простыня 220*220, лен100%', '', '10с738', 'Белорусский Лен \n                \n                \n', '550', '', 'Простыня белаяСостав ткани:  лен 100%Размаер: 220*220 смПроизводитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции.  Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье.\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_23.jpg:image/jpeg:12518:20/6/20_6_23.jpg', 'http://laprovence.com.ua/ru/153-комплект-постельного-белья-.html\n', '20_6_23_1.jpg:image/jpeg:12518:20/6/20_6_23_1.jpg', NULL),
(24, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Простыня 220*200, лен100%', '', '10с738', 'Белорусский Лен \n                \n                \n', '500', '', 'Простыня белаяСостав ткани:  лен 100%Размаер: 220*200 смПроизводитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции.  Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье.\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_24.jpg:image/jpeg:12518:20/6/20_6_24.jpg', 'http://laprovence.com.ua/ru/154-комплект-постельного-белья-.html\n', '20_6_24_1.jpg:image/jpeg:12518:20/6/20_6_24_1.jpg', NULL),
(25, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Комплект постельного белья, полутор, лен 100%', '', '11с455', 'Белорусский Лен \n                \n                \n', '1450', '', 'Комплект постельного белья полуторный размер. \r\nПододеяльник и наволочки из льна желтого цвета, простыня белая с узорным бордюром. Комплект создаст в спальне солнечную, теплую атмосферу!\r\nСостав ткани: 100 % ленУпаковка: плотный пакет ПВХ.Комплектация: пододеяльник, размер 215х148 смпростыня, размер 220х150 смнаволочка (2 штуки), размер 70х70Производитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции.  Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье.\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_25.jpg:image/jpeg:12518:20/6/20_6_25.jpg', 'http://laprovence.com.ua/ru/367-комплект-постельного-белья-.html\n', '20_6_25_1.jpg:image/jpeg:12518:20/6/20_6_25_1.jpg', NULL),
(26, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Комплект постельного белья, двуспал, лен/хл', '', '10с477', 'Белорусский Лен \n                \n                \n', '1700', '', 'Комплект постельного белья двуспальный размер. \r\nСостав ткани: 58% - лен, 42% - хлопок Упаковка: плотный пакет ПВХ.Комплектация: пододеяльник, размер 215х175 смпростыня, размер 220х220 смнаволочка (2 штуки), размер 70х70Производитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции.  Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье.\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_26.jpg:image/jpeg:12518:20/6/20_6_26.jpg', 'http://laprovence.com.ua/ru/369-комплект-постельного-белья-.html\n', '20_6_26_1.jpg:image/jpeg:12518:20/6/20_6_26_1.jpg', NULL),
(27, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Простыня 220*150, лен100%', '', '12с464', 'Белорусский Лен \n                \n                \n', '450', '', 'Простыня молочная в клетку. Состав ткани:  лен 100%Размаер: 225*150 смПроизводитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции.  Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье.\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_27.jpg:image/jpeg:12518:20/6/20_6_27.jpg', 'http://laprovence.com.ua/ru/448-комплект-постельного-белья-.html\n', '20_6_27_1.jpg:image/jpeg:12518:20/6/20_6_27_1.jpg', NULL),
(28, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Наволочка 70*70, лен 100%', '', '08с424', 'Белорусский Лен \n                \n                \n', '200', '', 'Наволочка верхняя 70*70 Состав ткани:  лен - 100%Производитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции.  Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье.\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_28.jpg:image/jpeg:12518:20/6/20_6_28.jpg', 'http://laprovence.com.ua/ru/449-комплект-постельного-белья-.html\n', '20_6_28_1.jpg:image/jpeg:12518:20/6/20_6_28_1.jpg', NULL),
(29, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Наволочка "Подарок" 50*70, лен/хл', '', '08с391', 'Белорусский Лен \n                \n                \n', '140', '', 'Наволочка "Подарок" 50*70 смСостав ткани:  лен - 53%, хлопок - 47%Производитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции.  Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье.\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_29.jpg:image/jpeg:12518:20/6/20_6_29.jpg', 'http://laprovence.com.ua/ru/461-комплект-постельного-белья-.html\n', '20_6_29_1.jpg:image/jpeg:12518:20/6/20_6_29_1.jpg', NULL),
(30, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Простыня Людмила 220*180, лен/хл', '', '12с39', 'Белорусский Лен \n                \n                \n', '580', '', 'Простыня Людмила (желтая)Состав ткани:  лен 53%, хлопок 47%Размаер: 220*180 смПроизводитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции.  Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье.\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_30.jpg:image/jpeg:12518:20/6/20_6_30.jpg', 'http://laprovence.com.ua/ru/486-комплект-постельного-белья-.html\n', '20_6_30_1.jpg:image/jpeg:12518:20/6/20_6_30_1.jpg', NULL),
(31, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Пододеяльник  215*175, лен/хл', '', '10с477', 'Белорусский Лен \n                \n                \n', '850', '', 'Пододеяльник желтыйСостав ткани:  лен 58%, хлопок 42%Размаер: 215*175 смПроизводитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции.  Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье.\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_31.jpg:image/jpeg:12518:20/6/20_6_31.jpg', 'http://laprovence.com.ua/ru/488-комплект-постельного-белья-.html\n', '20_6_31_1.jpg:image/jpeg:12518:20/6/20_6_31_1.jpg', NULL),
(32, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Наволочка 70*70, лен/хл', '', '10с477', 'Белорусский Лен \n                \n                \n', '180', '', 'Наволочка верхняяСостав ткани:  лен 58%, хлопок 42%Размаер: 70*70 смПроизводитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции.  Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье.\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_32.jpg:image/jpeg:12518:20/6/20_6_32.jpg', 'http://laprovence.com.ua/ru/489-комплект-постельного-белья-.html\n', '20_6_32_1.jpg:image/jpeg:12518:20/6/20_6_32_1.jpg', NULL),
(33, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Наволочка 70*70, лен/хл', '', '12с38', 'Белорусский Лен \n                \n                \n', '180', '', 'Наволочка верхняяСостав ткани:  лен 53%, хлопок 47%Размер: 70*70 смПроизводитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции.  Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье.\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_33.jpg:image/jpeg:12518:20/6/20_6_33.jpg', 'http://laprovence.com.ua/ru/490-комплект-постельного-белья-.html\n', '20_6_33_1.jpg:image/jpeg:12518:20/6/20_6_33_1.jpg', NULL);
INSERT INTO `Message8` (`Message_ID`, `User_ID`, `Subdivision_ID`, `Sub_Class_ID`, `Priority`, `Keyword`, `ncTitle`, `ncKeywords`, `ncDescription`, `ncSMO_Title`, `ncSMO_Description`, `ncSMO_Image`, `Checked`, `IP`, `UserAgent`, `Parent_Message_ID`, `Created`, `LastUpdated`, `LastUser_ID`, `LastIP`, `LastUserAgent`, `Name`, `Size`, `Code`, `Vendor`, `Price`, `Price_OLD`, `Description`, `Image`, `Link_OLD`, `ImageBig`, `MultiImage`) VALUES
(34, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Комплект постельного белья, евро, лен 100%', '', '10с880', 'Белорусский Лен \n                \n                \n', '2700', '', 'Комплект постельного белья \r\nСиний пододеяльник и наволочки, простыня цвета фуксии. Яркие, насыщенные тона. (На фото - синяя простыня и пододеяльник фуксия).\r\nСостав ткани: 100 % ленУпаковка: плотный пакет ПВХ.Комплектация: пододеяльник, размер 220х210 смпростыня, размер 235х220 смнаволочка (2 штуки), размер 50х70Производитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции.  Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье.\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_34.jpg:image/jpeg:12518:20/6/20_6_34.jpg', 'http://laprovence.com.ua/ru/541-комплект-постельного-белья-.html\n', '20_6_34_1.jpg:image/jpeg:12518:20/6/20_6_34_1.jpg', NULL),
(35, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Простыня 220*150, лен/хл', '', '08с364', 'Белорусский Лен \n                \n                \n', '500', '', 'Простыня НастроениеСостав ткани:  лен- 46%, хл - 54%Размаер: 220*150 смПроизводитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции.  Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье.\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_35.jpg:image/jpeg:12518:20/6/20_6_35.jpg', 'http://laprovence.com.ua/ru/593-простыня-лен.html\n', '20_6_35_1.jpg:image/jpeg:12518:20/6/20_6_35_1.jpg', NULL),
(36, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Комплект постельного белья, семейн, лен 100%', '', '12с333', 'Белорусский Лен \n                \n                \n', '2900', '', 'Комплект постельного белья семейный.\r\nСостав ткани: 100 % ленУпаковка:  плотный пакет ПВХ. Комплектация: пододеяльник,  215х148 см - 2 штпростыня,    220х235 см - 1 штнаволочка,   50х70 см - 2 штПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n       Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции.  Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье. \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_36.jpg:image/jpeg:12518:20/6/20_6_36.jpg', 'http://laprovence.com.ua/ru/632-комплект-постельного-белья-.html\n', '20_6_36_1.jpg:image/jpeg:12518:20/6/20_6_36_1.jpg', NULL),
(37, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'К-т постельного белья "Иллюзия" , евро, лен 100%', '', '13с318', 'Белорусский Лен \n                \n                \n', '2800', '', 'Комплект постельного белья "Иллюзия"\r\nБелое льняное белье с серой каймой для всех, кто любит комфорт и экологичность. \r\nСостав ткани: 100 % ленУпаковка: плотный пакет ПВХ.Комплектация: пододеяльник, размер 220х210 смпростыня, размер 240х220 смнаволочка (2 штуки), размер 50х70Производитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняное постельное белье лучший выбор для Вашей спальни! Оно очень высоко ценится за свои качества: отлично впитывает влагу, быстро высыхает, прекрасно справляется с функцией терморегуляции.  Лен - самый комфортный материал для кожи человека. Постельное белье изо льна рекомендован людям с чувствительной кожей, с кожными заболеваниями и аллергией. Свежесть, комфорт, снятие усталости, здоровый, восполняющий силы сон - такую атмосферу уюта способно создать льняное постельное белье.\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_37.jpg:image/jpeg:12518:20/6/20_6_37.jpg', 'http://laprovence.com.ua/ru/643-комплект-постельного-белья-.html\n', '20_6_37_1.jpg:image/jpeg:12518:20/6/20_6_37_1.jpg', NULL),
(38, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Комплект постельного белья евро (сатин)', '', 'JP-06-6', 'La Scala\n                \n                \n', '2200', '', 'Комплект постельного белья (JP-06-6)\r\nКомплект евро изготовлен из ткани сатин жаккард люкс фотопринт. \r\nСостав ткани: сатин (100 %  хлопок) Упаковка: картонная упаковка Комплектация: пододеяльник, размер 220х200 см - 1 штпростыня, размер 250х250 см - 1 штнаволочка , размер 50х70+5 см. - 2 шт., размер 70*70см. - 2 шт.Производитель: La Scala (Франция)Страна производства: Китай\r\nНастоящее произведение искусства – именно так можно охарактеризовать постельное белье La Scala. Отменное качество, деликатность тканей и широкая палитра оттенков – его главные отличительные черты. А все это дополняют оригинальные и порой неординарные расцветки и рисунки. Французское постельное белье La Scala обеспечит Вам удобный и полноценный сон, превратив Вашу спальню в уютный мир. Ведь наволочки, простыни и пододеяльники изготовлены из натуральных гипоаллергенных материалов, которые способствуют здоровому сну, позволяют полностью расслабиться. Специалисты компании постоянно усовершенствуют технологии изготовления белья и качество продукции. Так, стойкие краски и четкие контуры рисунков гарантируют долгий срок службы продукции.\r\n \r\n \r\n   \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_38.jpg:image/jpeg:12518:20/6/20_6_38.jpg', 'http://laprovence.com.ua/ru/69-комплект-постельного-белья-евро-сатин.html\n', '20_6_38_1.jpg:image/jpeg:12518:20/6/20_6_38_1.jpg', NULL),
(39, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Комплект постельного белья полуторный (сатин)', '', 'Y230-483', 'La Scala\n                \n                \n', '1300', '', 'Комплект постельного белья полуторный Y230-483\r\nСостав ткани: сатин (100 %  хлопок) Упаковка: картонная упаковка Комплектация: пододеяльник, размер 160х220 см - 1 штпростыня, размер 200х250 см - 1 штнаволочка , размер 50х70 см. - 2 шт., Производитель: La Scala (Франция)Страна производства: Китай\r\nНастоящее произведение искусства – именно так можно охарактеризовать постельное белье La Scala. Отменное качество, деликатность тканей и широкая палитра оттенков – его главные отличительные черты. А все это дополняют оригинальные и порой неординарные расцветки и рисунки. Французское постельное белье La Scala обеспечит Вам удобный и полноценный сон, превратив Вашу спальню в уютный мир. Ведь наволочки, простыни и пододеяльники изготовлены из натуральных гипоаллергенных материалов, которые способствуют здоровому сну, позволяют полностью расслабиться. Специалисты компании постоянно усовершенствуют технологии изготовления белья и качество продукции. Так, стойкие краски и четкие контуры рисунков гарантируют долгий срок службы продукции.\r\n \r\n \r\n   \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_39.jpg:image/jpeg:12518:20/6/20_6_39.jpg', 'http://laprovence.com.ua/ru/72-комплект-постельного-белья.html\n', '20_6_39_1.jpg:image/jpeg:12518:20/6/20_6_39_1.jpg', NULL),
(40, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Комплект постельного белья полуторный (сатин)', '', 'Y230-480', 'La Scala\n                \n                \n', '1300', '', 'Комплект постельного белья полуторный Y230-483\r\nСостав ткани: сатин (100 %  хлопок) Упаковка: картонная упаковка Комплектация: пододеяльник, размер 160х220 см - 1 штпростыня, размер 200х250 см - 1 штнаволочка , размер 50х70 см. - 2 шт., Производитель: La Scala (Франция)Страна производства: Китай\r\nНастоящее произведение искусства – именно так можно охарактеризовать постельное белье La Scala. Отменное качество, деликатность тканей и широкая палитра оттенков – его главные отличительные черты. А все это дополняют оригинальные и порой неординарные расцветки и рисунки. Французское постельное белье La Scala обеспечит Вам удобный и полноценный сон, превратив Вашу спальню в уютный мир. Ведь наволочки, простыни и пододеяльники изготовлены из натуральных гипоаллергенных материалов, которые способствуют здоровому сну, позволяют полностью расслабиться. Специалисты компании постоянно усовершенствуют технологии изготовления белья и качество продукции. Так, стойкие краски и четкие контуры рисунков гарантируют долгий срок службы продукции.\r\n \r\n \r\n   \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_40.jpg:image/jpeg:12518:20/6/20_6_40.jpg', 'http://laprovence.com.ua/ru/239-комплект-постельного-белья-.html\n', '20_6_40_1.jpg:image/jpeg:12518:20/6/20_6_40_1.jpg', NULL),
(41, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Комплект постельного белья полуторный (сатин)', '', 'Y230-488', 'La Scala\n                \n                \n', '1300', '', 'Комплект постельного белья полуторный Y230-483\r\nСостав ткани: сатин (100 %  хлопок) Упаковка: картонная упаковка Комплектация: пододеяльник, размер 160х220 см - 1 штпростыня, размер 200х250 см - 1 штнаволочка , размер 50х70 см. - 2 шт., Производитель: La Scala (Франция)Страна производства: Китай\r\nНастоящее произведение искусства – именно так можно охарактеризовать постельное белье La Scala. Отменное качество, деликатность тканей и широкая палитра оттенков – его главные отличительные черты. А все это дополняют оригинальные и порой неординарные расцветки и рисунки. Французское постельное белье La Scala обеспечит Вам удобный и полноценный сон, превратив Вашу спальню в уютный мир. Ведь наволочки, простыни и пододеяльники изготовлены из натуральных гипоаллергенных материалов, которые способствуют здоровому сну, позволяют полностью расслабиться. Специалисты компании постоянно усовершенствуют технологии изготовления белья и качество продукции. Так, стойкие краски и четкие контуры рисунков гарантируют долгий срок службы продукции.\r\n \r\n \r\n   \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_41.jpg:image/jpeg:12518:20/6/20_6_41.jpg', 'http://laprovence.com.ua/ru/240-комплект-постельного-белья-.html\n', '20_6_41_1.jpg:image/jpeg:12518:20/6/20_6_41_1.jpg', NULL),
(42, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Комплект постельного белья полуторный (сатин)', '', 'Y230-458', 'La Scala\n                \n                \n', '1300', '', 'Комплект постельного белья полуторный Y230-483\r\nСостав ткани: сатин (100 %  хлопок) Упаковка: картонная упаковка Комплектация: пододеяльник, размер 160х220 см - 1 штпростыня, размер 200х250 см - 1 штнаволочка , размер 50х70 см. - 2 шт., Производитель: La Scala (Франция)Страна производства: Китай\r\nНастоящее произведение искусства – именно так можно охарактеризовать постельное белье La Scala. Отменное качество, деликатность тканей и широкая палитра оттенков – его главные отличительные черты. А все это дополняют оригинальные и порой неординарные расцветки и рисунки. Французское постельное белье La Scala обеспечит Вам удобный и полноценный сон, превратив Вашу спальню в уютный мир. Ведь наволочки, простыни и пододеяльники изготовлены из натуральных гипоаллергенных материалов, которые способствуют здоровому сну, позволяют полностью расслабиться. Специалисты компании постоянно усовершенствуют технологии изготовления белья и качество продукции. Так, стойкие краски и четкие контуры рисунков гарантируют долгий срок службы продукции.\r\n \r\n \r\n   \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_42.jpg:image/jpeg:12518:20/6/20_6_42.jpg', 'http://laprovence.com.ua/ru/241-комплект-постельного-белья-.html\n', '20_6_42_1.jpg:image/jpeg:12518:20/6/20_6_42_1.jpg', NULL),
(43, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Комплект постельного белья полуторный (сатин)', '', 'Y230-474', 'La Scala\n                \n                \n', '1300', '', 'Комплект постельного белья полуторный Y230-483\r\nСостав ткани: сатин (100 %  хлопок) Упаковка: картонная упаковка Комплектация: пододеяльник, размер 160х220 см - 1 штпростыня, размер 200х250 см - 1 штнаволочка , размер 50х70 см. - 2 шт., Производитель: La Scala (Франция)Страна производства: Китай\r\nНастоящее произведение искусства – именно так можно охарактеризовать постельное белье La Scala. Отменное качество, деликатность тканей и широкая палитра оттенков – его главные отличительные черты. А все это дополняют оригинальные и порой неординарные расцветки и рисунки. Французское постельное белье La Scala обеспечит Вам удобный и полноценный сон, превратив Вашу спальню в уютный мир. Ведь наволочки, простыни и пододеяльники изготовлены из натуральных гипоаллергенных материалов, которые способствуют здоровому сну, позволяют полностью расслабиться. Специалисты компании постоянно усовершенствуют технологии изготовления белья и качество продукции. Так, стойкие краски и четкие контуры рисунков гарантируют долгий срок службы продукции.\r\n \r\n \r\n   \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_43.jpg:image/jpeg:12518:20/6/20_6_43.jpg', 'http://laprovence.com.ua/ru/242-комплект-постельного-белья-.html\n', '20_6_43_1.jpg:image/jpeg:12518:20/6/20_6_43_1.jpg', NULL),
(44, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Комплект постельного белья полуторный (сатин)', '', 'Y230-487', 'La Scala\n                \n                \n', '1300', '', 'Комплект постельного белья полуторный Y230-487\r\nСостав ткани: сатин (100 %  хлопок) Упаковка: картонная упаковка Комплектация: пододеяльник, размер 160х220 см - 1 штпростыня, размер 200х250 см - 1 штнаволочка , размер 50х70 см. - 2 шт., Производитель: La Scala (Франция)Страна производства: Китай\r\nНастоящее произведение искусства – именно так можно охарактеризовать постельное белье La Scala. Отменное качество, деликатность тканей и широкая палитра оттенков – его главные отличительные черты. А все это дополняют оригинальные и порой неординарные расцветки и рисунки. Французское постельное белье La Scala обеспечит Вам удобный и полноценный сон, превратив Вашу спальню в уютный мир. Ведь наволочки, простыни и пододеяльники изготовлены из натуральных гипоаллергенных материалов, которые способствуют здоровому сну, позволяют полностью расслабиться. Специалисты компании постоянно усовершенствуют технологии изготовления белья и качество продукции. Так, стойкие краски и четкие контуры рисунков гарантируют долгий срок службы продукции.\r\n \r\n \r\n   \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_44.jpg:image/jpeg:12518:20/6/20_6_44.jpg', 'http://laprovence.com.ua/ru/243-комплект-постельного-белья-.html\n', '20_6_44_1.jpg:image/jpeg:12518:20/6/20_6_44_1.jpg', NULL),
(45, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Комплект постельного белья полуторный (сатин)', '', 'Y230-487', 'La Scala\n                \n                \n', '1300', '', 'Комплект постельного белья полуторный Y230-487\r\nСостав ткани: сатин (100 %  хлопок) Упаковка: картонная упаковка Комплектация: пододеяльник, размер 160х220 см - 1 штпростыня, размер 200х250 см - 1 штнаволочка , размер 50х70 см. - 2 шт., Производитель: La Scala (Франция)Страна производства: Китай\r\nНастоящее произведение искусства – именно так можно охарактеризовать постельное белье La Scala. Отменное качество, деликатность тканей и широкая палитра оттенков – его главные отличительные черты. А все это дополняют оригинальные и порой неординарные расцветки и рисунки. Французское постельное белье La Scala обеспечит Вам удобный и полноценный сон, превратив Вашу спальню в уютный мир. Ведь наволочки, простыни и пододеяльники изготовлены из натуральных гипоаллергенных материалов, которые способствуют здоровому сну, позволяют полностью расслабиться. Специалисты компании постоянно усовершенствуют технологии изготовления белья и качество продукции. Так, стойкие краски и четкие контуры рисунков гарантируют долгий срок службы продукции.\r\n \r\n \r\n   \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_45.jpg:image/jpeg:12518:20/6/20_6_45.jpg', 'http://laprovence.com.ua/ru/244-комплект-постельного-белья-.html\n', '20_6_45_1.jpg:image/jpeg:12518:20/6/20_6_45_1.jpg', NULL),
(46, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'К-т постельного белья евро (сатин)', '', 'Y230-420', 'La Scala\n                \n                \n', '1550', '', 'Комплект постельного белья (Y230-558)\r\nСостав ткани: сатин (100 %  хлопок) Упаковка: картонная упаковка Комплектация: пододеяльник, размер 220х200 смпростыня, размер 230х250 смнаволочка (2 штуки), размер 50х70+5Производитель: La Scala (Франция)Страна производства: Китай\r\nНастоящее произведение искусства – именно так можно охарактеризовать постельное белье La Scala. Отменное качество, деликатность тканей и широкая палитра оттенков – его главные отличительные черты. А все это дополняют оригинальные и порой неординарные расцветки и рисунки. Французское постельное белье La Scala обеспечит Вам удобный и полноценный сон, превратив Вашу спальню в уютный мир. Ведь наволочки, простыни и пододеяльники изготовлены из натуральных гипоаллергенных материалов, которые способствуют здоровому сну, позволяют полностью расслабиться. Специалисты компании постоянно усовершенствуют технологии изготовления белья и качество продукции. Так, стойкие краски и четкие контуры рисунков гарантируют долгий срок службы продукции.\r\n \r\n \r\n   \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_46.jpg:image/jpeg:12518:20/6/20_6_46.jpg', 'http://laprovence.com.ua/ru/246-комплект-постельного-белья-.html\n', '20_6_46_1.jpg:image/jpeg:12518:20/6/20_6_46_1.jpg', NULL),
(47, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'К-т постельного белья евро (сатин)', '', 'Y230-445', 'La Scala\n                \n                \n', '1550', '', 'Комплект постельного белья (Y230-558)\r\nСостав ткани: сатин (100 %  хлопок) Упаковка: картонная упаковка Комплектация: пододеяльник, размер 220х200 смпростыня, размер 230х250 смнаволочка (2 штуки), размер 50х70+5Производитель: La Scala (Франция)Страна производства: Китай\r\nНастоящее произведение искусства – именно так можно охарактеризовать постельное белье La Scala. Отменное качество, деликатность тканей и широкая палитра оттенков – его главные отличительные черты. А все это дополняют оригинальные и порой неординарные расцветки и рисунки. Французское постельное белье La Scala обеспечит Вам удобный и полноценный сон, превратив Вашу спальню в уютный мир. Ведь наволочки, простыни и пододеяльники изготовлены из натуральных гипоаллергенных материалов, которые способствуют здоровому сну, позволяют полностью расслабиться. Специалисты компании постоянно усовершенствуют технологии изготовления белья и качество продукции. Так, стойкие краски и четкие контуры рисунков гарантируют долгий срок службы продукции.\r\n \r\n \r\n   \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_47.jpg:image/jpeg:12518:20/6/20_6_47.jpg', 'http://laprovence.com.ua/ru/247-комплект-постельного-белья-.html\n', '20_6_47_1.jpg:image/jpeg:12518:20/6/20_6_47_1.jpg', NULL),
(48, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Плед "Пазл" 190*120, лен/хл', '', '12с529', 'Белорусский Лен \n                \n                \n', '900', '', ' Плед "Пазл"  (12с529)\r\nПлед "Пазл"  из льна и хлопка очень мягкий, теплый и уютный! Он замечательно впишется в ваш дом если вы цените натуральность, экологичность и красоту!\r\nСостав ткани:  лен - 61%, хлопок - 39%Размер: 190х120 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные пледы и покрывала из умягченного льна лучший подарок себе и близким!  Летом под ними приятно и комфортно спать, зимой они согревают и снимают усталость после трудового дня. Такой плед захочет иметь каждый кто хоть раз соприкоснулся с ним!\r\n \r\n ', '20_6_48.jpg:image/jpeg:12518:20/6/20_6_48.jpg', 'http://laprovence.com.ua/ru/15-плед-пазл-190120-ленхл.html\n', '20_6_48_1.jpg:image/jpeg:12518:20/6/20_6_48_1.jpg', NULL),
(49, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Плед Кантри, 205*135, лен 100%', '', '10с759', 'Белорусский Лен \n                \n                                                                                                \n', '1300', '', ' Плед Кантри 205*135, лен 100%  (10с759)\r\nЧудесный мягкий плед из серого льна в клетку, словно из бабушкиного сундука...\r\nСостав ткани: 100 % лен (умягченный)Размер: 205х135 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n Льняные пледы и покрывала из умягченного льна лучший подарок себе и близким!  Летом под ними приятно и комфортно спать, зимой они согревают и снимают усталость после трудового дня. Такой плед захочет иметь каждый кто хоть раз соприкоснулся с ним! ', '20_6_49.jpg:image/jpeg:12518:20/6/20_6_49.jpg', 'http://laprovence.com.ua/ru/59-плед-220133-лен-100.html\n', '20_6_49_1.jpg:image/jpeg:12518:20/6/20_6_49_1.jpg', NULL),
(50, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Плед "Волшебство" 200*125, лен/хл', '', '12с568', 'Белорусский Лен \n                \n                \n', '950', '', ' Плед "Волшебство"  (12с568)\r\nПлед "Волшебство"  из льна и хлопка очень мягкий, теплый и уютный! Он замечательно впишется в ваш дом если вы цените натуральность, экологичность и красоту!\r\nСостав ткани:  лен - 61%, хлопок - 39%Размер: 200х125 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные пледы и покрывала из умягченного льна лучший подарок себе и близким!  Летом под ними приятно и комфортно спать, зимой они согревают и снимают усталость после трудового дня. Такой плед захочет иметь каждый кто хоть раз соприкоснулся с ним!\r\n \r\n ', '20_6_50.jpg:image/jpeg:12518:20/6/20_6_50.jpg', 'http://laprovence.com.ua/ru/75-плед-пазл-190120-ленхл.html\n', '20_6_50_1.jpg:image/jpeg:12518:20/6/20_6_50_1.jpg', NULL),
(51, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Плед "Пазл" 200*125, лен/хл', '', '12с568', 'Белорусский Лен \n                \n                \n', '950', '', ' Плед "Пазл"  (12с568)\r\nПлед "Пазл"  из льна и хлопка очень мягкий, теплый и уютный! Он замечательно впишется в ваш дом если вы цените натуральность, экологичность и красоту!\r\nСостав ткани:  лен - 61%, хлопок - 39%Размер: 200х125 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные пледы и покрывала из умягченного льна лучший подарок себе и близким!  Летом под ними приятно и комфортно спать, зимой они согревают и снимают усталость после трудового дня. Такой плед захочет иметь каждый кто хоть раз соприкоснулся с ним!\r\n \r\n ', '20_6_51.jpg:image/jpeg:12518:20/6/20_6_51.jpg', 'http://laprovence.com.ua/ru/114-плед-пазл-190120-ленхл.html\n', '20_6_51_1.jpg:image/jpeg:12518:20/6/20_6_51_1.jpg', NULL),
(52, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Плед "Магия Востока", 220*150, лен', '', '13с129', 'Белорусский Лен \n                \n                                                                                                \n', '1450', '', ' Плед Магия Востока\r\nСостав ткани: 80 % лен, 20% хлопокРазмер: 220х150 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n Льняные пледы и покрывала из умягченного льна лучший подарок себе и близким!  Летом под ними приятно и комфортно спать, зимой они согревают и снимают усталость после трудового дня. Такой плед захочет иметь каждый кто хоть раз соприкоснулся с ним! ', '20_6_52.jpg:image/jpeg:12518:20/6/20_6_52.jpg', 'http://laprovence.com.ua/ru/431-плед-220133-лен-100.html\n', '20_6_52_1.jpg:image/jpeg:12518:20/6/20_6_52_1.jpg', NULL),
(53, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Покрывало Людовик, 220*210, лен/хл', '', '13с155', 'Белорусский Лен \n                \n                \n', '1350', '', ' Покрывало Людовик (фиолетовый)\r\nСостав ткани: лен 49%, хлопок 51%Размер: 220х210 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n    Льняные пледы и покрывала из льна лучший подарок себе и близким!  Летом под ними приятно и комфортно спать, зимой они согревают и снимают усталость после трудового дня. Такой плед захочет иметь каждый кто хоть раз соприкоснулся с ним!\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_53.jpg:image/jpeg:12518:20/6/20_6_53.jpg', 'http://laprovence.com.ua/ru/496-покрывало-лен.html\n', '20_6_53_1.jpg:image/jpeg:12518:20/6/20_6_53_1.jpg', NULL),
(54, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Плед "Клетка", 240*200, лен100%', '', '13с435', 'Белорусский Лен \n                \n                                                                                                \n', '1800', '', ' Плед "Клетка"\r\nПлед-покрывало  "Клетка"  будет здорово смотреться как на диване, так и на большой кровати. И укрываться им летними ночами - одно наслаждение! Комфортный отдых и сон Вам обеспечен!\r\n Состав ткани: 100 % ленРазмер: 240х200 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n Льняные пледы и покрывала из умягченного льна лучший подарок себе и близким!  Летом под ними приятно и комфортно спать, зимой они согревают и снимают усталость после трудового дня. Такой плед захочет иметь каждый кто хоть раз соприкоснулся с ним! ', '20_6_54.jpg:image/jpeg:12518:20/6/20_6_54.jpg', 'http://laprovence.com.ua/ru/498-плед-220133-лен-100.html\n', '20_6_54_1.jpg:image/jpeg:12518:20/6/20_6_54_1.jpg', NULL),
(55, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Плед "Клетка", 200*160, лен', '', '13с223', 'Белорусский Лен \n                \n                                                                                                \n', '1500', '', ' Плед Клетка\r\nСостав ткани: 100 % ленРазмер: 200х160 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n Льняные пледы и покрывала из умягченного льна лучший подарок себе и близким!  Летом под ними приятно и комфортно спать, зимой они согревают и снимают усталость после трудового дня. Такой плед захочет иметь каждый кто хоть раз соприкоснулся с ним! ', '20_6_55.jpg:image/jpeg:12518:20/6/20_6_55.jpg', 'http://laprovence.com.ua/ru/565-плед-220133-лен-100.html\n', '20_6_55_1.jpg:image/jpeg:12518:20/6/20_6_55_1.jpg', NULL),
(56, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Плед "Клетка", 220*200, лен', '', '13с223', 'Белорусский Лен \n                \n                                                                                                \n', '1600', '', ' Плед Клетка\r\nСостав ткани: 100 % ленРазмер: 220х200 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n Льняные пледы и покрывала из умягченного льна лучший подарок себе и близким!  Летом под ними приятно и комфортно спать, зимой они согревают и снимают усталость после трудового дня. Такой плед захочет иметь каждый кто хоть раз соприкоснулся с ним! ', '20_6_56.jpg:image/jpeg:12518:20/6/20_6_56.jpg', 'http://laprovence.com.ua/ru/633-плед-лен.html\n', '20_6_56_1.jpg:image/jpeg:12518:20/6/20_6_56_1.jpg', NULL),
(57, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Плед "Чарли", 150*130 см, лен 100%', '', '15с376', 'Белорусский Лен \n                \n                \n', '1100', '', 'Плед Чарли\r\nЧудесный плед молочного цвета.Состав ткани: 100 % лен (умягченный)Размер: 150*130 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n    Льняные пледы и покрывала из умягченного льна лучший подарок себе и близким!  Летом под ними приятно и комфортно спать, зимой они согревают и снимают усталость после трудового дня. Такой плед захочет иметь каждый кто хоть раз соприкоснулся с ним!\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_57.jpg:image/jpeg:12518:20/6/20_6_57.jpg', 'http://laprovence.com.ua/ru/640-покрывало-чарли.html\n', '20_6_57_1.jpg:image/jpeg:12518:20/6/20_6_57_1.jpg', NULL),
(58, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Плед "Магия Востока", 220*160, лен/хл', '', '13с383', 'Белорусский Лен \n                \n                                                                                                \n', '1700', '', ' Плед Магия Востока коричневый\r\nСостав ткани: 79 % лен, 21% хлопокРазмер: 220х160 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n Льняные пледы и покрывала из умягченного льна лучший подарок себе и близким!  Летом под ними приятно и комфортно спать, зимой они согревают и снимают усталость после трудового дня. Такой плед захочет иметь каждый кто хоть раз соприкоснулся с ним! ', '20_6_58.jpg:image/jpeg:12518:20/6/20_6_58.jpg', 'http://laprovence.com.ua/ru/641-плед-220133-лен-100.html\n', '20_6_58_1.jpg:image/jpeg:12518:20/6/20_6_58_1.jpg', NULL),
(59, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Плед "Розалинда", 200*145, лен/хл', '', '13с293', 'Белорусский Лен \n                \n                                                                                                \n', '1500', '', ' Плед Розалинда\r\nСостав ткани: 80 % лен, 20% хлопокРазмер: 200х145 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n Льняные пледы и покрывала из умягченного льна лучший подарок себе и близким!  Летом под ними приятно и комфортно спать, зимой они согревают и снимают усталость после трудового дня. Такой плед захочет иметь каждый кто хоть раз соприкоснулся с ним! ', '20_6_59.jpg:image/jpeg:12518:20/6/20_6_59.jpg', 'http://laprovence.com.ua/ru/642-плед-220133-лен-100.html\n', '20_6_59_1.jpg:image/jpeg:12518:20/6/20_6_59_1.jpg', NULL);
INSERT INTO `Message8` (`Message_ID`, `User_ID`, `Subdivision_ID`, `Sub_Class_ID`, `Priority`, `Keyword`, `ncTitle`, `ncKeywords`, `ncDescription`, `ncSMO_Title`, `ncSMO_Description`, `ncSMO_Image`, `Checked`, `IP`, `UserAgent`, `Parent_Message_ID`, `Created`, `LastUpdated`, `LastUser_ID`, `LastIP`, `LastUserAgent`, `Name`, `Size`, `Code`, `Vendor`, `Price`, `Price_OLD`, `Description`, `Image`, `Link_OLD`, `ImageBig`, `MultiImage`) VALUES
(60, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Скатерть Гладриэль 180*180, лен 100%', '', '10с345', 'Белорусский Лен \n                \n                \n', '750', '', 'Скатерть Гладриэль\r\nСостав ткани: лен - 100%Размер: 180*180 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_60.jpg:image/jpeg:12518:20/6/20_6_60.jpg', 'http://laprovence.com.ua/ru/155-скатерть-гладриэль.html\n', '20_6_60_1.jpg:image/jpeg:12518:20/6/20_6_60_1.jpg', NULL),
(63, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Скатерть 150*300, лен100%', '', '11с178', 'Белорусский Лен \n                \n                \n', '750', '', 'Скатерть серый лен  \r\nСостав ткани: лен - 100%Размер: 150*300 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_63.jpg:image/jpeg:12518:20/6/20_6_63.jpg', 'http://laprovence.com.ua/ru/163-скатерть.html\n', '20_6_63_1.jpg:image/jpeg:12518:20/6/20_6_63_1.jpg', NULL),
(64, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'К-т столовый "Канцона" 150*250, лен100%', '', '11с63', 'Белорусский Лен \n                \n                \n', '1300', '', 'Комплект столовый "Канцона" (11с63)Комплект состоит из скатерти и 6 салфеток. Состав ткани: лен - 100%Упаковка: пакет блистер\r\nРазмер:Скатерть (1 шт.) 150х250 смСалфетки (6 шт.) 50х50 см Производитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_64.jpg:image/jpeg:12518:20/6/20_6_64.jpg', 'http://laprovence.com.ua/ru/167-к-т-столовый-канцона.html\n', '20_6_64_1.jpg:image/jpeg:12518:20/6/20_6_64_1.jpg', NULL),
(65, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'К-т столовый "Ливень" 150*200, лен100%', '', '10с336', 'Белорусский Лен \n                \n                \n', '850', '', 'Комплект столовый "Ливень" (10с336)Комплект состоит из скатерти и 6 салфеток. Состав ткани: лен - 100%Упаковка: пакет блистер\r\nРазмер:Скатерть (1 шт.) 150х200 смСалфетки (6 шт.) 50х50 см Производитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_65.jpg:image/jpeg:12518:20/6/20_6_65.jpg', 'http://laprovence.com.ua/ru/170-к-т-столовый-ливень.html\n', '20_6_65_1.jpg:image/jpeg:12518:20/6/20_6_65_1.jpg', NULL),
(66, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Скатерть Зима 150*250, лен 100%', '', '10с336', 'Белорусский Лен \n                \n                \n', '550', '', 'Скатерть Зима\r\nСостав ткани: лен - 100%Размер: 150*250 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_66.jpg:image/jpeg:12518:20/6/20_6_66.jpg', 'http://laprovence.com.ua/ru/171-скатерть-зима.html\n', '20_6_66_1.jpg:image/jpeg:12518:20/6/20_6_66_1.jpg', NULL),
(67, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Комплект для кухни  лен 100%', '', '06с2', 'Белорусский Лен \n                \n                \n', '250', '', 'Комплект для кухни (06с2)\r\nСостав ткани: лен - 100%\r\nКомплектация: Фартук  - 1шт, ухватка - 2 шт.\r\nПроизводитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_67.jpg:image/jpeg:12518:20/6/20_6_67.jpg', 'http://laprovence.com.ua/ru/176-комплект-для-кухни-лен.html\n', '20_6_67_1.jpg:image/jpeg:12518:20/6/20_6_67_1.jpg', NULL),
(68, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Комплект для кухни  лен 100%', '', '06с2', 'Белорусский Лен \n                \n                \n', '250', '', 'Комплект для кухни (06с2)\r\nСостав ткани: лен - 100%\r\nКомплектация: Фартук  - 1шт, ухватка - 2 шт.\r\nПроизводитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_68.jpg:image/jpeg:12518:20/6/20_6_68.jpg', 'http://laprovence.com.ua/ru/177-комплект-для-кухни-лен.html\n', '20_6_68_1.jpg:image/jpeg:12518:20/6/20_6_68_1.jpg', NULL),
(69, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'К-т столовый "Полонез" 150*150, лен100%', '', '11с62', 'Белорусский Лен \n                \n                \n', '750', '', 'Комплект столовый "Полонез" (11с62)Комплект состоит из скатерти и 6 салфеток. Состав ткани: лен - 100%Упаковка: пакет блистер\r\nРазмер:Скатерть (1 шт.) 150х150 смСалфетки (6 шт.) 50х50 см Производитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_69.jpg:image/jpeg:12518:20/6/20_6_69.jpg', 'http://laprovence.com.ua/ru/184-к-т-столовый-полонез.html\n', '20_6_69_1.jpg:image/jpeg:12518:20/6/20_6_69_1.jpg', NULL),
(70, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'К-т столовый "Мулине" 150*200, лен100%', '', '10с336', 'Белорусский Лен \n                \n                \n', '850', '', 'Комплект столовый "Мулине" Комплект с каймой голубого цвета состоит из скатерти и 6 салфеток. Состав ткани: лен - 100%Упаковка: пакет блистер\r\nРазмер:Скатерть (1 шт.) 150х200 смСалфетки (6 шт.) 50х50 см Производитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_70.jpg:image/jpeg:12518:20/6/20_6_70.jpg', 'http://laprovence.com.ua/ru/186-к-т-столовый-мулине.html\n', '20_6_70_1.jpg:image/jpeg:12518:20/6/20_6_70_1.jpg', NULL),
(71, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'К-т столовый D 148, лен100%', '', '12с81', 'Белорусский Лен \n                \n                \n', '550', '', 'Комплект столовый  (12с81)Комплект состоит из скатерти и 4 салфеток. Состав ткани: лен - 100%Упаковка: пакет блистер\r\nРазмер:Скатерть (1 шт.)  D 148 смСалфетки (4 шт.) 40х40 см Производитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_71.jpg:image/jpeg:12518:20/6/20_6_71.jpg', 'http://laprovence.com.ua/ru/187-к-т-столовый-лен.html\n', '20_6_71_1.jpg:image/jpeg:12518:20/6/20_6_71_1.jpg', NULL),
(72, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'К-т столовый D 100, лен100%', '', '10с488', 'Белорусский Лен \n                \n                \n', '450', '', 'Комплект столовый  (10с488)Комплект состоит из скатерти и 4 салфеток. Состав ткани: лен - 100%Упаковка: пакет блистер\r\nРазмер:Скатерть (1 шт.)  D 100 смСалфетки (4 шт.) 40х40 см Производитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_72.jpg:image/jpeg:12518:20/6/20_6_72.jpg', 'http://laprovence.com.ua/ru/189-к-т-столовый-лен.html\n', '20_6_72_1.jpg:image/jpeg:12518:20/6/20_6_72_1.jpg', NULL),
(73, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Скатерть Январь 160*160, лен 100%', '', '06с117', 'Белорусский Лен \n                \n                \n', '850', '', 'Скатерть Январь,  150*150 (06с117)\r\nВеликолепная жаккардовая скатерть с мережкой!\r\nСостав ткани: лен - 100%Размер: 160*160 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_73.jpg:image/jpeg:12518:20/6/20_6_73.jpg', 'http://laprovence.com.ua/ru/193-скатерть-январь.html\n', '20_6_73_1.jpg:image/jpeg:12518:20/6/20_6_73_1.jpg', NULL),
(74, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Скатерть Каприз 170*170, лен 100%', '', '11с493', 'Белорусский Лен \n                \n                \n', '850', '', 'Скатерть Каприз,   (11с493)\r\nВеликолепная жаккардовая скатерть с мережкой!\r\nСостав ткани: лен - 100%Размер: 170*170 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_74.jpg:image/jpeg:12518:20/6/20_6_74.jpg', 'http://laprovence.com.ua/ru/194-скатерть-каприз.html\n', '20_6_74_1.jpg:image/jpeg:12518:20/6/20_6_74_1.jpg', NULL),
(75, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Салфетка "Полонез" 50*50, лен100%', '', '11с61', 'Белорусский Лен \n                \n                \n', '55', '', 'Салфетка "Полонез" (11с61)Состав ткани: лен - 100%\r\nРазмер: 50*50 см Производитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_75.jpg:image/jpeg:12518:20/6/20_6_75.jpg', 'http://laprovence.com.ua/ru/196-салфетка-полонез.html\n', '20_6_75_1.jpg:image/jpeg:12518:20/6/20_6_75_1.jpg', NULL),
(76, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Н-р полотенец из 3-х шт "Эдем", 50*70 лен/хл', '', '10с234', 'Белорусский Лен \n                \n                \n', '300', '', 'Набор полотенец из 3-х шт. "Эдем"  (10с234)\r\nЛьняные кухонные полотенца \r\nСостав ткани: лен - 55%, хл - 45%Размер: 50*70 см\r\nУпаковка: пластиковая прозрачная туба.Производитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_76.jpg:image/jpeg:12518:20/6/20_6_76.jpg', 'http://laprovence.com.ua/ru/198-н-р-полотенец-из-3-х-шт-эдем.html\n', '20_6_76_1.jpg:image/jpeg:12518:20/6/20_6_76_1.jpg', NULL),
(77, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Полотенце "Элли", 45*70 лен/хл', '', '10с319', 'Белорусский Лен \n                \n                \n', '85', '', 'Полотенце "Элли",  лен/хл (10с319)\r\nЛьняные кухонные полотенца \r\nСостав ткани: лен - 76%, хлопок - 24%Размер: 45*70 смПроизводитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_77.jpg:image/jpeg:12518:20/6/20_6_77.jpg', 'http://laprovence.com.ua/ru/213-полотенце-элли.html\n', '20_6_77_1.jpg:image/jpeg:12518:20/6/20_6_77_1.jpg', NULL),
(78, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Полотенце "Апрель", 50*70 лен100%', '', '09с93', 'Белорусский Лен \n                \n                \n', '75', '', 'Полотенце "Апрель",   (09с93)\r\nЛьняные кухонные полотенца \r\nСостав ткани: лен - 100%Размер: 50*70 смПроизводитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_78.jpg:image/jpeg:12518:20/6/20_6_78.jpg', 'http://laprovence.com.ua/ru/220-комплект-постельного-белья-.html\n', '20_6_78_1.jpg:image/jpeg:12518:20/6/20_6_78_1.jpg', NULL),
(79, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Полотенце "Барвинок", 50*70 лен/хл', '', '06с24', 'Белорусский Лен \n                \n                \n', '50', '', 'Полотенце "Барвинок",   (06с24)\r\nЛьняные кухонные полотенца \r\nСостав ткани: лен - 100%Размер: 50*70 смПроизводитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_79.jpg:image/jpeg:12518:20/6/20_6_79.jpg', 'http://laprovence.com.ua/ru/221-комплект-постельного-белья-.html\n', '20_6_79_1.jpg:image/jpeg:12518:20/6/20_6_79_1.jpg', NULL),
(80, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Скатерть  138*120, лен 100%', '', '05с341', 'Белорусский Лен \n                \n                \n', '450', '', 'Скатерть с мережкой   (05с341)\r\nСостав ткани: лен - 100%Размер: 138*120 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_80.jpg:image/jpeg:12518:20/6/20_6_80.jpg', 'http://laprovence.com.ua/ru/224-скатерть.html\n', '20_6_80_1.jpg:image/jpeg:12518:20/6/20_6_80_1.jpg', NULL),
(81, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Скатерть  138*120, лен 100%', '', '05с341', 'Белорусский Лен \n                \n                \n', '450', '', 'Скатерть с мережкой   (05с341)\r\nСостав ткани: лен - 100%Размер: 138*120 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_81.jpg:image/jpeg:12518:20/6/20_6_81.jpg', 'http://laprovence.com.ua/ru/225-скатерть.html\n', '20_6_81_1.jpg:image/jpeg:12518:20/6/20_6_81_1.jpg', NULL),
(82, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Скатерть  138*120, лен 100%', '', '05с341', 'Белорусский Лен \n                \n                \n', '450', '', 'Скатерть с мережкой   (05с341)\r\nСостав ткани: лен - 100%Размер: 138*120 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_82.jpg:image/jpeg:12518:20/6/20_6_82.jpg', 'http://laprovence.com.ua/ru/226-скатерть-лен.html\n', '20_6_82_1.jpg:image/jpeg:12518:20/6/20_6_82_1.jpg', NULL),
(83, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Скатерть  138*150, лен 100%', '', '05с341', 'Белорусский Лен \n                \n                \n', '480', '', 'Скатерть с мережкой   (05с341)\r\nСостав ткани: лен - 100%Размер: 138*150 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_83.jpg:image/jpeg:12518:20/6/20_6_83.jpg', 'http://laprovence.com.ua/ru/227-скатерть-лен.html\n', '20_6_83_1.jpg:image/jpeg:12518:20/6/20_6_83_1.jpg', NULL),
(84, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Скатерть  155*100, лен 100%', '', '05с341', 'Белорусский Лен \n                \n                \n', '350', '', 'Скатерть розовая клетка\r\nСостав ткани: лен - 100%Размер: 100*155 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_84.jpg:image/jpeg:12518:20/6/20_6_84.jpg', 'http://laprovence.com.ua/ru/228-скатерть-лен.html\n', '20_6_84_1.jpg:image/jpeg:12518:20/6/20_6_84_1.jpg', NULL);
INSERT INTO `Message8` (`Message_ID`, `User_ID`, `Subdivision_ID`, `Sub_Class_ID`, `Priority`, `Keyword`, `ncTitle`, `ncKeywords`, `ncDescription`, `ncSMO_Title`, `ncSMO_Description`, `ncSMO_Image`, `Checked`, `IP`, `UserAgent`, `Parent_Message_ID`, `Created`, `LastUpdated`, `LastUser_ID`, `LastIP`, `LastUserAgent`, `Name`, `Size`, `Code`, `Vendor`, `Price`, `Price_OLD`, `Description`, `Image`, `Link_OLD`, `ImageBig`, `MultiImage`) VALUES
(85, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Скатерть Зима 150*120, лен 100%', '', '05с341', 'Белорусский Лен \n                \n                \n', '300', '', 'Скатерть Зима\r\nСостав ткани: лен - 100%Размер: 150*120 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_85.jpg:image/jpeg:12518:20/6/20_6_85.jpg', 'http://laprovence.com.ua/ru/230-скатерть-зима.html\n', '20_6_85_1.jpg:image/jpeg:12518:20/6/20_6_85_1.jpg', NULL),
(86, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'К-т столовый  95*95, лен100%', '', '07с39', 'Белорусский Лен \n                \n                \n', '450', '', 'Комплект столовый  (07с39)Комплект состоит из скатерти и 4-х салфеток. Состав ткани: лен - 100%Упаковка: пакет блистер\r\nРазмер:Скатерть (1 шт.)  95х95 смСалфетки (4 шт.) 45х45 см Производитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_86.jpg:image/jpeg:12518:20/6/20_6_86.jpg', 'http://laprovence.com.ua/ru/232-к-т-столовый-лен.html\n', '20_6_86_1.jpg:image/jpeg:12518:20/6/20_6_86_1.jpg', NULL),
(87, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'К-т столовый  105*105, лен100%', '', '10с395', 'Белорусский Лен \n                \n                \n', '450', '', 'Комплект столовый  (10с395)Комплект состоит из скатерти и 4-х салфеток. Состав ткани: лен - 100%Упаковка: пакет блистер\r\nРазмер:Скатерть (1 шт.)  105х105 смСалфетки (4 шт.) 21х21 см Производитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_87.jpg:image/jpeg:12518:20/6/20_6_87.jpg', 'http://laprovence.com.ua/ru/233-к-т-столовый-лен.html\n', '20_6_87_1.jpg:image/jpeg:12518:20/6/20_6_87_1.jpg', NULL),
(88, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'К-т столовый  105*105, лен100%', '', '12с82', 'Белорусский Лен \n                \n                \n', '450', '', 'Комплект столовый  (12с82)Комплект состоит из скатерти и 4-х салфеток. Состав ткани: лен - 100%Упаковка: пакет блистер\r\nРазмер:Скатерть (1 шт.)  105х105 смСалфетки (4 шт.) 33х33 см Производитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_88.jpg:image/jpeg:12518:20/6/20_6_88.jpg', 'http://laprovence.com.ua/ru/234-к-т-столовый-лен.html\n', '20_6_88_1.jpg:image/jpeg:12518:20/6/20_6_88_1.jpg', NULL),
(89, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'К-т столовый  95*95, лен100%', '', '07с39', 'Белорусский Лен \n                \n                \n', '450', '', 'Комплект столовый  (07с39)Комплект состоит из скатерти и 4-х салфеток. Состав ткани: лен - 100%Упаковка: пакет блистер\r\nРазмер:Скатерть (1 шт.)  95х95 смСалфетки (4 шт.) 45х45 см Производитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_89.jpg:image/jpeg:12518:20/6/20_6_89.jpg', 'http://laprovence.com.ua/ru/235-к-т-столовый-лен.html\n', '20_6_89_1.jpg:image/jpeg:12518:20/6/20_6_89_1.jpg', NULL),
(90, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Комплект для кухни  лен 100%', '', '10с210', 'Белорусский Лен \n                \n                \n', '750', '', 'Комплект для кухни\r\nСостав ткани: лен - 100%\r\nКомплектация: Фартук  - 1шт, скатерть - 1шт. размер 150*120см, салфетки - 6 шт, размер - 33*33 см\r\nПроизводитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_90.jpg:image/jpeg:12518:20/6/20_6_90.jpg', 'http://laprovence.com.ua/ru/238-комплект-для-кухни-лен.html\n', '20_6_90_1.jpg:image/jpeg:12518:20/6/20_6_90_1.jpg', NULL),
(91, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Скатерть зеленая  95*95, лен 100%', '', '12с375', 'Белорусский Лен \n                \n                \n', '150', '', 'Скатерть  зеленая  (12с375)\r\nСостав ткани: лен - 100%Размер: 95*95 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_91.jpg:image/jpeg:12518:20/6/20_6_91.jpg', 'http://laprovence.com.ua/ru/288-скатерть-зеленая-лен.html\n', '20_6_91_1.jpg:image/jpeg:12518:20/6/20_6_91_1.jpg', NULL),
(92, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Салфетка "Версаль" 45*45, лен 100%', '', '07с329', 'Белорусский Лен \n                \n                \n', '60', '', 'Салфетка  "Версаль" (07с329)\r\nСостав ткани: лен - 100%Размер: 45*45 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_92.jpg:image/jpeg:12518:20/6/20_6_92.jpg', 'http://laprovence.com.ua/ru/289-салфетка-версаль.html\n', '20_6_92_1.jpg:image/jpeg:12518:20/6/20_6_92_1.jpg', NULL),
(93, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Салфетка "Новгород" 50*50, лен 100%', '', '3с101', 'Белорусский Лен \n                \n                \n', '55', '', 'Салфетка  "Новгород" \r\nСостав ткани: лен - 100%Размер: 50*50 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_93.jpg:image/jpeg:12518:20/6/20_6_93.jpg', 'http://laprovence.com.ua/ru/291-салфетка-новгород.html\n', '20_6_93_1.jpg:image/jpeg:12518:20/6/20_6_93_1.jpg', NULL),
(94, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Салфетка "Милан" 50*50, лен/хл', '', '06с46', 'Белорусский Лен \n                \n                \n', '50', '', 'Салфетка  "Милан" \r\nСостав ткани: лен - 55%, хлопок - 45%Размер: 50*50 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_94.jpg:image/jpeg:12518:20/6/20_6_94.jpg', 'http://laprovence.com.ua/ru/292-салфетка-милан.html\n', '20_6_94_1.jpg:image/jpeg:12518:20/6/20_6_94_1.jpg', NULL),
(95, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Салфетка "Фаворит" 45*45, лен100%', '', '06с118', 'Белорусский Лен \n                \n                \n', '60', '', 'Салфетка  "Фаворит" \r\nСостав ткани: лен - 100%Размер: 45*45 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_95.jpg:image/jpeg:12518:20/6/20_6_95.jpg', 'http://laprovence.com.ua/ru/293-салфетка-фаворит.html\n', '20_6_95_1.jpg:image/jpeg:12518:20/6/20_6_95_1.jpg', NULL),
(96, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Салфетка "Полонез" 50*50, лен 100%', '', '11с61', 'Белорусский Лен \n                \n                \n', '55', '', 'Салфетка  "Полонез" \r\nСостав ткани: лен - 100%Размер: 50*50 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_96.jpg:image/jpeg:12518:20/6/20_6_96.jpg', 'http://laprovence.com.ua/ru/295-салфетка-полонез.html\n', '20_6_96_1.jpg:image/jpeg:12518:20/6/20_6_96_1.jpg', NULL),
(97, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Салфетка "Золушка" 50*50, лен 100%', '', '06с274', 'Белорусский Лен \n                \n                \n', '55', '', 'Салфетка  "Золушка" \r\nСостав ткани: лен - 100%Размер: 50*50 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_97.jpg:image/jpeg:12518:20/6/20_6_97.jpg', 'http://laprovence.com.ua/ru/299-салфетка-золушка.html\n', '20_6_97_1.jpg:image/jpeg:12518:20/6/20_6_97_1.jpg', NULL),
(98, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Салфетка "Золушка" 50*50, лен 100%', '', '06с274', 'Белорусский Лен \n                \n                \n', '55', '', 'Салфетка  "Золушка" \r\nСостав ткани: лен - 100%Размер: 50*50 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_98.jpg:image/jpeg:12518:20/6/20_6_98.jpg', 'http://laprovence.com.ua/ru/300-салфетка-золушка.html\n', '20_6_98_1.jpg:image/jpeg:12518:20/6/20_6_98_1.jpg', NULL),
(99, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Салфетка "Клюква" 50*50, лен', '', '10с298', 'Белорусский Лен \n                \n                \n', '55', '', 'Салфетка  "Клюква" \r\nСостав ткани: лен - 100%Размер: 50*50 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_99.jpg:image/jpeg:12518:20/6/20_6_99.jpg', 'http://laprovence.com.ua/ru/301-комплект-постельного-белья-.html\n', '20_6_99_1.jpg:image/jpeg:12518:20/6/20_6_99_1.jpg', NULL),
(100, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Салфетка гладкокрашеная 45*45, лен100%', '', '7с46', 'Белорусский Лен \n                \n                \n', '40', '', 'Салфетка  цветная\r\nВ наличии цвета: бирюза, голубой, розовый, баклажан, желтый.\r\nСостав ткани: лен - 100%Размер: 45*45 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_100.jpg:image/jpeg:12518:20/6/20_6_100.jpg', 'http://laprovence.com.ua/ru/303-салфетка-гладкокрашеная.html\n', '20_6_100_1.jpg:image/jpeg:12518:20/6/20_6_100_1.jpg', NULL),
(101, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Рушник "Торжество" 50*150, лен100%', '', '10с347', 'Белорусский Лен \n                \n                \n', '180', '', 'Рушник  "Торжество" \r\nСостав ткани: лен - 100%Размер: 50*150 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_101.jpg:image/jpeg:12518:20/6/20_6_101.jpg', 'http://laprovence.com.ua/ru/308-рушник-торжество.html\n', '20_6_101_1.jpg:image/jpeg:12518:20/6/20_6_101_1.jpg', NULL),
(102, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Рушник "Торжество" 50*205, лен/хл', '', '07с4', 'Белорусский Лен \n                \n                \n', '200', '', 'Рушник  "Торжество" \r\nСостав ткани: лен - 53%, хлопок - 47%Размер: 50*205 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_102.jpg:image/jpeg:12518:20/6/20_6_102.jpg', 'http://laprovence.com.ua/ru/309-рушник-торжество.html\n', '20_6_102_1.jpg:image/jpeg:12518:20/6/20_6_102_1.jpg', NULL),
(103, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Салфетка "Янка" 50*50, лен 100%', '', '3с25', 'Белорусский Лен \n                \n                \n', '50', '', 'Салфетка  "Янка" \r\nСостав ткани: лен - 100%Размер: 50*50 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_103.jpg:image/jpeg:12518:20/6/20_6_103.jpg', 'http://laprovence.com.ua/ru/311-салфетка-янка.html\n', '20_6_103_1.jpg:image/jpeg:12518:20/6/20_6_103_1.jpg', NULL),
(104, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Салфетка "Авалон" 45*45, лен 100%', '', '05с205', 'Белорусский Лен \n                \n                \n', '40', '', 'Салфетка  "Авалон" \r\nСостав ткани: лен - 100%Размер: 45*45 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_104.jpg:image/jpeg:12518:20/6/20_6_104.jpg', 'http://laprovence.com.ua/ru/312-салфетка-авалон.html\n', '20_6_104_1.jpg:image/jpeg:12518:20/6/20_6_104_1.jpg', NULL),
(105, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Хлебница + птичка, лен 100%', '', ' HandMade', 'La Provence\n                \n                \n', '130', '', 'Хлебница + птичка \r\nСостав ткани: лен - 100%\r\nКомплектация: хлебница (1шт) - 25*18 см, птичка - 1шт\r\nПроизводитель:  handmade_ La Provence Страна производства: Украина\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_105.jpg:image/jpeg:12518:20/6/20_6_105.jpg', 'http://laprovence.com.ua/ru/313-комплект-постельного-белья-.html\n', '20_6_105_1.jpg:image/jpeg:12518:20/6/20_6_105_1.jpg', NULL),
(106, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Скатерть зеленая с бахромой, лен 100%', '', ' HandMade', 'La Provence\n                \n                \n', '350', '', 'Скатерть зеленая с бахромой, лен 100%\r\nСостав ткани: лен - 100%\r\nРазмер - 120*150 см\r\nПроизводитель:  handmade_ La Provence Страна производства: Украина\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_106.jpg:image/jpeg:12518:20/6/20_6_106.jpg', 'http://laprovence.com.ua/ru/314-скатерть-зеленая-с-бахромой-лен.html\n', '20_6_106_1.jpg:image/jpeg:12518:20/6/20_6_106_1.jpg', NULL),
(107, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'К-т столовый голубой с кружевом 150*200, лен/хл', '', ' HandMade', 'La Provence\n                \n                \n', '750', '', 'Комплект столовый голубой с кружевом\r\nКомплектация: скатерть  1 шт - 150*200 см - лен/хл, салфетки 8 шт - 45*45 см - лен 100%\r\nПроизводитель:  handmade_ La Provence Страна производства: Украина\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_107.jpg:image/jpeg:12518:20/6/20_6_107.jpg', 'http://laprovence.com.ua/ru/315-к-т-столовый-голубой-с-кружевом.html\n', '20_6_107_1.jpg:image/jpeg:12518:20/6/20_6_107_1.jpg', NULL);
INSERT INTO `Message8` (`Message_ID`, `User_ID`, `Subdivision_ID`, `Sub_Class_ID`, `Priority`, `Keyword`, `ncTitle`, `ncKeywords`, `ncDescription`, `ncSMO_Title`, `ncSMO_Description`, `ncSMO_Image`, `Checked`, `IP`, `UserAgent`, `Parent_Message_ID`, `Created`, `LastUpdated`, `LastUser_ID`, `LastIP`, `LastUserAgent`, `Name`, `Size`, `Code`, `Vendor`, `Price`, `Price_OLD`, `Description`, `Image`, `Link_OLD`, `ImageBig`, `MultiImage`) VALUES
(108, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Скатерть цветочная с бахромой, лен 100%', '', ' HandMade', 'La Provence\n                \n                \n', '450', '', 'Скатерть цветочная с бахромой, лен 100%\r\nСостав ткани: лен - 100%\r\nРазмер - 120*80 см\r\nПроизводитель:  handmade_ La Provence Страна производства: Украина\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_108.jpg:image/jpeg:12518:20/6/20_6_108.jpg', 'http://laprovence.com.ua/ru/316-скатерть-цветочная-с-бахромой.html\n', '20_6_108_1.jpg:image/jpeg:12518:20/6/20_6_108_1.jpg', NULL),
(109, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Салфетка белая с кружевом, лен 100%', '', ' HandMade', 'La Provence\n                \n                \n', '220', '', 'Салфетка белая с кружевом\r\nСостав ткани: лен - 100%\r\nРазмер - 50*80 см\r\nПроизводитель:  handmade_ La Provence Страна производства: Украина\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_109.jpg:image/jpeg:12518:20/6/20_6_109.jpg', 'http://laprovence.com.ua/ru/318-салфетка-белая-с-кружевом.html\n', '20_6_109_1.jpg:image/jpeg:12518:20/6/20_6_109_1.jpg', NULL),
(110, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Салфетка белая с кружевом, лен 100%', '', ' HandMade', 'La Provence\n                \n                \n', '180', '', 'Салфетка белая с кружевом\r\nСостав ткани: лен - 100%\r\nРазмер - 45*80 см\r\nПроизводитель:  handmade_ La Provence Страна производства: Украина\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_110.jpg:image/jpeg:12518:20/6/20_6_110.jpg', 'http://laprovence.com.ua/ru/321-салфетка-белая-с-кружевом-лен.html\n', '20_6_110_1.jpg:image/jpeg:12518:20/6/20_6_110_1.jpg', NULL),
(111, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Кофейный комплект, лен/хл', '', ' HandMade', 'La Provence\n                \n                \n', '220', '', 'Кофейный комплект голубой с кружевом\r\nСостав ткани: лен/хл\r\nКомплектация: салфетка 1 шт - 64*28 см, салфетка - 4 шт -  30*30 см\r\nПроизводитель:  handmade_ La Provence Страна производства: Украина\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_111.jpg:image/jpeg:12518:20/6/20_6_111.jpg', 'http://laprovence.com.ua/ru/322-комплект-постельного-белья-.html\n', '20_6_111_1.jpg:image/jpeg:12518:20/6/20_6_111_1.jpg', NULL),
(112, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Скатерть белая 80*80, лен 100%', '', '03с71', 'Белорусский Лен \n                \n                \n', '150', '', 'Скатерть белая\r\nСостав ткани: лен - 100%Размер: 80*80 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_112.jpg:image/jpeg:12518:20/6/20_6_112.jpg', 'http://laprovence.com.ua/ru/323-скатерть-белая-лен.html\n', '20_6_112_1.jpg:image/jpeg:12518:20/6/20_6_112_1.jpg', NULL),
(113, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Салфетка "Катюша" 50*50, лен/хл', '', '10с210', 'Белорусский Лен \n                \n                \n', '50', '', 'Салфетка  "Катюша" \r\nСостав ткани: лен - 79%, хлопок - 21%Размер: 50*50 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_113.jpg:image/jpeg:12518:20/6/20_6_113.jpg', 'http://laprovence.com.ua/ru/324-салфетка-катюша.html\n', '20_6_113_1.jpg:image/jpeg:12518:20/6/20_6_113_1.jpg', NULL),
(114, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Скатерть "Ассоль" 150*250, лен 100%', '', '5с35', 'Белорусский Лен \n                \n                \n', '450', '', 'Скатерть  "Ассоль" \r\nСостав ткани: лен - 100%Размер: 150*250 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_114.jpg:image/jpeg:12518:20/6/20_6_114.jpg', 'http://laprovence.com.ua/ru/325-скатерть-ассоль-лен.html\n', '20_6_114_1.jpg:image/jpeg:12518:20/6/20_6_114_1.jpg', NULL),
(115, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Скатерть ажурная, хлопок 100%', '', ' HandMade', 'La Provence\n                \n                \n', '700', '', 'Скатерть ажурная\r\nСкатерть связанная крючком. Смотрится очень романтично  в сочетании с льняными цветными скатертями.\r\nСостав ткани: хлопок - 100%\r\nРазмер - 100*100 см\r\nПроизводитель:  handmade_ La Provence Страна производства: Украина\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_115.jpg:image/jpeg:12518:20/6/20_6_115.jpg', 'http://laprovence.com.ua/ru/353-комплект-постельного-белья-.html\n', '20_6_115_1.jpg:image/jpeg:12518:20/6/20_6_115_1.jpg', NULL),
(116, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Скатерть цветочная с кружевом, лен 100%', '', ' HandMade', 'La Provence\n                \n                \n', '450', '', 'Скатерть цветочная с кружевом, лен 100%\r\nСостав ткани: лен - 100%\r\nРазмер - 130*85 см\r\nПроизводитель:  handmade_ La Provence Страна производства: Украина\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_116.jpg:image/jpeg:12518:20/6/20_6_116.jpg', 'http://laprovence.com.ua/ru/354-скатерть-цветочная-с-кружевом-лен.html\n', '20_6_116_1.jpg:image/jpeg:12518:20/6/20_6_116_1.jpg', NULL),
(117, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Рушник "Совет да любовь" 50*150, лен100%', '', '10с853', 'Белорусский Лен \n                \n                \n', '180', '', 'Рушник  "Совет да любовь" \r\nСостав ткани: лен - 100%Размер: 50*150 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_117.jpg:image/jpeg:12518:20/6/20_6_117.jpg', 'http://laprovence.com.ua/ru/357-рушник-совет-да-любовь.html\n', '20_6_117_1.jpg:image/jpeg:12518:20/6/20_6_117_1.jpg', NULL),
(118, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Полотенце "Евдокия", 50*70 лен/хл', '', '06с22', 'Белорусский Лен \n                \n                \n', '85', '', 'Полотенце "Евдокия",   \r\nЛьняные кухонные полотенца \r\nСостав ткани: лен - 53%, хлопок - 47%Размер: 50*70 смПроизводитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_118.jpg:image/jpeg:12518:20/6/20_6_118.jpg', 'http://laprovence.com.ua/ru/358-полотенце-евдокия.html\n', '20_6_118_1.jpg:image/jpeg:12518:20/6/20_6_118_1.jpg', NULL),
(119, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Полотенце "Дуняша", 45*70 лен/хл', '', '10с828', 'Белорусский Лен \n                \n                \n', '85', '', 'Полотенце "Дуняша",   \r\nЛьняные кухонные полотенца \r\nСостав ткани: лен - 79%, хлопок - 21%Размер: 45*70 смПроизводитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_119.jpg:image/jpeg:12518:20/6/20_6_119.jpg', 'http://laprovence.com.ua/ru/359-полотенце-дуняша.html\n', '20_6_119_1.jpg:image/jpeg:12518:20/6/20_6_119_1.jpg', NULL),
(120, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Полотенце "Бостон", 50*70 лен/хл', '', '10с157', 'Белорусский Лен \n                \n                \n', '85', '', 'Полотенце "Бостон",  лен/хл (10с157)\r\nЛьняные кухонные полотенца \r\nСостав ткани: лен - 72%, хлопок - 28%Размер: 50*70 смПроизводитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_120.jpg:image/jpeg:12518:20/6/20_6_120.jpg', 'http://laprovence.com.ua/ru/361-полотенце-бостон.html\n', '20_6_120_1.jpg:image/jpeg:12518:20/6/20_6_120_1.jpg', NULL),
(121, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Полотенце "Тройка ночь", 50*70 лен100%', '', '09с93', 'Белорусский Лен \n                \n                \n', '85', '', 'Полотенце "Тройка ночь"\r\nЛьняные кухонные полотенца \r\nСостав ткани: лен - 100%Размер: 50*70 смПроизводитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_121.jpg:image/jpeg:12518:20/6/20_6_121.jpg', 'http://laprovence.com.ua/ru/413-полотенце-тройка-ночь.html\n', '20_6_121_1.jpg:image/jpeg:12518:20/6/20_6_121_1.jpg', NULL),
(122, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Полотенце "Гирлянды", 50*70 лен/хл', '', '10с197', 'Белорусский Лен \n                \n                \n', '85', '', 'Полотенце "Гирлянды"\r\nЛьняные кухонные полотенца \r\nСостав ткани: лен - 55%, хлопок - 45%Размер: 50*70 смПроизводитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_122.jpg:image/jpeg:12518:20/6/20_6_122.jpg', 'http://laprovence.com.ua/ru/417-полотенце-гирлянды.html\n', '20_6_122_1.jpg:image/jpeg:12518:20/6/20_6_122_1.jpg', NULL),
(123, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Полотенце "Фонарик", 50*70 лен/хл', '', '10с197', 'Белорусский Лен \n                \n                \n', '85', '', 'Полотенце "Фонарик"\r\nЛьняные кухонные полотенца \r\nСостав ткани: лен - 55%, хлопок - 45%Размер: 50*70 смПроизводитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_123.jpg:image/jpeg:12518:20/6/20_6_123.jpg', 'http://laprovence.com.ua/ru/418-полотенце-фонарик.html\n', '20_6_123_1.jpg:image/jpeg:12518:20/6/20_6_123_1.jpg', NULL),
(124, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Н-р подарочный  "Сердечки",  лен100%', '', '06с393', 'Белорусский Лен \n                \n                \n', '180', '', 'Набор подарочный сердечко + 6 салфеток\r\nЛьняные кухонные салфетки\r\nСостав ткани: лен - 100%Размер салфеток: 33*33 смПроизводитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_124.jpg:image/jpeg:12518:20/6/20_6_124.jpg', 'http://laprovence.com.ua/ru/419-комплект-постельного-белья-.html\n', '20_6_124_1.jpg:image/jpeg:12518:20/6/20_6_124_1.jpg', NULL),
(125, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Дорожка с мережкой , лен 100%', '', ' HandMade', 'La Provence\n                \n                \n', '450', '', 'Дорожка желтая с мережкой и бахромой\r\nСостав ткани: лен - 100%\r\nРазмер - 145*65 см\r\nПроизводитель:  handmade_ La Provence Страна производства: Украина\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_125.jpg:image/jpeg:12518:20/6/20_6_125.jpg', 'http://laprovence.com.ua/ru/420-комплект-постельного-белья-.html\n', '20_6_125_1.jpg:image/jpeg:12518:20/6/20_6_125_1.jpg', NULL),
(126, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Салфетка "Крокус" 45*45, лен100%', '', '06с41', 'Белорусский Лен \n                \n                \n', '60', '', 'Салфетка  "Крокус" с мережкой\r\nСостав ткани: лен - 100%Размер: 45*45 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_126.jpg:image/jpeg:12518:20/6/20_6_126.jpg', 'http://laprovence.com.ua/ru/424-салфетка-крокус.html\n', '20_6_126_1.jpg:image/jpeg:12518:20/6/20_6_126_1.jpg', NULL),
(127, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Скатерть "Елизавета" 150*250, лен 100%', '', '12с569', 'Белорусский Лен \n                \n                \n', '500', '', 'Скатерть  "Елизавета" \r\nСостав ткани: лен - 100%Размер: 150*250 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_127.jpg:image/jpeg:12518:20/6/20_6_127.jpg', 'http://laprovence.com.ua/ru/425-скатерть-елизавета-лен.html\n', '20_6_127_1.jpg:image/jpeg:12518:20/6/20_6_127_1.jpg', NULL),
(128, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 0, '', '', 'Скатерть "Полонез" 150*200, лен 100%', '', '11с423', 'Белорусский Лен \n                \n                \n', '850', '', 'Скатерть  "Полонез"\r\nСостав ткани: лен - 100%Размер: 150*200 смПроизводитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_128.jpg:image/jpeg:12518:20/6/20_6_128.jpg', 'http://laprovence.com.ua/ru/427-скатерть-полонез-лен.html\n', '20_6_128_1.jpg:image/jpeg:12518:20/6/20_6_128_1.jpg', NULL),
(130, 0, 20, 6, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 03:38:03', 1, '85.173.83.50', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 'Полотенце "Снежинки", 50*70 лен/хл', '', '10с197', 'Белорусский Лен', '85', '', '<p>&nbsp;Полотенце &quot;Снежинки&quot; (синее) Льняные кухонные полотенца&nbsp; Состав ткани: лен - 55%, хлопок - 45%Размер: 50*70 смПроизводитель: Оршанский льнокомбинат (г. Орша)Страна производства: Беларусь &nbsp; Льняные скатерти, салфетки и полотенца &ndash; это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.&nbsp; В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на&nbsp; скромной, но благородной льняной скатерти -&nbsp; идеальный вариант сервировки стола для романтического ужина. Традиционная &laquo;бабушкина&raquo; льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть. &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>', '20_6_130.jpg:image/jpeg:12518:20/6/20_6_130.jpg', 'http://laprovence.com.ua/ru/446-полотенце-снежинки.html', '20_6_130_1.jpg:image/jpeg:12518:20/6/20_6_130_1.jpg', NULL),
(132, 1, 22, 11, 1, '', '', '', '', '', '', '', 1, '5.139.36.53', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 0, '2016-07-06 09:25:11', '2016-07-06 06:25:11', 0, NULL, NULL, 'Наименование', '20х20 см', '3434234', 'ВДЖЫЛОЖАДЫВЛ', '220', '230', '<p>оащшыовщфшоащзфыов</p>', 'img_04.jpg:image/jpeg:220391:22/11/img_04.jpg', '', 'img_06.jpg:image/jpeg:283870:22/11/img_06.jpg', NULL),
(61, 0, 32, 34, 2, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 09:37:57', 0, '', '', 'К-т столовый "Франческа" 170*170, лен100%', '', '11с246', 'Белорусский Лен \n                \n                \n', '1100', '', 'Комплект столовый "Франческа" (11с246)Комплект состоит из скатерти и 6 салфеток. Состав ткани: лен - 100%Упаковка: пакет блистер\r\nРазмер:Скатерть (1 шт.) 170х170 смСалфетки (6 шт.) 45х45 см Производитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_61.jpg:image/jpeg:12518:32/34/20_6_61.jpg', 'http://laprovence.com.ua/ru/161-к-т-столовый-франческа.html\n', '20_6_61_1.jpg:image/jpeg:12518:32/34/20_6_61_1.jpg', NULL);
INSERT INTO `Message8` (`Message_ID`, `User_ID`, `Subdivision_ID`, `Sub_Class_ID`, `Priority`, `Keyword`, `ncTitle`, `ncKeywords`, `ncDescription`, `ncSMO_Title`, `ncSMO_Description`, `ncSMO_Image`, `Checked`, `IP`, `UserAgent`, `Parent_Message_ID`, `Created`, `LastUpdated`, `LastUser_ID`, `LastIP`, `LastUserAgent`, `Name`, `Size`, `Code`, `Vendor`, `Price`, `Price_OLD`, `Description`, `Image`, `Link_OLD`, `ImageBig`, `MultiImage`) VALUES
(62, 0, 32, 34, 3, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 09:39:44', 0, '', '', 'К-т столовый "Рогнеда" 170*245, лен100%', '', '11с178', 'Белорусский Лен \n                \n                \n', '1400', '', 'Комплект столовый "Рогнеда" (11с178)Комплект состоит из скатерти и 6 салфеток. Состав ткани: лен - 100%Упаковка: пакет блистер\r\nРазмер:Скатерть (1 шт.) 170х245 смСалфетки (6 шт.) 45х45 см Производитель: Оршанский льнокомбинат (г. Орша) Страна производства: Беларусь\r\n  Льняные скатерти, салфетки и полотенца – это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.  В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на  скромной, но благородной льняной скатерти -  идеальный вариант сервировки стола для романтического ужина. Традиционная «бабушкина» льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть.\r\n \r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n \r\n ', '20_6_62.jpg:image/jpeg:12518:32/34/20_6_62.jpg', 'http://laprovence.com.ua/ru/162-к-т-столовый-рогнеда.html\n', '20_6_62_1.jpg:image/jpeg:12518:32/34/20_6_62_1.jpg', NULL),
(129, 0, 32, 34, 1, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-07 09:36:25', 17, '46.118.63.237', 'Opera/9.80 (Windows NT 6.1; WOW64) Presto/2.12.388 Version/12.15', 'Скатерть "Полонез" 150*150, лен 100%', '150*150', '11с423', 'Белорусский Лен', '650', '', '<p>Скатерть &nbsp;&quot;Полонез&quot; Состав ткани: лен - 100%Размер: 150*150 смПроизводитель: Оршанский льнокомбинат (г. Орша)&nbsp;Страна производства: Беларусь &nbsp; Льняные скатерти, салфетки и полотенца &ndash; это не только вещи первой необходимости, но и оригинальные и практичные подарки, которые украсят любое застолье. Лен на сегодняшний день один из самых модных материалов и популярность его с течением времени только растет.&nbsp; В то же время он практичен и подходит на все случаи жизни. Тончайший фарфор и свечи смотрятся великолепно на&nbsp; скромной, но благородной льняной скатерти -&nbsp; идеальный вариант сервировки стола для романтического ужина. Традиционная &laquo;бабушкина&raquo; льняная скатерть в клеточку хороша для ежедневного использования или для воскресного обеда в кругу семьи. А для торжественных случаев можно выбрать белоснежную или ярко-красную льняную скатерть. &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>', '20_6_129.jpg:image/jpeg:12518:32/34/20_6_129.jpg', 'http://laprovence.com.ua/ru/428-скатерть-полонез-лен.html', '20_6_129_1.jpg:image/jpeg:12518:32/34/20_6_129_1.jpg', ''),
(133, 17, 60, 35, 1, '', '', '', '', '', '', '', 1, '5.248.110.66', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.84 Safari/537.36 OPR/38.0.2220.31', 0, '2016-07-06 17:01:04', '2016-07-07 09:40:25', 17, '5.248.110.66', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.84 Safari/537.36 OPR/38.0.2220.31', 'Тестовый товар', '150х150', '111111', 'Украина', '500', '600', '<p>Сайт рыбатекст поможет дизайнеру, верстальщику, вебмастеру сгенерировать несколько абзацев более менее осмысленного текста рыбы на русском языке, а начинающему оратору отточить навык публичных выступлений в домашних условиях. При создании генератора мы использовали небезызвестный универсальный код речей. Текст генерируется абзацами случайным образом от двух до десяти предложений в абзаце, что позволяет сделать текст более привлекательным и живым для визуально-слухового восприятия.</p>\r\n<p>По своей сути рыбатекст является альтернативой традиционному lorem ipsum, который вызывает у некторых клиентов недоумение при попытках прочитать рыбу текст. В отличии от lorem ipsum, текст рыба на русском языке наполнит любой макет непонятным смыслом и придаст неповторимый колорит советских времен.</p>', 'покрывало-чарли.jpg:image/jpeg:43369:60/35/pokryvalo_charli.jpg', '', 'покрывало-чарли (1).jpg:image/jpeg:47331:60/35/pokryvalo_charli__1_.jpg', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `Message11`
--

CREATE TABLE IF NOT EXISTS `Message11` (
  `Message_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) NOT NULL,
  `Subdivision_ID` int(11) NOT NULL,
  `Sub_Class_ID` int(11) NOT NULL,
  `Priority` int(11) NOT NULL DEFAULT '0',
  `Keyword` char(255) NOT NULL,
  `ncTitle` varchar(255) DEFAULT NULL,
  `ncKeywords` varchar(255) DEFAULT NULL,
  `ncDescription` text,
  `ncSMO_Title` varchar(255) DEFAULT NULL,
  `ncSMO_Description` text,
  `ncSMO_Image` char(255) DEFAULT NULL,
  `Checked` tinyint(4) NOT NULL DEFAULT '1',
  `IP` char(15) DEFAULT NULL,
  `UserAgent` char(255) DEFAULT NULL,
  `Parent_Message_ID` int(11) NOT NULL DEFAULT '0',
  `Created` datetime NOT NULL,
  `LastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastUser_ID` int(11) NOT NULL,
  `LastIP` char(15) DEFAULT NULL,
  `LastUserAgent` char(255) DEFAULT NULL,
  `Text` longtext,
  `MapCode` longtext,
  PRIMARY KEY (`Message_ID`),
  UNIQUE KEY `Sub_Class_ID` (`Sub_Class_ID`,`Message_ID`,`Keyword`),
  KEY `User_ID` (`User_ID`),
  KEY `LastUser_ID` (`LastUser_ID`),
  KEY `Subdivision_ID` (`Subdivision_ID`),
  KEY `Parent_Message_ID` (`Parent_Message_ID`),
  KEY `Priority` (`Priority`,`LastUpdated`),
  KEY `Checked` (`Checked`),
  KEY `Created` (`Created`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `Message11`
--

INSERT INTO `Message11` (`Message_ID`, `User_ID`, `Subdivision_ID`, `Sub_Class_ID`, `Priority`, `Keyword`, `ncTitle`, `ncKeywords`, `ncDescription`, `ncSMO_Title`, `ncSMO_Description`, `ncSMO_Image`, `Checked`, `IP`, `UserAgent`, `Parent_Message_ID`, `Created`, `LastUpdated`, `LastUser_ID`, `LastIP`, `LastUserAgent`, `Text`, `MapCode`) VALUES
(1, 1, 8, 5, 1, '', '', '', '', '', '', '', 1, '85.173.83.50', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 0, '2016-07-04 07:30:49', '2016-07-04 04:30:49', 0, NULL, NULL, '<p>Магазин домашнего текстиля "Ля Прованс"<br/>\r\n				г. Кривой Рог, пр. Мира 27<br/>\r\n				Заказ по телефону:  067 971-22-35,  096 704-62-13.<br/>\r\n				e-mail: 0967046213@mail.ru<br/>\r\n				<br/>\r\n				График работы: понедельник-суббота с 11:00-18:00<br/>\r\n				Выходной: воскресенье<br/>\r\n				<br/></p>', '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2674.494292250152!2d33.38289151511512!3d47.90747257513912!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x40db20a4d739285d%3A0x2fa98d5b7cad18f0!2z0L_RgNC-0YHQvy4g0JzQuNGA0YMsIDI3LCDQmtGA0LjQstC40Lkg0KDRltCzLCDQlNC90ZbQv9GA0L7Qv9C10YLRgNC-0LLRgdGM0LrQsCDQvtCx0LvQsNGB0YLRjCwgNTAwMDA!5e0!3m2!1sru!2sua!4v1459332826612" width="100%" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>');

-- --------------------------------------------------------

--
-- Структура таблицы `Message17`
--

CREATE TABLE IF NOT EXISTS `Message17` (
  `Message_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) NOT NULL,
  `Subdivision_ID` int(11) NOT NULL,
  `Sub_Class_ID` int(11) NOT NULL,
  `Priority` int(11) NOT NULL DEFAULT '0',
  `Keyword` char(255) NOT NULL,
  `ncTitle` varchar(255) DEFAULT NULL,
  `ncKeywords` varchar(255) DEFAULT NULL,
  `ncDescription` text,
  `ncSMO_Title` varchar(255) DEFAULT NULL,
  `ncSMO_Description` text,
  `ncSMO_Image` char(255) DEFAULT NULL,
  `Checked` tinyint(4) NOT NULL DEFAULT '1',
  `IP` char(15) DEFAULT NULL,
  `UserAgent` char(255) DEFAULT NULL,
  `Parent_Message_ID` int(11) NOT NULL DEFAULT '0',
  `Created` datetime NOT NULL,
  `LastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastUser_ID` int(11) NOT NULL,
  `LastIP` char(15) DEFAULT NULL,
  `LastUserAgent` char(255) DEFAULT NULL,
  `Name` char(255) DEFAULT NULL,
  `Text` longtext,
  `Image` char(255) DEFAULT NULL,
  `Date` datetime NOT NULL,
  `MultiImage` char(255) DEFAULT NULL,
  PRIMARY KEY (`Message_ID`),
  UNIQUE KEY `Sub_Class_ID` (`Sub_Class_ID`,`Message_ID`,`Keyword`),
  KEY `User_ID` (`User_ID`),
  KEY `LastUser_ID` (`LastUser_ID`),
  KEY `Subdivision_ID` (`Subdivision_ID`),
  KEY `Parent_Message_ID` (`Parent_Message_ID`),
  KEY `Priority` (`Priority`,`LastUpdated`),
  KEY `Checked` (`Checked`),
  KEY `Created` (`Created`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `Message17`
--

INSERT INTO `Message17` (`Message_ID`, `User_ID`, `Subdivision_ID`, `Sub_Class_ID`, `Priority`, `Keyword`, `ncTitle`, `ncKeywords`, `ncDescription`, `ncSMO_Title`, `ncSMO_Description`, `ncSMO_Image`, `Checked`, `IP`, `UserAgent`, `Parent_Message_ID`, `Created`, `LastUpdated`, `LastUser_ID`, `LastIP`, `LastUserAgent`, `Name`, `Text`, `Image`, `Date`, `MultiImage`) VALUES
(1, 1, 6, 14, 1, '', '', '', '', '', '', '', 1, '85.173.83.50', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 0, '2016-07-04 21:07:39', '2016-07-04 18:09:22', 1, '85.173.83.50', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 'Подынтегральное выражение как метод последовательных приближений', '<p>Пейзажный парк входит комплексный натуральный логарифм, таким образом сбылась мечта идиота - утверждение полностью доказано. Геодезическая линия недоступно поднимает изоморфный максимум. Длина вектора перевозит распространенный критерий интегрируемости.</p>\r\n<p>Эпсилон окрестность стремится к нулю. Определитель системы линейных уравнений применяет график функции, для этого необходим заграничный паспорт, действительный в течение трех месяцев с момента завершения поездки со свободной страницей для визы. Неравенство Бернулли постоянно. Если после применения правила Лопиталя неопределённость типа 0 / 0 осталась, собственное подмножество небезынтересно притягивает бесплатный расходящийся ряд. Итак, ясно, что интеграл Фурье обоснован необходимостью. Море жизненно совершает языковой цикл.</p>', 'img_04.jpg:image/jpeg:220391:6/14/img_04.jpg', '0000-00-00 00:00:00', NULL),
(2, 1, 6, 14, 2, '', '', '', '', '', '', '', 1, '85.173.83.50', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 0, '2016-07-04 21:08:23', '2016-07-04 18:08:55', 1, '85.173.83.50', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 'Почему независим бальнеоклиматический курорт?', '<p>Предел последовательности, исключая очевидный случай, выбирает эмпирический Бенгальский залив. Деформация связывает теплый Дом-музей Риддера Шмидта (XVIII в.). Поле направлений текстологически допускает равновероятный кит, что неудивительно. Ураган превышает двойной интеграл. Непрерывная функция уравновешивает Бенгальский залив. Карибский бассейн транслирует интеграл по ориентированной области.</p>\r\n<p>Абсолютно сходящийся ряд притягивает языковой неопределенный интеграл. Доказательство продуцирует кустарничек. Векторное поле применяет детерминант. Умножение двух векторов (векторное) оправдывает гидроузел. Венгры страстно любят танцевать, особенно ценятся национальные танцы, при этом температура уравновешивает изоморфный попугай.</p>', 'img_06.jpg:image/jpeg:283870:6/14/img_06.jpg', '0000-00-00 00:00:00', NULL),
(3, 1, 6, 14, 3, '', '', '', '', '', '', '', 1, '85.173.83.50', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 0, '2016-07-04 21:10:03', '2016-07-07 04:08:25', 1, '5.139.36.53', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 'Возрастающий степенной ряд в XXI веке', '<p>Геодезическая линия точно накладывает интеграл от функции, имеющий конечный разрыв. Щебнистое плато уравновешивает линейно зависимый бальнеоклиматический курорт. Линейное программирование оформляет ледостав, что несомненно приведет нас к истине. Интеграл от функции, имеющий конечный разрыв, при том, что королевские полномочия находятся в руках исполнительной власти - кабинета министров, основан&nbsp;на&nbsp;опыте.</p>\r\n<p>Антарктический пояс входит полярный круг, явно демонстрируя всю чушь вышесказанного. Связное множество существенно начинает косвенный график функции. Бурное развитие внутреннего туризма привело Томаса Кука к необходимости организовать поездки за границу, при этом непрерывная функция иллюстрирует ряд Тейлора.</p>', 'img_07.jpg:image/jpeg:378748:6/14/img_07.jpg', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Структура таблицы `Message24`
--

CREATE TABLE IF NOT EXISTS `Message24` (
  `Message_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) NOT NULL,
  `Subdivision_ID` int(11) NOT NULL,
  `Sub_Class_ID` int(11) NOT NULL,
  `Priority` int(11) NOT NULL DEFAULT '0',
  `Keyword` char(255) NOT NULL,
  `ncTitle` varchar(255) DEFAULT NULL,
  `ncKeywords` varchar(255) DEFAULT NULL,
  `ncDescription` text,
  `ncSMO_Title` varchar(255) DEFAULT NULL,
  `ncSMO_Description` text,
  `ncSMO_Image` char(255) DEFAULT NULL,
  `Checked` tinyint(4) NOT NULL DEFAULT '1',
  `IP` char(15) DEFAULT NULL,
  `UserAgent` char(255) DEFAULT NULL,
  `Parent_Message_ID` int(11) NOT NULL DEFAULT '0',
  `Created` datetime NOT NULL,
  `LastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastUser_ID` int(11) NOT NULL,
  `LastIP` char(15) DEFAULT NULL,
  `LastUserAgent` char(255) DEFAULT NULL,
  `Goods` char(255) DEFAULT NULL,
  `Name` char(255) DEFAULT NULL,
  `Phone` char(255) DEFAULT NULL,
  `Email` char(255) DEFAULT NULL,
  PRIMARY KEY (`Message_ID`),
  UNIQUE KEY `Sub_Class_ID` (`Sub_Class_ID`,`Message_ID`,`Keyword`),
  KEY `User_ID` (`User_ID`),
  KEY `LastUser_ID` (`LastUser_ID`),
  KEY `Subdivision_ID` (`Subdivision_ID`),
  KEY `Parent_Message_ID` (`Parent_Message_ID`),
  KEY `Priority` (`Priority`,`LastUpdated`),
  KEY `Checked` (`Checked`),
  KEY `Created` (`Created`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=78 ;

--
-- Дамп данных таблицы `Message24`
--

INSERT INTO `Message24` (`Message_ID`, `User_ID`, `Subdivision_ID`, `Sub_Class_ID`, `Priority`, `Keyword`, `ncTitle`, `ncKeywords`, `ncDescription`, `ncSMO_Title`, `ncSMO_Description`, `ncSMO_Image`, `Checked`, `IP`, `UserAgent`, `Parent_Message_ID`, `Created`, `LastUpdated`, `LastUser_ID`, `LastIP`, `LastUserAgent`, `Goods`, `Name`, `Phone`, `Email`) VALUES
(2, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 15:45:07', 0, '', '', '{"57":2,"14":2,"69":2}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(3, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 15:46:32', 0, '', '', '{"57":2,"14":2,"69":2}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(4, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 15:46:34', 0, '', '', '{"57":2,"14":2,"69":2}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(5, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 15:46:37', 0, '', '', '{"57":2,"14":2,"69":2}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(6, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 15:46:42', 0, '', '', '{"57":2,"14":2,"69":2}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(7, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 15:47:17', 0, '', '', '{"57":2,"14":2,"69":2}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(8, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 15:59:12', 0, '', '', '{"129":1,"15":1}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(9, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:00:42', 0, '', '', '{"129":1}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(10, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:01:06', 0, '', '', '{"129":1}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(11, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:01:10', 0, '', '', '{"129":1}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(12, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:03:40', 0, '', '', '{"129":2}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(13, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:04:05', 0, '', '', '{"129":2}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(14, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:04:20', 0, '', '', '{"129":2}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(15, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:04:21', 0, '', '', '{"129":2}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(16, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:04:43', 0, '', '', '{"129":2}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(17, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:04:58', 0, '', '', '{"129":2}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(18, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:05:18', 0, '', '', '{"129":2}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(19, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:05:28', 0, '', '', '{"129":2}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(20, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:06:21', 0, '', '', '{"129":2}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(21, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:06:36', 0, '', '', '{"129":2}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(22, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:06:37', 0, '', '', '{"129":2}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(23, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:07:02', 0, '', '', '{"129":2}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(24, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:07:25', 0, '', '', '{"129":2}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(25, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:07:35', 0, '', '', '{"129":2}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(26, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:07:43', 0, '', '', '{"129":2}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(27, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:08:19', 0, '', '', '{"129":2}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(28, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:08:30', 0, '', '', '{"129":2}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(29, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:00', 0, '', '', '{"129":2}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(30, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:00', 0, '', '', '', '', '', ''),
(31, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:00', 0, '', '', '', '', '', ''),
(32, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:00', 0, '', '', '', '', '', ''),
(33, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:01', 0, '', '', '', '', '', ''),
(34, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:01', 0, '', '', '', '', '', ''),
(35, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:01', 0, '', '', '', '', '', ''),
(36, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:01', 0, '', '', '', '', '', ''),
(37, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:01', 0, '', '', '', '', '', ''),
(38, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:01', 0, '', '', '', '', '', ''),
(39, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:01', 0, '', '', '', '', '', ''),
(40, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:02', 0, '', '', '', '', '', ''),
(41, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:02', 0, '', '', '', '', '', ''),
(42, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:02', 0, '', '', '', '', '', ''),
(43, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:02', 0, '', '', '', '', '', ''),
(44, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:03', 0, '', '', '', '', '', ''),
(45, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:03', 0, '', '', '', '', '', ''),
(46, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:03', 0, '', '', '', '', '', ''),
(47, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:03', 0, '', '', '', '', '', ''),
(48, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:04', 0, '', '', '', '', '', ''),
(49, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:04', 0, '', '', '', '', '', ''),
(50, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:04', 0, '', '', '', '', '', ''),
(51, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:04', 0, '', '', '', '', '', ''),
(52, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:04', 0, '', '', '', '', '', ''),
(53, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:05', 0, '', '', '', '', '', ''),
(54, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:05', 0, '', '', '', '', '', ''),
(55, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:05', 0, '', '', '', '', '', ''),
(56, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:05', 0, '', '', '', '', '', ''),
(57, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:05', 0, '', '', '', '', '', ''),
(58, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:06', 0, '', '', '', '', '', ''),
(59, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:06', 0, '', '', '', '', '', ''),
(60, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:06', 0, '', '', '', '', '', ''),
(61, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:06', 0, '', '', '', '', '', ''),
(62, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:06', 0, '', '', '', '', '', ''),
(63, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:06', 0, '', '', '', '', '', ''),
(64, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:07', 0, '', '', '', '', '', ''),
(65, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:07', 0, '', '', '', '', '', ''),
(66, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:07', 0, '', '', '', '', '', ''),
(67, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:07', 0, '', '', '', '', '', ''),
(68, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:07', 0, '', '', '', '', '', ''),
(69, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:08', 0, '', '', '', '', '', ''),
(70, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:08', 0, '', '', '', '', '', ''),
(71, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:09:33', 0, '', '', '{"129":1}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(72, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:13:00', 0, '', '', '{"21":3}', 'Павел Павлович', '89178349719', '1234@mail.ru'),
(73, 15, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:13:29', 0, '', '', '{"129":1,"15":1,"21":1}', 'Имя Фамилия', '23423', '1234@mail.ru'),
(74, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-05 16:23:13', 0, '', '', '', 'Коземиров Павел Павлович', '2342423', '234@mai.ru'),
(75, 16, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-06 06:08:58', 0, '', '', '{"103":2}', 'Петр Петров', '9393993939', '5555@mail.ru'),
(76, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-06 06:18:52', 0, '', '', '{"129":1}', '234234', '2342342', 'tashery@yashery.ru'),
(77, 0, 72, 18, 0, '', '', '', '', '', '', '', 1, '', '', 0, '0000-00-00 00:00:00', '2016-07-06 13:39:14', 0, '', '', '{"12":1,"11":1,"10":1}', 'К М Дмитриевич', '096 777 777 77', '777@mail.ru');

-- --------------------------------------------------------

--
-- Структура таблицы `Message26`
--

CREATE TABLE IF NOT EXISTS `Message26` (
  `Message_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) NOT NULL,
  `Subdivision_ID` int(11) NOT NULL,
  `Sub_Class_ID` int(11) NOT NULL,
  `Priority` int(11) NOT NULL DEFAULT '0',
  `Keyword` char(255) NOT NULL,
  `ncTitle` varchar(255) DEFAULT NULL,
  `ncKeywords` varchar(255) DEFAULT NULL,
  `ncDescription` text,
  `ncSMO_Title` varchar(255) DEFAULT NULL,
  `ncSMO_Description` text,
  `ncSMO_Image` char(255) DEFAULT NULL,
  `Checked` tinyint(4) NOT NULL DEFAULT '1',
  `IP` char(15) DEFAULT NULL,
  `UserAgent` char(255) DEFAULT NULL,
  `Parent_Message_ID` int(11) NOT NULL DEFAULT '0',
  `Created` datetime NOT NULL,
  `LastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastUser_ID` int(11) NOT NULL,
  `LastIP` char(15) DEFAULT NULL,
  `LastUserAgent` char(255) DEFAULT NULL,
  `Image` char(255) DEFAULT NULL,
  `URL` char(255) DEFAULT NULL,
  PRIMARY KEY (`Message_ID`),
  UNIQUE KEY `Sub_Class_ID` (`Sub_Class_ID`,`Message_ID`,`Keyword`),
  KEY `User_ID` (`User_ID`),
  KEY `LastUser_ID` (`LastUser_ID`),
  KEY `Subdivision_ID` (`Subdivision_ID`),
  KEY `Parent_Message_ID` (`Parent_Message_ID`),
  KEY `Priority` (`Priority`,`LastUpdated`),
  KEY `Checked` (`Checked`),
  KEY `Created` (`Created`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `Message26`
--

INSERT INTO `Message26` (`Message_ID`, `User_ID`, `Subdivision_ID`, `Sub_Class_ID`, `Priority`, `Keyword`, `ncTitle`, `ncKeywords`, `ncDescription`, `ncSMO_Title`, `ncSMO_Description`, `ncSMO_Image`, `Checked`, `IP`, `UserAgent`, `Parent_Message_ID`, `Created`, `LastUpdated`, `LastUser_ID`, `LastIP`, `LastUserAgent`, `Image`, `URL`) VALUES
(1, 1, 1, 19, 1, '', '', '', '', '', '', '', 1, '5.139.36.53', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 0, '2016-07-07 07:17:19', '2016-07-07 04:17:20', 0, NULL, NULL, 'banner.jpg:image/jpeg:12295:1/19/banner.jpg', 'http://laprovance.melixov.ru/catalogue/postelnoe-bele-len/komplekty/komplekty_127.html'),
(2, 1, 1, 19, 2, '', '', '', '', '', '', '', 1, '5.139.36.53', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 0, '2016-07-07 07:18:57', '2016-07-07 04:32:42', 1, '5.139.36.53', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 'banner.jpg:image/jpeg:12295:1/19/banner_0.jpg', 'http://laprovance.melixov.ru/catalogue/postelnoe-bele-len/komplekty/komplekty_13.html'),
(3, 1, 1, 19, 3, '', '', '', '', '', '', '', 1, '5.139.36.53', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 0, '2016-07-07 07:19:06', '2016-07-07 04:32:22', 1, '5.139.36.53', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 'banner.jpg:image/jpeg:12295:1/19/banner_1.jpg', 'http://laprovance.melixov.ru/catalogue/postelnoe-bele-len/komplekty/komplekty_73.html');

-- --------------------------------------------------------

--
-- Структура таблицы `Module`
--

CREATE TABLE IF NOT EXISTS `Module` (
  `Module_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Module_Name` varchar(255) NOT NULL DEFAULT '',
  `Keyword` varchar(255) NOT NULL DEFAULT '',
  `Description` text NOT NULL,
  `Parameters` text NOT NULL,
  `Example_URL` varchar(255) NOT NULL DEFAULT '',
  `Help_URL` varchar(255) NOT NULL DEFAULT '',
  `Installed` tinyint(4) NOT NULL DEFAULT '0',
  `Number` varchar(16) NOT NULL DEFAULT '',
  `Inside_Admin` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Checked` tinyint(4) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`Module_ID`),
  KEY `Checked` (`Checked`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `Module_Catalog`
--

CREATE TABLE IF NOT EXISTS `Module_Catalog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Module_ID` int(11) NOT NULL,
  `Catalogue_ID` int(11) NOT NULL,
  `Inside_Admin` int(4) NOT NULL,
  `Checked` int(4) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Module_ID` (`Module_ID`),
  KEY `Catalogue_ID` (`Catalogue_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `Multifield`
--

CREATE TABLE IF NOT EXISTS `Multifield` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Field_ID` int(10) unsigned NOT NULL,
  `Message_ID` int(10) unsigned NOT NULL,
  `Priority` int(10) unsigned DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Size` int(10) unsigned NOT NULL,
  `Path` varchar(255) NOT NULL,
  `Preview` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ixField_ID` (`Field_ID`),
  KEY `ixMessage_ID` (`Message_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `Multifield`
--

INSERT INTO `Multifield` (`ID`, `Field_ID`, `Message_ID`, `Priority`, `Name`, `Size`, `Path`, `Preview`) VALUES
(8, 37, 129, 1, '', 283870, '/netcat_files/multifile/37/img_06_0.jpg', '/netcat_files/multifile/37/preview_img_06_0.jpg'),
(7, 37, 129, 2, '', 378748, '/netcat_files/multifile/37/img_07_1.jpg', '/netcat_files/multifile/37/preview_img_07_1.jpg'),
(10, 38, 3, 1, '', 236420, '/netcat_files/multifile/38/img_05.jpg', '/netcat_files/multifile/38/preview_img_05.jpg'),
(5, 38, 3, 0, '', 283870, '/netcat_files/multifile/38/img_06.jpg', '/netcat_files/multifile/38/preview_img_06.jpg'),
(4, 37, 7, 0, '', 220391, '/netcat_files/multifile/37/img_04.jpg', '/netcat_files/multifile/37/preview_img_04.jpg'),
(3, 37, 7, 1, '', 236420, '/netcat_files/multifile/37/img_05.jpg', '/netcat_files/multifile/37/preview_img_05.jpg'),
(2, 37, 7, 2, '', 283870, '/netcat_files/multifile/37/img_06.jpg', '/netcat_files/multifile/37/preview_img_06.jpg'),
(1, 37, 7, 3, '', 378748, '/netcat_files/multifile/37/img_07.jpg', '/netcat_files/multifile/37/preview_img_07.jpg'),
(9, 37, 129, 0, '', 236420, '/netcat_files/multifile/37/img_05_0.jpg', '/netcat_files/multifile/37/preview_img_05_0.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `Patch`
--

CREATE TABLE IF NOT EXISTS `Patch` (
  `Patch_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Patch_Name` char(32) NOT NULL DEFAULT '',
  `Created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Description` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`Patch_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `Patch`
--

INSERT INTO `Patch` (`Patch_ID`, `Patch_Name`, `Created`, `Description`) VALUES
(1, '560', '2015-12-07 00:00:00', 'Обновление системы 5.6.0.15340');

-- --------------------------------------------------------

--
-- Структура таблицы `Permission`
--

CREATE TABLE IF NOT EXISTS `Permission` (
  `Permission_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) NOT NULL DEFAULT '0',
  `AdminType` int(11) NOT NULL DEFAULT '0',
  `Catalogue_ID` int(11) NOT NULL DEFAULT '0',
  `PermissionSet` int(11) NOT NULL DEFAULT '0',
  `PermissionGroup_ID` int(11) NOT NULL DEFAULT '0',
  `PermissionBegin` datetime DEFAULT NULL,
  `PermissionEnd` datetime DEFAULT NULL,
  PRIMARY KEY (`Permission_ID`),
  KEY `User_ID` (`User_ID`),
  KEY `AdminType` (`AdminType`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `Permission`
--

INSERT INTO `Permission` (`Permission_ID`, `User_ID`, `AdminType`, `Catalogue_ID`, `PermissionSet`, `PermissionGroup_ID`, `PermissionBegin`, `PermissionEnd`) VALUES
(1, 1, 7, 0, 0, 0, NULL, NULL),
(2, 2, 7, 0, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `PermissionGroup`
--

CREATE TABLE IF NOT EXISTS `PermissionGroup` (
  `PermissionGroup_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PermissionGroup_Name` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`PermissionGroup_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `PermissionGroup`
--

INSERT INTO `PermissionGroup` (`PermissionGroup_ID`, `PermissionGroup_Name`) VALUES
(1, 'Администраторы'),
(2, 'Внешние пользователи');

-- --------------------------------------------------------

--
-- Структура таблицы `Redirect`
--

CREATE TABLE IF NOT EXISTS `Redirect` (
  `Redirect_ID` int(11) NOT NULL AUTO_INCREMENT,
  `OldURL` varchar(255) NOT NULL DEFAULT '',
  `NewURL` varchar(255) NOT NULL DEFAULT '',
  `Header` int(3) DEFAULT '301',
  `Group_ID` int(11) DEFAULT '1',
  `Checked` int(3) DEFAULT '1',
  PRIMARY KEY (`Redirect_ID`),
  UNIQUE KEY `OldURL` (`OldURL`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `Redirect_Group`
--

CREATE TABLE IF NOT EXISTS `Redirect_Group` (
  `Redirect_Group_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Redirect_Group_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `Redirect_Group`
--

INSERT INTO `Redirect_Group` (`Redirect_Group_ID`, `Name`) VALUES
(1, 'Основная группа');

-- --------------------------------------------------------

--
-- Структура таблицы `Session`
--

CREATE TABLE IF NOT EXISTS `Session` (
  `Session_ID` char(32) NOT NULL DEFAULT '',
  `User_ID` int(11) NOT NULL DEFAULT '0',
  `SessionStart` int(11) NOT NULL DEFAULT '0',
  `SessionTime` int(11) NOT NULL DEFAULT '0',
  `UserIP` bigint(11) NOT NULL DEFAULT '0',
  `LoginSave` tinyint(1) NOT NULL DEFAULT '0',
  `Catalogue_ID` int(11) NOT NULL DEFAULT '0',
  `Subdivision_ID` int(11) NOT NULL DEFAULT '0',
  `AuthVariant` int(11) DEFAULT '1',
  PRIMARY KEY (`Session_ID`),
  KEY `User_ID` (`User_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Session`
--

INSERT INTO `Session` (`Session_ID`, `User_ID`, `SessionStart`, `SessionTime`, `UserIP`, `LoginSave`, `Catalogue_ID`, `Subdivision_ID`, `AuthVariant`) VALUES
('c9b644a671a8b0353ac4f04e4a89890c', 1, 1468059787, 1470660004, 93005114, 0, 0, 0, 1),
('08beeb5df92b41a78cdbbe267ede463a', 1, 1468072594, 1470726938, 93005114, 1, 0, 0, 1),
('7b91310e99707fb95f86ee9f48949653', 2, 1468072804, 1470664827, 93005114, 0, 0, 0, 1),
('912feb21e0e8164e495f13ffbbfdd5bf', 2, 1468072883, 1470664899, 778227441, 0, 0, 0, 1),
('08a07a58539a8989ccf17e1b22c6ecb1', 2, 1468079998, 1470810803, 100167234, 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Settings`
--

CREATE TABLE IF NOT EXISTS `Settings` (
  `Settings_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Key` varchar(255) NOT NULL,
  `Value` text NOT NULL,
  `Module` varchar(255) NOT NULL DEFAULT 'system',
  `Catalogue_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Settings_ID`),
  KEY `Catalogue_ID` (`Catalogue_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- Дамп данных таблицы `Settings`
--

INSERT INTO `Settings` (`Settings_ID`, `Key`, `Value`, `Module`, `Catalogue_ID`) VALUES
(1, 'VersionNumber', '5.6.0', 'system', 0),
(2, 'UserEmailField', 'Email', 'system', 0),
(3, 'PatchCheck', '1353317699', 'system', 0),
(4, 'LastPatch', '0', 'system', 0),
(5, 'LastPatchBuildNumber', '15340', 'system', 0),
(6, 'LastPatchType', 'master', 'system', 0),
(7, 'EditDesignTemplateID', '1', 'system', 0),
(8, 'EditorType', '3', 'system', 0),
(9, 'InlineEditConfirmation', '1', 'system', 0),
(10, 'CkeditorEmbedEditor', '1', 'system', 0),
(11, 'CkeditorPanelFull', '1', 'system', 0),
(12, 'CkeditorPanelInline', '2', 'system', 0),
(13, 'AdminButtons', '<div class=''nc_idtab".($f_Checked ? "" : " nc_idtab_disabled")."''>\r\n<div class=''nc_idtab_handler'' id=''Message".$classID."-".$f_RowID."_handler''></div>\r\n<div class=''nc_idtab_id''>\r\n<div class=''nc_idtab_Messageid'' 	title=''".NETCAT_MODERATION_ID.": ".$f_RowID."''>".$f_AdminButtons_id."</div>\r\n<div class=''nc_idtab_priority'' 	title=''".NETCAT_MODERATION_PRIORITY.": ".$f_Priority."''>".$f_AdminButtons_priority."</div>\r\n<div class=''nc_idtab_adduser'' 		title=''".NETCAT_MODERATION_ADDEDON.": ".$f_UserID."''>$f_UserID</div>\r\n".($f_LastUserID ? "<div class=''nc_idtab_edituser'' title=''".NETCAT_MODERATION_CHANGED.": ".$f_LastUserID."''>$f_LastUserID</div>" : "")."\r\n</div>\r\n<div class=''nc_idtab_buttons''>\r\n<input class=''nc_multi_check'' type=''checkbox'' onclick=''nc_package_obj.select(".$f_RowID.", ".$cc.");'' >\\r\\n\r\n<a href=''#'' onclick=\\"window.open(''".$ADMIN_PATH."objects/copy_Message.php?catalogue=".$catalogue."&amp;sub=".$sub."&amp;cc=".$cc."&amp;classID=".$classID."&amp;Message=".$f_RowID."'', ''nc_popup_test1'', ''width=800,height=500,menubar=no,resizable=no,scrollbars=no,toolbar=no,resizable=yes''); return false;\\"><img src=''".$ADMIN_TEMPLATE."img/i_obj_copy.gif'' alt=''".NETCAT_MODERATION_COPY_OBJECT."'' title=''".NETCAT_MODERATION_COPY_OBJECT."''></a>\r\n<a href=''".($f_Checked\r\n        ? $any_url_prefix.$SUB_FOLDER.$HTTP_ROOT_PATH."Message.php?catalogue=".$catalogue."&amp;sub=".$sub."&amp;cc=".$cc."&amp;classID=".$classID."&amp;Message=".$f_RowID."&amp;checked=1&amp;posting=1".( $curPos ? "&amp;curPos=".$curPos : "").($admin_mode ? "&amp;admin_mode=1" : "")\r\n        : $admin_url_prefix."Message.php?sub=".$sub."&amp;cc=".$cc."&amp;classID=".$classID."&amp;Message=".$f_RowID."&amp;checked=2&amp;posting=1".( $curPos ? "&amp;curPos=".$curPos : "").($admin_mode ? "&amp;admin_mode=1" : "")\r\n      )."''><img	src=''".$ADMIN_TEMPLATE."img/i_obj_turn" . ($f_Checked ? ''on'' : ''off'' ) . ".gif'' ".($f_Checked ? "alt=''" . NETCAT_MODERATION_TURNTOOFF ."''  title=''".NETCAT_MODERATION_TURNTOOFF."''"	: "alt=''".NETCAT_MODERATION_TURNTOON."'' title=''".NETCAT_MODERATION_TURNTOON."''")."></a>\r\n&nbsp;&nbsp;\r\n<a href=''".$SUB_FOLDER.$HTTP_ROOT_PATH."Message.php?catalogue=".$catalogue."&amp;sub=".$sub."&amp;cc=".$cc."&amp;Message=".$f_RowID.( $curPos ? "&amp;curPos=".$curPos : "")."''><img src=''".$ADMIN_TEMPLATE."img/i_obj_edit.gif'' alt=''".NETCAT_MODERATION_CHANGE."'' title=''".NETCAT_MODERATION_CHANGE."''></a>\r\n&nbsp;&nbsp;\r\n<a	href=''".$SUB_FOLDER.$HTTP_ROOT_PATH."Message.php?catalogue=".$catalogue."&amp;sub=".$sub."&amp;cc=".$cc."&amp;Message=".$f_RowID."&amp;delete=1".( $curPos ? "&amp;curPos=".$curPos : "")."''><img src=''".$ADMIN_TEMPLATE."img/i_obj_delete.gif'' alt=''".NETCAT_MODERATION_DELETE."'' title=''".NETCAT_MODERATION_DELETE."''></a>       \r\n</div>\r\n<div class=''ncf_row nc_clear''></div>\r\n</div>', 'system', 0),
(14, 'AdminCommon', '<div class=''nc_idtab nc_admincommon''>\r\n<div class=''nc_idtab_id''>\r\n<div class=''nc_idtab_ccid'' title=''".NETCAT_MODERATION_CLASSID.": ".$cc."''>".$cc.".</div>\r\n<div class=''nc_idtab_ccname''>".$cc_env[''Sub_Class_Name'']."</div>\r\n</div>\r\n<div class=''nc_idtab_buttons''>\r\n<a href=''#'' onclick=''nc_package_obj.process(\\"checkOn\\", ".$cc."); return false;''><img src=''".$ADMIN_TEMPLATE."img/i_selected_on.gif'' alt=''".NETCAT_MODERATION_SELECTEDON."'' title=''".NETCAT_MODERATION_SELECTEDON."''></a>\r\n<a href=''#'' onclick=''nc_package_obj.process(\\"checkOff\\", ".$cc."); return false;''><img src=''".$ADMIN_TEMPLATE."img/i_selected_off.gif'' alt=''".NETCAT_MODERATION_SELECTEDOFF."'' title=''".NETCAT_MODERATION_SELECTEDOFF."''></a>\r\n&nbsp;&nbsp;\r\n<a href=''#'' onclick=''nc_package_obj.process(\\"delete\\", ".$cc."); return false;''><img src=''".$ADMIN_TEMPLATE."img/i_selected_remove.gif'' alt=''".NETCAT_MODERATION_DELETESELECTED."'' title=''".NETCAT_MODERATION_DELETESELECTED."''></a>\r\n&nbsp;&nbsp;\r\n<a href=''".$admin_url_prefix."add.php?catalogue=".$catalogue."&amp;sub=".$sub."&amp;cc=".$cc."''><img src=''".$ADMIN_TEMPLATE."img/i_obj_add.gif'' alt=''".CONTROL_CONTENT_CATALOUGE_FUNCS_SHOWMENU_ADD."'' title=''".CONTROL_CONTENT_CATALOUGE_FUNCS_SHOWMENU_ADD."''></a>\r\n<a href=''".$admin_url_prefix."Message.php?catalogue=".$catalogue."&amp;sub=".$sub."&amp;cc=".$cc."&amp;classID=".$classID."&amp;delete=1''><img src=''".$ADMIN_TEMPLATE."img/i_obj_delete_all.gif'' alt=''".NETCAT_MODERATION_REMALL."'' title=''".NETCAT_MODERATION_REMALL."''></a>\r\n</div>\r\n<div class=''ncf_row nc_clear''></div>\r\n<script type=''text/javascript'' language=''javascript''>\r\nnc_package_obj.new_cc(".$cc.", ''".NETCAT_MODERATION_NOTSELECTEDOBJ."'');\r\n</script>\r\n<form id=''nc_form_selected_".$cc."'' action=''".$SUB_FOLDER.$HTTP_ROOT_PATH."Message.php'' method=''post''>\r\n<input type=''hidden'' name=''catalogue'' value=''".$catalogue."''>\r\n<input type=''hidden'' name=''sub'' value=''".$sub."''>\r\n<input type=''hidden'' name=''cc'' value=''".$cc."''>\r\n<input type=''hidden'' name=''curPos'' value=''".$curPos."''>\r\n<input type=''hidden'' name=''admin_mode'' value=''".$admin_mode."''>\r\n</form>\r\n</div>\r\n<div class=''ncf_row nc_clear''></div>', 'system', 0),
(15, 'AdminButtonsType', '', 'system', 0),
(16, 'AdminParameters', '', 'system', 0),
(17, 'RemindSave', '1', 'system', 0),
(18, 'PacketOperations', '', 'system', 0),
(19, 'TextareaResize', '', 'system', 0),
(20, 'SyntaxEditor', '1', 'system', 0),
(21, 'SyntaxCheck', '', 'system', 0),
(22, 'UseToken', '4', 'system', 0),
(23, 'AdminNoticeResponse', 'a:6:{s:10:"next_patch";i:0;s:3:"lic";i:1;s:7:"support";i:0;s:8:"linkcopy";s:42:"http://www.netcat.ru/forclients/my/copies/";s:7:"crpatch";i:0;s:11:"crpatchlink";s:0:"";}', 'system', 0),
(24, 'TrashUse', '1', 'system', 0),
(25, 'TrashLimit', '20', 'system', 0),
(26, 'FieldUsage', 'a:12:{s:13:"last_modified";s:12:"LastModified";s:18:"last_modified_type";s:16:"LastModifiedType";s:8:"language";s:8:"Language";s:8:"keywords";s:8:"Keywords";s:11:"description";s:11:"Description";s:5:"title";s:5:"Title";s:15:"sitemap_include";s:16:"IncludeInSitemap";s:18:"sitemap_changefreq";s:17:"SitemapChangefreq";s:16:"sitemap_priority";s:15:"SitemapPriority";s:9:"smo_title";s:11:"ncSMO_Title";s:15:"smo_description";s:17:"ncSMO_Description";s:9:"smo_image";s:11:"ncSMO_Image";}', 'system', 0),
(27, 'CKEditorSkin', 'moono', 'system', 0),
(28, 'ProductNumber', '', 'system', 0),
(29, 'ProjectName', 'Мой сайт', 'system', 0),
(30, 'SpamFromName', 'admin', 'system', 0),
(31, 'SpamFromEmail', 'valerymelixov@gmail.com', 'system', 0),
(32, 'Code', '', 'system', 0),
(33, 'SecretKey', 'd41d8cd98f00b204e9800998ecf8427e', 'system', 0),
(34, 'nc_shop_mode', '2', 'system', 0),
(35, 'nc_default_settings_filled_500', '1', 'system', 0),
(36, 'CKEditorFileSystem', '', 'system', 0),
(37, 'CMEmbeded', '1', 'system', 0),
(38, 'CMDefault', '1', 'system', 0),
(39, 'CMAutocomplete', '1', 'system', 0),
(40, 'CMHelp', '1', 'system', 0),
(41, 'JSLoadjQueryDollar', '1', 'system', 0),
(42, 'JSLoadjQueryExtensionsAlways', '1', 'system', 0),
(43, 'JSLoadModulesScripts', '1', 'system', 0),
(44, 'MinifyStaticFiles', '1', 'system', 0),
(45, 'AutosaveType', 'keyboard', 'system', 0),
(46, 'AutosavePeriod', '60', 'system', 0),
(47, 'user_widgets_1', '[]', 'system', 0),
(48, 'AutosaveNoActive', '1', 'system', 0),
(49, 'SystemID', '2', 'system', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `SQLQueries`
--

CREATE TABLE IF NOT EXISTS `SQLQueries` (
  `SQL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SQL_text` text,
  UNIQUE KEY `SQL_ID` (`SQL_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `SQLQueries`
--

INSERT INTO `SQLQueries` (`SQL_ID`, `SQL_text`) VALUES
(1, 'select * from Field'),
(2, 'truncate Field'),
(3, 'select * from Temp'),
(4, 'select * from Templates'),
(5, 'select * from Template'),
(6, 'select * from User');

-- --------------------------------------------------------

--
-- Структура таблицы `Subdivision`
--

CREATE TABLE IF NOT EXISTS `Subdivision` (
  `Subdivision_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Catalogue_ID` int(11) NOT NULL DEFAULT '0',
  `Parent_Sub_ID` int(11) NOT NULL DEFAULT '0',
  `Subdivision_Name` varchar(255) NOT NULL DEFAULT '',
  `Template_ID` int(11) DEFAULT NULL,
  `ExternalURL` varchar(255) DEFAULT NULL,
  `EnglishName` varchar(64) NOT NULL DEFAULT '',
  `LastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LastModified` datetime DEFAULT NULL,
  `LastModifiedType` int(11) DEFAULT '0',
  `Hidden_URL` varchar(255) NOT NULL DEFAULT '',
  `Read_Access_ID` int(11) NOT NULL DEFAULT '0',
  `Write_Access_ID` int(11) NOT NULL DEFAULT '0',
  `Priority` int(11) DEFAULT NULL,
  `Checked` smallint(6) NOT NULL DEFAULT '0',
  `Edit_Access_ID` int(11) NOT NULL DEFAULT '0',
  `Checked_Access_ID` int(11) NOT NULL DEFAULT '0',
  `Delete_Access_ID` int(11) NOT NULL DEFAULT '0',
  `Subscribe_Access_ID` int(11) NOT NULL DEFAULT '0',
  `Moderation_ID` int(11) NOT NULL DEFAULT '0',
  `Favorite` smallint(6) NOT NULL DEFAULT '0',
  `TemplateSettings` text,
  `UseMultiSubClass` tinyint(1) NOT NULL DEFAULT '0',
  `UseEditDesignTemplate` tinyint(1) NOT NULL DEFAULT '0',
  `DisallowIndexing` int(11) DEFAULT '-1',
  `Description` text,
  `Keywords` text,
  `Title` varchar(255) DEFAULT NULL,
  `ncSMO_Title` varchar(255) DEFAULT NULL,
  `ncSMO_Description` text,
  `ncSMO_Image` varchar(255) DEFAULT NULL,
  `Language` varchar(255) DEFAULT NULL,
  `DisplayType` enum('inherit','traditional','shortpage','longpage_vertical','longpage_horizontal') NOT NULL DEFAULT 'inherit',
  `LabelColor` varchar(6) DEFAULT NULL,
  `Cache_Access_ID` int(11) unsigned NOT NULL DEFAULT '0',
  `Cache_Lifetime` int(11) unsigned NOT NULL DEFAULT '0',
  `Comment_Rule_ID` int(11) NOT NULL DEFAULT '0',
  `SitemapPriority` float DEFAULT NULL,
  `SitemapChangefreq` enum('-1','always','hourly','daily','weekly','monthly','yearly','never') DEFAULT '-1',
  `IncludeInSitemap` int(11) DEFAULT '-1',
  PRIMARY KEY (`Subdivision_ID`),
  UNIQUE KEY `Hidden_URL` (`Catalogue_ID`,`Parent_Sub_ID`,`EnglishName`),
  KEY `Parent_Sub_ID` (`Parent_Sub_ID`),
  KEY `Checked` (`Checked`),
  KEY `Subdivision_ID` (`Subdivision_ID`,`Hidden_URL`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=74 ;

--
-- Дамп данных таблицы `Subdivision`
--

INSERT INTO `Subdivision` (`Subdivision_ID`, `Catalogue_ID`, `Parent_Sub_ID`, `Subdivision_Name`, `Template_ID`, `ExternalURL`, `EnglishName`, `LastUpdated`, `Created`, `LastModified`, `LastModifiedType`, `Hidden_URL`, `Read_Access_ID`, `Write_Access_ID`, `Priority`, `Checked`, `Edit_Access_ID`, `Checked_Access_ID`, `Delete_Access_ID`, `Subscribe_Access_ID`, `Moderation_ID`, `Favorite`, `TemplateSettings`, `UseMultiSubClass`, `UseEditDesignTemplate`, `DisallowIndexing`, `Description`, `Keywords`, `Title`, `ncSMO_Title`, `ncSMO_Description`, `ncSMO_Image`, `Language`, `DisplayType`, `LabelColor`, `Cache_Access_ID`, `Cache_Lifetime`, `Comment_Rule_ID`, `SitemapPriority`, `SitemapChangefreq`, `IncludeInSitemap`) VALUES
(54, 1, 17, 'Наволочки', 0, NULL, 'navolochki', '2016-07-09 12:32:32', '2016-07-03 18:31:17', '2016-07-09 15:32:32', 0, '/catalogue/sumki-lnyanye/navolochki/', 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(48, 1, 16, 'Комплекты', 0, NULL, 'komplekty', '2016-07-09 12:32:32', '2016-07-03 18:28:33', '2016-07-09 15:32:32', 0, '/catalogue/interernyy-dekor/komplekty/', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(49, 1, 16, 'Простыни', 0, NULL, 'prostyni', '2016-07-09 12:32:32', '2016-07-03 18:28:41', '2016-07-09 15:32:32', 0, '/catalogue/interernyy-dekor/prostyni/', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(50, 1, 16, 'Наволочки', 0, NULL, 'navolochki', '2016-07-09 12:32:32', '2016-07-03 18:28:50', '2016-07-09 15:32:32', 0, '/catalogue/interernyy-dekor/navolochki/', 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(51, 1, 16, 'Пододеяльники', 0, NULL, 'pododeyalniki', '2016-07-09 12:32:32', '2016-07-03 18:30:50', '2016-07-09 15:32:32', 0, '/catalogue/interernyy-dekor/pododeyalniki/', 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(52, 1, 17, 'Комплекты', 0, NULL, 'komplekty', '2016-07-09 12:32:32', '2016-07-03 18:31:03', '2016-07-09 15:32:32', 0, '/catalogue/sumki-lnyanye/komplekty/', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(47, 1, 15, 'Пододеяльники', 0, NULL, 'pododeyalniki', '2016-07-09 12:32:32', '2016-07-03 18:28:26', '2016-07-09 15:32:32', 0, '/catalogue/len-dlya-detey/pododeyalniki/', 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(46, 1, 15, 'Наволочки', 0, NULL, 'navolochki', '2016-07-09 12:32:32', '2016-07-03 18:28:20', '2016-07-09 15:32:32', 0, '/catalogue/len-dlya-detey/navolochki/', 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(53, 1, 17, 'Простыни', 0, NULL, 'prostyni', '2016-07-09 12:32:32', '2016-07-03 18:31:11', '2016-07-09 15:32:32', 0, '/catalogue/sumki-lnyanye/prostyni/', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(35, 1, 12, 'Пододеяльники', 0, NULL, 'pododeyalniki', '2016-07-09 12:32:32', '2016-07-03 18:27:04', '2016-07-09 15:32:32', 0, '/catalogue/stolovoe-bele-len/pododeyalniki/', 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(36, 1, 13, 'Комплекты', 0, NULL, 'komplekty', '2016-07-09 12:32:32', '2016-07-03 18:27:12', '2016-07-09 15:32:32', 0, '/catalogue/polotentsa-mahrovye/komplekty/', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(37, 1, 13, 'Простыни', 0, NULL, 'prostyni', '2016-07-09 12:32:32', '2016-07-03 18:27:18', '2016-07-09 15:32:32', 0, '/catalogue/polotentsa-mahrovye/prostyni/', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(38, 1, 13, 'Наволочки', 0, NULL, 'navolochki', '2016-07-09 12:32:32', '2016-07-03 18:27:24', '2016-07-09 15:32:32', 0, '/catalogue/polotentsa-mahrovye/navolochki/', 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(39, 1, 13, 'Пододеяльники', 0, NULL, 'pododeyalniki', '2016-07-09 12:32:32', '2016-07-03 18:27:31', '2016-07-09 15:32:32', 0, '/catalogue/polotentsa-mahrovye/pododeyalniki/', 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(40, 1, 14, 'Комплекты', 0, NULL, 'komplekty', '2016-07-09 12:32:32', '2016-07-03 18:27:40', '2016-07-09 15:32:32', 0, '/catalogue/bannye-prinadlezhnosti/komplekty/', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(41, 1, 14, 'Простыни', 0, NULL, 'prostyni', '2016-07-09 12:32:32', '2016-07-03 18:27:46', '2016-07-09 15:32:32', 0, '/catalogue/bannye-prinadlezhnosti/prostyni/', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(42, 1, 14, 'Наволочки', 0, NULL, 'navolochki', '2016-07-09 12:32:32', '2016-07-03 18:27:53', '2016-07-09 15:32:32', 0, '/catalogue/bannye-prinadlezhnosti/navolochki/', 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(43, 1, 14, 'Пододеяльники', 0, NULL, 'pododeyalniki', '2016-07-09 12:32:32', '2016-07-03 18:28:00', '2016-07-09 15:32:32', 0, '/catalogue/bannye-prinadlezhnosti/pododeyalniki/', 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(44, 1, 15, 'Комплекты', 0, NULL, 'komplekty', '2016-07-09 12:32:32', '2016-07-03 18:28:07', '2016-07-09 15:32:32', 0, '/catalogue/len-dlya-detey/komplekty/', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(45, 1, 15, 'Простыни', 0, NULL, 'prostyni', '2016-07-09 12:32:32', '2016-07-03 18:28:13', '2016-07-09 15:32:32', 0, '/catalogue/len-dlya-detey/prostyni/', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(31, 1, 11, 'Пододеяльники', 0, NULL, 'pododeyalniki', '2016-07-09 12:32:32', '2016-07-03 18:26:37', '2016-07-09 15:32:32', 0, '/catalogue/pokryvala-pledy-len/pododeyalniki/', 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(32, 1, 12, 'Комплекты столовые', 0, NULL, 'komplekty-stolovye', '2016-07-09 12:32:32', '2016-07-03 18:26:44', '2016-07-09 15:32:32', 0, '/catalogue/stolovoe-bele-len/komplekty-stolovye/', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', '', 0, 0, 0, NULL, '-1', -1),
(33, 1, 12, 'Простыни', 0, NULL, 'prostyni', '2016-07-09 12:32:32', '2016-07-03 18:26:50', '2016-07-09 15:32:32', 0, '/catalogue/stolovoe-bele-len/prostyni/', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(34, 1, 12, 'Наволочки', 0, NULL, 'navolochki', '2016-07-09 12:32:32', '2016-07-03 18:26:57', '2016-07-09 15:32:32', 0, '/catalogue/stolovoe-bele-len/navolochki/', 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(28, 1, 11, 'Комплекты', 0, NULL, 'komplekty', '2016-07-09 12:32:32', '2016-07-03 18:26:12', '2016-07-09 15:32:32', 0, '/catalogue/pokryvala-pledy-len/komplekty/', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(29, 1, 11, 'Простыни', 0, NULL, 'prostyni', '2016-07-09 12:32:32', '2016-07-03 18:26:21', '2016-07-09 15:32:32', 0, '/catalogue/pokryvala-pledy-len/prostyni/', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(30, 1, 11, 'Наволочки', 0, NULL, 'navolochki', '2016-07-09 12:32:32', '2016-07-03 18:26:29', '2016-07-09 15:32:32', 0, '/catalogue/pokryvala-pledy-len/navolochki/', 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(27, 1, 10, 'Пододеяльники', 0, NULL, 'pododeyalniki', '2016-07-09 12:32:32', '2016-07-03 18:26:06', '2016-07-09 15:32:32', 0, '/catalogue/postelnoe-bele-satin/pododeyalniki/', 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(26, 1, 10, 'Наволочки', 0, NULL, 'navolochki', '2016-07-09 12:32:32', '2016-07-03 18:25:58', '2016-07-09 15:32:32', 0, '/catalogue/postelnoe-bele-satin/navolochki/', 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(25, 1, 10, 'Простыни', 0, NULL, 'prostyni', '2016-07-09 12:32:32', '2016-07-03 18:25:52', '2016-07-09 15:32:32', 0, '/catalogue/postelnoe-bele-satin/prostyni/', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(23, 1, 9, 'Пододеяльники', 0, NULL, 'pododeyalniki', '2016-07-09 12:32:32', '2016-07-03 18:25:39', '2016-07-09 15:32:32', 0, '/catalogue/postelnoe-bele-len/pododeyalniki/', 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(24, 1, 10, 'Комплекты', 0, NULL, 'komplekty', '2016-07-09 12:32:32', '2016-07-03 18:25:46', '2016-07-09 15:32:32', 0, '/catalogue/postelnoe-bele-satin/komplekty/', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(22, 1, 9, 'Наволочки', 0, NULL, 'navolochki', '2016-07-09 12:32:32', '2016-07-03 18:25:31', '2016-07-09 15:32:32', 0, '/catalogue/postelnoe-bele-len/navolochki/', 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(21, 1, 9, 'Простыни', 0, NULL, 'prostyni', '2016-07-09 12:32:32', '2016-07-03 18:25:24', '2016-07-09 15:32:32', 0, '/catalogue/postelnoe-bele-len/prostyni/', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(20, 1, 9, 'Комплекты', 0, NULL, 'komplekty', '2016-07-09 12:32:32', '2016-07-03 18:25:17', '2016-07-09 15:32:32', 0, '/catalogue/postelnoe-bele-len/komplekty/', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(70, 1, 69, 'Заказ', 9, NULL, 'order', '2016-07-09 12:39:34', '2016-07-05 18:14:59', '2016-07-09 15:39:34', 0, '/cart/order/', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(19, 1, 3, 'La Provence handmade', 0, NULL, 'la-provence-handmade', '2016-07-09 12:32:32', '2016-07-03 18:24:50', '2016-07-09 15:32:32', 0, '/catalogue/la-provence-handmade/', 0, 0, 10, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(18, 1, 3, 'Интерьерные игрушки', 0, NULL, 'interernye-igrushki', '2016-07-09 12:32:32', '2016-07-03 18:08:48', '2016-07-09 15:32:32', 0, '/catalogue/interernye-igrushki/', 0, 0, 9, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(17, 1, 3, 'Сумки льняные', 0, NULL, 'sumki-lnyanye', '2016-07-09 12:32:32', '2016-07-03 18:08:32', '2016-07-09 15:32:32', 0, '/catalogue/sumki-lnyanye/', 0, 0, 8, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(16, 1, 3, 'Интерьерный декор', 0, NULL, 'interernyy-dekor', '2016-07-09 12:32:32', '2016-07-03 18:08:16', '2016-07-09 15:32:32', 0, '/catalogue/interernyy-dekor/', 0, 0, 7, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(15, 1, 3, 'Лен для детей', 0, NULL, 'len-dlya-detey', '2016-07-09 12:32:32', '2016-07-03 18:08:02', '2016-07-09 15:32:32', 0, '/catalogue/len-dlya-detey/', 0, 0, 6, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(14, 1, 3, 'Банные принадлежности', 0, NULL, 'bannye-prinadlezhnosti', '2016-07-09 12:32:32', '2016-07-03 18:07:50', '2016-07-09 15:32:32', 0, '/catalogue/bannye-prinadlezhnosti/', 0, 0, 5, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(13, 1, 3, 'Полотенца махровые', 0, NULL, 'polotentsa-mahrovye', '2016-07-09 12:32:32', '2016-07-03 18:07:36', '2016-07-09 15:32:32', 0, '/catalogue/polotentsa-mahrovye/', 0, 0, 4, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(12, 1, 3, 'Столовое белье лен', 0, NULL, 'stolovoe-bele-len', '2016-07-09 12:32:32', '2016-07-03 18:07:24', '2016-07-09 15:32:32', 0, '/catalogue/stolovoe-bele-len/', 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(11, 1, 3, 'Покрывала, пледы лен', 0, NULL, 'pokryvala-pledy-len', '2016-07-09 12:32:32', '2016-07-03 18:07:11', '2016-07-09 15:32:32', 0, '/catalogue/pokryvala-pledy-len/', 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(10, 1, 3, 'Постельное белье сатин', 0, NULL, 'postelnoe-bele-satin', '2016-07-09 12:32:32', '2016-07-03 18:06:59', '2016-07-09 15:32:32', 0, '/catalogue/postelnoe-bele-satin/', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(9, 1, 3, 'Постельное белье лен', 0, NULL, 'postelnoe-bele-len', '2016-07-09 12:32:32', '2016-07-03 18:06:44', '2016-07-09 15:32:32', 0, '/catalogue/postelnoe-bele-len/', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(73, 1, 0, 'Забыли пароль', 10, NULL, 'zabyli-parol', '2016-07-09 12:32:32', '2016-07-05 19:18:36', '2016-07-09 15:32:32', 0, '/zabyli-parol/', 0, 0, 13, 0, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(72, 1, 0, 'Заказы', 0, NULL, 'zakazy', '2016-07-07 04:30:03', '2016-07-05 18:43:31', '2016-07-07 07:30:03', 0, '/zakazy/', 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', 'green', 0, 0, 0, NULL, '-1', -1),
(71, 1, 0, 'Поиск', 4, NULL, 'search', '2016-07-09 12:32:32', '2016-07-05 18:25:58', '2016-07-09 15:32:32', 0, '/search/', 0, 0, 11, 0, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', '', 0, 0, 0, NULL, '-1', -1),
(69, 1, 0, 'Корзина', 7, NULL, 'cart', '2016-07-09 12:39:34', '2016-07-05 17:11:14', '2016-07-09 15:39:34', 0, '/cart/', 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(68, 1, 0, 'Вход', 6, NULL, 'enter', '2016-07-09 12:32:32', '2016-07-05 07:42:14', '2016-07-09 15:32:32', 0, '/enter/', 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', '', 0, 0, 0, NULL, '-1', -1),
(65, 1, 0, 'Регистрация', 5, NULL, 'registratsiya', '2016-07-09 12:32:32', '2016-07-05 07:42:01', '2016-07-09 15:32:32', 0, '/registratsiya/', 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(8, 1, 0, 'Контакты', 4, NULL, 'contacts', '2016-07-09 12:32:32', '2016-07-03 17:37:24', '2016-07-09 15:32:32', 0, '/contacts/', 0, 0, 6, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(7, 1, 0, 'Скидки', 4, NULL, 'sales', '2016-07-09 12:32:32', '2016-07-03 17:37:12', '2016-07-09 15:32:32', 0, '/sales/', 0, 0, 5, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(4, 1, 0, 'О льне', 4, NULL, 'o-lne', '2016-07-09 12:32:32', '2016-07-03 17:36:08', '2016-07-09 15:32:32', 0, '/o-lne/', 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(5, 1, 0, 'Доставка / Оплата', 4, NULL, 'dostavka-oplata', '2016-07-09 12:32:32', '2016-07-03 17:36:45', '2016-07-09 15:32:32', 0, '/dostavka-oplata/', 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(6, 1, 0, 'Новости', 4, NULL, 'news', '2016-07-09 12:32:32', '2016-07-03 17:36:58', '2016-07-09 15:32:32', 0, '/news/', 0, 0, 4, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(3, 1, 0, 'Каталог', 4, NULL, 'catalogue', '2016-07-09 12:32:32', '2016-07-03 17:36:01', '2016-07-09 15:32:32', 0, '/catalogue/', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, '', '', 'Каталог', '', '', NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(1, 1, 0, 'Главная', 0, NULL, 'index', '2016-07-07 06:26:32', '0000-00-00 00:00:00', '2016-07-07 09:26:32', 0, '/index/', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, NULL, 1, 0, -1, '', '', 'Главная', '', '', NULL, NULL, 'inherit', '', 0, 0, 0, NULL, '-1', -1),
(2, 1, 0, 'Страница не найдена (ошибка 404)', 0, NULL, '404', '2016-07-07 04:30:03', '0000-00-00 00:00:00', '2016-07-07 07:30:03', 0, '/404/', 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(55, 1, 17, 'Пододеяльники', 0, NULL, 'pododeyalniki', '2016-07-09 12:32:32', '2016-07-03 18:31:23', '2016-07-09 15:32:32', 0, '/catalogue/sumki-lnyanye/pododeyalniki/', 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(56, 1, 18, 'Комплекты', 0, NULL, 'komplekty', '2016-07-09 12:32:32', '2016-07-03 18:31:30', '2016-07-09 15:32:32', 0, '/catalogue/interernye-igrushki/komplekty/', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(57, 1, 18, 'Простыни', 0, NULL, 'prostyni', '2016-07-09 12:32:32', '2016-07-03 18:31:37', '2016-07-09 15:32:32', 0, '/catalogue/interernye-igrushki/prostyni/', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(58, 1, 18, 'Наволочки', 0, NULL, 'navolochki', '2016-07-09 12:32:32', '2016-07-03 18:31:44', '2016-07-09 15:32:32', 0, '/catalogue/interernye-igrushki/navolochki/', 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(59, 1, 18, 'Пододеяльники', 0, NULL, 'pododeyalniki', '2016-07-09 12:32:32', '2016-07-03 18:31:50', '2016-07-09 15:32:32', 0, '/catalogue/interernye-igrushki/pododeyalniki/', 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(60, 1, 19, 'Игрушки', 0, NULL, 'igrushki', '2016-07-09 12:32:32', '2016-07-03 18:31:58', '2016-07-09 15:32:32', 0, '/catalogue/la-provence-handmade/igrushki/', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', '', 0, 0, 0, NULL, '-1', -1),
(61, 1, 19, 'Простыни', 0, NULL, 'prostyni', '2016-07-09 12:32:32', '2016-07-03 18:32:04', '2016-07-09 15:32:32', 0, '/catalogue/la-provence-handmade/prostyni/', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(62, 1, 19, 'Наволочки', 0, NULL, 'navolochki', '2016-07-09 12:32:32', '2016-07-03 18:32:10', '2016-07-09 15:32:32', 0, '/catalogue/la-provence-handmade/navolochki/', 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1),
(63, 1, 19, 'Пододеяльники', 0, NULL, 'pododeyalniki', '2016-07-09 12:32:32', '2016-07-03 18:32:16', '2016-07-09 15:32:32', 0, '/catalogue/la-provence-handmade/pododeyalniki/', 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, '', 1, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'inherit', NULL, 0, 0, 0, NULL, '-1', -1);

-- --------------------------------------------------------

--
-- Структура таблицы `Sub_Class`
--

CREATE TABLE IF NOT EXISTS `Sub_Class` (
  `Sub_Class_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Subdivision_ID` int(11) NOT NULL DEFAULT '0',
  `Class_ID` int(11) NOT NULL DEFAULT '0',
  `Sub_Class_Name` varchar(255) NOT NULL DEFAULT '',
  `Priority` int(11) NOT NULL DEFAULT '0',
  `Read_Access_ID` int(11) NOT NULL DEFAULT '0',
  `Write_Access_ID` int(11) NOT NULL DEFAULT '0',
  `EnglishName` varchar(64) DEFAULT NULL,
  `Checked` smallint(6) NOT NULL DEFAULT '0',
  `Catalogue_ID` int(11) NOT NULL DEFAULT '0',
  `Edit_Access_ID` int(11) NOT NULL DEFAULT '0',
  `Checked_Access_ID` int(11) NOT NULL DEFAULT '0',
  `Delete_Access_ID` int(11) NOT NULL DEFAULT '0',
  `Subscribe_Access_ID` int(11) NOT NULL DEFAULT '0',
  `Moderation_ID` int(11) NOT NULL DEFAULT '0',
  `DaysToHold` int(11) DEFAULT NULL,
  `AllowTags` int(11) NOT NULL DEFAULT '-1',
  `RecordsPerPage` int(11) DEFAULT NULL,
  `SortBy` varchar(255) NOT NULL DEFAULT '',
  `Created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DefaultAction` enum('index','add','search','subscribe') NOT NULL DEFAULT 'index',
  `NL2BR` tinyint(4) NOT NULL DEFAULT '-1',
  `UseCaptcha` tinyint(4) NOT NULL DEFAULT '-1',
  `CustomSettings` text,
  `Class_Template_ID` int(10) unsigned NOT NULL DEFAULT '0',
  `isNaked` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `AllowRSS` tinyint(4) DEFAULT '0',
  `AllowXML` tinyint(4) DEFAULT '0',
  `SrcMirror` int(11) NOT NULL DEFAULT '0',
  `Edit_Class_Template` int(11) NOT NULL,
  `Admin_Class_Template` int(11) NOT NULL DEFAULT '0',
  `TableViewMode` tinyint(1) NOT NULL DEFAULT '0',
  `Cache_Access_ID` int(11) unsigned NOT NULL DEFAULT '0',
  `Cache_Lifetime` int(11) unsigned NOT NULL DEFAULT '0',
  `CacheForUser` tinyint(4) NOT NULL DEFAULT '-1',
  `Comment_Rule_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Sub_Class_ID`),
  UNIQUE KEY `EnglishName` (`Subdivision_ID`,`EnglishName`),
  KEY `Class_ID` (`Class_ID`),
  KEY `Checked` (`Checked`),
  KEY `Catalogue_ID` (`Catalogue_ID`),
  KEY `Class_Template_ID` (`Class_Template_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- Дамп данных таблицы `Sub_Class`
--

INSERT INTO `Sub_Class` (`Sub_Class_ID`, `Subdivision_ID`, `Class_ID`, `Sub_Class_Name`, `Priority`, `Read_Access_ID`, `Write_Access_ID`, `EnglishName`, `Checked`, `Catalogue_ID`, `Edit_Access_ID`, `Checked_Access_ID`, `Delete_Access_ID`, `Subscribe_Access_ID`, `Moderation_ID`, `DaysToHold`, `AllowTags`, `RecordsPerPage`, `SortBy`, `Created`, `LastUpdated`, `DefaultAction`, `NL2BR`, `UseCaptcha`, `CustomSettings`, `Class_Template_ID`, `isNaked`, `AllowRSS`, `AllowXML`, `SrcMirror`, `Edit_Class_Template`, `Admin_Class_Template`, `TableViewMode`, `Cache_Access_ID`, `Cache_Lifetime`, `CacheForUser`, `Comment_Rule_ID`) VALUES
(27, 15, 8, 'Лен для детей', 0, 0, 0, 'len-dlya-detey', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-07 09:11:14', '2016-07-07 06:11:14', 'index', -1, -1, '', 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(26, 14, 8, 'Банные принадлежности', 0, 0, 0, 'bannye-prinadlezhnosti', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-07 09:11:02', '2016-07-07 06:11:02', 'index', -1, -1, '', 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(25, 13, 8, 'Полотенца махровые', 0, 0, 0, 'polotentsa-mahrovye', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-07 09:10:48', '2016-07-07 06:10:48', 'index', -1, -1, '', 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(24, 12, 8, 'Столовое белье лен', 0, 0, 0, 'stolovoe-bele-len', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-07 09:10:27', '2016-07-07 06:10:27', 'index', -1, -1, '', 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(22, 10, 8, 'Постельное белье сатин', 0, 0, 0, 'postelnoe-bele-satin', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-07 09:10:02', '2016-07-07 06:10:02', 'index', -1, -1, '', 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(23, 11, 8, 'Покрывала, пледы лен', 0, 0, 0, 'pokryvala-pledy-len', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-07 09:10:16', '2016-07-07 06:10:16', 'index', -1, -1, '', 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(18, 72, 24, 'Заказы', 0, 0, 0, 'zakazy', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-05 18:43:32', '2016-07-05 15:43:32', 'index', -1, -1, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(17, 71, 8, 'Поиск', 0, 0, 0, 'search', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-05 18:25:58', '2016-07-05 15:27:14', 'index', -1, -1, '', 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(16, 1, 8, 'Главная', 3, 0, 0, 'index-3', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-04 21:50:16', '2016-07-04 18:50:16', 'index', -1, -1, '', 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(15, 1, 8, 'Главная', 2, 0, 0, 'index-2', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-04 21:49:37', '2016-07-04 18:50:06', 'index', -1, -1, '', 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(14, 6, 17, 'Новости', 0, 0, 0, 'news', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-04 21:06:37', '2016-07-04 18:06:37', 'index', -1, -1, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(13, 7, 8, 'Скидки', 0, 0, 0, 'sales', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-04 20:37:46', '2016-07-04 17:37:46', 'index', -1, -1, '', 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(12, 23, 8, 'Пододеяльники', 0, 0, 0, 'pododeyalniki', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-04 20:31:55', '2016-07-04 17:31:55', 'index', -1, -1, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(11, 22, 8, 'Наволочки', 0, 0, 0, 'navolochki', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-04 20:31:45', '2016-07-04 17:31:45', 'index', -1, -1, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(10, 21, 8, 'Простыни', 0, 0, 0, 'prostyni', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-04 20:31:25', '2016-07-04 17:31:25', 'index', -1, -1, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(9, 9, 8, 'Постельное белье лен', 0, 0, 0, 'postelnoe-bele-len', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-04 20:31:04', '2016-07-04 17:31:04', 'index', -1, -1, '', 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(8, 3, 8, 'Каталог', 0, 0, 0, 'catalogue', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-04 20:22:45', '2016-07-07 09:22:48', 'index', -1, -1, '', 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(7, 25, 8, 'Простыни', 0, 0, 0, 'prostyni', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-04 20:00:21', '2016-07-04 17:00:21', 'index', -1, -1, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(6, 20, 8, 'Комплекты', 0, 0, 0, 'komplekty', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-04 19:21:43', '2016-07-07 04:05:10', 'index', -1, -1, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(5, 8, 11, 'Контакты', 0, 0, 0, 'contacts', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-04 07:30:24', '2016-07-04 04:30:24', 'index', -1, -1, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(4, 5, 4, 'Доставка / Оплата', 0, 0, 0, 'dostavka-oplata', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-04 07:19:07', '2016-07-04 04:19:07', 'index', -1, -1, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(3, 4, 4, 'О льне', 0, 0, 0, 'o-lne', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-04 07:08:15', '2016-07-04 04:08:15', 'index', -1, -1, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(2, 1, 4, 'Статья', 4, 0, 0, 'index-1', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-03 17:50:18', '2016-07-03 14:58:21', 'index', -1, -1, '', 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(19, 1, 26, 'Баннер', 1, 0, 0, 'index', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-07 07:09:56', '2016-07-07 04:10:07', 'index', -1, -1, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(28, 16, 8, 'Интерьерный декор', 0, 0, 0, 'interernyy-dekor', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-07 09:11:25', '2016-07-07 06:11:25', 'index', -1, -1, '', 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(29, 17, 8, 'Сумки льняные', 0, 0, 0, 'sumki-lnyanye', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-07 09:11:40', '2016-07-07 06:11:40', 'index', -1, -1, '', 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(30, 18, 8, 'Интерьерные игрушки', 0, 0, 0, 'interernye-igrushki', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-07 09:11:53', '2016-07-07 06:11:53', 'index', -1, -1, '', 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(31, 19, 8, 'La Provence handmade', 0, 0, 0, 'la-provence-handmade', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-07 09:12:07', '2016-07-07 06:12:07', 'index', -1, -1, '', 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(32, 26, 8, 'Наволочки', 0, 0, 0, 'navolochki', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-07 09:13:53', '2016-07-07 06:13:53', 'index', -1, -1, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(33, 32, 1, 'Комплекты столовые', 0, 0, 0, 'komplekty-stolovye', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-07 12:32:48', '2016-07-07 09:32:48', 'index', -1, -1, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(34, 32, 8, 'Комплекты столовые', 1, 0, 0, 'komplekty-stolovye-1', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-07 12:35:45', '2016-07-07 09:35:45', 'index', -1, -1, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0),
(35, 60, 8, 'Игрушки', 0, 0, 0, 'igrushki', 1, 1, 0, 0, 0, 0, 0, NULL, -1, NULL, '', '2016-07-07 12:39:42', '2016-07-07 09:39:42', 'index', -1, -1, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `SystemMessage`
--

CREATE TABLE IF NOT EXISTS `SystemMessage` (
  `SystemMessage_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Description` varchar(255) NOT NULL DEFAULT '',
  `Checked` tinyint(4) NOT NULL DEFAULT '0',
  `Message` text NOT NULL,
  PRIMARY KEY (`SystemMessage_ID`),
  KEY `Checked` (`Checked`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `System_Table`
--

CREATE TABLE IF NOT EXISTS `System_Table` (
  `System_Table_ID` int(11) NOT NULL AUTO_INCREMENT,
  `System_Table_Name` char(32) NOT NULL DEFAULT '',
  `System_Table_Rus_Name` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`System_Table_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `System_Table`
--

INSERT INTO `System_Table` (`System_Table_ID`, `System_Table_Name`, `System_Table_Rus_Name`) VALUES
(1, 'Catalogue', 'TOOLS_SYSTABLE_SITES'),
(2, 'Subdivision', 'TOOLS_SYSTABLE_SECTIONS'),
(3, 'User', 'TOOLS_SYSTABLE_USERS'),
(4, 'Template', 'TOOLS_SYSTABLE_TEMPLATE');

-- --------------------------------------------------------

--
-- Структура таблицы `Template`
--

CREATE TABLE IF NOT EXISTS `Template` (
  `Template_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Keyword` varchar(64) NOT NULL DEFAULT '',
  `Description` varchar(64) NOT NULL DEFAULT '',
  `Parent_Template_ID` int(11) NOT NULL DEFAULT '0',
  `Settings` text NOT NULL,
  `CustomSettings` text,
  `Header` text NOT NULL,
  `Footer` text NOT NULL,
  `File_Mode` tinyint(1) NOT NULL DEFAULT '0',
  `File_Path` varchar(255) DEFAULT NULL,
  `File_Hash` char(32) NOT NULL DEFAULT '',
  `Priority` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Template_ID`),
  KEY `Keyword` (`Keyword`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 PACK_KEYS=0 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `Template`
--

INSERT INTO `Template` (`Template_ID`, `Keyword`, `Description`, `Parent_Template_ID`, `Settings`, `CustomSettings`, `Header`, `Footer`, `File_Mode`, `File_Path`, `File_Hash`, `Priority`) VALUES
(1, '__system_edit_objects', 'Системный: редактирование объектов', 0, '', '', '', '', 1, '/__system_edit_objects/', 'c828977934f318ef0abfcf1f75ec2bff', 0),
(9, '', 'Заказ', 4, '', '', '', '', 1, '/2/4/9/', '1afcc7938d86d51ed042af540fc6de27', 3),
(7, '', 'Корзина', 4, '', '', '', '', 1, '/2/4/7/', '24c8726a041380e83c9bb61f1cc3cae7', 2),
(6, '', 'Вход', 4, '', '', '', '', 1, '/2/4/6/', 'bb7dbee90b993a38f35d72387f5d21f0', 1),
(5, '', 'Регистрация', 4, '', '', '', '', 1, '/2/4/5/', 'ed4977327596dbe52d0a6a528f33c6fc', 0),
(4, '', 'Внутренняя', 2, '', '', '', '', 1, '/2/4/', '9c694a6bad471e1aa6a1dca76df59977', 1),
(3, '', 'Главная', 2, '', '', '', '', 1, '/2/3/', '0b10277fc326cbb58cdd1e6d5f5a288f', 0),
(2, '', 'LaProvance', 0, '', '', '', '', 1, '/2/', '1ea543cb0bc916158ff4461a7c66bd4d', 1),
(10, '', 'Забыли пароль', 4, '', '', '', '', 1, '/2/4/10/', 'd493b3ef8b72bf6b8cbec305a1b6be52', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `Trash_Data`
--

CREATE TABLE IF NOT EXISTS `Trash_Data` (
  `Trash_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` int(3) NOT NULL,
  `Message_ID` int(11) NOT NULL,
  `Class_ID` int(11) NOT NULL,
  `Subdivision_ID` int(11) NOT NULL,
  `Sub_Class_ID` int(11) NOT NULL,
  `System_Table_ID` int(3) NOT NULL,
  `Created` datetime NOT NULL,
  `XML_Filename` char(255) DEFAULT NULL,
  `XML_Filesize` int(10) NOT NULL,
  `IP` char(15) DEFAULT NULL,
  `UserAgent` char(255) DEFAULT NULL,
  `User_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Trash_ID`),
  KEY `User_ID` (`User_ID`),
  KEY `Message_ID` (`Message_ID`),
  KEY `Class_ID` (`Class_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `User`
--

CREATE TABLE IF NOT EXISTS `User` (
  `User_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Password` varchar(45) NOT NULL DEFAULT '',
  `PermissionGroup_ID` int(11) NOT NULL,
  `Checked` tinyint(4) NOT NULL DEFAULT '0',
  `Language` varchar(255) NOT NULL DEFAULT 'Russian',
  `Created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Email` char(255) NOT NULL,
  `Confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `RegistrationCode` varchar(255) NOT NULL DEFAULT '',
  `Keyword` varchar(255) DEFAULT NULL,
  `Catalogue_ID` int(11) NOT NULL DEFAULT '0',
  `InsideAdminAccess` tinyint(4) NOT NULL DEFAULT '0',
  `Auth_Hash` text,
  `UserType` enum('normal','pseudo','vk','fb','twitter','openid') NOT NULL DEFAULT 'normal',
  PRIMARY KEY (`User_ID`),
  KEY `PermissionGroup_ID` (`PermissionGroup_ID`),
  KEY `Checked` (`Checked`),
  KEY `Confirmed` (`Confirmed`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `User`
--

INSERT INTO `User` (`User_ID`, `Password`, `PermissionGroup_ID`, `Checked`, `Language`, `Created`, `LastUpdated`, `Email`, `Confirmed`, `RegistrationCode`, `Keyword`, `Catalogue_ID`, `InsideAdminAccess`, `Auth_Hash`, `UserType`) VALUES
(1, '381a8404abc976add67f5bd68d2aa1b6', 1, 1, 'Russian', '2016-07-09 13:22:34', '2016-07-09 10:22:34', 'valerymelixov@gmail.com', 0, '', '', 0, 1, NULL, 'normal'),
(2, '81dc9bdb52d04dc20036dbd8313ed055', 1, 1, 'Russian', '0000-00-00 00:00:00', '2016-07-09 13:59:30', 'test@test.test', 0, '', NULL, 0, 1, NULL, 'normal');

-- --------------------------------------------------------

--
-- Структура таблицы `User_Group`
--

CREATE TABLE IF NOT EXISTS `User_Group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) NOT NULL,
  `PermissionGroup_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `User_ID` (`User_ID`),
  KEY `PermissionGroup_ID` (`PermissionGroup_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `User_Group`
--

INSERT INTO `User_Group` (`ID`, `User_ID`, `PermissionGroup_ID`) VALUES
(1, 1, 1),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Widget`
--

CREATE TABLE IF NOT EXISTS `Widget` (
  `Widget_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Widget_Class_ID` int(11) NOT NULL DEFAULT '0',
  `Name` varchar(255) NOT NULL,
  `Keyword` varchar(255) NOT NULL,
  `Result` text NOT NULL,
  `User_ID` int(11) NOT NULL DEFAULT '0',
  `LastUser_ID` int(11) NOT NULL DEFAULT '0',
  `Created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LastUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Widget_ID`),
  KEY `Widget_Class_ID` (`Widget_Class_ID`),
  KEY `User_ID` (`User_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `Widget_Class`
--

CREATE TABLE IF NOT EXISTS `Widget_Class` (
  `Widget_Class_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Keyword` varchar(255) NOT NULL,
  `Description` text,
  `Category` text,
  `InDevelop` tinyint(4) NOT NULL DEFAULT '0',
  `Template` text NOT NULL,
  `Settings` text NOT NULL,
  `AddForm` text NOT NULL,
  `EditForm` text NOT NULL,
  `User_ID` int(11) NOT NULL DEFAULT '0',
  `LastUser_ID` int(11) NOT NULL DEFAULT '0',
  `Created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LastUpdated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `WidgetDisallow` tinyint(4) NOT NULL DEFAULT '0',
  `Update` int(11) NOT NULL DEFAULT '0',
  `File_Mode` tinyint(1) NOT NULL DEFAULT '0',
  `File_Path` varchar(255) DEFAULT NULL,
  `AfterSaveAction` text NOT NULL,
  `BeforeSaveAction` text NOT NULL,
  `IsStatic` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Widget_Class_ID`),
  KEY `User_ID` (`User_ID`),
  KEY `LastUser_ID` (`LastUser_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `Widget_Field`
--

CREATE TABLE IF NOT EXISTS `Widget_Field` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Widget_ID` int(11) NOT NULL DEFAULT '0',
  `Field_ID` int(11) NOT NULL DEFAULT '0',
  `Value` text,
  PRIMARY KEY (`ID`),
  KEY `Widget_ID` (`Widget_ID`),
  KEY `Field_ID` (`Field_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `Wysiwyg_Panel`
--

CREATE TABLE IF NOT EXISTS `Wysiwyg_Panel` (
  `Wysiwyg_Panel_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Toolbars` longtext NOT NULL,
  `Editor` enum('ckeditor') NOT NULL DEFAULT 'ckeditor',
  PRIMARY KEY (`Wysiwyg_Panel_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `Wysiwyg_Panel`
--

INSERT INTO `Wysiwyg_Panel` (`Wysiwyg_Panel_ID`, `Name`, `Toolbars`, `Editor`) VALUES
(1, 'Обычная панель редактирования', 'a:15:{s:9:"clipboard";b:1;s:4:"undo";b:1;s:4:"find";b:1;s:9:"selection";b:1;s:5:"forms";b:1;s:11:"basicstyles";b:1;s:7:"cleanup";b:1;s:4:"list";b:1;s:6:"indent";b:1;s:6:"blocks";b:1;s:5:"align";b:1;s:5:"links";b:1;s:6:"insert";b:1;s:6:"styles";b:1;s:6:"colors";b:1;}', 'ckeditor'),
(2, 'Inline панель редактирования', 'a:6:{s:9:"clipboard";b:1;s:4:"undo";b:1;s:11:"basicstyles";b:1;s:5:"align";b:1;s:5:"links";b:1;s:6:"insert";b:1;}', 'ckeditor'),
(3, 'Базовые стили', 'a:4:{s:11:"basicstyles";b:1;s:5:"align";b:1;s:6:"styles";b:1;s:6:"colors";b:1;}', 'ckeditor'),
(4, 'Поиск и замена', 'a:3:{s:9:"clipboard";b:1;s:4:"undo";b:1;s:4:"find";b:1;}', 'ckeditor'),
(5, 'Вставка объектов', 'a:2:{s:5:"links";b:1;s:6:"insert";b:1;}', 'ckeditor');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
