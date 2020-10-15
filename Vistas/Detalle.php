
<?php 

include '../Controls/MetodosControls.php';

$cod=$_REQUEST['cod']; 

$objMetodos = new MetodosControls();
$lista=$objMetodos->ListarProductosCod($cod);

foreach($lista as $row) {

    $name=$row[1];
    $price=$row[7];
    $description=$row[2];
    $image=$row[8];
}

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

<form action="">
    <table border="0">
        <tr>
           <th rowspan="4"><img src="data:image/png;base64,<?php echo base64_encode( $image );?>"></th>
           <th><?php echo $name; ?></th>
        </tr>
        <tr>
            <td align="justify"><?php echo $description; ?> </td>
        </tr>
        <tr>
            <td align="right">$ <?php echo $price; ?></td>
        </tr>
        <tr>
            <td align="right">Ingresar cantidad: 
                <input type="number" min="1" max="100" value="1" name="txtCan">
            </td>
        </tr>
        <tr>
            <th align="right" colspan="2">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary">Agregar a carrito</button>
            </th>
        </tr>
    </table>
</form>
    
</body>
</html>