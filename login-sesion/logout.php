<?php
    session_start();
    session_destroy();

    header("location: ../Vistas/login.php");
    exit();
?>