<%@ page contentType="text/html;charset=UTF-8" session="true" %>
<%@ include file="header.jsp" %>

<body>
    <script>
        $(document).ready(function() {
            $("select").select2({
                width: '100%'
            });
            document.getElementById("dodajLek").onclick = function() {
                getname()
            };

            function dodajLek_funkcja() {
                Swal.fire("The form was submitted");
            }

            function getname() {
                var medicine = $('select option').filter(':selected').text();
                var amount = $("#amount").val();
                $.ajax({
                    type: "post",
                    dataType: "text",
                    data: {
                        'medicine': medicine,
                        'amount': amount
                    },
                    url: "/api/medicalCare/orderMedicine",
                    success: function(response) {
                        if (response == 0) {
                            Swal.fire({
                                title: 'Brak leku w magazynie. Czy chcesz złożyć zamówienie?',
                                showDenyButton: true,
                                showCancelButton: false,
                                confirmButtonText: 'Zamów',
                                denyButtonText: 'Odrzuć',
                            }).then((result) => {

                                if (result.isConfirmed) {
                                    Swal.fire('Złożono zamówienie', '', 'success');
                                    jQuery.ajax({
                                        type: "POST",
                                        url: '/api/medicalCare/orderUnavailable',
                                        dataType: 'text',
                                        data: {
                                            'medicine': medicine,
                                            'amount': amount
                                        },

                                        success: function() {}
                                    });
                                } else if (result.isDenied) {}
                            })
                        } else {
                            if (medicine == 'Wybierz lek' || !amount || amount < 1 || amount % 1 !== 0) {
                                Swal.fire('Wpisz właściwe dane')
                            } else {
                                Swal.fire({
                                    title: "Czy chcesz zarezerwować " + medicine + " w ilości " + amount + "?",
                                    showDenyButton: true,
                                    showCancelButton: false,
                                    confirmButtonText: 'Zarezerwuj',
                                    denyButtonText: 'Odrzuć',
                                }).then((result) => {

                                    if (result.isConfirmed) {
                                        Swal.fire('Zamówiono', '', 'success');
                                        jQuery.ajax({
                                            type: "POST",
                                            url: '/api/medicalCare/orderAvailable',
                                            dataType: 'text',
                                            data: {
                                                'medicine': medicine,
                                                'amount': amount
                                            },

                                            success: function() {}
                                        });
                                    } else if (result.isDenied) {}
                                })
                            }
                        }
                    }
                });
            }
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
                                   <a class="nav-link" href="/api/page/doctor">Strona Główna</a>
                               </li>
                               <li class="nav-item">
                                   <a class="nav-link" href="/api/mail/openMailbox">Poczta</a>
                               </li>
                               <li class="nav-item">
                                   <a class="nav-link active" href="/api/page/orderMedicines">Zamów Leki</a>
                               </li>
                               <li class="nav-item">
                                   <a class="nav-link" href="/api/page/forum">Forum</a>
                               </li>
                               <li class="nav-item d-md-none" style="text-align: center;">
                                   <a href="logout.php">Wyloguj się</a>
                               </li>
                           </ul>

                       </div>

                       <div class="d-none d-md-block">
                           <a href="logout.php">Wyloguj się</a>
                       </div>
                   </div>
               </nav>
           </header>
    <div class="container">
        <h2 class="secondary-header-class">Zamów leki</h2>
        <form>
            <select id="wybor_lek" class="form-control" name="medicine" required>
                <option value="" selected disabled hidden>Wybierz lek</option>
                <% for(Leki l : (List<Leki>)request.getAttribute("listOfMedicines")){ %>
                    <option value="<%=l.getNazwa()%>"><%=l.getNazwa()%></option>
                    <% } %>
                </select>
                <input type="number" class="form-control" name="amount" id="amount" placeholder="Ilość" required/> <br />
        </form>
        <button id="dodajLek" class="btn btn-secondary">Zatwierdź</button>
    </div>
</body>

</html>