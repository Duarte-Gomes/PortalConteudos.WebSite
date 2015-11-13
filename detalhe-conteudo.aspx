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

        <!-- Barra intruções, categorias e search -->
        <uc:SearchBar runat="server"></uc:SearchBar>

        <!-- PUB container -->
        <div class="row contents-margin text-center">
        </div>

        <!-- MAIN container -->
        <div class="row contents-margin">

            <div class="col-xs-4">
                <div class="text-left">
                    <div class="page-title">TOP 5</div>
                    <div class="page-title-wedge-right"></div><div class="page-title-rectangle"></div>
                </div>

                <!-- COLUNA TOP 5 -->
                <div id="top">
                </div>
            </div>

            <!-- COLUNA DETALHE CONTEUDO-->
            <div class="col-xs-8 content-details-container">
                <div class="row" id="detalhes">
                    <div class="text-center muted">por favor aguarde...</div>
                </div>

                <div id="comoComprar" class="panel-collapse collapse">
                    <div class="details-instructions">
                        <div class="text-primary"><strong>Para comprar o Serviço Toques de Espera da Unitel, basta:</strong></div>
                        <div class="text-light">Enviar um SMS com <strong><span class="promocode"></span></strong> para o <strong>19121</strong>.</div>
                    </div>

                    <div class="details-instructions clearfix text-light">
                        <div class="text-info"><span class="col-xs-4">Subscrição do serviço *</span><span class="col-xs-8">144kz (20 UTT) válido por 90 dias</span></div>
                        <div class="text-info"><span class="col-xs-4">Compra de um toque *</span><span class="col-xs-8">72kz (10 UTT) válido por 90 dias</span></div>
                        <div class="text-info"><span class="col-xs-4">Custo de cada SMS enviado</span><span class="col-xs-8">9kz (1,25 UTT)</span></div>
                    </div>
                    <div class="details-instructions text-light">
                        <span class="text-info">*</span> <small class="text-muted">5 dias antes de terminar a validade da subscrição, receberá
                        uma notificação a perguntar se deseja renovar ou não a subscrição do serviço, bem como a
                        compra da música.</small>
                    </div>
                </div>
            </div>
        </div>

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
                var byId = $.getUrlVar('id');
                carregaDetalhesConteudo(byId);
                carregaTop(false);
                carregaCategorias();
                carregaArtistas();
            } catch (ex) {
                Raven.captureException(ex);
            }
        });

    </script>

</body>
</html>
