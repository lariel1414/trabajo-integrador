<section id="actions" class="py-4 mb-4 bg-light">
    <form action = "${pageContext.request.contextPath}/servletControlador?accion=devolver&idLibro=${libro.idLibros}" method="POST" class="was-validated">
            <div class="container">
        <div class="row">
            <div class="col-md-4">
                <a href="index.jsp" class="btn btn-light btn-block">
                    <i class="fas fa-arrow-left"></i>
                    Regresar a Inicio
                </a>
            </div>
            <div class="col-md-4">
                <button type="submit" class="btn btn-success btn-block">
                    <i class="fas fa-check"></i>
                    confirmar devolucion
                </button>
            </div>
            

        </div>
    </div>
</section>
