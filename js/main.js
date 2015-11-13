//------------------------------------------------------//
//                                                       //
//    CHANGE THE siteRoot VALUE BEFORE PUBLISHING SITE   //
//                                                       //
//-----------------------------------------------------//

//var siteRoot = "http://gotvms.no-ip.biz/PortalConteudos/";
//var siteRoot = "http://www.goring.pt/";
var siteRoot = "";

var noImageUrl = noImageUrl || 'img/semImagem.jpg';

Raven.config('http://1afc51fb780a402fa27c70273320ee6c@sentry.gotvmediasoftware.com/5', {
    // we highly recommend restricting exceptions to a domain in order to filter out clutter
    //whitelistUrls: ['example.com/scripts/']
}).install();


$.extend({
    getUrlVars: function () {
        var vars = [], hash;
        var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
        for (var i = 0; i < hashes.length; i++) {
            hash = hashes[i].split('=');
            vars.push(hash[0]);
            if (hash[1] && hash[1].indexOf('#') != -1) {
                hash[1] = hash[1].substring(0, hash[1].indexOf('#'));
            }
            vars[hash[0]] = decodeURIComponent(hash[1].replace(/\+/g, ' '));
        }
        return vars;
    },
    getUrlVar: function (name) {
        return $.getUrlVars()[name];
    }
});


// GOOGLE ANALYTICS
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-54380993-1', 'auto');
ga('send', 'pageview');



//SCRIPT CHAMADA DROPBOX ARTISTAS

function carregaArtistas() {
    // 1 - pedir ao serviço os artistas
    var urlPerformers = siteRoot + "API/performers";

    $.getJSON(urlPerformers, function (data) {
        var artistas = data;
        // 2 - publicar artistas na combo para o cliente escolher
        $("#artistas").html("");

        $.each(artistas, function (i, artista) {
            var option = criaOptionArtistas(artista);
            $(option).appendTo("#artistas");
        });
    });
}

function criaOptionArtistas(artista) {
    var newOption = '<li><a href="artistas.aspx?id=' + artista.idPerformer + '&name=' + encodeURIComponent(artista.name) + '">' + artista.name + '</a></li>';
    return newOption;
}



//SCRIPT CHAMADA DROPBOX CATEGORIAS

function carregaCategorias() {
    // 1 - pedir ao serviço as categorias
    var urlcategorias = siteRoot + "API/categories";

    $.getJSON(urlcategorias, function (data) {
        var categorias = data;
        // 2 - publicar categorias na combo para o cliente escolher
        $("#categorias").html("");

        $.each(categorias, function (i, categoria) {
            var option = criaOptionCategorias(categoria);
            $(option).appendTo("#categorias");
        });
    });
}

function criaOptionCategorias(categoria) {
    var newOption = '<li><a href="categorias.aspx?id=' + categoria.idCategory + '&name=' + encodeURIComponent(categoria.name) + '">' + categoria.name + '</a></li>';
    return newOption;
}




//SCRIPT CHAMADA TOP 12 - INDEX

function carregaTop(isMainPage) {
    var urltop = siteRoot + "API/top";

    $.getJSON(urltop, function (dataTop) {
        var topResults = isMainPage ? dataTop.results : dataTop.results.slice(0,5);
        $("#top").html("");

        $.each(topResults, function (i, content) {
            var optionTop = isMainPage ? criaOptionContent(content) : criaOptionContentSide(content);
            $(optionTop).appendTo("#top");
        });

        registerPreviewClicks("#top");
    });
}



// SCRIPT CHAMADA INFO DETALHE CONTEUDO

function carregaDetalhesConteudo(contentid) {
   
    var urldetail = siteRoot + "API/contents/" + contentid;

    $.getJSON(urldetail, function (detail) {
        $("#detalhes").html("");

        var optionDetail = criaDetalhe(detail);
        $(optionDetail).appendTo("#detalhes");
        registerPreviewClicks("#detalhes");
        registerHowToBuyClicked();

        $(".promocode").text(detail.promocode);
    });
}


