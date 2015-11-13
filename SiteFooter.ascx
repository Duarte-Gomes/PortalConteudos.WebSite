<%@ Control Language="C#" AutoEventWireup="false" %>

<div class="row footer">
    <div class="footer-copyright text-muted">Copyright 2014 Go - Edições e Produções, Lda</div>
<% if (Request.Url.Host.ToLowerInvariant().Contains("goring.")) { %>
    <div class="footer-links">
        <a href="sobre.aspx">Sobre</a>
        <a href="contactos.aspx">Contactos</a>
    </div>
<% } %>
</div>
