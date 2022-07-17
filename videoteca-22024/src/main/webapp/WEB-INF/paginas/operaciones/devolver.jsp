<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

       

            <section id="details">
                <div class="container">
                    <div class="row">
            <div class="col-md-4">
                <a href="index.jsp" class="btn btn-light btn-block">
                    <i class="fas fa-arrow-left"></i>
                    Regresar a Inicio
                </a>
            </div>
                    <div class="row">
                        <div class="col">
                       <table class="table table-striped table-info">
                        <thead class="thead-primary">
                            <tr>
                                <th>#</th>
                                <th>Nombre</th>
                                <th>Autor</th>
                                <th>Precio</th>
                                <th>duracion</th>
                            </tr>
                        </thead>
                        <tbody>
                                
                                <tr>
                                    <td>${status.count}</td>
                                    <td>${libro.nombre}</td>
                                    <td>${libro.autor}</td>
                                    <td><fmt:formatNumber value="${libro.precio}" type="currency"/></td>
                                    <td>${libro.cantPaginas}'</td>
                                    
                                    <!-- COMPLETAR HREF CUANDO ESTE TERMINADO JSP EDITAR -->
                                    <td>
                                        <a href="${pageContext.request.contextPath}/servletControlador?accion=retornar&idLibro=${libro.idLibros}&nombre=${libro.nombre}&autor=${libro.autor}
                                              &precio=${libro.precio}&cantPaginas=${libro.cantPaginas}&copias=${libro.copias}&copiasafu=${libro.copiasafu}" 
                                           class="btn btn-secondary" method="POST" class="was-validated" >
                                            <i class="fas fa-angle-double-right"></i>
                                            confirmar devolucion
                                        </a>
                                           
                                    </td>
                                  </tr>
                            </tbody>
                    </table>
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