function carregaNameCategory(byNameCategory) {
    $("#categoria").text(byNameCategory);
}

function carregaSearch(bySearch) {
    $("#resSearch").text(bySearch);
}


function carregaNameArtist(NameArtist) {
    $("#artista").text(NameArtist);
}

//// SCRIPT CHAMADA LISTA CATEGORIAS
function carregaCategoriesList(idCategory, currentPage) {
    currentPage = currentPage || 1;
    var startIndex = (currentPage - 1) * 10;
    var itemsPerPage = 10;

    var urlcategories = siteRoot + "API/contents?c=" + idCategory + "&i=" + startIndex + "&n=" + itemsPerPage;

    $.getJSON(urlcategories, function (arraycategorias) {
        var categoriesResults = arraycategorias.results;
        $("#categories_contents").html("");

        $.each(categoriesResults, function (i, content) {
            var optionCategory = criaOptionContentList(content);
            $(optionCategory).appendTo("#categories_contents");
        });

        if (arraycategorias.totalResults > itemsPerPage) {
            $("#category-pagination").pagination({
                items: arraycategorias.totalResults,
                itemsOnPage: itemsPerPage,
                currentPage: currentPage,
                prevText: '<<',
                nextText: '>>',
                displayedPages: 10,
                onPageClick: function (pageNumber, event) {
                    carregaCategoriesList(idCategory, pageNumber);
                }
            });
        }

        registerPreviewClicks("#categories_contents");
    });
}

//// SCRIPT CHAMADA LISTA ARTISTAS

function carregaArtistList(idArtist, currentPage) {
    currentPage = currentPage || 1;
    var startIndex = (currentPage - 1) * 10;
    var itemsPerPage = 10;

    var urlartists = siteRoot + "API/contents/performer/" + idArtist + "?i=" + startIndex + "&n=" + itemsPerPage;

    $.getJSON(urlartists, function (arrayartistas) {
        var artistsResults = arrayartistas.results;
        $("#artista_contents").html("");

        $.each(artistsResults, function (i, content) {
            var optionArtist = criaOptionContentList(content);
            $(optionArtist).appendTo("#artista_contents");
        });

        if (arrayartistas.totalResults > itemsPerPage) {
            $("#artist-pagination").pagination({
                items: arrayartistas.totalResults,
                itemsOnPage: itemsPerPage,
                currentPage: currentPage,
                prevText: '<<',
                nextText: '>>',
                displayedPages: 10,
                onPageClick: function (pageNumber, event) {
                    carregaArtistList(idArtist, pageNumber);
                }
            });
        }

        registerPreviewClicks("#artista_contents");
    });
}


// CREATE CLICK HANDLERS FOR THE DIFFERENT TRACKS
var my_jPlayer = null;
var playingTrack = null;

function createPreviewPlayer() {
    my_jPlayer = $("#jquery_jplayer");

    if (my_jPlayer) {
        my_jPlayer.jPlayer({
            swfPath: "js",
            supplied: "mp3",
            wmode: "window"
        });
    }
}



// FUNÇÃO REGISTO PREVIEW
function registerPreviewClicks(container) {
    $(container + " .track").click(function (e) {
        if (my_jPlayer) {
            if (playingTrack != e.target) {
                my_jPlayer.jPlayer("setMedia", {
                    mp3: $(this).attr("href")
                });
                my_jPlayer.jPlayer("play");
                playingTrack = e.target;
                ga('send', 'event', 'preview', $(this).attr("data-tag"));
            }
            else {
                // clicked same track, stop preview
                my_jPlayer.jPlayer("stop");
                playingTrack = null;
            }
        }
        $(this).blur();
        return false;
    });
}



// GERAR CONTEUDO PARA TOP INDEX

