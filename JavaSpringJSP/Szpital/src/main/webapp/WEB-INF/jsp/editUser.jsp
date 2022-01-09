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
                							<a class="nav-link" href="/api/admin/addMedicines">Dodaj leki</a>
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

    <form class="form-signin" action="/api/admin/users/edit?userId=<%=((Pracownicy) request.getAttribute("user")).getId() %>" method="post">
        <p class="h3">Edytuj pracownika</p>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" name="userLogin" value="<%=((Pracownicy) request.getAttribute("user")).getLogin() %>" disabled required>
        </div>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" name="userName" value="<%=((Pracownicy) request.getAttribute("user")).getImie() %>" required>
        </div>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" name="userSurname" value="<%=((Pracownicy) request.getAttribute("user")).getNazwisko() %>" required>
        </div>
        <div class="form-floating mb-3">
            <select name="userType" size="3" required>
            <option value="rejestrator" <% if(((Pracownicy) request.getAttribute("user")).getTypPrac().equals("rejestrator")){ %> selected <% } %> >Rejestrator</option>
            <option value="lekarz" <% if(((Pracownicy) request.getAttribute("user")).getTypPrac().equals("lekarz")){ %> selected <% } %> >Lekarz</option>
            <option value="admin" <% if(((Pracownicy) request.getAttribute("user")).getTypPrac().equals("admin")){ %> selected <% } %> >Admin</option>
            </select>
        </div>
        <div class="d-flex justify-content-center">
            <input type="submit" class="btn btn-secondary" value="Edytuj pracownika" />
        </div>
    </form>
</body>
</html>