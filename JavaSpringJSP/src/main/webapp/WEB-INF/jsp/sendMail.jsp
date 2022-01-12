<%@ page contentType="text/html;charset=UTF-8" session="true" %>
<%@ include file="header.jsp" %>

<body>

    <script>
        $(document).ready(function() {
            $("select").select2({
                width: '100%'
            });
        });
    </script>
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
                                        <a class="nav-link active" href="/api/mail/openMailbox">Poczta</a>
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

                    <button class="nav-link active" onclick="location.href = '/api/mail/sendMail';" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-selected="false">Wyślij</button>

                </li>
                <li class="nav-item" role="presentation">

                    <button class="nav-link" onclick="location.href = '/api/mail/sentMailbox';" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-selected="false">Wysłane</button>

                </li>
            </ul>
    <div class="container">
        <h2 class="secondary-header-class">Wyślij wiadomość</h2>
        <form action="/api/mail/send" method="post">
            <select name="toWhom" required>
              <option value="" selected disabled hidden>Odbiorca</option>
              <%
              for(Pracownicy pr : (List<Pracownicy>)request.getAttribute("listOfWorkers")){ %>
                   <option value='<%=pr.getLogin()%>'><%=pr.getImie()%> <%=pr.getNazwisko()%></option>';
              <%
                  }
              %>
          </select>
            <input type="text" name="topic" class="form-control" placeholder="Temat" required />
            <textarea name="message" class="form-control" rows="10" cols="50" placeholder="Napisz wiadomość..."></textarea>
            <br>
            <input type="submit" class="btn btn-secondary" value="Wyślij">
        </form>
    </div>
</body>

</html>