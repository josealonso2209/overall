<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="shortcut icon" href="img/icono.ico">
    <title>OVERALL</title>
    <!-- <link rel="stylesheet" href="css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="css/principal.css">
    <!-- <link href="fontawesome-free-5.14.0-web/css/all.css" rel="stylesheet">
    <link href="fontawesome-free-5.14.0-web/css/solid.css" rel="stylesheet">
    <link href="fontawesome-free-5.14.0-web/js/all.js" rel="stylesheet"> -->
</head>

<body>
    <div class="wrapper">
        <div class="card">
            <div class="row justify-content-md-center user-img">
                <img src="../img/imgEnca/photo5006105819296671891.png" class="rounded-circle" alt="logo OverAll">
            </div>
            <form class="col-12" action="../login-sesion/logon.php" method="POST" accept-charset="utf-8">
                <div class="form-group" id="user-group" >
                    <input class="form-control" type="text" name="identification" placeholder="Usuario">
                </div>
                <div class="form-group" id="contra-group">
                    <input class="form-control" type="password" name="password" placeholder="Contraseña">
                </div>
                <button type="submit" class="btn btn-secondary"><i class="fas fa-sign-in-alt"></i>  Ingresar</button>
            </form>
            <div class="col-12 forgot">
                <a href="#">Recordar contraseña</a>
            </div> 
        </div>
    </div>

    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>

</html>
