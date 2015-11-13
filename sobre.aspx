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
                
        <div class="row contents-margin text-left">
            <div class="page-title">SOBRE</div>
            <div class="page-title-wedge-right"></div><div class="page-title-rectangle"></div>
        </div>
        <div>
            <p>A marca <i style="color: #ff6a00; font-weight: 600;">GoRing</i> é propriedade da <b style="color: #00aaff">Go - Edições e Produções, Lda</b>, cuja actividade é dedicada à criação e desenvolvimento de soluções móveis e de entretenimento.<br />
            Especializada na criação e implementação de serviços para as Operadores Móveis sobre conteúdos musicais, em parceria com os músicos e com as editoras discográficas locais e internacionais.
            <br />
            <br />
            O website <i style="color: #ff6a00; font-weight: 600;">GoRing</i> tem como único objectivo o de promover os conteúdos da <b style="color: #00aaff">Go - Edições e Produções, Lda</b>, ao informar os clientes Unitel sobre as condições particulares de activição do serviço Toques de Espera e também sobre a compra de um toque específico.</p>
        </div>
            
        <uc:footer runat="server"></uc:footer>

    </div>

    <script src="Scripts/jquery-1.9.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>

    <script src="//cdn.ravenjs.com/1.1.15/jquery,native/raven.min.js"></script>

    <script src="js/main.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            try {
                carregaCategorias();
                carregaArtistas();
            } catch (ex) {
                Raven.captureException(ex);
            }
        });

    </script>

</body>
</html>
