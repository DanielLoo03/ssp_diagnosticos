<?php  
 include "../../../config/conexion.php";
 mysqli_set_charset($con, "utf-8");
 
 header('Content-Type: text/html; charset=utf-8');

 ?> 
<?php
	session_start();

	if(!isset($_SESSION['admin_login']))	
	{
		header("location: ../../../index.php");  
	}
?>

<!DOCTYPE html>
<html lang="es">
  <head>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    
    <meta name="description" content="Vali is a responsive and free admin theme built with Bootstrap 5, SASS and PUG.js. It's fully customizable and modular.">
    <!-- Twitter meta-->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:site" content="@pratikborsadiya">
    <meta property="twitter:creator" content="@pratikborsadiya">
    <!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Vali Admin">
    <meta property="og:title" content="Vali - Free Bootstrap 5 admin theme">
    <meta property="og:url" content="http://pratikborsadiya.in/blog/vali-admin">
    <meta property="og:image" content="http://pratikborsadiya.in/blog/vali-admin/hero-social.png">
    <meta property="og:description" content="Vali is a responsive and free admin theme built with Bootstrap 5, SASS and PUG.js. It's fully customizable and modular.">
    <title>Agregar Usuarios || Recursos Humanos</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="../../../css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  </head>
  <body class="app sidebar-mini">
    <!-- Navbar-->
    <header class="app-header">
      <a class="app-header__logo" href="index.php" style="font-size: 20px">
        <?php
                    
          if(isset($_SESSION['admin_login']))
            {
        ?>
        <?php
          echo $_SESSION['admin_login'];
            }
          ?>
          
        
      </a>
      <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
      <!-- Navbar Right Menu-->
      <ul class="app-nav">
        <!--<li class="app-search">
          <input class="app-search__input" type="search" placeholder="Search">
          <button class="app-search__button"><i class="bi bi-search"></i></button>
        </li>-->
        <!--Notification Menu-->
        <!--<li class="dropdown"><a class="app-nav__item" href="#" data-bs-toggle="dropdown" aria-label="Show notifications"><i class="bi bi-bell fs-5"></i></a>
          <ul class="app-notification dropdown-menu dropdown-menu-right">
            <li class="app-notification__title">You have 4 new notifications.</li>
            <div class="app-notification__content">
              <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><i class="bi bi-envelope fs-4 text-primary"></i></span>
                  <div>
                    <p class="app-notification__message">Lisa sent you a mail</p>
                    <p class="app-notification__meta">2 min ago</p>
                  </div></a></li>
              <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><i class="bi bi-exclamation-triangle fs-4 text-warning"></i></span>
                  <div>
                    <p class="app-notification__message">Mail server not working</p>
                    <p class="app-notification__meta">5 min ago</p>
                  </div></a></li>
              <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><i class="bi bi-cash fs-4 text-success"></i></span>
                  <div>
                    <p class="app-notification__message">Transaction complete</p>
                    <p class="app-notification__meta">2 days ago</p>
                  </div></a></li>
              <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><i class="bi bi-envelope fs-4 text-primary"></i></span>
                  <div>
                    <p class="app-notification__message">Lisa sent you a mail</p>
                    <p class="app-notification__meta">2 min ago</p>
                  </div></a></li>
              <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><i class="bi bi-exclamation-triangle fs-4 text-warning"></i></span>
                  <div>
                    <p class="app-notification__message">Mail server not working</p>
                    <p class="app-notification__meta">5 min ago</p>
                  </div></a></li>
              <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><i class="bi bi-cash fs-4 text-success"></i></span>
                  <div>
                    <p class="app-notification__message">Transaction complete</p>
                    <p class="app-notification__meta">2 days ago</p>
                  </div></a></li>
            </div>
            <li class="app-notification__footer"><a href="#">See all notifications.</a></li>
          </ul>
        </li>-->
        <!-- User Menu-->
        <li class="dropdown"><a class="app-nav__item" href="#" data-bs-toggle="dropdown" aria-label="Open Profile Menu"><i class="bi bi-person fs-4"></i></a>
          <ul class="dropdown-menu settings-menu dropdown-menu-right">
            
          <li><a class="dropdown-item" href="../../../cerrar.php"><i class="bi bi-box-arrow-right me-2 fs-5"></i> Cerrar Sesión</a></li>
          </ul>
        </li>
      </ul>
    </header>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <?php require("aside.php")?><!--ASIDE</p>-->
	<main class="app-content">
	    <div class="app-title">
            <div>
                <h1><i class="bi bi-person-vcard">&nbsp;&nbsp;&nbsp;</i> Graficas Alumnos</h1><br>
                <p><a class="btn btn-secondary" href="javascript: history.go(-1)"><i class="bi bi-x-circle-fill me-2"></i>Regresar</a></p>
            </div>
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item"><i class="bi bi-house-door fs-6"></i></li>
                    <li class="breadcrumb-item">Gr��ficas Alumnos</li>
                </ul>
        </div>
        <div class="col-md-10">
          <div class="tab-content">
            <div class="tab-pane active" id="user-timeline">
              <div class="tile user-settings">
                <h4 class="line-head">Alumnos por género</h4>
                <div class="table-responsive">
           
            <?php
