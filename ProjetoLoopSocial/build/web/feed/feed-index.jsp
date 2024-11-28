<!--UNIVERSIDADE DE MOGI DAS CRUZES - UMC
ANDRÉ HIDEKI HATAISHI DA SILVA - 11231100985
RODRIGO GAZOLLI DE OLIVEIRA - 11231101823
17314-PADRÕES DE PROJETOS ORIENTADOS A OBJETOS
PROFESSOR: PEDRO TOLEDO
07/11/2024
PROJETO REDE SOCIAL-->

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.*"%>
<%@page import="model.dao.*"%>
<%@page import="java.lang.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    // Verifica se usuário está logado
    Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");
    if (usuarioLogado == null) {
        response.sendRedirect("../pagina-inicial");
        return;
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>   
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!--titulo-->
        <title>Feed - Loop Social</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

        <!--Link css-->
        <link href="../css/styles.css" rel="stylesheet" type="text/css"/>        
        <!--Link icone-->
        <link rel="icon" type="image/x-icon" href="../img/logo-b.png" />
    </head>

    <body>
        <header>
            <!--barra de navegação-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container px-5">
                    <a href="../pagina-inicial"><img src="../img/logo-b.png" alt="alt" height="40px" width="50px"/></a>
                    <a class="navbar-brand" href="../pagina-inicial">Loop Social</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item"><a class="nav-link" aria-current="page" href="../pagina-inicial">Início</a></li>                        
                                <%
                                    // Verifica se usuário está logado                                
                                    if (usuarioLogado != null) { %> 
                            <li class="nav-item"><a class="nav-link active" href="../feed/feed-index.jsp">Feed</a></li>
                            <li class="nav-item"><a class="nav-link" href="../sobre-nos/sobre-nos-index.jsp">Sobre-nós</a></li>
                            <li class="nav-item"><a class="nav-link" href="../login/logout.jsp">Sair</a></li>
                                <%
                                } else {
                                %> 
                            <li class="nav-item"><a class="nav-link" href="../sobre-nos/sobre-nos-index.jsp">Sobre-nós</a></li>
                            <li class="nav-item"><a class="nav-link" href="../cadastro/cadastrar-index.jsp">Cadastrar</a></li>
                            <li class="nav-item"><a class="nav-link" href="../login/login-index.jsp">Entrar</a></li>
                                <%
                                    }
                                %>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <main>
            <div class="container-fluid gedf-wrapper">
                <div class="row">
                    <div class="col-md-3">
                        <div class="card">

                            <!--Card esquerdo-->
                            <div class="card-body">
                                <%
                                    Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
                                %>
                                <div class="h5"> Bem-vindo, <%= usuario.getNome()%>! </div>
                                <div class="h5"></div>
                                <div class="h7 text-muted">Sobrenome: <%= usuario.getSobrenome()%></div>
                                <div class="h7"><%= usuario.getResumo()%></div>
                                <div class="h7 mt-2"> <button class="btn-sm btn-dark"><a href="../editar-perfil/editar-perfil-index.jsp" class="link-light" style="text-decoration: none;">Editar Perfil</a </button> </div>
                                <!--                        
                                <div class="h7">Developer of web applications, JavaScript, PHP, Java, Python, Ruby, Java, Node.js, etc.
                                                        </div>-->
                            </div>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">
                                    <div class="h6 text-muted">Seguidores</div>
                                    <div class="h5"><%= usuario.getSeguidores()%> </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="h6 text-muted">Seguindo</div>
                                    <div class="h5"><%= usuario.getSeguindo()%></div>
                                </li>
                                <li class="list-group-item">Todos os direitos reservados.</li>
                            </ul>
                        </div>
                    </div>                                

                    <div class="col-md-6 gedf-main">
                        <!--- \\\\\\\Post-->
                        <form method="post" action="postar.jsp">
                            <div class="card gedf-card">

                                <!--Titulo do card de publi-->
                                <div class="card-header">
                                    <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="posts-tab" data-toggle="tab" href="#posts" style="pointer-events: none" role="tab" aria-controls="posts" aria-selected="true">Fazer uma publicação</a>
                                        </li>

                                    </ul>
                                </div>
                                <!--Fim do titulo-->

                                <!--Card de postagem-->                        
                                <div class="card-body">
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="posts" role="tabpanel" aria-labelledby="posts-tab">
                                            <div class="form-group">
                                                <input class="form-control mb-3" required id="titulo" name="titulo" placeholder="Título"></input>
                                                <label class="sr-only" for="titulo">post</label>
                                                <textarea class="form-control" id="conteudo" name="conteudo" rows="3" placeholder="O que você está pensando?" required></textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <!--Botão do card de postagem-->
                                    <div class="btn-toolbar justify-content-between">
                                        <div class="btn-group">
                                            <button type="submit" class="btn btn-primary">Publicar</button>
                                        </div>
                                    </div>
                                    <!--Fim do botão-->
                                    <!--Fim do card de postagem-->
                                </div>
                            </div>
                        </form>
                        <!-- Post /////-->


                        <!--Ativar a listagem dos posts-    ->
                        <%
                            PostagemDAO postDAO = new PostagemDAO();

                            List<Postagem> lista = new ArrayList<>();
                            lista = postDAO.ListaPostagem();

                            int n_reg = 0;
                            if (lista == null) {
                        %>
                        <div class="card gedf-card">
                            <div class="card-header">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="mr-2">                                
                                        </div>
                                        <div class="ml-2">
                                            <div class="h5 m-0"></div>
                                            <!--Mensagem caso não tenha posts-->
                                            <div class="h7 text-muted">Oops parece que não temos nenhuma postagem ainda... </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                        } else {
//                                For em formato decrescente
                            for (int i = lista.size() - 1; i >= 0; i--) {%>

                        <!--- \\\\\\\Post-->
                        <div class="card gedf-card">
                            <div class="card-header">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="mr-2">
                                            <!--Foto do perfil - post-->
                                            <img class="rounded-circle" width="45" src="https://picsum.photos/50/50" alt="">
                                        </div>
                                        <div class="ml-2">
                                            <!--Informações de quem postou-->
                                            <div class="h5 m-0"><%= lista.get(i).getNome()%> </div>
                                            <div class="h7 text-muted"><%= lista.get(i).getSobrenome()%></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">

                                <!--Hora que feito a postagem-->

                                <!--Formatar de yyyy/MM/dd HH/mm/ss ==> HH/mm - dd/MM-->
                                <div class="text-muted h7 mb-2"> <i class="fa fa-clock-o"></i><%
                                    String dataOriginal = lista.get(i).getDataPostagem(); // Exemplo de data

                                    // Dividir a string para separar a data e a hora
                                    String[] partes = dataOriginal.split(" "); // Parte[0] -> "2024-10-21", Parte[1] -> "20:45:45"
                                    String data = partes[0]; // "2024-10-21"
                                    String hora = partes[1]; // "20:45:45"

                                    // Extrair os componentes da data
                                    String ano = data.substring(0, 4); // "2024"
                                    String mes = data.substring(5, 7); // "10"
                                    String dia = data.substring(8, 10); // "21"

                                    // Extrair os componentes da hora
                                    String horaMinuto = hora.substring(0, 5); // "20:45"

                                    // Formatar a data no padrão brasileiro
                                    String dataFormatada = horaMinuto + " - " + dia + "/" + mes;

                                    %>
                                    <%=dataFormatada%> 
                                </div>
                                <a class="card-link" href="#" style="text-decoration: none">
                                    <h5 class="card-title"><%= lista.get(i).getTitulo()%></h5>
                                </a>
                                <p class="card-text">
                                    <%= lista.get(i).getConteudo()%>
                                </p>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                        <!-- Post /////-->


                        <!--- \\\\\\\Post-->
                        <!--                <div class="card gedf-card">
                                            <div class="card-header">
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <div class="d-flex justify-content-between align-items-center">
                                                        <div class="mr-2">
                                                            <img class="rounded-circle" width="45" src="https://picsum.photos/50/50" alt="">
                                                        </div>
                                                        <div class="ml-2">
                                                            <div class="h5 m-0">@LeeCross</div>
                                                            <div class="h7 text-muted">Miracles Lee Cross</div>
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <div class="dropdown">
                                                            <button class="btn btn-link dropdown-toggle" type="button" id="gedf-drop1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                <i class="fa fa-ellipsis-h"></i>
                                                            </button>
                                                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="gedf-drop1">
                                                                <div class="h6 dropdown-header">Configuration</div>
                                                                <a class="dropdown-item" href="#">Save</a>
                                                                <a class="dropdown-item" href="#">Hide</a>
                                                                <a class="dropdown-item" href="#">Report</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                        
                                            </div>
                                            <div class="card-body">
                                                <div class="text-muted h7 mb-2"> <i class="fa fa-clock-o"></i> 10 min ago</div>
                                                <a class="card-link" href="#">
                                                    <h5 class="card-title"> Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit consectetur
                                                        deserunt illo esse distinctio.</h5>
                                                </a>
                        
                                                <p class="card-text">
                                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Magnam omnis nihil, aliquam est, voluptates officiis iure soluta
                                                    alias vel odit, placeat reiciendis ut libero! Quas aliquid natus cumque quae repellendus. Lorem
                                                    ipsum dolor sit amet consectetur adipisicing elit. Ipsa, excepturi. Doloremque, reprehenderit!
                                                    Quos in maiores, soluta doloremque molestiae reiciendis libero expedita assumenda fuga quae.
                                                    Consectetur id molestias itaque facere? Hic!
                                                </p>
                                                <div>
                                                    <span class="badge badge-primary">JavaScript</span>
                                                    <span class="badge badge-primary">Android</span>
                                                    <span class="badge badge-primary">PHP</span>
                                                    <span class="badge badge-primary">Node.js</span>
                                                    <span class="badge badge-primary">Ruby</span>
                                                    <span class="badge badge-primary">Paython</span>
                                                </div>
                                            </div>
                                            <div class="card-footer">
                                                <a href="#" class="card-link"><i class="fa fa-gittip"></i> Like</a>
                                                <a href="#" class="card-link"><i class="fa fa-comment"></i> Comment</a>
                                                <a href="#" class="card-link"><i class="fa fa-mail-forward"></i> Share</a>
                                            </div>
                                        </div>-->
                        <!-- Post /////-->
                    </div>

                    <!--Card de Notícias da parte direita-->
                    <div class="col-md-3">
                        <div class="card gedf-card">
                            <div class="card-body">
                                <!--Titulo da noticia-->
                                <h5 class="card-title">🚨 URGENTE: Trump é eleito presidente dos EUA</h5>
                                <!--Subtitulo-->
                                <h6 class="card-subtitle mb-2 text-muted">Republicano venceu a democrata Kamala Harris</h6>
                                <!--Corpo-->
                                <p class="card-text">Contrariando as últimas pesquisas divulgadas à vespera da eleição, o retorno do presidente à Casa Branca se deu de maneira histórica</p>
                                <!--Ancoragem de fonte-->
                                <a href="https://www.metropoles.com/mundo/eua-projecao-confirma-trump-eleito-presidente-da-republica" class="card-link">Metrópole</a>
                                <a href="https://www.bbc.com/portuguese/articles/c30p8045p13o" class="card-link">BBC</a>
                            </div>
                        </div>

                        <!--Card de Notícias da parte direita-->
                        <div class="card gedf-card">
                            <div class="card-body">
                                <!--Titulo da noticia-->
                                <h5 class="card-title">💼 Ciee oferece 125 vagas no Alto Tietê nesta quinta-feira; confira</h5>
                                <!--Subtitulo-->
                                <h6 class="card-subtitle mb-2 text-muted">Oportunidades são para estudantes do ensino médio, técnico e graduação em Mogi das Cruzes.</h6>
                                <!--Ancoragem de fonte-->
                                <p class="card-text">O Centro de Integração Empresa - Escola (Ciee) está com 125 vagas abertas no Alto Tietê nesta quinta-feira (7). Desse total são 102 para estágio e 23 para menor aprendiz. As oportunidades são para estudantes do ensino médio, técnico e superior em Mogi das Cruzes.</p>
                                <a href="https://g1.globo.com/sp/mogi-das-cruzes-suzano/concursos-e-emprego/noticia/2024/11/07/ciee-oferece-145-vagas-no-alto-tiete-nesta-quinta-feira-confira.ghtml" class="card-link">G1 Globo</a>
                                <a href="https://hojediario.com/2024/10/29/programa-de-empregabilidade-de-mogi-das-cruzes-conta-com-769-vagas-abertas-para-emprego-e-estagio-veja-os-cargos/" class="card-link">Hoje Diário</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!--footer-->
        <footer>
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
            <!-- Core theme JS-->
            <script src="js/scripts.js"></script>
            <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
        </footer>
    </body>
</html>

