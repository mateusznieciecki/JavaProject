<%@ page contentType="text/html;charset=UTF-8" session="true" %>
<%@ include file="header.jsp" %>
<%
				Date date = new Date();
				SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
				String data = formatter.format(date);
				%>
<body>
	<div class="row justify-content-center container-top">
		<div class="card" style="width: 18rem;">
			<div class="card-body">
				<h5 class="card-title osw">Oświadczenie</h5>
				<h6 class="card-subtitle mb-2 text-muted osw"> <%=data%></h6>
				<p class="card-text">Ja, ${imiePacjenta} ${nazwiskoPacjenta} oświadczam, że posiadam ważne ubezpieczenie.</p>
				<p class="card-text">Podpis:</p>
				<p class="card-text">...........................</p>
			</div>
		</div>
	</div>
</body>