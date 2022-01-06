<%@ page contentType="text/html;charset=UTF-8" session="true" %>
<%@ include file="header.jsp" %>

<body>
    <script>
        $(document).ready(function () {
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
                            <a class="nav-link" href="poczta.php">Poczta</a>
                        </li>
                        <li class="nav-item d-md-none" style="text-align: center;">
                            <a href="logout.php">Wyloguj się</a>
                        </li>
                    </ul>

                </div>

                <div class="d-none d-md-block">
                    <a href="/api/login/logout">Wyloguj się</a>
                </div>
            </div>
        </nav>
    </header>
    <div class="table-responsive">
    <table class='table'><thead class='thead-dark'><tr><th>PESEL</th><th>Imię</th><th>Nazwisko</th><th>Data urodzenia</th><th>Lekarz prowadzący</th><th>Ustaw lekarza</th><th>Ubezpieczenie</th><th>Usuń</th></thead>
        <% for(Pacjenci p : (List<Pacjenci>)request.getAttribute("pacjenciList")){ %>
        <tr><td><%=p.getPesel()%></td><td><%=p.getImie()%></td><td><%=p.getNazwisko()%></td><td><%=p.getDataUrodzenia()%></td><td><%=p.getLekProw()%></td><td><form action="/api/register/updateLekarz?id=<%=p.getId()%>" method="post"><select name="lekProwP" required>
                                                                                                                                                                              <option value="" selected disabled hidden>Lekarz prowadzący</option>
                                                                                                                                                                              <%
                                                                                                                                                                              for(Pracownicy pr : (List<Pracownicy>)request.getAttribute("lekarzeList")){ %>
                                                                                                                                                                                   <option value='<%=pr.getImie()%> <%=pr.getNazwisko()%>'><%=pr.getImie()%> <%=pr.getNazwisko()%></option>';
                                                                                                                                                                              <%
                                                                                                                                                                                  }
                                                                                                                                                                              %>
                                                                                                                                                                          </select><input type="submit" value="Zatwierdź" class="btn btn-secondary float-right oswiadczenie"/></form></td>
        <td>
            <% SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
               Date date = new Date(System.currentTimeMillis());
               if(date.after(p.getUbezpieczenie())){ %>
                    Pacjent nieubezpieczony <form target="_blank" action="/api/register/oswiadczenie?id=<%=p.getId()%>" method="post">
                    <input type="submit" value="Drukuj oświadczenie" class="btn btn-secondary oswiadczenie"/></form>
               <%}
               else{ %>
                    Pacjent ubezpieczony
               <% } %>
        </td><td><a href="/api/register/deletePacjent?id=<%=p.getId()%>"><i class="material-icons icons">person_remove</i></a></td></tr>
        <% } %>
        </table>
    </div>
</body>
</html>
