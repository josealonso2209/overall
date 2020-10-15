<?php

    $host = "localhost";
    $usuario = "root";
    $password = "DrVM99JAXP";
    $base_datos = "overalldb";

    $conexion = mysqli_connect($host, $usuario, $password, $base_datos);

    if($conexion){
        echo "Conexión Exitosa";
    }else{
        echo "Ha Ocurrido un Error";
    }
?>