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
    <script>
        $(document).ready(function() {
            var lim = 2;
            $("button").click(function() {
                lim = lim + 2;
                $("#historia_chorob").load("/api/medicalCare/morePatientHistory", {
                    limit: lim
                });
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
                               <a class="nav-link active" href="/api/page/doctor">Strona Główna</a>
                           </li>
                           <li class="nav-item">
                               <a class="nav-link" href="/api/mail/openMailbox">Poczta</a>
                           </li>
                           <li class="nav-item">
                               <a class="nav-link" href="/api/page/orderMedicines">Zamów Leki</a>
                           </li>
                           <li class="nav-item">
                               <a class="nav-link" href="/api/page/forum">Forum</a>
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

    <div class="container container-top">
        <h2>Pacjent</h2>
        <div class="pacjent">

            <ul class="list-group">
            <li class="list-group-item">
            <%=((Pacjenci)request.getAttribute("patient")).getImie()%> <%=((Pacjenci)request.getAttribute("patient")).getNazwisko()%>
            </li>
            <li class="list-group-item">
            <%=((Pacjenci)request.getAttribute("patient")).getPesel()%>
            </li>
            <li class="list-group-item">
            Data urodzenia: <%=((Pacjenci)request.getAttribute("patient")).getDataUrodzenia()%>
            </li>
            </ul>

        </div>
        <h2 class="secondary-header-class">Rozpoznanie</h2>
        <form action="/api/medicalCare/putDiagnosis?pesel=<%=((Pacjenci)request.getAttribute("patient")).getPesel()%>" method="post">
            <select class="wybor_icd" name="icdChoice" required>
                <option value="" selected disabled hidden>Rozpoznanie</option>
                <% for(Rozpoznanie r : (List<Rozpoznanie>)request.getAttribute("listOfIcd")){ %>
                   <option value="<%=r.getIcd()%> <%=r.getOpis()%>"><%=r.getIcd()%> <%=r.getOpis()%></option>
                <% } %>
            </select><br>
            <textarea name="diagnosis" class="form-control" rows="10" cols="50" placeholder="Opis słowny stanu pacjenta"></textarea>
            <br>
            <input type="submit" class="btn btn-secondary" value="Zatwierdź pacjenta">
        </form>
        <h2 class="secondary-header-class">Historia chorób</h2>
        <div id="historia_chorob">
        <% for(HistoriaChorob h : (List<HistoriaChorob>)request.getAttribute("listOfPatientsHistory")){ %>
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">
                            <b> <%=h.getIcd()%></b>
                            </h5>
                            <h6 class="card-subtitle mb-2 text-muted">
                            Data zgłoszenia: <%=h.getDataBadania()%>
                            </h6>
                            <p class="card-text">
                            <%=h.getOpisSlowny()%>
                            </p>
                        </div>
                    </div>
                    <br>
                    <% } %>
        </div>
        <button class="btn btn-secondary load-history">Załaduj starsze wpisy</button>
    </div>
</body>

</html>