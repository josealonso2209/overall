<!--  Inicio del encabezado -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="index.php">
    <img src="../img/logo.png" class="rounded-circle" width="50" height="50" alt="" loading="lazy">
    OverAll
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Buscar" aria-label="Buscar">
      <div class="input-group-append">
        <button class="btn btn-info my-2 my-sm-0" type="submit">Buscar</button>
      </div>
    </form>  
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="nuestrosProductos.php">Nuestros Productos <span class="sr-only">(current)</span>
          <img src="../img/productos.png" width="20px" height="20px" alt="">
        </a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="#">Nuestros Aliados <span class="sr-only">(current)</span>
          <img src="../img/colombia.png" width="20px" height="20px" alt="">
        </a>
      </li>
      <!-- <li class="nav-item active">
        <a class="nav-link" href="contacto.php">Contactenos <span class="sr-only">(current)</span>
          <img src="img/colombia.png" width="20px" height="20px" alt="">
        </a>
      </li> -->
      <li class="nav-item active">
        <a class="nav-link" href="nosotros.php">Nosotros <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="cotizar.php">
          <span class="sr-only">(current)</span>
          <span class="badge badge-light">0</span>
          <img style="padding: 5px;" width="30px" height="30px" src="../img/carrito-de-compras.png" alt="">
        </a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0" action="login.php">
        <button class="btn btn-warning my-2 my-sm-2" style="color: white; margin-right: 7px;" type="submit">Entrar</button>
    </form>
    <form class="form-inline my-2 my-lg-0" action="../login-sesion/logout.php">
        <button class="btn my-2 my-sm-0" style="background: #2c3e50; color: white;" type="submit">Salir</button>
    </form> 
  </div>
</nav>
<br>
<!-- final del encabezado -->