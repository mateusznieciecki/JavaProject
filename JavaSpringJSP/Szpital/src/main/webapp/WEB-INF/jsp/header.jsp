<!DOCTYPE HTML>
<html lang="pl">

<head>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.Date" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    <%@ page import ="com.example.Szpital.entities.Leki" %>
    <%@ page import ="com.example.Szpital.entities.Komentarze" %>
    <%@ page import ="com.example.Szpital.entities.Wpisy" %>
    <%@ page import ="com.example.Szpital.entities.Pracownicy" %>
    <%@ page import ="com.example.Szpital.entities.Pacjenci" %>
    <%@ page import ="com.example.Szpital.entities.Wiadomosci" %>
    <%@ page import ="com.example.Szpital.entities.HistoriaChorob" %>
    <%@ page import ="com.example.Szpital.entities.Rozpoznanie" %>
    <%@ page import ="com.example.Szpital.entities.Przypomnienia" %>
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <script src="${pageContext.request.contextPath}/js/jquery_min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sweetalert2.all.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/select2_min.js"></script>
    <link href="${pageContext.request.contextPath}/css/select2_min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <title>Szpital</title>
</head>