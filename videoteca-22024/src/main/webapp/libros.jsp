<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Videoteca</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/382381b436.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/stylo.css">
    </head>
    <body>
        <jsp:include page="/WEB-INF/paginas/comunes/cabecera.jsp"/>
        <jsp:include page="/WEB-INF/paginas/comunes/navegacion1.jsp"/>
        <jsp:include page="/WEB-INF/paginas/operaciones/listarLibros.jsp"/>
        <jsp:include page="/WEB-INF/paginas/comunes/navegacion.jsp"/>
        <jsp:include page="/WEB-INF/paginas/comunes/pieDePagina.jsp"/>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/js10.js"> </script>
    </body>
</html>
