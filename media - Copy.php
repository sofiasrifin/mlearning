<?php
include "configurasi/koneksi.php";
include "configurasi/library.php";
include "configurasi/fungsi_indotgl.php";
include "configurasi/fungsi_combobox.php";
include "configurasi/class_paging.php";


session_start();
error_reporting(0);
include "timeout.php";

if($_SESSION[login]==1){
    if(!cek_login()){
        $_SESSION[login] = 0;
    }
}
if($_SESSION[login]==0){
  echo "<link href='css/screen.css' rel='stylesheet' type='text/css'><link href='css/reset.css' rel='stylesheet' type='text/css'>


 <center><br><br><br><br><br><br>Maaf, untuk masuk <b>Halaman</b><br>
  <center>anda harus <b>Login</b> dahulu!<br><br>";
 echo "<div> <a href='index.php'><img src='images/kunci.png'  height=176 width=143></a>
             </div>";
  echo "<input type=button class=simplebtn value='LOGIN DI SINI' onclick=location.href='index.php'></a></center>";
}
else{
if (empty($_SESSION['username']) AND empty($_SESSION['passuser']) AND $_SESSION['login']==0){
 //  echo "<link href='css/screen.css' rel='stylesheet' type='text/css'><link href='css/reset.css' rel='stylesheet' type='text/css'>


 // <center><br><br><br><br><br><br>Maaf, untuk masuk <b>Halaman</b><br>
 //  <center>anda harus <b>Login</b> dahulu!<br><br>";
 echo "<div> <a href='index.php'><img src='images/kunci.png'  height=176 width=143></a>
             </div>";
  echo "<input type=button class=simplebtn value='LOGIN DI SINI' onclick=location.href='index.php'></a></center>";
}
else{
?>
<!DOCTYPE html>
<html class="no-js">
    
    <head>
        <title>.::E-Learning::.</title>
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
        <link href="assets/styles.css" rel="stylesheet" media="screen">
        <link href="assets/DT_bootstrap.css" rel="stylesheet" media="screen">
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>

        <!-- <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png"> -->
        <!-- <link rel="stylesheet" href="css/reset.css" type="text/css"/> -->
        <link rel="stylesheet" href="css/fancybox.css" type="text/css"/>
        <link rel="stylesheet" href="css/jquery.wysiwyg.css" type="text/css"/>
        <link rel="stylesheet" href="css/jquery.ui.css" type="text/css"/>
        <link rel="stylesheet" href="css/visualize.css" type="text/css"/>
        <link rel="stylesheet" href="css/visualize-light.css" type="text/css"/>
        <link type="text/css" rel="stylesheet" media="all" href="css_chat/chat.css" />

        <script type="text/javascript" src="js_chat/chat.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery.visualize.js"></script>
        <script type="text/javascript" src="js/jquery.wysiwyg.js"></script>
        <script type="text/javascript" src="js/tiny_mce/jquery.tinymce.js"></script>
        <script type="text/javascript" src="js/jquery.fancybox.js"></script>
        <script type="text/javascript" src="js/jquery.idtabs.js"></script>
        <script type="text/javascript" src="js/jquery.datatables.js"></script>
        <script type="text/javascript" src="js/jquery.jeditable.js"></script>
        <script type="text/javascript" src="js/jquery.ui.js"></script>
        <script type="text/javascript" src="js/clock.js"></script>

        <script type="text/javascript" src="js/excanvas.js"></script>
        <script type="text/javascript" src="js/cufon.js"></script>
        <script type="text/javascript" src="js/Geometr231_Hv_BT_400.font.js"></script>
        <script src="vendors/jquery-1.9.1.js"></script>

        <!-- Bootstrap -->
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="vendors/datatables/js/jquery.dataTables.min.js"></script>


        <script src="assets/scripts.js"></script>
        <script src="assets/DT_bootstrap.js"></script>


    <script language="javascript" type="text/javascript">
        tinyMCE_GZ.init({
        plugins : 'style,layer,table,save,advhr,advimage, ...',
            themes  : 'simple,advanced',
            languages : 'en',
            disk_cache : true,
            debug : false
    });
    </script>
    <script language="javascript" type="text/javascript"
    src="../tinymcpuk/tiny_mce_src.js"></script>
    <script type="text/javascript">
    tinyMCE.init({
            mode : "textareas",
            theme : "advanced",
            plugins : "table,youtube,advhr,advimage,advlink,emotions,flash,searchreplace,paste,directionality,noneditable,contextmenu",
            theme_advanced_buttons1_add : "fontselect,fontsizeselect",
            theme_advanced_buttons2_add : "separator,preview,zoom,separator,forecolor,backcolor,liststyle",
            theme_advanced_buttons2_add_before: "cut,copy,paste,separator,search,replace,separator",
            theme_advanced_buttons3_add_before : "tablecontrols,separator,youtube,separator",
            theme_advanced_buttons3_add : "emotions,flash",
            theme_advanced_toolbar_location : "top",
            theme_advanced_toolbar_align : "left",
            theme_advanced_statusbar_location : "bottom",
            extended_valid_elements : "hr[class|width|size|noshade]",
            file_browser_callback : "fileBrowserCallBack",
            paste_use_dialog : false,
            theme_advanced_resizing : true,
            theme_advanced_resize_horizontal : false,
            theme_advanced_link_targets : "_something=My somthing;_something2=My somthing2;_something3=My somthing3;",
            apply_source_formatting : true
    });

        function fileBrowserCallBack(field_name, url, type, win) {
            var connector = "../../filemanager/browser.html?Connector=connectors/php/connector.php";
            var enableAutoTypeSelection = true;

            var cType;
            tinymcpuk_field = field_name;
            tinymcpuk = win;

            switch (type) {
                case "image":
                    cType = "Image";
                    break;
                case "flash":
                    cType = "Flash";
                    break;
                case "file":
                    cType = "File";
                    break;
            }

            if (enableAutoTypeSelection && cType) {
                connector += "&Type=" + cType;
            }

            window.open(connector, "tinymcpuk", "modal,width=600,height=400");
        }
    </script>

    <script language="javascript" type="text/javascript">
            function pertanyaan(){
             if(confirm('Anda yakin yang ingin keluar?')){
                return true;
                 }else{
                return false;
                 }
            }
    </script>

    </head>
    
    <body>
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="#">Admin Panel</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i> <?php echo "$_SESSION[namalengkap]";?> <i class="caret"></i>
                                </a>
                                <ul class="dropdown-menu">
                                <?php
                                    echo "
                                    <li>
                                        <a tabindex='-1' href='media.php?module=siswa&act=detailprofilsiswa&id=$_SESSION[idsiswa]'>Edit Profil</a>
                                    </li>
                                    <li>
                                        <a tabindex='-1' href='media.php?module=siswa&act=detailaccount'>
                                        Edit Password</a>
                                    </li>
                                    <li class='divider'></li>
                                    <li>
                                        <a tabindex='-1' href='login.php'>Logout</a>
                                    </li>";
                                ?>
                                </ul>
                            </li>
                        </ul>
                        <ul class="nav">
                            <li>
                                <a href="?module=home">Dashboard</a>
                            </li>
                        </ul>
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </div>
        </div>

        <!-- Content -->
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3" id="sidebar">
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
                        <?php include "menu.php"; ?>
                    </ul>
                </div>
                
                <!--/span-->
                <div class="span9" id="content">
<!--                     <div class="row-fluid">
                            <div class="navbar">
                                <div class="navbar-inner">
                                    <ul class="breadcrumb">
                                        <i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
                                        <i class="icon-chevron-right show-sidebar" style="display:none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
                                        <li>
                                            <a href="#">Dashboard</a> <span class="divider">/</span>    
                                        </li>
                                        <li>
                                            <a href="#">Settings</a> <span class="divider">/</span> 
                                        </li>
                                        <li class="active">Tools</li>
                                    </ul>
                                </div>
                            </div>
                        </div> -->

                        <!-- block -->
<!--                     <div class="row-fluid">
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">Statistics</div>
                                <div class="pull-right"><span class="badge badge-warning">View More</span>

                                </div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span3">
                                    <div class="chart" data-percent="73">73%</div>
                                    <div class="chart-bottom-heading"><span class="label label-info">Visitors</span>

                                    </div>
                                </div>
                                <div class="span3">
                                    <div class="chart" data-percent="53">53%</div>
                                    <div class="chart-bottom-heading"><span class="label label-info">Page Views</span>

                                    </div>
                                </div>
                                <div class="span3">
                                    <div class="chart" data-percent="83">83%</div>
                                    <div class="chart-bottom-heading"><span class="label label-info">Users</span>

                                    </div>
                                </div>
                                <div class="span3">
                                    <div class="chart" data-percent="13">13%</div>
                                    <div class="chart-bottom-heading"><span class="label label-info">Orders</span>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>  
                        <!-- /block -->

                         <!-- Konten PHP -->
                    <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                                <?php include "content.php"; ?>
                            <div class="block-content collapse in">
                            </div>
                        </div>
                        <!-- /block -->
                    </div>   
                        <!-- End Konten PHP -->
                </div>
            </div>
            <hr>
            <footer>
                <p>&copy; Asrifin Sofi</p>
            </footer>
        </div>
        <!--/.fluid-container-->
        <script src="vendors/jquery-1.9.1.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="vendors/easypiechart/jquery.easy-pie-chart.js"></script>
        <script src="assets/scripts.js"></script>
        <script>
        $(function() {
            // Easy pie charts
            $('.chart').easyPieChart({animate: 1000});
        });
        </script>
    </body>

</html>
<?php
}
}
?>
