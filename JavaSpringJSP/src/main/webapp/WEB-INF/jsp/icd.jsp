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
    							<a class="nav-link" href="/api/page/admin/panel">Strona Główna</a>
    						</li>
    						<li class="nav-item">
    							<a class="nav-link" href="/api/mail/openMailbox">Poczta</a>
    						</li>
    						<li class="nav-item">
    							<a class="nav-link" href="/api/page/admin/users">Użytkownicy</a>
    						</li>
    						<li class="nav-item">
    							<a class="nav-link active" href="/api/page/icd">ICD</a>
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
		<button class="btn btn-outline-secondary float-right addbutton" type="button" data-toggle="collapse" data-target="#search_collapse" aria-expanded="false" aria-controls="search_collapse">
			Szukaj
		</button>
		<button class="btn btn-outline-secondary float-right" type="button" data-toggle="collapse" data-target="#add_collapse" aria-expanded="false" aria-controls="add_collapse">
			Dodaj
		</button>
		<h2>ICD:</h2>
	</div>
	<div class="collapse" id="search_collapse">
		<form class="form-signin" action="/api/page/icd/search" method="post">
			<p class="h3">Szukaj</p>
			<div class="form-floating mb-3">
				<input type="text" class="form-control" name="searchValue" placeholder="Treść wyszukiwania..." required>
			</div>
			<div class="d-flex justify-content-center">
				<input type="submit" class="btn btn-secondary" value="Szukaj ICD" />
			</div>
		</form>
	</div>
	<div class="collapse" id="add_collapse">
		<form class="form-signin" action="/api/admin/icd/add" method="post">
			<p class="h3">Dodaj ICD</p>
			<div class="form-floating mb-3">
				<input type="text" class="form-control" name="icd" placeholder="ICD" required>
			</div>
			<div class="form-floating mb-3">
				<input type="text" class="form-control" name="description" placeholder="Opis" required>
			</div>
			<div class="d-flex justify-content-center">
				<input type="submit" class="btn btn-secondary" value="Dodaj ICD" />
			</div>
		</form>
	</div>
	<div class="table-responsive">
				<table class="table"><thead class="thead-dark"><tr><th>ICD<a class="icons" href="/api/page/icd?sortOption=1"><i class="material-icons">keyboard_arrow_up</i></a><a class="icons" href="/api/page/icd?sortOption=2"><i class="material-icons">keyboard_arrow_down</i></a></th><th>Opis<a class="icons" href="/api/page/icd?sortOption=3"><i class="material-icons">keyboard_arrow_up</i></a><a class="icons" href="/api/page/icd?sortOption=4"><i class="material-icons">keyboard_arrow_down</i></a></th><th>Usuń</th><th>Edytuj</th></tr></thead>
				<% for(Rozpoznanie r : (List<Rozpoznanie>)request.getAttribute("listOfIcd")){ %>
					<tr><td><%=r.getIcd()%></td><td><%=r.getOpis()%></td>
					<td><a class="icons" href="/api/admin/icd/remove?icdId=<%=r.getId()%>"><i class="material-icons">delete</i></a></td>
					<td><a class="icons" href="/api/page/icd/edit?icdId=<%=r.getId()%>"><i class="material-icons">edit</i></a></td>
					</tr>
				<% } %>
				</table>
	</div>
</body>

</html>