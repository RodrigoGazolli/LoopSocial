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
        <title>Email Duplicado - Loop Social</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../img/logo-b.png" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
        <!--link css-->
        <link href="../css/styles.css" rel="stylesheet" type="text/css"/>
    </head>

    <body class=""  >
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
                                    Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");
                                    if (usuarioLogado != null) { %> 
                            <li class="nav-item"><a class="nav-link " href="../feed/feed-index.jsp">Feed</a></li>
                            <li class="nav-item"><a class="nav-link" href="../sobre-nos/sobre-nos-index.jsp">Sobre-nós</a></li>
                            <li class="nav-item"><a class="nav-link" href="../login/logout.jsp">Sair</a></li>
                                <%
                                } else {
                                %> 
                            <li class="nav-item"><a class="nav-link" href="../sobre-nos/sobre-nos-index.jsp">Sobre-nós</a></li>
                            <li class="nav-item"><a class="nav-link active" href="../cadastro/cadastrar-index.jsp">Cadastrar</a></li>
                            <li class="nav-item"><a class="nav-link " href="../login/login-index.jsp">Entrar</a></li>
                                <%
                                    }
                                %>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <main style="height: 76vh">            
            <div class="container">
                <div class="d-block justify-content-center ">
                    <div class="user_card mt-2">
                        <div class="d-flex justify-content-center">
                            <div class="brand_logo_container">
                                <!--logo-->
                                <a href="../pagina-inicial"><img src="../img/logo.png" class="brand_logo" alt="Logo" width="100" height="100"></a>
                            </div>                            
                        </div>                     
                    </div>                    
                </div>
            </div>
            <div class="container">
                <div class="d-block justify-content-center ">
                    <div class="user_card">
                        <div class="mt-2 d-flex justify-content-center">
                            <!--mensagem de erro-->
                            <h4>Parece que já existe um cadastro com esse email, tente novamente com um email diferente.</h4>                                    
                        </div>                     
                        <div class="mt-3 d-flex justify-content-center">
                            <!--botão de retornar a pagina anterior-->
                            <button class="btn btn-primary" onclick=history.back()>Voltar</button>                                      
                        </div>                     
                    </div>                    
                </div>
            </div>
        </main>
                        
        <!-- Footer-->
        <footer class="py-lg-5 bg-dark">
            <div class="container px-5"><p class="m-auto text-center text-white">Copyright &copy; Loop Social 2024</p></div>
        </footer>
    </body>

    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</html>