include "../../../config/conexion.php";
 $con->set_charset("utf8mb4");

$query_cuantos_hombres = "SELECT COUNT(*) as count FROM datosGenerales WHERE d5 = 'H'";
$query_cuantas_mujeres = "SELECT COUNT(*) as count FROM datosGenerales WHERE d5 = 'M'";
$query_cuantos_prefiero_no_decir = "SELECT COUNT(*) as count FROM datosGenerales WHERE d5 = 'Prefiero no decir'";

$result_cuantos_hombres = mysqli_query($con, $query_cuantos_hombres);
if (!$result_cuantos_hombres) {
    die("Error en la consulta alumnos por institución: " . mysqli_error($con));
}

$result_cuantas_mujeres = mysqli_query($con, $query_cuantas_mujeres);
if (!$result_cuantas_mujeres) {
    die("Error en la consulta alumnos por institución: " . mysqli_error($con));
}

$result_cuantos_prefiero_no_decir = mysqli_query($con, $query_cuantos_prefiero_no_decir);
if (!$result_cuantos_prefiero_no_decir) {
    die("Error en la consulta alumnos por institución: " . mysqli_error($con));
}

$count_cuantos_hombres = mysqli_fetch_assoc($result_cuantos_hombres)['count'];
$count_cuantas_mujeres = mysqli_fetch_assoc($result_cuantas_mujeres)['count'];
$count_cuantos_prefiero_no_decir = mysqli_fetch_assoc($result_cuantos_prefiero_no_decir)['count'];
?>
          
<div id="alumnosPorGeneroChart"></div>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    try {
      var countCuantosHombres = <?php echo $count_cuantos_hombres; ?>;
      var countCuantasMujeres = <?php echo $count_cuantas_mujeres; ?>;
      var countCuantosPrefieroNoDecir = <?php echo $count_cuantos_prefiero_no_decir; ?>;

      let grafica = new ApexCharts(document.getElementById('alumnosPorGeneroChart'), {
          chart: {
              type: "pie",
              width: 450,
              height: 250,
              parentHeightOffset: 0,
              toolbar: {
                  show: true,
                  tools: {
                      download: true,
                      selection: true,
                      zoom: true,
                      zoomin: true,
                      zoomout: true,
                      pan: true,
                      reset: true
                  }
              }
          },
          plotOptions: {
              pie: {
                  donut: {
                      size: '50%'
                  }
              }
          },
          dataLabels: {
              enabled: false
          },
          fill: {
              opacity: 1
          },
          series: [countCuantosHombres, countCuantasMujeres, countCuantosPrefieroNoDecir],
          labels: ['Hombres', 'Mujeres', 'Prefiero no decir'],
          tooltip: {
              theme: 'dark'
          },
          grid: {
              padding: {
                  top: 10,
                  right: 0,
                  left: 10,
                  bottom: -4
              },
              strokeDashArray: 4
          },
          legend: {
              show: true,
              position: 'bottom',
              offsetY: 12,
              markers: {
                  width: 10,
                  height: 10,
                  radius: 100
              },
              itemMargin: {
                  horizontal: 8,
                  vertical: 8
              }
          }
      });
      grafica.render();
    } 
    catch (error) {
      console.error('Error:', error);
    }
  });
</script>
    

		        </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
    
    <!-- Essential javascripts for application to work-->
    <script src="../../../js/jquery-3.7.0.min.js"></script>
    <script src="../../../js/bootstrap.min.js"></script>
    <script src="../../../js/main.js"></script>
    <!-- Page specific javascripts-->
    <!-- Google analytics script-->
    <script type="text/javascript">
      if(document.location.hostname == 'pratikborsadiya.in') {
      	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
      	ga('create', 'UA-72504830-1', 'auto');
      	ga('send', 'pageview');
      }
    </script>
  </body>
</html>