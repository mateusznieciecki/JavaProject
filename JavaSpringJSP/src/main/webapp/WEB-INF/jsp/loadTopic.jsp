<%@ page contentType="text/html;charset=UTF-8" session="true" %>
<%@ include file="header.jsp" %>

<div class="div-only-mobile">
    <div class="container back">
        <a class="btn btn-outline-secondary" href="/api/page/forum">Cofnij</a>
    </div>
</div>
<div class="card">
            <div class="card-body">
                <h5 class="card-title">
                <b> <%=((Wpisy) request.getAttribute("topic")).getTematWpisu() %></b>
                </h5>
                <h6 class="card-subtitle mb-2 text-muted">
                Autor wpisu: <%=((Wpisy) request.getAttribute("topic")).getAutorWpisu() %>
                </h6>
                <p class="card-text">
                <%=((Wpisy) request.getAttribute("topic")).getTrescWpisu() %>
                </p>
            </div>
        </div>
        <div class="card-footer">
            <h3>Komentarze</h3>
        </div>
        <% for(Komentarze k : (List<Komentarze>)request.getAttribute("listOfComments")){ %>
        <div class="card">
                            <div class="card-body">
                                <h6 class="card-subtitle mb-2 text-muted">
                                Autor komentarza: <%=k.getAutorKomentarza()%>
                                </h6>
                                <p class="card-text">
                                <%=k.getTrescKomentarza()%>
                                </p>
                                <%
                                String currentUser = ((Pracownicy) request.getSession().getAttribute("pracownik")).getImie()+" "+((Pracownicy) request.getSession().getAttribute("pracownik")).getNazwisko();
                                if(k.getAutorKomentarza().equals(currentUser)) { %>
                                    <div class="btn-group float-right">
                                        <button class="btn btn-outline-secondary" type="button" data-toggle="collapse" data-target="#edit_collapse<%=k.getIdKomentarza()%>" aria-expanded="false" aria-controls="edit_collapse<%=k.getIdKomentarza()%>">Edytuj</button>
                                        <a class="btn btn-outline-danger" href="/api/forum/comment/remove?commentId=<%=k.getIdKomentarza()%>">Usuń</a>
                                    </div>
                                    <div class="collapse" id="edit_collapse<%=k.getIdKomentarza()%>">
                                        <form class="form-signin" action="/api/forum/comment/edit?commentId=<%=k.getIdKomentarza()%>" method="post">
                                            <div class="form-floating mb-3">
                                                <textarea name="content" class="form-control" rows="5" cols="100"><%=k.getTrescKomentarza()%></textarea>
                                            </div>
                                            <div class="d-flex justify-content-center">
                                                <input type="submit" class="btn btn-secondary" value="Edytuj komentarz" />
                                            </div>
                                        </form>
                                    </div>
                                    <% } %>
                            </div>
                        </div>
                        <% } %>
                        <br>

                <form class="form comment-sender" action="/api/forum/comment/add?topicId=<%=((Wpisy) request.getAttribute("topic")).getIdWpisu() %>" method="post">
                    <div class="form-floating mb-3">
                        <textarea name="content" class="form-control" rows="5" cols="100" placeholder="Napisz komentarz..."></textarea>
                    </div>
                    <div class="d-flex justify-content-center">
                        <input type="submit" class="btn btn-secondary" value="Wyślij" />
                    </div>
                </form>