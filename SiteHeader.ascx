<%@ Control Language="C#" AutoEventWireup="false" %>

<div class="row navbar-fixed-top">
    <div class="menu-top">
<% if (Request.Url.Host.ToLowerInvariant().Contains("goring.")) { %>
        <script type="text/javascript">
            var noImageUrl = 'img/semImagem.jpg';
        </script>
        <a class="navbar-brand logo" href="index.aspx">
            <img src="img/logo.png" />
        </a>
<% } else { %>
        <script type="text/javascript">
            var noImageUrl = 'img/semImagem-unitel.jpg';
        </script>
        <a class="navbar-brand logo" href="http://www.unitel.ao/">
            <img src="img/logo_unitel.png" />
        </a>
        <a class="navbar-brand logo" href="index.aspx" style="padding-top: 10px; margin-left: 270px;">
            <img src="img/home-icon.png" alt="Voltar ao início" /><p class="text-center"><small>início</small></p>
        </a>
<% } %>
    </div>
</div>