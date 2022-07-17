<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="es_AR"/>
<section id="libros">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h4>Listado de videos</h4>
                    </div>
                    <table class="table table-striped table-info">
                        <thead class="thead-primary">
                            <tr>
                                <th>#</th>
                                <th>Nombre</th>
                                <th>Autor</th>
                                <th>Precio</th>
                                <th>duracion</th>
                                <th>Copias en local</th>
                                <th>En alquiler</th>
                                <th>Alquiler</th>
                                <th>Devolucion</th>
                                <th>accion</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="libro" items="${pepe}"varStatus="status" >
                                <tr>
                                    <td>${status.count}</td>
                                    <td>${libro.nombre}</td>
                                    <td>${libro.autor}</td>
                                    <td><fmt:formatNumber value="${libro.precio}" type="currency"/></td>
                                    <td>${libro.cantPaginas}'</td>
                                    <td>${libro.copias}</td>
                                    <td>${libro.copiasafu}</td>
                                    <!-- COMPLETAR HREF CUANDO ESTE TERMINADO JSP EDITAR -->
                                    <td>
                                        <a href="${pageContext.request.contextPath}/servletControlador?accion=alquilar&idLibro=${libro.idLibros}&copias=${libro.copias}" 
                                           class="btn btn-secondary">
                                            <i class="fas fa-angle-double-right"></i>
                                            alquilar
                                        </a>
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/servletControlador?accion=devolver&idLibro=${libro.idLibros}&copiasafu=${libro.copiasafu}" 
                                           class="btn btn-secondary">
                                            <i class="fas fa-angle-double-right"></i>
                                            devolver
                                        </a>
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/servletControlador?accion=editar&idLibro=${libro.idLibros}" 
                                           class="btn btn-secondary">
                                            <i class="fas fa-angle-double-right"></i>
                                            editar
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center bg-success text-white mb-3">
                    <div class="card-body">
                        <h3>Cantidad de videos</h3>
                        <h4 class="display-4">
                         En stock   ${cantidadLibros}
                        </h4>
                        <h4 class="display-4">
                         En alquiler ${cantidadLibrosalq}
                        </h4>
                    </div>
                </div>
                <div class="card text-center bg-danger text-white mb-3">
                    <div class="card-body">
                        <h3>Esta semana aprovecha las promos a </h3>
                        <h4 class="display-4">
                            <i class="fas fa-bullhorn"></i>
                            $99
                            <i class="fa-solid fa-handshake"></i>
                        </h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/paginas/operaciones/agregarLibros.jsp"/>