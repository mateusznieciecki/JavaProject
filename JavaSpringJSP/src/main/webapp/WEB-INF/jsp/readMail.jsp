<%@ page contentType="text/html;charset=UTF-8" session="true" %>
<%@ include file="header.jsp" %>

<body>

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

    <header>
            <nav class="navbar navbar-expand-md navbar-light bg-light">
                <div class="container-fluid">
                        <span id="tytul">Witaj <%=((Pracownicy) request.getSession().getAttribute("pracownik")).getImie() %> <%=((Pracownicy) request.getSession().getAttribute("pracownik")).getNazwisko() %></span>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainmenu" aria-controls="mainmenu" aria-expanded="false" aria-label="Przełącznik nawigacji">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="mainmenu" style="margin-left: 15px">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="/api/page/szpital">Strona Główna</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/api/mail/openMailbox">Poczta</a>
                            </li>
                            <li class="nav-item d-md-none" style="text-align: center;">
                                <a href="/api/login/logout">Wyloguj się</a>
                            </li>
                        </ul>

                    </div>

                    <div class="d-none d-md-block">
                        <a href="/api/login/logout">Wyloguj się</a>
                    </div>
                </div>
            </nav>
        </header>

    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link" onclick="location.href = '/api/mail/openMailbox';" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-selected="true">Skrzynka</button>
        </li>
        <li class="nav-item" role="presentation">

            <button class="nav-link" onclick="location.href = '/api/mail/sendMail';" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-selected="false">Wyślij</button>

        </li>
        <li class="nav-item" role="presentation">

            <button class="nav-link" onclick="location.href = '/api/mail/sentMailbox';" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-selected="false">Wysłane</button>

        </li>
    </ul>

    <div class="container">
        <h2 class="secondary-header-class">Wiadomość</h2>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">
                <b> Temat: <%=((Wiadomosci)request.getAttribute("mail")).getTemat()%></b>
                </h5>
                <h6 class="card-subtitle mb-2 text-muted">
                Wiadomość od: <%=((Wiadomosci)request.getAttribute("mail")).getOd()%> do <%=((Wiadomosci)request.getAttribute("mail")).getDoKogo()%>
                </h6>
                <p class="card-text">
                <%=((Wiadomosci)request.getAttribute("mail")).getTresc()%>
                </p>
            </div>
        </div>
    </div>
</body>

</html>