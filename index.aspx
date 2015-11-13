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

        <div id="jquery_jplayer"></div>

        <!--[if lt IE 7]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <uc:header runat="server"></uc:header>

        <!-- Main jumbotron for a primary marketing message or call to action -->
        <div id="promos-carousel" class="carousel slide" data-ride="carousel" style="max-height: 482px; overflow: hidden;">
            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <div style="background: url(img/teaserAnnaJoyce.jpg) center center; background-repeat: no-repeat; /*background-size: cover; */" class="slider-size"></div>
                </div>
                <div class="item">
                    <div style="background: url(img/teaserVagabanda.jpg) center center; background-repeat: no-repeat; /*background-size: cover; */" class="slider-size"></div>
                </div>
                <div class="item">
                    <div style="background: url(img/teaserDaMagical.jpg) center center; background-repeat: no-repeat; /*background-size: cover; */" class="slider-size"></div>
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#promos-carousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
            </a>
            <a class="right carousel-control" href="#promos-carousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
            </a>
        </div>

        <!-- Barra intruções, categorias e search -->
        <uc:SearchBar runat="server"></uc:SearchBar>

        <!-- Container Top -->
        
            <div class="row contents-margin text-center">
                <div class="page-title-rectangle"></div><div class="page-title-wedge-left"></div>
                <div class="page-title">MAIS POPULARES</div>
                <div class="page-title-wedge-right"></div><div class="page-title-rectangle"></div>
            </div>
            <div class="row contents-margin" id="top">
            </div>
        
        <!-- /container -->

        <uc:footer runat="server"></uc:footer>

    </div>

    <script src="Scripts/jquery-1.9.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="js/jquery.jplayer.min.js"></script>

    <script src="//cdn.ravenjs.com/1.1.15/jquery,native/raven.min.js"></script>

    <script src="js/main.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            try {
                createPreviewPlayer();
                carregaTop(true);
                carregaCategorias();
                carregaArtistas();
            } catch (ex) {
                Raven.captureException(ex);
            }
        });

    </script>
</body>
</html>
