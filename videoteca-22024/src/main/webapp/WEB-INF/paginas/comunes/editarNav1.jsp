<section id="actions" class="py-4 mb-4 bg-light">
    <form action = "${pageContext.request.contextPath}/servletControlador?accion=alquilar&idLibro=${libro.idLibros}" method="POST" class="was-validated">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <a href="index.jsp" class="btn btn-light btn-block">
                    <i class="fas fa-arrow-left"></i>
                    Regresar a Inicio
                </a>
                <div class="col-md-4">
                <button type="submit" class="btn btn-success btn-block">
                    <i class="fas fa-check"></i>
                    confirmar alquiler
                </button>
            </div>
            </div>
            
        </div>
    </div>
</section>