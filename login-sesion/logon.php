<?php
    require 'conexion.php';
    session_start();
    $usuario = $_POST['identification'];
    $password = $_POST['password'];

    $q = "SELECT COUNT(*) as contar from users where identification = '$usuario' and password = '$password'";
    $consulta = mysqli_query($conexion, $q);
    $array = mysqli_fetch_array($consulta);

    if ($array['contar'] > 0) {
        $_SESSION['username'] = $usuario;
        header("location: ../Vistas/index.php");
    }else{
        echo "Error: %s\n", mysqli_error($conexion);
        echo "Datos Incorrectos";
    }

?>