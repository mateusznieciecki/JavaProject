<%@ page contentType="text/html;charset=UTF-8" session="true" %>
<%@ include file="header.jsp" %>

<body>
    <form class="form-signin" action="/api/login/login" method="post">
        <img class="form-signin" id="logo" src="${pageContext.request.contextPath}/images/logo_szpital.png">
        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="floatingInput" name="login" placeholder="Nazwa Użytkownika" required>
        </div>
        <div class="form-floating mb-3">
            <input type="password" class="form-control" id="floatingPassword" name="haslo" placeholder="Hasło" required>
        </div>
        <% if((String)request.getAttribute("errorMessage")=="True"){%>
                    <div class="alert alert-dark blad" role="alert">Błędny login lub hasło</div>
                    <% } %>
        <div class="d-flex justify-content-center">
            <input type="submit" class="btn btn-primary" value="Zaloguj się" />
        </div>
    </form>
</body>

</html>