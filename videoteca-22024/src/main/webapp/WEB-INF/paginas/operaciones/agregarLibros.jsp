<div class="modal fade" id="agregarLibroModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-info text-white">
                <h5 class="modal-title">Agregar libro</h5>
            </div>
            <form action="${pageContext.request.contextPath}/servletControlador?accion=insertar" method="POST" class="was-validated">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="nombre">Titulo</label>
                        <input type="text" class="form-control" name="nombre" required="">
                    </div>
                    <div class="form-group">
                        <label for="autor">Director</label>
                        <input type="text" class="form-control" name="autor">
                    </div>
                    <div class="form-group">
                        <label for="cantPaginas">Duracion</label>
                        <input type="number" class="form-control" name="cantPaginas" required="">
                    </div>
                    <div class="form-group">
                        <label for="precio">Valor del alquiler</label>
                        <input type="currency" class="form-control" name="precio" required="">
                    </div>
                    <div class="form-group">
                        <label for="copias">Stock en salon</label>
                        <input type="number" class="form-control" name="copias" required="">
                    </div>
                    <div class="form-group">
                        <label for="copiasafu">Copias en alquiler</label>
                        <input type="number" class="form-control" name="copiasafu" required="">
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" type="submit">
                        Guardar
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
