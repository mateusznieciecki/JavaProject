-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 30 Sty 2022, 11:09
-- Wersja serwera: 10.4.21-MariaDB
-- Wersja PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `java_szpital`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `historia_chorob`
--

CREATE TABLE `historia_chorob` (
  `id_choroby` int(11) NOT NULL,
  `pesel` bigint(11) NOT NULL,
  `icd` text NOT NULL,
  `opis_slowny` text NOT NULL,
  `data_badania` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `historia_chorob`
--

INSERT INTO `historia_chorob` (`id_choroby`, `pesel`, `icd`, `opis_slowny`, `data_badania`) VALUES
(2, 799823, 'B01 Ospa wietrzna', 'Pacjent zachorował na ospę wietrzną. Bardzo poważnie. Sporo krost i czuje się dosyć słabo.', '2021-11-29'),
(3, 799823, 'F14 Zaburzenia psychiczne i zaburzenia zachowania spowodowane używaniem kokainy (ostre zatrucie)', 'Pacjent odczuwa dosyć spore zaburzenia psychiczne. Zaleca się nadzór domowy a w razie konieczności wizytę w Choroszczy,', '2021-11-29'),
(4, 799823, 'A84 Wirusowe zapalenie mózgu wywołane przez wirusy przenoszone przez kleszcze', 'Pacjent dostał niezwykle silnego wirusowego zapalenia. Bardzo go boli.', '2021-11-29'),
(5, 799823, 'G10 Pląsawica Huntingtona', 'Pacjent notorycznie choruje na pląsawice. Strasznie chce mu się tańczyć.', '2021-11-29'),
(6, 799823, 'F20 Schizofrenia', 'Pacjent dostał schizofrenii i nie uważa się już za Bogdana Supińskiego. Ciężka sprawa.', '2021-11-29'),
(7, 799823, 'F14 Zaburzenia psychiczne i zaburzenia zachowania spowodowane używaniem kokainy (ostre zatrucie)', 'Pacjent zażył zbyt dużo kokainy.', '2021-11-29'),
(8, 78978, 'T5404 Ciężki ostry zespół oddechowy COVID-19', 'Typowa choroba w tych czasach.', '2021-11-29'),
(9, 78943543, 'G03 Zapalenie opon mózgowo-rdzeniowych wywołane przez inne i nieokreślone czynniki', 'Robert bardzo źle się czuje. Naprawdę bardzo źle.', '2021-12-06'),
(10, 799823, 'B01 Ospa wietrzna', 'Pacjent choruje na ospę.', '2021-12-06'),
(11, 2147483647, 'S05 Uraz oka i oczodołu', 'Jest bardzo kiepskim piłkarzem.', '2021-12-15'),
(12, 123, 'F13 Zaburzenia psychiczne i zaburzenia zachowania spowodowane używaniem substancji uspokajających i nasennych', '&#39; /; &#60;&#62; &#39;', '2021-12-18'),
(13, 12345678909, 'A84 Wirusowe zapalenie mózgu wywołane przez wirusy przenoszone przez kleszcze', 'dfdffdfd', '2021-12-19'),
(14, 12345678909, 'A84 Wirusowe zapalenie mózgu wywołane przez wirusy przenoszone przez kleszcze', 'dfdffdfd', '2021-12-19'),
(15, 9876543212, 'B27 Mononukleoza zakaźna', 'ddddd', '2021-12-19'),
(16, 56473829852, 'B01 Ospa wietrzna', 'Paweł zachorował na ospę', '2021-12-19'),
(17, 33334445556, 'T42 Zatrucie lekami przeciwpadaczkowymi, uspokajająco-nasennymi i stosowanymi w chorobie Parkinsona', 'PRzykład', '2021-12-20'),
(18, 98573647283, 'J45 Astma oskrzelowa', 'Pacjent jest bardzo chory', '2022-01-07'),
(19, 98573647283, 'B01 Ospa wietrzna', 'Wszędzie kropki', '2022-01-07'),
(20, 98464272834, 'F20 Schizofrenia', 'Nie do końca wie gdzie jest.', '2022-01-12'),
(21, 123, 'B01 Ospa wietrzna', 'dfdffdfd', '2022-01-18'),
(22, 799823, 'G10 Pląsawica Huntingtona', 'nnidfssdffds', '2022-01-20');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `komentarze`
--

CREATE TABLE `komentarze` (
  `id_komentarza` int(11) NOT NULL,
  `autor_komentarza` text NOT NULL,
  `tresc_komentarza` text NOT NULL,
  `id_wpis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `komentarze`
--

INSERT INTO `komentarze` (`id_komentarza`, `autor_komentarza`, `tresc_komentarza`, `id_wpis`) VALUES
(1, 'Artur Żmijewski', 'Witam, mnie też to spotkało.\r\nCiężka sprawa.', 1),
(3, 'Gregory House', 'U mnie też się to zdarzyło.\r\n\r\nPozdrawiam.', 1),
(7, 'Artur Żmijewski', 'Witam serdecznie, tu lekarz Żmijewski Artur Artur', 1),
(8, 'Artur Żmijewski', 'Witam, ja nie leczę wcale.\r\nPozdrawiam Artur', 2),
(9, 'Ojciec Mateusz', 'Witam pana', 1),
(11, 'Artur Żmijewski', 'Teścik', 3),
(12, 'Jakub Burski', 'Dziękuję za poradę ', 5),
(13, 'Artur Żmijewski', 'Komentarz', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `leki`
--

CREATE TABLE `leki` (
  `id` int(11) NOT NULL,
  `nazwa` text NOT NULL,
  `ilosc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `leki`
--

INSERT INTO `leki` (`id`, `nazwa`, `ilosc`) VALUES
(1, 'relanium', 250),
(2, 'ketonal', 20),
(3, 'penicylina', 2),
(4, 'ibuprofen', 20),
(5, 'apap', 319),
(6, '&#39;', 30),
(7, 'smecta', 90),
(8, 'ffdfd', 30),
(11, 'etopirya', 150);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pacjenci`
--

CREATE TABLE `pacjenci` (
  `id` int(11) NOT NULL,
  `pesel` bigint(11) NOT NULL,
  `imie` varchar(30) NOT NULL,
  `nazwisko` varchar(30) NOT NULL,
  `data_urodzenia` date NOT NULL,
  `lek_prow` varchar(30) NOT NULL,
  `ubezpieczenie` date NOT NULL,
  `stan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `pacjenci`
--

INSERT INTO `pacjenci` (`id`, `pesel`, `imie`, `nazwisko`, `data_urodzenia`, `lek_prow`, `ubezpieczenie`, `stan`) VALUES
(1, 123, 'Patryk', 'Supiński', '2019-09-03', 'Artur Żmijewski', '2021-11-17', ''),
(2, 799823, 'Bogdan', 'Supiński', '2021-09-30', '', '2022-11-10', 'nagly'),
(3, 7897223, 'Tomasz', 'Supiński', '2021-11-12', 'Artur Żmijewski', '2021-11-03', ''),
(6, 78978, 'Antoni', 'Macierewicz', '2021-10-26', 'Artur Żmijewski', '2021-11-03', 'pilny'),
(7, 432432432, 'Kacper', 'Antoniak', '2021-11-18', 'Artur Żmijewski', '2021-11-26', ''),
(8, 2147483647, 'Błażej', 'Augustyn', '1960-08-14', 'Artur Żmijewski', '2021-12-02', 'nagly'),
(9, 78943543, 'Robkucz', 'Robkuczyński', '1998-06-13', 'Gregory House', '2021-12-17', 'pilny'),
(14, 2147483647, 'Mateusz', 'Nieciecki', '2021-12-07', 'Ojciec Mateusz', '0000-00-00', 'pilny'),
(20, 12345678909, '&#62;&#60;?', '&#62;&#60;&#62;?', '2021-12-15', 'brak', '2021-12-21', 'pilny'),
(21, 9876543212, 'Antoni', 'Tramwaj', '2021-12-15', 'brak', '2021-12-15', 'nagly'),
(85, 62839593021, 'Barnaba', 'Pomidor', '2021-11-30', 'Gregory House', '2021-12-28', 'zwykly'),
(87, 98573647283, 'Adam', 'Małysz', '2021-12-02', '', '2021-12-07', 'pilny'),
(90, 98464272834, 'Magdalena', 'Filipek', '2021-11-30', '', '2021-12-15', 'pilny'),
(92, 23456789987, '&#39;&#60;&#62;/--', '--&#39;', '2021-12-15', 'Gregory House', '2021-12-14', 'pilny'),
(93, 56473829852, 'Pablito', 'Sidorowiczo', '2021-12-09', 'Artur Żmijewski', '2021-12-15', 'nagly'),
(94, 98041103994, 'Mateusz', 'Nieciecki', '1998-04-11', 'Ojciec Mateusz', '2021-12-29', 'pilny'),
(95, 33334445556, 'Shaquille', 'O&#39;Neal', '2016-12-06', 'Artur Żmijewski', '2021-12-16', 'pilny'),
(97, 36475890274, 'Maciej', 'Klimowicz', '2021-12-29', 'Artur Żmijewski', '2022-01-25', 'pilny'),
(98, 33949564758, 'dsds', 'nionio', '2022-01-05', 'Artur Żmijewski', '2022-01-06', 'pilny');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `id` int(11) NOT NULL,
  `login` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `haslo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `imie` varchar(20) DEFAULT NULL,
  `nazwisko` varchar(30) DEFAULT NULL,
  `typ_prac` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`id`, `login`, `haslo`, `imie`, `nazwisko`, `typ_prac`) VALUES
(1, 'jkowalski', 'błonnik', 'Jan', 'Kowalski', 'rejestrator'),
(2, 'jburski', 'qwerty', 'Jakub', 'Burski', 'lekarz'),
(3, 'omateusz', 'qwerty', 'Ojciec', 'Mateusz', 'lekarz'),
(4, 'azmijewski', 'qwerty', 'Artur', 'Żmijewski', 'lekarz'),
(5, 'ghouse', 'qwerty', 'Gregory', 'House', 'lekarz'),
(6, 'admin', 'qwerty', 'admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przypomnienia`
--

CREATE TABLE `przypomnienia` (
  `id_przypomnienia` int(11) NOT NULL,
  `data_przypomnienia` date NOT NULL,
  `tresc_przypomnienia` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `przypomnienia`
--

INSERT INTO `przypomnienia` (`id_przypomnienia`, `data_przypomnienia`, `tresc_przypomnienia`) VALUES
(1, '2021-12-15', 'Szachy z Jurkiem'),
(3, '2021-12-15', 'Dentysta o siedemnastej'),
(5, '2021-12-16', 'Oddać projekt profesor Mironowicz'),
(6, '2021-12-15', 'test'),
(7, '2021-12-18', 'Wycieczka do lasu z Antonim'),
(9, '2021-12-20', 'Golf z Grzesiem'),
(10, '2021-12-20', 'Szachy z Antonim'),
(11, '2021-12-22', 'przypomnienie'),
(12, '2021-12-19', 'przypomnienie'),
(13, '2021-12-19', 'przypomenieni2'),
(14, '2021-12-19', 'przypomenieni3'),
(15, '2021-12-19', '&#39;'),
(16, '2021-12-19', 'seima'),
(17, '2021-12-20', 'Nie zapomnieć oddać projektu'),
(18, '2021-12-21', 'Szachy z Jurkiem'),
(20, '2022-01-09', 'Przypomnienie teścik'),
(22, '2022-01-09', 'Przypomnienie teścik2');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rozpoznanie`
--

CREATE TABLE `rozpoznanie` (
  `id` int(11) NOT NULL,
  `icd` varchar(20) DEFAULT NULL,
  `opis` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `rozpoznanie`
--

INSERT INTO `rozpoznanie` (`id`, `icd`, `opis`) VALUES
(1, 'J45', 'Astma oskrzelowa'),
(2, 'A84', 'Wirusowe zapalenie mózgu wywołane przez wirusy przenoszone przez kleszcze'),
(3, 'B01', 'Ospa wietrzna'),
(4, 'B27', 'Mononukleoza zakaźna'),
(5, 'F20', 'Schizofrenia'),
(6, 'F13', 'Zaburzenia psychiczne i zaburzenia zachowania spowodowane używaniem substancji uspokajających i nasennych'),
(7, 'F19', 'Zaburzenia psychiczne i zaburzenia zachowania spowodowane używaniem wielu narkotyków i innych substancji psychoaktywnych (ostre zatrucie)'),
(8, 'F10.4', 'Zaburzenia psychiczne i zaburzenia zachowania spowodowane używaniem alkoholu (zespół abstynencyjny z majaczeniem'),
(9, 'F14', 'Zaburzenia psychiczne i zaburzenia zachowania spowodowane używaniem kokainy (ostre zatrucie)'),
(10, 'G03', 'Zapalenie opon mózgowo-rdzeniowych wywołane przez inne i nieokreślone czynniki'),
(11, 'G04', 'Zapalenie mózgu, rdzenia kręgowego oraz mózgu i rdzenia kręgowego'),
(12, 'G10', 'Pląsawica Huntingtona'),
(13, 'S53', 'Zwichnięcie, skręcenie i naderwanie stawów i więzadeł stawu łokciowego'),
(14, 'S82', 'Złamanie podudzia, łącznie ze stawem skokowym'),
(15, 'S05', 'Uraz oka i oczodołu'),
(16, 'S97', 'Uraz zmiażdżeniowy stawu skokowego i stopy'),
(17, 'T29', 'Oparzenia termiczne i chemiczne'),
(18, 'T42', 'Zatrucie lekami przeciwpadaczkowymi, uspokajająco-nasennymi i stosowanymi w chorobie Parkinsona'),
(19, 'T54', 'Toksyczne skutki działania substancji żrących'),
(20, 'T5404', 'Ciężki ostry zespół oddechowy COVID-19');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wiadomosci`
--

CREATE TABLE `wiadomosci` (
  `id_wiadomosci` int(11) NOT NULL,
  `temat` varchar(50) NOT NULL,
  `tresc` varchar(1000) NOT NULL,
  `od` varchar(30) NOT NULL,
  `do_kogo` varchar(30) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `wiadomosci`
--

INSERT INTO `wiadomosci` (`id_wiadomosci`, `temat`, `tresc`, `od`, `do_kogo`, `status`) VALUES
(1, '', 'Dnia xyz zostanie dodana funkcjonalność taka i owaka', 'admin', 'jkowalski', 1),
(2, '', 'Dnia zyx zostanie dodana funkcjonalność taka i owaka', 'admin', 'jkowalski', 1),
(3, '', 'Wiadomosc taka i owaka', 'jkowalski', 'ghouse', 1),
(5, '', 'Gregory House słaby z ciebie skoczek', 'jkowalski', 'ghouse', 1),
(6, '', 'Witam szefie zarejestruj tego i owego', 'ghouse', 'jkowalski', 1),
(7, '', 'seima artur ctm', 'jkowalski', 'azmijewski', 1),
(8, '', '', 'azmijewski', 'ghouse', 0),
(9, 'Proszę wypisać mojego syna z zajęć', 'Zajęcia z religii', 'azmijewski', 'omateusz', 1),
(10, 'Jednak proszę tego nie robić', 'Żartowałem', 'azmijewski', 'omateusz', 1),
(11, 'Super są te nowe odcinki', '4 sezon', 'omateusz', 'ghouse', 1),
(12, 'Proszę nie brać narkotyków w pracy', 'Narkotyki', 'omateusz', 'jburski', 1),
(13, 'siema byku', 'M jak miłość', 'jkowalski', 'azmijewski', 1),
(14, 'Witam panie Kowalski piszę dłuższą wiadomość żeby ', 'Wiadomość testowa', 'azmijewski', 'jkowalski', 1),
(15, 'Wiadomość testowa', 'Witam serdecznie z tej strony doktor House. Jeżeli pan to czyta proszę wejść pograć w czołgi. Serdecznie pozdrawiam, całuję rączki. G. House.', 'ghouse', 'jkowalski', 1),
(16, 'temacik', 'witaj ojcze jak się masz', 'jkowalski', 'omateusz', 1),
(17, 'fsdfds', 'dfssdffsdfds', 'jkowalski', 'omateusz', 1),
(18, 'erertre', 'trtreterre', 'omateusz', 'jkowalski', 1),
(19, 'Wi', '', 'azmijewski', 'jkowalski', 1),
(20, 'Wiadomość testowa', 'Wiadomość sam do siebie, witam Artur', 'azmijewski', 'azmijewski', 1),
(21, 'Jeszcze jedna wiadomość', 'Wiadomość o krótkiej treści', 'azmijewski', 'azmijewski', 1),
(22, 'Wiadomość teścik', 'Uwaga oto wiadomość', 'azmijewski', 'azmijewski', 1),
(25, '&#39;dsds&#62;&#39;', '&#39;', 'jkowalski', 'omateusz', 1),
(26, 'Shaquille O&#39;Neal', 'To świetny koszykarz', 'jkowalski', 'omateusz', 1),
(27, 'to i tamto', 'typowy teścik', 'omateusz', 'jburski', 1),
(28, 'ten i tamten', 'to i tamto wiaodmość testowa', 'jburski', 'azmijewski', 1),
(29, 'test znowu', 'znowu teścik', 'azmijewski', 'omateusz', 1),
(30, 'testtest', 'test', 'omateusz', 'jburski', 0),
(31, 'testttt', 'tetst', 'omateusz', 'ghouse', 0),
(32, 'wiadomosc', 'testowa', 'azmijewski', 'ghouse', 0),
(33, 'hej', 'siemka', 'jkowalski', 'admin', 1),
(34, 'wiadomosc test', 'teścik&#13;&#10;', 'admin', 'admin', 1),
(35, 'ddssd', 'sddsds', 'jkowalski', 'jkowalski', 1),
(36, 'hkuguikbkjkug', 'fyifiu', 'jkowalski', 'omateusz', 1),
(37, 'Programowanie', 'Programowanie w Javie jest super', 'jkowalski', 'azmijewski', 0),
(38, 'fsfds', 'sdffdsfds', 'jkowalski', 'ghouse', 0),
(39, 'wsrre', 'fsdsdfsdf', 'jkowalski', 'jburski', 0),
(40, '3ds', 'sdfdsfsdf', 'jkowalski', 'omateusz', 0),
(41, '3232', '323232', 'jkowalski', 'jburski', 0),
(42, 'test', 'ttt', 'azmijewski', 'jburski', 0),
(43, 'ddd', 'xxx', 'azmijewski', 'omateusz', 0),
(44, 'fdffd', 'dsdsds', 'azmijewski', 'omateusz', 0),
(45, 'niio', 'bbiuvi', 'azmijewski', 'azmijewski', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wpisy`
--

CREATE TABLE `wpisy` (
  `id_wpisu` int(11) NOT NULL,
  `autor_wpisu` varchar(100) NOT NULL,
  `temat_wpisu` varchar(100) NOT NULL,
  `tresc_wpisu` varchar(1500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `wpisy`
--

INSERT INTO `wpisy` (`id_wpisu`, `autor_wpisu`, `temat_wpisu`, `tresc_wpisu`) VALUES
(1, 'Jakub Burski', 'Ciekawy przypadek zapalenia płuc', 'Dzień dobry.\r\nDzisiaj miałem niezwykle ciekawy przypadek zapalenia płuc. Otóż pacjent miał zapalenie płuc i z nim do mnie przyszedł.'),
(2, 'Artur Żmijewski', 'Zaćma - jak leczycie?', 'Od lat problemy sprawia mi zaćma. Zastanawiam się w jaki sposób państwo sobie z nią radzą.'),
(3, 'Artur Żmijewski', 'Zabawny przypadek pląsawicy - pytanko.', 'Witam, z tej strony Artur.\r\nOstatnio zdarzyła mi się doprawdy dziwaczna sytuacja. Mianowicie...'),
(5, 'Gregory House', 'Borelioza', 'Moi drodzy. Uważajcie na kleszcze.'),
(6, 'Artur Żmijewski', 'Wpis testowy', 'Test wpisowy');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia_lekow`
--

CREATE TABLE `zamowienia_lekow` (
  `id` int(11) NOT NULL,
  `lek` text NOT NULL,
  `ilosc_leku` int(11) NOT NULL,
  `lekarz` text NOT NULL,
  `status_zamowienia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `zamowienia_lekow`
--

INSERT INTO `zamowienia_lekow` (`id`, `lek`, `ilosc_leku`, `lekarz`, `status_zamowienia`) VALUES
(4, 'penicylina', 120, 'Artur Żmijewski', 1),
(5, 'ketonal', 100, 'Artur Żmijewski', 1),
(6, 'penicylina', 100, 'Artur Żmijewski', 1),
(7, 'penicylina', 250, 'Gregory House', 1),
(8, 'penicylina', 80, 'Artur Żmijewski', 1),
(9, 'ibuprofen', 100, 'Artur Żmijewski', 1),
(10, 'ibuprofen', 80, 'Gregory House', 1),
(11, 'ibuprofen', 140, 'Jakub Burski', 1),
(12, 'penicylina', 2000, 'Artur Żmijewski', 0),
(13, 'ketonal', 200, 'Ojciec Mateusz', 1),
(14, 'ibuprofen', 100, 'Artur Żmijewski', 1),
(15, 'ketonal', 66, 'Artur Żmijewski', 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `historia_chorob`
--
ALTER TABLE `historia_chorob`
  ADD PRIMARY KEY (`id_choroby`);

--
-- Indeksy dla tabeli `komentarze`
--
ALTER TABLE `komentarze`
  ADD PRIMARY KEY (`id_komentarza`);

--
-- Indeksy dla tabeli `leki`
--
ALTER TABLE `leki`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pacjenci`
--
ALTER TABLE `pacjenci`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Indeksy dla tabeli `przypomnienia`
--
ALTER TABLE `przypomnienia`
  ADD PRIMARY KEY (`id_przypomnienia`);

--
-- Indeksy dla tabeli `rozpoznanie`
--
ALTER TABLE `rozpoznanie`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `wiadomosci`
--
ALTER TABLE `wiadomosci`
  ADD PRIMARY KEY (`id_wiadomosci`);

--
-- Indeksy dla tabeli `wpisy`
--
ALTER TABLE `wpisy`
  ADD PRIMARY KEY (`id_wpisu`);

--
-- Indeksy dla tabeli `zamowienia_lekow`
--
ALTER TABLE `zamowienia_lekow`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `historia_chorob`
--
ALTER TABLE `historia_chorob`
  MODIFY `id_choroby` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT dla tabeli `komentarze`
--
ALTER TABLE `komentarze`
  MODIFY `id_komentarza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT dla tabeli `leki`
--
ALTER TABLE `leki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT dla tabeli `pacjenci`
--
ALTER TABLE `pacjenci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT dla tabeli `przypomnienia`
--
ALTER TABLE `przypomnienia`
  MODIFY `id_przypomnienia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT dla tabeli `rozpoznanie`
--
ALTER TABLE `rozpoznanie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT dla tabeli `wiadomosci`
--
ALTER TABLE `wiadomosci`
  MODIFY `id_wiadomosci` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT dla tabeli `wpisy`
--
ALTER TABLE `wpisy`
  MODIFY `id_wpisu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `zamowienia_lekow`
--
ALTER TABLE `zamowienia_lekow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