function criaOptionContent(content) {
    var imageUrl = siteRoot + "Images/" + content.imageFile;
    var previewUrl = siteRoot + "Previews/" + content.previewFile;
    var detailsUrl = "detalhe-conteudo.aspx?id=" + content.idContent;

    if (!content.imageFile) {
        imageUrl = noImageUrl;
    }

    var newOptionTop = '<div class="col-xs-3">' +
                            '<div class="content-thumbnail">' +
                                '<div class="image"><a href="' + detailsUrl + '">' +
                                    '<img class="img-responsive" src="' + imageUrl + '">' +
                                '</a></div>' +
                                '<div class="content-caption">' +
                                    '<div class="content-title">' + content.title + '</div>' +
                                    '<div class="content-performer"><a href="artistas.aspx?id=' + content.idPerformer + '&name=' + content.performer + '">' + content.performer + '</a></div>' +
                                    '<div class="content-buttons"><a href="' + previewUrl + '" class="btn btn-info track' + (content.previewFile ? '' : ' disabled') + '" role="button" data-tag="' + (content.performer + ':' + content.title) + '">OUVIR</a>' +
                                    '<a href="' + detailsUrl + '" class="btn btn-default" role="button">COMPRAR</a></div>' +
                                '</div>' +
                            '</div>' +
                        '</div>';

    return newOptionTop;
}



// GERAR CONTEUDO PARA LISTAS

function criaOptionContentList(content) {
    var imageUrl = siteRoot + "Images/" + content.imageFile;
    var previewUrl = siteRoot + "Previews/" + content.previewFile;
    var detailsUrl = "detalhe-conteudo.aspx?id=" + content.idContent;

    if (!content.imageFile) {
        imageUrl = noImageUrl;
    }

    var newOptionTop = '<tr>' +
                                '<td>' + content.title + '</td>' +
                                '<td class="content-performer-table"><a href="artistas.aspx?id=' + content.idPerformer + '&name=' + content.performer + '">' + content.performer + '</a></td>' +
                                '<td><a class="track top-preview-link' + (content.previewFile ? '' : ' disabled') + '" href="' + previewUrl + '"' + (content.previewFile ? '' : ' disabled') + ' data-tag="' + (content.performer + ':' + content.title) + '">OUVIR</a><a class="top-comprar-link" href="' + detailsUrl + '">COMPRAR ></a></td>' +
                                '<td>' + content.promocode + '</td>' +
                            '</tr>';
                        

    return newOptionTop;
}



// GERAR CONTEUDO PARA TOP LATERAL

function criaOptionContentSide(content) {
    var imageUrl = siteRoot + "Images/" + content.imageFile;
    var previewUrl = siteRoot + "Previews/" + content.previewFile;
    var detailsUrl = "detalhe-conteudo.aspx?id=" + content.idContent;

    if (!content.imageFile) {
        imageUrl = noImageUrl;
    }

    var newOptionTopSide = '<div class="content-thumbnail-side">' +
                                    '<div class="row">' +
                                        '<div class="col-xs-3">' +
                                            '<div class="image">' +
                                                '<a href="' + detailsUrl + '">' +
                                                '<img class="img-responsive" src="' + imageUrl + '">' +
                                                '</a>' +
                                            '</div>' +
                                        '</div>' +
                                        '<div class="col-xs-9">' +
                                            '<div class="content-caption-side">' +
                                                '<div class="content-title-side">' + content.title + '</div>' +
                                                '<div class="content-performer-side"><a href="artistas.aspx?id=' + content.idPerformer + '&name=' + content.performer + '">' + content.performer + '</a></div>' +
                                                '<div class="content-buttons-side">' +
                                                        '<a href="' + previewUrl + '" class="track top-preview-link' + (content.previewFile ? '' : ' disabled') + '" role="button" data-tag="' + (content.performer + ':' + content.title) + '">OUVIR</a>' +
                                                        '<a href="' + detailsUrl + '" class="top-comprar-link" role="button">COMPRAR ></a>' +
                                                '</div>' +
                                            '</div>' +
                                        '</div>' +
                                    '</div>' +
                            '</div>';

    return newOptionTopSide;
}




