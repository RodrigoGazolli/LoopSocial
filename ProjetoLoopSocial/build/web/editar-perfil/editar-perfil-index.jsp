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

    <!--Pega o atributo salvo na session-->
    <%
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");
    %> 
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

        <!--Titulo-->
        <title>Editar Perfil - Loop Social</title>
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

    <body class="" >
        <header>            
            <!--Barra de navegação-->
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
                            <li class="nav-item"><a class="nav-link" href="../feed/feed-index.jsp">Feed</a></li>
                            <li class="nav-item"><a class="nav-link" href="../sobre-nos/sobre-nos-index.jsp">Sobre-nós</a></li>
                            <li class="nav-item"><a class="nav-link" href="../login/logout.jsp">Sair</a></li>
                                <%
                                } else {
                                %> 
                            <li class="nav-item"><a class="nav-link" href="../sobre-nos/sobre-nos-index.jsp">Sobre-nós</a></li>
                            <li class="nav-item"><a class="nav-link active" href="../cadastro/cadastrar-index.jsp">Cadastrar</a></li>
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
            <div class="container">
                <div class="d-block justify-content-center ">
                    <div class="user_card">
                        <div class="d-flex justify-content-center">
                            <div class="brand_logo_container">
                                <!--Logo-->
                                <a href="../pagina-inicial"><img src="../img/logo.png" class="brand_logo" alt="Logo" width="100" height="100"></a>                
                            </div>
                        </div>

                        <div class="d-flex justify-content-center form_container">
                            <form method="post" action="editar-perfil.jsp" style="width: 398px">

                                <!-- Email (desabilitado) -->
                                <div class="input-group mb-3">
                                    <div class="input-group-append">
                                        <span class="input-group-text" style="width: 40px"><i class="fas fa-envelope"></i></span>
                                    </div>
                                    <input type="email" id="email" name="email" class="form-control input_user" placeholder="email" 
                                           value="<%= usuarioLogado.getEmail()%>" disabled>
                                </div>

                                <!-- Senha (desabilitada) -->
                                <div class="input-group mb-3">
                                    <div class="input-group-append">
                                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                                    </div>
                                    <input type="password" id="senha" name="senha" class="form-control input_pass" placeholder="senha" required value="*********" disabled>
                                </div>

                                <!-- Nome -->
                                <div class="input-group mb-3">
                                    <div class="input-group-append">
                                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                                    </div>
                                    <input type="text" id="nome" name="nome" class="form-control input_user" placeholder="nome" 
                                           value="<%= usuarioLogado.getNome()%>" required>
                                </div>

                                <!-- Sobrenome -->
                                <div class="input-group mb-3">
                                    <div class="input-group-append">
                                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                                    </div>
                                    <input type="text" id="sobrenome" name="sobrenome" class="form-control input_user" placeholder="sobrenome" 
                                           value="<%= usuarioLogado.getSobrenome()%>" required>
                                </div>


                                <!-- Resumo -->
                                <div class="input-group mb-3">
                                    <textarea id="resumo" name="resumo" class="form-control input_pass" placeholder="Descreva suas melhores habilidades" 
                                              rows="2" cols="40" required><%= usuarioLogado.getResumo()%></textarea>
                                </div>

                                <!-- Aceite Termos -->
                                <div class="form-group">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" name="aceiteTermo" class="custom-control-input" id="aceiteTermo" required>
                                        <label class="custom-control-label" for="aceiteTermo">Marque esta caixa se deseja continuar</label>
                                    </div>
                                </div>

                                <!-- Botão para alterar -->
                                <div class="d-flex justify-content-center mt-1 login_container">
                                    <button type="submit" name="button" class="btn login_btn btn-primary">Alterar</button>
                                </div>                         

                            </form>
                        </div>

                        <div class="mt-2 mb-3">
                            <!--ancora para excluir o cadastro-->
                            <div class="d-flex justify-content-center links">
                                Deseja excluir o cadastro? <a href="../editar-perfil/excluir-perfil.jsp" class="ml-2">Excluir cadastro</a>
                            </div>
                            <!--                            <div class="d-flex justify-content-center links mb-3">
                                                            <a href="#">Esqueceu a senha?</a>
                                                        </div>-->
                        </div>
                    </div>
                </div>
            </div>

        </main>
    </body>

    <!--footer-->
    <footer class="py-5 bg-dark">
        <div class="container px-5"><p class="m-0 text-center text-white">Copyright &copy; Loop Social 2024</p></div>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </footer>
</html>

