-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 24 Lis 2021, 23:01
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
-- Baza danych: `szpital`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pacjenci`
--

CREATE TABLE `pacjenci` (
  `id` int(11) NOT NULL,
  `pesel` int(11) NOT NULL,
  `imie` varchar(30) NOT NULL,
  `nazwisko` varchar(30) NOT NULL,
  `data_urodzenia` date NOT NULL,
  `lek_prow` varchar(30) NOT NULL,
  `ubezpieczenie` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `pacjenci`
--

INSERT INTO `pacjenci` (`id`, `pesel`, `imie`, `nazwisko`, `data_urodzenia`, `lek_prow`, `ubezpieczenie`) VALUES
(1, 123, 'Patryk', 'Supiński', '2019-09-03', 'Jakub Burski', '2021-11-17'),
(2, 799823, 'Bogdan', 'Supiński', '2021-09-30', 'Artur Żmijewski', '2021-11-02'),
(3, 7897223, 'Tomasz', 'Supiński', '2021-11-12', 'Gregory House', '2021-11-03'),
(6, 78978, 'Antoni', 'Macierewicz', '2021-10-26', 'Artur Żmijewski', '2021-11-03'),
(7, 432432432, 'Kacper', 'Antoniak', '2021-11-18', 'Artur Żmijewski', '2021-11-26');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `id` int(11) NOT NULL,
  `login` varchar(30) NOT NULL,
  `haslo` varchar(30) NOT NULL,
  `imie` varchar(20) DEFAULT NULL,
  `nazwisko` varchar(30) DEFAULT NULL,
  `typ_prac` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`id`, `login`, `haslo`, `imie`, `nazwisko`, `typ_prac`) VALUES
(1, 'jkowalski', 'qwerty', 'Jan', 'Kowalski', 'rejestrator'),
(2, 'jburski', 'qwerty', 'Jakub', 'Burski', 'lekarz'),
(3, 'omateusz', 'qwerty', 'Ojciec', 'Mateusz', 'lekarz'),
(4, 'azmijewski', 'qwerty', 'Artur', 'Żmijewski', 'lekarz'),
(5, 'ghouse', 'qwerty', 'Gregory', 'House', 'lekarz');

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
  `do` varchar(30) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `wiadomosci`
--

INSERT INTO `wiadomosci` (`id_wiadomosci`, `temat`, `tresc`, `od`, `do`, `status`) VALUES
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
(18, 'erertre', 'trtreterre', 'omateusz', 'jkowalski', 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `pacjenci`
--
ALTER TABLE `pacjenci`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `pacjenci`
--
ALTER TABLE `pacjenci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `rozpoznanie`
--
ALTER TABLE `rozpoznanie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT dla tabeli `wiadomosci`
--
ALTER TABLE `wiadomosci`
  MODIFY `id_wiadomosci` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
