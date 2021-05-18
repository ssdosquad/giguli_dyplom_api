-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 18 2021 г., 08:29
-- Версия сервера: 10.4.14-MariaDB
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lada`
--

-- --------------------------------------------------------

--
-- Структура таблицы `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `email` varchar(120) NOT NULL,
  `login` varchar(60) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `surname` varchar(60) DEFAULT NULL,
  `patronymic` varchar(60) DEFAULT NULL,
  `date_born` varchar(45) NOT NULL,
  `passport_series` int(11) NOT NULL,
  `passport_id` int(11) NOT NULL,
  `passport_issued` varchar(120) NOT NULL,
  `passport_date` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `account`
--

INSERT INTO `account` (`id`, `email`, `login`, `password`, `name`, `surname`, `patronymic`, `date_born`, `passport_series`, `passport_id`, `passport_issued`, `passport_date`) VALUES
(1, 'asd@asd.asd', 'asdf', '$2y$10$J5ulzSmavTK3HHkTvr0r3uLEf1rBaYS7VaBbaqzpuYx2Sl8YgdWAq', 'Данил', 'Ленченков', 'Сергеевич', '26.06.2003', 5317, 831802, 'ОТДЕЛОМ УФМС ПО ОРЕНБУРГСКОЙ ОБЛ', '13.07.2017');

-- --------------------------------------------------------

--
-- Структура таблицы `account_session`
--

