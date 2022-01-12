<%@ page contentType="text/html;charset=UTF-8" session="true" %>
<%@ include file="header.jsp" %>

<%
				Date date = new Date();
				SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
				String data = formatter.format(date);
				%>

<body>
    <script>
        $(document).ready(function() {
            $("select").select2();
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
                                <a class="nav-link active" href="/api/page/szpital">Strona Główna</a>
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

    <form class="form-signin" action="/api/register/addPacjent" onsubmit="return validateForm()" method="post">
        <p class="h3">Formularz rejestracji</p>
        <div class="form-floating mb-3">
            <input type="number" class="form-control" id="pesel_pacjenta" name="peselP" <% if((Long)request.getAttribute("peselPacjenta") != null){ %> value='<%=(Long)request.getAttribute("peselPacjenta")%>' <% } %>  placeholder="PESEL" required>
        </div>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" name="imieP" placeholder="Imię" required>
        </div>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" name="nazwiskoP" <% if(request.getAttribute("nazwiskoPacjenta") != null && !request.getAttribute("nazwiskoPacjenta").equals("")){ %> value='<%=request.getAttribute("nazwiskoPacjenta") %>' <% } %> placeholder="Nazwisko" required>
        </div>
        <div class="form-floating mb-3">
            <input type="text"  onfocus="(this.type='date', this.max='<%=data%>')" class="form-control" name="dataP" placeholder="Data urodzenia" required>
        </div>
        <div class="form-floating mb-3">
            <select name="lekProwP" required>
                <option value="" selected disabled hidden>Lekarz prowadzący</option>
                <%
                for(Pracownicy p : (List<Pracownicy>)request.getAttribute("lekarzeList")){ %>
                     <option value='<%=p.getImie()%> <%=p.getNazwisko()%>'><%=p.getImie()%> <%=p.getNazwisko()%></option>';
                <%
                    }
                %>
            </select>
        </div>
        <div class="form-floating mb-3">
            <input type="text" onfocus="(this.type='date')" class="form-control" name="ubezpieczenieP" placeholder="Termin ubezpieczenia" required>
        </div>
        <div class="form-floating mb-3">
            <select name="stanP" required>
                <option value="" selected disabled hidden>Stan</option>
                <option value="zwykly">Zwykły</option>
                <option value="pilny">Pilny</option>
                <option value="nagly">Nagły</option>
            </select>
        </div>
        <div class="d-flex justify-content-center">
            <input type="submit" class="btn btn-secondary" value="Zarejestruj pacjenta" />
        </div>
    </form>

    <script>
        function validateForm() {
            var a = document.getElementById("pesel_pacjenta").value;
            console.log(a)
            if (a.length == 11 || a.length == 0) {
                return true;
            } else {
                Swal.fire('Błędna ilość znaków w PESEL');
                return false;
            }
        }
    </script>

</body>

</html>