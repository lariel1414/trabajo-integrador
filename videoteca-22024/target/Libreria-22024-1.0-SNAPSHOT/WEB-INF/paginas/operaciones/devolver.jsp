<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="es_AR"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Libreria</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/382381b436.js" crossorigin="anonymous"></script>
    </head>
    <body>

        <jsp:include page="/WEB-INF/paginas/comunes/cabecera.jsp"/>

        <form action = "${pageContext.request.contextPath}/servletControlador?accion=actualizar&idLibro=${libro.idLibros}"
              method="POST" class="was-validated">
            <jsp:include page="/WEB-INF/paginas/comunes/editarNav2.jsp"/>

            <section id="details">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div clas="card">
                                <div class="card-header">
                                    <h4>Video seleccionado </h4>
                                </div>
                                <table class="table table-striped table-dark">
                                  <thead class="thead-dark">
                                   <tr>
                                     <th>Nombre</th>
                                     <th>Autor</th>
                                     <th>Precio</th>
                                     <th>duracion</th>
                                   </tr>
                                  </thead>
                                  <tbody>
                                
                                    <tr>
                                        <td>${libro.nombre}</td>
                                        <td>${libro.autor}</td>
                                        <td><fmt:formatNumber value="${libro.precio}" type="currency"/></td>
                                        <td>${libro.cantPaginas}'</td>
                                    </tr>
                                 </tbody> 
                                </table>
                                </div>
                                    
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </form>


        <jsp:include page="/WEB-INF/paginas/comunes/pieDePagina.jsp"/>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
