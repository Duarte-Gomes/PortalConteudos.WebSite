<%@ Control Language="C#" AutoEventWireup="false" %>
        <!-- Barra intruções, categorias e search -->
        <div class="barra-centro">
            <div class="row">
                <div class="col-xs-12 lett-barra-centro">
                    Se és cliente Unitel e queres personalizar o teu toque de espera, escolhe aqui a tua música favorita.<br />
                    Podes fazer a tua pesquisa por Artistas, por Géneros ou podes Procurar por um Nome.
                </div>
            </div>
            <div class="row row-filtro">
                <div class="col-xs-12">
                    <div class="text-center">
                        <div class="dropdown btn-group dropdown-filtro">
                            <button class="btn btn-default dropdown-filtro-label dropdown-toggle" data-toggle="dropdown">Artistas</button>
                            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">
                                <span class="caret"></span>
                                <span class="sr-only">Artistas</span>
                            </button>
                            <ul class="dropdown-menu dropdown-filtro-list" role="menu" aria-labelledby="dropdownMenu1" id="artistas">
                                <li><i class="glyphicon glyphicon-refresh"></i>Por favor aguarde</li>
                            </ul>
                        </div>
                        <div class="dropdown btn-group dropdown-filtro">
                            <button class="btn btn-default dropdown-filtro-label dropdown-toggle" data-toggle="dropdown">Géneros</button>
                            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown">
                                <span class="caret"></span>
                                <span class="sr-only">Géneros</span>
                            </button>
                            <ul class="dropdown-menu dropdown-filtro-list" role="menu" aria-labelledby="dropdownMenu2" id="categorias">
                                <li><i class="glyphicon glyphicon-refresh"></i>Por favor aguarde</li>
                            </ul>
                        </div>
                        <form class="search-box" name="result" action="resultados-procura.aspx" method="get">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Procurar por nome" name="search" />
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="submit" value="submit"><span class="glyphicon glyphicon-search"></span></button>
                                </span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
