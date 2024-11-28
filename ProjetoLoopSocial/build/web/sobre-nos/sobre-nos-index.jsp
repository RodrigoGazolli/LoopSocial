<!--UNIVERSIDADE DE MOGI DAS CRUZES - UMC
ANDRÉ HIDEKI HATAISHI DA SILVA - 11231100985
RODRIGO GAZOLLI DE OLIVEIRA - 11231101823
17314-PADRÕES DE PROJETOS ORIENTADOS A OBJETOS
PROFESSOR: PEDRO TOLEDO
07/11/2024
PROJETO REDE SOCIAL-->

<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>
    html, body {
        height: 100%;
        display: flex;
        flex-direction: column;
        margin: 0;
    }

    main {
        flex: 1; /* O conteúdo principal expande para ocupar o espaço restante */
    }

    footer {
        background-color: #343a40; /* Cor de fundo do footer */
        color: #fff;
        padding: 20px;
        text-align: center;
    }</style>

<html lang="pt-br" >
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!--titulo-->
        <title>Sobre Nós - Loop Social</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../img/logo-b.png" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../css/styles.css" rel="stylesheet" type="text/css"/>

    </head>
    <body >
        <!-- Responsive navbar-->
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
                                Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");
                                if (usuarioLogado != null) { %> 
                        <li class="nav-item"><a class="nav-link" href="../feed/feed-index.jsp">Feed</a></li>
                        <li class="nav-item"><a class="nav-link active" href="../sobre-nos/sobre-nos-index.jsp">Sobre-nós</a></li>
                        <li class="nav-item"><a class="nav-link" href="../login/logout.jsp">Sair</a></li>
                            <%
                            } else {
                            %> 
                        <li class="nav-item"><a class="nav-link active" href="../sobre-nos/sobre-nos-index.jsp">Sobre-nós</a></li>
                        <li class="nav-item"><a class="nav-link" href="../cadastro/cadastrar-index.jsp">Cadastrar</a></li>
                        <li class="nav-item"><a class="nav-link" href="../login/login-index.jsp">Entrar</a></li>
                            <%
                                }
                            %>
                    </ul>
                </div>
            </div>
        </nav>
        <main>
            <section class="py-5">
                <div class="container" >
                    <div class="row" >
                        <div class="col-md-5">
                            <span class="text-muted">Nossa História</span>
                            <h2 class="display-5 fw-bold">Sobre Nós</h2>
                            <p class="lead">Um lugar acolhedor para todas as pessoas que sempre sonharam em uma rede de interações voltada para o estudantes.</p>
                        </div>
                        <div class="col-md-6 offset-md-1">
                            <p class="lead">Aqui você pode compartilhar seu trabalho, encontrar oportunidades, fazer parcerias e, claro, se conectar com pessoas que pensam como você. Seja para trocar experiências, buscar mentores ou aprender com outros profissionais, nossa rede está sempre aberta.</p>
                            <p class="lead">Aqui, cada post, cada comentário, cada interação tem o poder de aproximar alguém de algo novo. Juntos, criamos uma comunidade vibrante e cheia de possibilidades, onde todos têm voz. Se você está em busca de novas amizades, trocar experiências ou apenas compartilhar momentos, na Loop Social.</p>
                        </div>
                    </div>
                </div>
            </section>


        </main> 


        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container px-5"><p class="m-0 text-center text-white">Copyright &copy; Loop Social 2024</p></div>

        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
