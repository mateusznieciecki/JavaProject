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
        							<a class="nav-link" href="/api/page/admin/panel">Strona Główna</a>
        						</li>
        						<li class="nav-item">
        							<a class="nav-link" href="/api/mail/openMailbox">Poczta</a>
        						</li>
        						<li class="nav-item">
        							<a class="nav-link active" href="/api/page/admin/users">Użytkownicy</a>
        						</li>
        						<li class="nav-item">
        							<a class="nav-link" href="/api/page/icd">ICD</a>
        						</li>
        						<li class="nav-item">
        							<a class="nav-link" href="/api/page/medicines">Dodaj leki</a>
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
        <div class="container container-search">
        <% if((String)request.getAttribute("message")!=null){%>
            <div class="alert alert-dark blad" role="alert"><%=(String)request.getAttribute("message")%></div>
        <% } %>
		<button class="btn btn-outline-secondary float-right" type="button" data-toggle="collapse" data-target="#add_collapse" aria-expanded="false" aria-controls="add_collapse">
			Dodaj
		</button>
	<h2>Użytkownicy:</h2>
	</div>
	<div class="collapse" id="add_collapse">
    <form class="form-signin" action="/api/admin/users/add" method="post">
        <p class="h3">Zarejestruj pracownika</p>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" name="userLogin" placeholder="Login" required>
        </div>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" name="userName" placeholder="Imię" required>
        </div>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" name="userSurname" placeholder="Nazwisko" required>
        </div>
        <div class="form-floating mb-3">
            <select name="userType" required>
            <option value="" selected disabled hidden>Typ pracownika</option>
            <option value="rejestrator">Rejestrator</option>
            <option value="lekarz">Lekarz</option>
            <option value="admin">Admin</option>
            </select>
        </div>
        <div class="d-flex justify-content-center">
            <input type="submit" class="btn btn-secondary" value="Dodaj pracownika" />
        </div>
    </form>
	</div>
        <div class="table-responsive">
                    <table class="table"><thead class="thead-dark"><tr><th>Login</th><th>Imię</th><th>Nazwisko</th><th>Typ pracownika<th>Usuń</th><th>Edytuj</th><th>Zresetuj hasło</th></thead>
                    <% for(Pracownicy p : (List<Pracownicy>)request.getAttribute("listOfUsers")){ %>
                        <tr><td><%=p.getLogin()%></td><td><%=p.getImie()%></td><td><%=p.getNazwisko()%></td><td><%=p.getTypPrac()%></td>
                        <td><a href="/api/admin/users/remove?userId=<%=p.getId()%>"><i class="material-icons">person_remove</i></a></td>
                        <td><a href="/api/page/admin/users/edit?userId=<%=p.getId()%>"><i class="material-icons">edit</i></a></td>
                        <td><a href="/api/admin/users/password/reset?userId=<%=p.getId()%>"><i class="material-icons">refresh</i></a></td>
                        </tr>
                    <% } %>
                  </table>
            <br>
        </div>
    </body>

</html>