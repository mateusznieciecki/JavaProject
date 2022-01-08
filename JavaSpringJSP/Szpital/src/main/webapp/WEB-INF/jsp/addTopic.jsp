<%@ page contentType="text/html;charset=UTF-8" session="true" %>
<%@ include file="header.jsp" %>

<div class="div-only-mobile">
    <div class="container back">
        <a class="btn btn-outline-secondary" href="/api/page/forum">Cofnij</a>
    </div>
</div>
<form class="form-signin" action="/api/forum/topic/add" method="post">
			<p class="h3">Dodaj wpis</p>
			<div class="form-floating mb-3">
				<input type="text" class="form-control" name="topic" placeholder="Temat" required>
			</div>
            <div class="form-floating mb-3">
                    <textarea name="content" class="form-control" rows="5" cols="100" placeholder="Treść wpisu"></textarea>
				</div>
			<div class="d-flex justify-content-center">
				<input type="submit" class="btn btn-secondary" value="Dodaj wpis" />
			</div>
		</form>