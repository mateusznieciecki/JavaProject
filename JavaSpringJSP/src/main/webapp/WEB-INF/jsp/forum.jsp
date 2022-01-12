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
                                   <a class="nav-link" href="/api/page/doctor">Strona Główna</a>
                               </li>
                               <li class="nav-item">
                                   <a class="nav-link" href="/api/mail/openMailbox">Poczta</a>
                               </li>
                               <li class="nav-item">
                                   <a class="nav-link" href="/api/page/orderMedicines">Zamów Leki</a>
                               </li>
                               <li class="nav-item">
                                   <a class="nav-link active" href="/api/mail/forum">Forum</a>
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
    <div class="container-fluid container-top">
        <div class="row">
            <div class="col lista_wpisow">
            <ul class="list-group">
                <li class="list-group-item list-group-item-action add_forum" id="add_forum2">
                <i class="material-icons icons">add</i><b>Dodaj wpis</b>
                </li>
                </ul>
                <% for(Wpisy w : (List<Wpisy>)request.getAttribute("listOfTopics")){ %>
                            <ul class="list-group">
                            <li class="list-group-item list-group-item-action wpis" id="<%=w.getIdWpisu()%>">
                            <%=w.getTematWpisu()%>
                            </li>
                            </ul>
                <% } %>
            </div>
            <div class="col" id="tresc_wpisow">
                Witaj na forum. Wybierz temat który cię interesuje lub dodaj wpis.
                <div class="div-only-mobile">
                        <ul class="list-group">
                        <li class="list-group-item list-group-item-action add_forum" id="add_forum2">
                        <i class="material-icons icons">add</i><b>Dodaj wpis</b>
                        </li>
                        </ul>
                        <% for(Wpisy w : (List<Wpisy>)request.getAttribute("listOfTopics")){ %>
                                                    <ul class="list-group">
                                                    <li class="list-group-item list-group-item-action wpis" id="<%=w.getIdWpisu()%>">
                                                    <%=w.getTematWpisu()%>
                                                    </li>
                                                    </ul>
                                        <% } %>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            $("select").select2();
            $(".wpis").click(function() {
                var id = this.id;
                $("#tresc_wpisow").load("/api/forum/loadTopic", {
                    id
                });
            });
            $(".add_forum").click(function() {
                var id = this.id;
                $("#tresc_wpisow").load("/api/page/topic/add", {
                    id
                });
            });
            $(".add_forum2").click(function() {
                var id = this.id;
                $("#tresc_wpisow").load("/api/page/topic/add", {
                    id
                });
            });

        });
    </script>
</body>

</html>