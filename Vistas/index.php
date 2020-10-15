<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Overrall</title>
    <?php
        session_start();
        $usuario = $_SESSION['username'];
    ?>
    <script>
        function ingresar(){
            location.href='../Controls/FerreteriaControls.php?op=1';
        }
    </script>
</head>
<body onload="ingresar()">
    
</body>
</html>