<%@ page contentType="text/html;charset=UTF-8" session="true" %>
<%@ include file="header.jsp" %>

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