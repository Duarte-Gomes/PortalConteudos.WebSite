<%@ Page Language="C#" AutoEventWireup="false" %>
<%@ Register TagPrefix="uc" TagName="Header" Src="~/SiteHeader.ascx" %>
<%@ Register TagPrefix="uc" TagName="Footer" Src="~/SiteFooter.ascx" %>
<%@ Register TagPrefix="uc" TagName="SearchBar" Src="~/SearchBar.ascx" %>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>GoRing - Personaliza o teu toque de espera</title>
    <meta name="description" content="">

    <link href='http://fonts.googleapis.com/css?family=Roboto:900,400,300,300italic,100,700italic,700' rel='stylesheet' type='text/css'>

    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-theme.min.css" rel="stylesheet" />

    <link rel="stylesheet" href="css/main.css" />

    <!--[if gte IE 9]>
      <style type="text/css">
        .gradient {
           filter: none;
        }
      </style>
    <![endif]-->

</head>
<body>

    <div class="container">

        <!--[if lt IE 7]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <uc:header runat="server"></uc:header>

        <!-- Barra intruções, categorias e search -->
        <uc:SearchBar runat="server"></uc:SearchBar>

        <!-- Container Top -->
        
        <div class="row contents-margin text-left">
            <div class="page-title">CONTACTOS</div>
            <div class="page-title-wedge-right"></div><div class="page-title-rectangle"></div>
        </div>
        <div class="row contents-margin">
            <div id="map-container" class="col-xs-8 map-container">
            </div>
            <div class="col-xs-4">
                <address>
                    <i style="color: #ff6a00; font-weight: 600;">Go Edições e Produções, Lda.</i><br>
                     Rua de João Seca, nº23, 1º Esquerdo, Maianga<br>
                    Luanda, Angola<br>
                    <br>
                    Contacto: +244 937 55 73 51
                </address>
            </div>
        </div>
              
        <uc:footer runat="server"></uc:footer>

    </div>

    <script src="Scripts/jquery-1.9.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>

    <script src="//cdn.ravenjs.com/1.1.15/jquery,native/raven.min.js"></script>

    <script src="js/main.js"></script>
    
    <script src="http://maps.google.com/maps/api/js?sensor=false"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            try {
                google.maps.event.addDomListener(window, 'load', init_map);
                carregaCategorias();
                carregaArtistas();
            } catch (ex) {
                Raven.captureException(ex);
            }
        });

    </script>

</body>
</html>
