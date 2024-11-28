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


<html lang="pt-br">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

        <!--titulo-->
        <title>Início - Loop Social</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../img/logo-b.png" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../css/styles.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <!-- navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-5">
                <a href="../pagina-inicial"><img src="../img/logo-b.png" alt="alt" height="40px" width="50px"/></a>
                <a class="navbar-brand" href="../pagina-inicial">Loop Social</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="../pagina-inicial">Início</a></li>                        
                            <%
                                // Verifica se usuário está logado  
                                Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");
                                if (usuarioLogado != null) { %> 
                        <li class="nav-item"><a class="nav-link " href="../feed/feed-index.jsp">Feed</a></li>
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

        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-5">
                <div class="row gx-5 justify-content-center">
                    <div class="col-lg-6">
                        <div class="text-center my-5">
                            <h1 class="display-5 fw-bolder text-white mb-2">Uma Rede Social Feita Para Você</h1>
                            <p class="lead text-white-50 mb-4">Bem-vindo(a) à <b>Loop Social!</b> Conecte-se com estudantes como você, compartilhe conhecimentos e inspire-se com novas ideias. Aqui, cada publicação e interação tem o propósito de facilitar o aprendizado e fortalecer a comunidade estudantil. Junte-se a nós e aproveite um espaço criado especialmente para trocas de experiências!</p>
                            <div class="d-grid gap-3 d-sm-flex justify-content-sm-center">
                                <a class="btn btn-primary btn-lg px-4 me-sm-3" href="#features">Ver mais</a>
                                <a class="btn btn-outline-light btn-lg px-4" href="../sobre-nos/sobre-nos-index.jsp">Sobre-nós</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Features section-->
        <main>
            <section class="py-5 border-bottom" id="features">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-4 mb-5 mb-lg-0">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-person-plus-fill"></i></div>
                            <h2 class="h4 fw-bolder">Conecte-se a outras pessoas</h2>
                            <p>Expanda sua rede e compartilhe conhecimento com outros estudantes e profissionais da sua área. Aqui, conexões significativas acontecem a cada interação.</p>
                            <a class="text-decoration-none" href="../cadastro/cadastrar-index.jsp">
                                Começar agora
                                <i class="bi bi-arrow-right"></i>
                            </a>
                        </div>
                        <div class="col-lg-4 mb-5 mb-lg-0">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-phone"></i></div>
                            <h2 class="h4 fw-bolder">Compatibilidade</h2>
                            <p>Acesse sua rede social de qualquer lugar, seja no desktop, tablet ou smartphone. Nossa plataforma é otimizada para acompanhar você onde estiver.</p>
                            <a class="text-decoration-none" href="../cadastro/cadastrar-index.jsp">
                                Começar agora
                                <i class="bi bi-arrow-right"></i>
                            </a>
                        </div>
                        <div class="col-lg-4">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-newspaper"></i></div>
                            <h2 class="h4 fw-bolder">Aba de notícias atualizadas</h2>
                            <p>Mantenha-se informado com uma seção de notícias sempre atualizada, trazendo conteúdos relevantes para o seu crescimento acadêmico e profissional.</p>
                            <a class="text-decoration-none" href="../cadastro/cadastrar-index.jsp">
                                Começar agora
                                <i class="bi bi-arrow-right"></i>
                            </a>
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