CREATE TABLE `account_session` (
  `account_id` int(11) NOT NULL,
  `session_key` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `actions`
--

CREATE TABLE `actions` (
  `id` int(11) NOT NULL,
  `time` varchar(120) NOT NULL,
  `name` text NOT NULL,
  `text` text NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `actions`
--

INSERT INTO `actions` (`id`, `time`, `name`, `text`, `image`) VALUES
(1, '01.01.2021-30.04.2021', 'ОНЛАЙН-ЗАКАЗ LADA', 'Простые шаги для заказа автомобиля онлайн:\r\n\r\n1. Выберите модель и комплектацию автомобиля.\r\n2. Заполните форму заказа.\r\n3. Дождитесь уведомления на указанную электронную почту и подтвердите заказ, перейдя по ссылке из письма.\r\n4. Дождитесь звонка представителя дилерского центра.', 'https://static.lada.ru/files/sd/48200255/uhT81OvzYBA.jpg'),
(2, '01.02.2021-30.04.2021', 'ПРОГРАММА ТРЭЙД-ИН ДЛЯ АВТОМОБИЛЕЙ LADA', 'Программа Трейд-ин – это максимально удобный и быстрый способ обменять подержанный автомобиль на новый. Вам не нужно задумываться о реализации автомобиля, эту задачу на себя возьмут специалисты дилерского центра LADA. Кроме того, участники программы Трейд-ин получают преимущество в виде выгоды на покупку нового автомобиля.\r\n\r\n\r\nПеречень документов покупателя:\r\n\r\n• Паспорт гражданина РФ, владельца автомобиля.\r\n• Оригинал ПТС, подтверждающий срок владения автомобилем (не менее 6 месяцев).\r\n• Оригинал «Свидетельства о регистрации транспортного средства».\r\n• Копия паспорта транспортного средства БУ автомобиля с записью о переходе права собственности покупателю.\r\n• Документ выдан органами ГИБДД о регистрации БУ автомобиля за данным потребителем (КУТС либо справка, либо копия ПТС заверенная оригинальной печатью уполномоченного органа ГИБДД, либо копия ПТС заверенная нотариально).\r\n\r\nПеречень документов, которые должен предоставить Вам дилер:\r\n\r\n• Договор купли-продажи.\r\n• Акт приема-передачи.', 'https://static.lada.ru/files/sd/48200255/1562760867_act_vlx-80_0619.jpg'),
(3, '01.02.2021-30.04.2021', 'LADA BLACK ТОЛЬКО СВЕТЛЫЕ ЭМОЦИИ ОТ ЧЁРНОГО-ЧЁРНОГО', 'ТОЛЬКО СВЕТЛЫЕ ЭМОЦИИ\r\nОТ ЧЁРНОГО-ЧЁРНОГО\r\n\r\nСтиль — то, что отличает каждого. Смелый стиль — то, что отличает избранных. Уникальная комбинация хрома и глянца, энергии чёрного и эмоций цветного — то, чем выделяется новая серия LADA [BLACK].\r\n\r\nВнедорожник, кроссовер, седан или универсал — каждая LADA может раскрыться по-новому.\r\n\r\nКаждая LADA может стать еще харизматичней, выразительней. Достаточно добавить капельку чёрного. И — обязательно! — стильный шильд с обозначением спецсерии, который есть на всех моделях [BLACK].', 'https://static.lada.ru/files/sd/48200255/_UyqoZ_JfX8.jpg'),
(4, '01.04.2021-30.04.2021', 'LADA Finance Максимум: кредит с остаточным платежом', 'LADA Finance Максимум: кредит с остаточным платежом\r\n\r\nПрограмма LADA Finance Максимум - это максимально удобный и быстрый способ приобретения автомобиля LADA уже сейчас. Выбирайте комфортный размер авансового и остаточного платежа для получения наиболее интересных финансовых условий именно для Вас.\r\n\r\nКак это работает:\r\n\r\n• В программе участвует весь модельный ряд LADA. Первоначальный взнос от 10% стоимости автомобиля.\r\n\r\n• Остаточный платёж на последний месяц может составлять 30, 40, 50 или 60%. Определите удобные для Вас условия!\r\n\r\n• Стоимость автомобиля, которая погашается в течение срока кредита (за 36 или 48 месяцев).\r\n\r\n• Кредит предоставляется с условием обязательного страхования автомобиля по КАСКО.\r\n\r\n• По окончании срока кредита Вы можете обменять автомобиль на новый или оставить его себе, погасив остаточный платёж.\r\n\r\n• Также есть возможность пролонгации кредита на сумму остаточного платежа.', 'https://static.lada.ru/files/sd/48200255/%D0%BB%D0%B0%D0%B4%D0%B0_%D1%84%D0%B8%D0%BD%D0%B0%D0%BD%D1%81_%D0%BC%D0%B0%D0%BA%D1%81%D0%B8%D0%BC%D1%83%D0%BC_%D0%B4%D0%B8%D0%B0%D0%BB_1250x540.jpg'),
(5, '01.01.2021-30.04.2021', 'Лизинг автомобилей LADA', 'Программа LADA Leasing – это максимально удобный и быстрый способ приобретения автомобиля для Вашего бизнеса, сохраняя оборотные средства. Вы можете выбрать оптимальный срок лизинга и авансового платежа, получить оперативное решение о финансировании с минимальным возможным пакетом документов. Кроме того, участники программы LADA Leasing могут включить в лизинговые платежи страхование и аксессуары.\r\n\r\nУчастники программы:\r\n• юридические лица;\r\n• индивидуальные предприниматели.\r\n\r\nЛизинговые компании – партнеры программы LADA Leasing:\r\n- АО «ЛК «Европлан»;\r\n- АО «ВТБ лизинг»;\r\n- АО «Сбербанк Лизинг»;\r\n- ООО «Мэйджор Лизинг»;\r\n- ООО «Ресо-Лизинг»;\r\n- ООО «Балтийский лизинг»;\r\n- ООО «КОНТРОЛ лизинг».\r\n- ООО «Совкомбанк Лизинг».\r\n\r\nПодробная информация о программе\r\n\r\n* Предложение ограничено! Подробности акции уточняйте у официальных дилеров LADA.', 'https://static.lada.ru/files/sd/48200255/1562760799_act_glv-40.jpg'),
(6, '15.04.2021-30.04.2021', 'Выгода 10% для всех', 'Расширенные условия программы государственной поддержки\r\n\r\nВыгода 10% для всех\r\n\r\nДо конца апреля Вы можете приобрести автомобиль по доступной цене, суммируя акции по специальным программам автопроизводителя с выгодой 10% по Госпрограмме* на условиях льготного автокредитования по программам LADA Finance и LADA Finance Максимум.\r\n\r\nУсловия программы:\r\n\r\n• Выгода 10% от стоимости автомобиля\r\nLADA\r\n• 2020 или 2021 года выпуска\r\n• Без ограничений по стоимости автомобиля\r\n• Без дополнительных требований к Клиентам', 'https://static.lada.ru/files/sd/48200255/102020_gvt_actions_all.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `cover` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Дамп данных таблицы `article`
--

INSERT INTO `article` (`id`, `title`, `cover`, `text`, `date`) VALUES
(1, 'LADA – лауреат Гран-При «За рулем»', 'https://static.lada.ru/files/sd/48200255/vaz_catalogue_notes-file_-119085-840.jpg', 'Две модели LADA стали призерами престижной автомобильной премии Гран-При «За рулем» - 2021. LADA Granta победила в номинации «Лидер продаж», а в номинации «За верность традициям» LADA получила приз с формулировкой «За возвращение бренда «Нива».\r\n\r\nНапомним, что LADA уже не раз становилась лауреатом премии Гран-при «За рулем». В 2019 году в номинации «За новую энергию» награждены двухтопливные LADA Vesta CNG и LADA Largus CNG, а в категории «Малый класс» одержал победу седан LADA Vesta Cross. В 2018 году LADA Vesta SW Cross получила Гран-при в номинации «Компактные кроссоверы», в 2017 году LADA XRAY стал лучшим в номинации «Малый класс», а седан LADA Vesta удостоился специального приза «Выбор редакции «За рулем». Также наградами Гран-при отмечались LADA Granta (2013) и LADA Kalina (2014).', '2021-04-23 12:00:01'),
(2, 'Старт продаж автомобилей LADA с новой мультимедийной системой EnjoY Pro', 'https://static.lada.ru/files/sd/48200255/vaz_catalogue_notes-file_-118986-840.jpg', 'АВТОВАЗ объявляет о старте продаж автомобилей с мультимедийной системой LADA EnjoY Pro с Яндекс.Авто. Это интеллектуальная мультимедийная система, обеспечивающая функционал современного смартфона, интегрированного в автомобиль, со встроенным Яндекс.Авто и поддержкой проецируемых систем Apple CarPlay и Android Auto. Система отличается высоким быстродействием и возможностью пользоваться привычными сервисами в дороге: Навигатором, Музыкой, Алисой и Заправками. LADA EnjoY Pro с Яндекс.Авто - это 8-дюймовый HD-экран с отзывчивой и яркой матрицей IPS, удовольствие от качественного объемного звука ARKAMYS, а также регулярно обновляемое \'\'по воздуху\'\' программное обеспечение, которое позволяет поддерживать актуальность всех имеющихся функций, добавлять новые и повышать стабильность их работы.\r\n\r\nНа большом экране пользоваться сервисами удобнее и безопаснее. С помощью голосового ассистента Алисы можно включить музыку, построить маршрут или узнать погоду, не отвлекаясь от дороги. Помимо этого, можно синхронизировать систему со своей учётной записью Яндекса. Так водители смогут строить маршруты на телефоне и переносить их на экран Яндекс.Авто.\r\n\r\n\'\'Яндекс участвует в этом проекте с момента создания и тестирования первых прототипов, поэтому мы смогли вместе с коллегами из АВТОВАЗа подобрать \'\'железо\'\' под наши стандарты. Система построена на базе современного процессора и работает под управлением модифицированной нами автомобильной версии Android 9. В итоге получилось решение, сопоставимое со смартфонами по многим параметрам, среди которых плавность работы, скорость отклика и быстродействие\'\', - прокомментировал Михаил Малахов, руководитель лаборатории Яндекс.Авто.\r\n\r\nОдной из наиболее ожидаемых характеристик новой мультимедийной системы является внедрение технологии объемного звука, которое обеспечивает точное и естественное воспроизведение музыки с учетом материалов отделки салона, характеристик динамиков и их расположения в автомобиле. Звук LADA EnjoY Pro был настроен с учетом архитектуры и объема салона каждой модели LADA, в которой он будет использоваться. Уникальные алгоритмы распределения звука в пространстве создают эффект концертного зала. Индивидуальная настройка звуковых частот и звуковой сцены обеспечивают качественное звучание в широком диапазоне.\r\n\r\nНовая мультимедийная система представлена в автомобилях семейства LADA Vesta включая версию Sport, XRAY Cross и XRAY.\r\n\r\nНа моделях семейства Vesta LADA EnjoY Pro c Яндекс.Авто доступна опционально начиная с комплектации Comfort в рамках пакета Winter EnjoY Pro по цене от 856 900 рублей. Для модели XRAY Cross доступна в рамках пакета Prestige, a так же в исполнении Instinct по цене от 973 900 рублей. Для модели XRAY - в комплектации Luxe с пакетом Prestige по цене от 887 900 рублей.\r\n\r\n\'\'Мы рады сообщить о старте продаж автомобилей с новой мультимедийной системой LADA EnjoY Pro - единственной мультимедийной системой со встроенным Яндекс.Авто, технологиями проекции телефона через 8-дюймовый экран и 3D-стереосистемой в России. Это стратегически важный запуск для нас и качественно новый уровень комфорта и безопасности для клиентов LADA. На первом этапе новая мультимедийная система представлена в автомобилях семейства LADA Vesta, XRAY и XRAY Cross. Планируется что в дальнейшем LADA EnjoY появится и в других наших моделях\'\', - сказал Оливье Морне, исполнительный вице-президент по маркетингу и продажам АВТОВАЗ.', '2021-04-12 14:25:43'),
(3, 'LADA: российские продажи в I квартале выросли на 5,4%', 'https://static.lada.ru/files/sd/48200255/vaz_catalogue_notes-file_-118945-840.jpg', 'В марте 2021 года в России продано 33 779 легковых и лёгких коммерческих автомобилей LADA, что на 3% превышает результаты марта 2020 года. Продажи LADA за три месяца 2021 года составили 83 908 автомобилей, что на 5,4% выше, чем за аналогичный период прошлого года.\r\n\r\nТОП-3 моделей по результатам продаж: в марте было продано 12 686 легковых моделей семейства LADA Granta, что на 9,1% выше результатов аналогичного периода прошлого года. Продажи LADA Vesta составили 8 779 автомобилей, на третьем месте – LADA Largus с результатом 3 888 автомобилей (совокупные результаты продаж легковых универсалов и фургонов).\r\n\r\n\'\'Мы удовлетворены результатами первого квартала 2021 года, потому что достигли всех поставленных целей. Мы успешно запустили две наши долгожданные модели: LADA Niva Travel и новый LADA Largus. Обе модели отличаются своей чрезвычайно лояльной аудиторией, и наша основная цель состояла в том, чтобы улучшив их, сохранить все то, за что их ценят, особенно доступную стоимость\'\', - сказал Оливье Морне, исполнительный вице-президент по продажам и маркетингу.', '2021-04-02 14:18:29'),
(4, 'LADA предлагает XRAY в новой комплектации', 'https://static.lada.ru/files/sd/48200255/vaz_catalogue_notes-file_-118905-347.jpg', 'В марте на АВТОВАЗе стартовало производство LADA XRAY в новых версиях, оснащенных обновленной роботизированной трансмиссией АМТ в сочетании с надежным двигателем LADA 1,6 л (106 л.с.). Новые комплектации позволили еще более снизить начальную цену на XRAY с «двумя педалями» - до 805 900 рублей. Для таких версий LADA XRAY предлагается три пакета комфортных опций Comfort, #Club и Luxe/Prestige.\r\n\r\nФункционал механики – удобство автомата\r\n\r\nОбновленная трансмиссия АМТ отличается повышенной надежностью и быстродействием. За счет нового алгоритма переключение передач происходит на 30% быстрее*. Учитывая климатические условия, появился удобный зимний режим, который позволяет стартовать сразу со второй передачи. Владельцы классического «автомата» не заметят разницы, благодаря простоте управления, но при этом расход топлива будет значительно ниже (как у МТ).\r\n\r\nLADA XRAY – компактный, но вместительный, отличается хорошей динамикой, энергоемкой подвеской и высоким дорожным просветов в 195 мм. Комфорт и безопасность обеспечивают климат-контроль, мультимедиа с навигацией и камерой заднего вида, подогрев сидений, датчики дождя и света, а также две фронтальные подушки безопасности, система торможения ABS+BAS, ESC и помощник при старте в гору HSA.\r\n\r\n*по сравнению с предыдущей версией АМТ, предлагавшейся до марта 2021 года в сочетании с двигателем 1,8л', '2021-03-24 12:00:40'),
(5, 'Старт продаж нового LADA Largus', 'https://static.lada.ru/files/sd/48200255/vaz_catalogue_notes-file_-118805-840.jpg', 'LADA объявляет о старте продаж автомобилей семейства Largus, которое включает три модели: пассажирский универсал, Cross-версию и фургон. Новый Largus приобрел узнаваемый фамильный дизайн передней части, новый просторный салон с улучшенной эргономикой, новые комфортные опции, а также новый мотор 1,6 л 90 л.с. Уникальное предложение на рынке пассажирских универсалов, благодаря наличию 7-местной версии для пассажирских модификаций.\r\n\r\nКомфорт на максимум\r\n\r\nLADA Largus получил новую панель приборов, мультируль с обогревом, камеру заднего вида, мультимедиа с навигацией и поддержкой Apple Carplay/Android Auto, улучшенную шумоизоляцию, обогрев ветрового стекла и задних сидений, датчик дождя и света, подлокотник водителя с боксом для хранения, новые передние сиденья с улучшенной формой и новой обивкой, круиз-контроль. LADA Largus - универсальный автомобиль, в котором есть все для ежедневных поездок, дальних путешествий и работы, единственный в своем классе 7-местный универсал (пассажирские версии) с третьим рядом сидений. Базовое оснащение дополнилось новым оборудованием, включающим центральный замок с дистанционным управлением, маршрутный компьютер и дневные ходовые огни.\r\n\r\nНовый двигатель\r\n\r\nНа новом базовом моторе была внедрена обновленная шатунно-поршневая группа, модернизированный коленвал и газораспределительный механизм. В результате мощность повышена до 90 л.с., а 80% крутящего момента доступны уже на 1000 оборотах в минуту, что позволяет снизить расход топлива и снизить частоту переключений. Кроме того, исключена необходимость регулировки клапанов до пробега в 90 000 километров. Для более старших комплектаций по-прежнему доступен двигатель 1.6 л (106 л.с.). Оба двигателя адаптированы для работы на бензине с октановым числом 92.\r\n\r\nЦены и комплектации\r\n\r\nСтартовая стоимость LADA Largus фургон в исполнении Classic – от 685 900 рублей. Стоимость пассажирских версий (5 мест) начинается от 690 900 рублей. Цена на новый Largus с третьим рядом сидений – от 817 900 рублей. Версии Cross так же предлагаются в двух вариантах исполнения (5 и 7 мест) по цене от 865 900 рублей.', '2021-03-02 12:23:19'),
(6, 'EnjoY Pro: мультимедийная система нового поколения от LADA', 'https://static.lada.ru/files/sd/48200255/vaz_catalogue_notes-file_-118885-347.jpg', 'АВТОВАЗ объявляет о создании новой мультимедийной системы LADA EnjoY Pro, разработанной с учетом пожеланий потребителей и современных технологий. Это интеллектуальная мультимедийная система, обеспечивающая полноценный функционал современного смартфона, интегрированного в автомобиль, с поддержкой Apple CarPlay, Android Auto и полным набором встроенных сервисов от Яндекс.Авто. Система отличается высоким быстродействием и возможностью анализировать предпочтения пользователя, предлагая привычные маршруты движения и музыкальную подборку. LADA EnjoY Pro – это 8-дюймовый HD-экран с отзывчивой и яркой матрицей IPS, удовольствие от качественного объемного звука ARKAMYS, а также регулярно обновляемое программное обеспечение, которое позволяет поддерживать актуальность всех имеющихся функций, добавлять новые и повышать стабильность их работы.\r\n\r\nЭкосистемы\r\n\r\nLADA EnjoY Pro универсальна: она объединила в себе три наиболее востребованные и функциональные системы: Яндекс.Авто, Apple CarPlay и Android Auto. Пользователь может сам выбрать систему, к которой привык, которая отвечает его потребностям. Каждая система имеет свой уникальный набор приложений с музыкой, навигацией и голосовым помощником – LADA EnjoY Pro работает со всеми функциями.\r\n\r\nОбъемный звук\r\n\r\nТехнология объемного звука ARKAMYS обеспечивает точное и естественное воспроизведение музыки с учетом материалов отделки салона, характеристик динамиков и их расположения в автомобиле. Звук LADA EnjoY Pro был настроен с учетом архитектуры и объема салона каждой модели LADA, в которой он будет использоваться. Уникальные алгоритмы распределения звука в пространстве создают эффект концертного зала. Индивидуальная настройка звуковых частот и звуковой сцены обеспечивают качественное звучание в широком диапазоне.\r\n\r\nПолностью интегрированная с автомобилем система\r\n\r\nЗагрузка операционной системы и приложений начинается сразу после того, как пользователь нажимает на брелоке кнопку «открыть дверь». Благодаря этому к моменту посадки в автомобиль и включения зажигания LADA EnjoY Pro уже готова радовать музыкой и прокладывать маршрут без длительного ожидания. Кроме того, система завершает работу не с момента отключения зажигания, а только с открытием двери водителя, что, например, дает возможность дослушать любимую музыку или закончить телефонный разговор уже после остановки двигателя автомобиля.\r\n\r\nБезопасность\r\n\r\nУправление всеми функциями системы можно осуществлять, не отвлекаясь от дороги. Ответить на звонок, переключить трек, отрегулировать громкость, поменять источник музыки можно как с помощью кнопок на руле, так и с помощью умного голосового помощника. Камера заднего вида с динамическими парковочными линиями позволяет уверенно и безопасно маневрировать задним ходом, а сигналы предупреждения своевременно оповестят о ситуациях, когда маневрирование небезопасно – например, когда открыт багажник или скорость при движении задним ходом слишком высока.\r\n\r\n«Мы всегда уделяем большое внимание техническому оснащению автомобилей LADA, постоянно улучшая и расширяя их функционал в соответствии с запросами потребителей и последними тенденциями рынка. Сегодня мы рады объявить о создании EnjoY Pro, с появлением которой LADA становится единственным автопроизводителем в России, представляющим мультимедийную систему со встроенными сервисами Яндекс, технологиями проекции телефона через 8-дюймовый экран и c 3D-стереосистемой. EnjoY Pro – это высокотехнологическое и глубоко интегрированное решение, которое обеспечивает качественно новый уровень взаимодействия водителя и автомобиля», - сказал Оливье Морне, исполнительный вице-президент по маркетингу и продажам АО «АВТОВАЗ».\r\n\r\nПеречень моделей с EnjoY Pro и даты старта продаж будут объявлены позднее.', '2021-03-01 10:34:16');

-- --------------------------------------------------------

--
-- Структура таблицы `boo_car`
--

CREATE TABLE `boo_car` (
  `id` int(11) NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `car_model_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `mileage` int(11) NOT NULL,
  `engine_volume` double NOT NULL,
  `engine_power` double NOT NULL,
  `doors_number` int(11) NOT NULL,
  `car_body_id` int(11) NOT NULL,
  `trunk_volume` double NOT NULL,
  `clearance` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `tank_volume` double NOT NULL,
  `height` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `length` int(11) NOT NULL,
  `functions` text NOT NULL,
  `image` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `boo_car`
--

INSERT INTO `boo_car` (`id`, `manufacturer`, `car_model_id`, `year`, `mileage`, `engine_volume`, `engine_power`, `doors_number`, `car_body_id`, `trunk_volume`, `clearance`, `weight`, `tank_volume`, `height`, `width`, `length`, `functions`, `image`) VALUES
(1, 'KIA', 3, 2018, 13050, 1.6, 96, 4, 1, 235, 140, 105, 50, 1500, 1700, 3905, 'Отсутствуют', 'http://pngimg.com/uploads/kia/kia_PNG29.png'),
(2, 'KIA', 4, 2013, 19250, 1.6, 96, 4, 1, 235, 140, 105, 50, 1500, 1700, 3905, 'Отсутствуют', 'http://pngimg.com/uploads/kia/kia_PNG55.png');

-- --------------------------------------------------------

--
-- Структура таблицы `car`
--

CREATE TABLE `car` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `manufacturer` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `win` varchar(60) NOT NULL,
  `engine` varchar(60) NOT NULL,
  `date_plan_to` datetime NOT NULL DEFAULT current_timestamp(),
  `date_change_oil` datetime NOT NULL DEFAULT current_timestamp(),
  `date_end_guarantee` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `car`
--

INSERT INTO `car` (`id`, `account_id`, `manufacturer`, `model`, `win`, `engine`, `date_plan_to`, `date_change_oil`, `date_end_guarantee`) VALUES
(1, 1, 'Lada', 'Granta', '86891268912646218', '879847532788948', '2021-04-29 12:35:06', '2021-04-29 12:35:06', '2021-04-29 12:35:06');

-- --------------------------------------------------------

--
-- Структура таблицы `car_body`
--

CREATE TABLE `car_body` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `title` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `car_body`
--

INSERT INTO `car_body` (`id`, `name`, `title`) VALUES
(1, 'sedan', 'Седан');

-- --------------------------------------------------------

--
-- Структура таблицы `car_model`
--

CREATE TABLE `car_model` (
  `id` int(11) NOT NULL,
  `title` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `car_model`
--

INSERT INTO `car_model` (`id`, `title`) VALUES
(1, 'Granta'),
(2, 'Largus'),
(3, 'Ceed'),
(4, 'Rio');

-- --------------------------------------------------------

--
-- Структура таблицы `catalog_car`
--

CREATE TABLE `catalog_car` (
  `id` int(11) NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `car_model_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `engine_volume` double NOT NULL,
  `engine_power` double NOT NULL,
  `doors_number` int(11) NOT NULL,
  `car_body_id` int(11) NOT NULL,
  `trunk_volume` double NOT NULL,
  `clearance` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `tank_volume` double NOT NULL,
  `height` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `length` int(11) NOT NULL,
  `functions` text NOT NULL,
  `image` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `catalog_car`
--

INSERT INTO `catalog_car` (`id`, `manufacturer`, `car_model_id`, `year`, `engine_volume`, `engine_power`, `doors_number`, `car_body_id`, `trunk_volume`, `clearance`, `weight`, `tank_volume`, `height`, `width`, `length`, `functions`, `image`) VALUES
(1, 'LADA', 1, 2016, 1.6, 96, 4, 1, 235, 140, 105, 50, 1500, 1700, 3905, 'Отсутствуют', 'https://pngimg.com/uploads/lada/lada_PNG84.png'),
(2, 'LADA', 2, 2020, 1.6, 96, 4, 1, 335, 140, 125, 80, 1500, 1700, 3905, 'Отсутствуют', 'http://pngimg.com/uploads/lada/lada_PNG126.png');

-- --------------------------------------------------------

--
-- Структура таблицы `master`
--

CREATE TABLE `master` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `surname` varchar(60) NOT NULL,
  `patronymic` varchar(60) NOT NULL,
  `position` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `master`
--

INSERT INTO `master` (`id`, `name`, `surname`, `patronymic`, `position`) VALUES
(1, 'Данил', 'Ленченков', 'Сергеевич', 'Старший механник');

-- --------------------------------------------------------

--
-- Структура таблицы `work`
--

CREATE TABLE `work` (
  `id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `type` enum('to','repair') NOT NULL DEFAULT 'to',
  `recomendation` varchar(200) NOT NULL,
  `mileage` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `work`
--

INSERT INTO `work` (`id`, `car_id`, `type`, `recomendation`, `mileage`, `date`, `price`) VALUES
(1, 1, 'repair', 'Никогда не заводите эту красотку, пока она не завела Вас :)', 0, '2021-04-30 09:11:47', 1),
(2, 1, 'to', 'Выключи телевизор, насри в холодильник', 10000, '2021-04-30 09:11:47', 123000);

-- --------------------------------------------------------

--
-- Структура таблицы `work_act`
--

CREATE TABLE `work_act` (
  `work_id` int(11) NOT NULL,
  `text` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `work_act`
--

INSERT INTO `work_act` (`work_id`, `text`) VALUES
(1, 'Завели'),
(1, 'Выкинули'),
(2, 'Выпили пиво'),
(2, 'Включили телевизор');

-- --------------------------------------------------------

--
-- Структура таблицы `work_master`
--

CREATE TABLE `work_master` (
  `work_id` int(11) NOT NULL,
  `master_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `work_master`
--

INSERT INTO `work_master` (`work_id`, `master_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `work_request`
--

CREATE TABLE `work_request` (
  `id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `type` enum('to','repair') NOT NULL,
  `text` text NOT NULL,
  `date` varchar(45) NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `work_request`
--

INSERT INTO `work_request` (`id`, `car_id`, `type`, `text`, `date`) VALUES
(1, 1, 'repair', 'adasda', '20.01.2021');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `account_session`
--
ALTER TABLE `account_session`
  ADD KEY `account_id` (`account_id`);

--
-- Индексы таблицы `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `boo_car`
--
ALTER TABLE `boo_car`
  ADD PRIMARY KEY (`id`),
  ADD KEY `car_body_id` (`car_body_id`),
  ADD KEY `car_model_id` (`car_model_id`);

--
-- Индексы таблицы `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`);

--
-- Индексы таблицы `car_body`
--
ALTER TABLE `car_body`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `car_model`
--
ALTER TABLE `car_model`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `catalog_car`
--
ALTER TABLE `catalog_car`
  ADD PRIMARY KEY (`id`),
  ADD KEY `car_body_id` (`car_body_id`),
  ADD KEY `car_model_id` (`car_model_id`);

--
-- Индексы таблицы `master`
--
ALTER TABLE `master`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `work`
--
ALTER TABLE `work`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FOREGIN_KEY` (`car_id`);

--
-- Индексы таблицы `work_act`
--
ALTER TABLE `work_act`
  ADD KEY `work_id` (`work_id`);

--
-- Индексы таблицы `work_master`
--
ALTER TABLE `work_master`
  ADD KEY `master_id` (`master_id`),
  ADD KEY `work_id` (`work_id`);

--
-- Индексы таблицы `work_request`
--
ALTER TABLE `work_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `car_id` (`car_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `actions`
--
ALTER TABLE `actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `boo_car`
--
ALTER TABLE `boo_car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `car`
--
ALTER TABLE `car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `car_body`
--
ALTER TABLE `car_body`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `car_model`
--
ALTER TABLE `car_model`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `catalog_car`
--
ALTER TABLE `catalog_car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `master`
--
ALTER TABLE `master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `work`
--
ALTER TABLE `work`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `work_request`
--
ALTER TABLE `work_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `account_session`
--
ALTER TABLE `account_session`
  ADD CONSTRAINT `account_session_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);

--
-- Ограничения внешнего ключа таблицы `boo_car`
--
ALTER TABLE `boo_car`
  ADD CONSTRAINT `boo_car_ibfk_1` FOREIGN KEY (`car_body_id`) REFERENCES `car_body` (`id`),
  ADD CONSTRAINT `boo_car_ibfk_2` FOREIGN KEY (`car_model_id`) REFERENCES `car_model` (`id`);

--
-- Ограничения внешнего ключа таблицы `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);

--
-- Ограничения внешнего ключа таблицы `catalog_car`
--
ALTER TABLE `catalog_car`
  ADD CONSTRAINT `catalog_car_ibfk_1` FOREIGN KEY (`car_body_id`) REFERENCES `car_body` (`id`),
  ADD CONSTRAINT `catalog_car_ibfk_2` FOREIGN KEY (`car_model_id`) REFERENCES `car_model` (`id`);

--
-- Ограничения внешнего ключа таблицы `work`
--
ALTER TABLE `work`
  ADD CONSTRAINT `work_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `car` (`id`);

--
-- Ограничения внешнего ключа таблицы `work_act`
--
ALTER TABLE `work_act`
  ADD CONSTRAINT `work_act_ibfk_1` FOREIGN KEY (`work_id`) REFERENCES `work` (`id`);

--
-- Ограничения внешнего ключа таблицы `work_master`
--
ALTER TABLE `work_master`
  ADD CONSTRAINT `work_master_ibfk_1` FOREIGN KEY (`master_id`) REFERENCES `master` (`id`),
  ADD CONSTRAINT `work_master_ibfk_2` FOREIGN KEY (`work_id`) REFERENCES `work` (`id`);

--
-- Ограничения внешнего ключа таблицы `work_request`
--
ALTER TABLE `work_request`
  ADD CONSTRAINT `work_request_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `car` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