function criaDetalhe(content) {
    var imageUrl = siteRoot + "Images/" + content.imageFile;
    var previewUrl = siteRoot + "Previews/" + content.previewFile;
    var detailsUrl = "detalhe-conteudo.aspx?id=" + content.idContent;

    if (!content.imageFile) {
        imageUrl = noImageUrl;
    }

    var newOptionDetail =   '<div class="col-xs-4 details-img">' +
                                '<img src="' + imageUrl + '" class="img-responsive" />' +
                             '</div>' +
                             '<div class="col-xs-8">' +
                                '<div class="details-row">' +
                                    '<div class="details-label">Titulo</div><div class="details-text text-light">' + content.title + '</div>' +
                                '</div>' +
                                '<div class="details-row">' +
                                    '<div class="details-label">Artista</div><div class="details-text"><a href="artistas.aspx?id=' + content.idPerformer + '&name=' + content.performer + '">' + content.performer + '</a></div>' +
                                '</div>' +
                                '<div class="details-row">' +
                                    '<div class="details-label">Código</div><div class="details-text"><strong>' + content.promocode + '</strong></div>' +
                                '</div>' +
                                '<div class="details-row">' +
                                    '<div class="details-label">Preço</div><div class="details-text text-light">10 UTT</div>' +
                                '</div>' +
                                '<div class="details-row">' +
                                    '<div class="details-label">Validade</div><div class="details-text text-light">90 dias</div>' +
                                '</div>' +
                                '<div class="details-buttons">' +
                                    '<a href="#comoComprar" id="howToBuy" data-toggle="collapse" class="btn btn-info" role="button" data-tag="' + (content.performer + ':' + content.title) + '">COMO COMPRAR <span class="glyphicon glyphicon-chevron-down"></span></a>' +
                                    '<a href="javascript:history.go(-1);" class="btn btn-default" role="button">CANCELAR</a></div>' +
                                '</div>' +
                            '</div>';

    return newOptionDetail;
}

function registerHowToBuyClicked() {
    $("#howToBuy").click(function (e) {
        if (!$('#comoComprar').hasClass('in')) {
            ga('send', 'event', 'comprar', $(this).attr("data-tag"));
        }
    });
}


//SCRIPT DE QUERY DA PESQUISA

function fetchSearch(paramSearch, currentPage) {
    currentPage = currentPage || 1;
    var startIndex = (currentPage - 1) * 10;
    var itemsPerPage = 10;

    var urlSearchRes = siteRoot + "API/contents?s=" + paramSearch + "&i=" + startIndex + "&n=" + itemsPerPage;

    $.getJSON(urlSearchRes, function (arrayprocura) {
        var searchResults = arrayprocura.results;
        $("#search").html("");

        if (arrayprocura.totalResults === 0) {
            $("#search-results").html('<div class="search-not-found">Não foram encontrados conteúdos correspondentes à sua procura</div>');

        } else {
            $.each(searchResults, function (i, content) {
                var optionSearch = criaOptionContentList(content);
                $(optionSearch).appendTo("#search");
            });
        }
        $("#search-results").css('display', 'block');

        if (arrayprocura.totalResults>itemsPerPage){
            $("#search-pagination").pagination({
                items: arrayprocura.totalResults,
                itemsOnPage: itemsPerPage,
                currentPage: currentPage,
                prevText: '<<',
                nextText: '>>',
                displayedPages: 10,
                onPageClick: function (pageNumber, event) {
                    fetchSearch(paramSearch, pageNumber);
                }
            });
        }
        registerPreviewClicks("#search");
    });
}

function init_map() {
    var var_location = new google.maps.LatLng(-8.825957, 13.229504);

    var var_mapoptions = {
        center: var_location,
        zoom: 16
    };

    var var_marker = new google.maps.Marker({
        position: var_location,
        map: var_map,
        title: "Venice"
    });

    var var_map = new google.maps.Map(document.getElementById("map-container"),
        var_mapoptions);

    var_marker.setMap(var_map);

}