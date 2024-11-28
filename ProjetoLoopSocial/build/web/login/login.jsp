<!--UNIVERSIDADE DE MOGI DAS CRUZES - UMC
ANDRÉ HIDEKI HATAISHI DA SILVA - 11231100985
RODRIGO GAZOLLI DE OLIVEIRA - 11231101823
17314-PADRÕES DE PROJETOS ORIENTADOS A OBJETOS
PROFESSOR: PEDRO TOLEDO
07/11/2024
PROJETO REDE SOCIAL-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Usuario"%>
<%@page import="model.dao.UsuarioDAO"%>

<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%            
            // Captura o email e a senha do formulário
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");

            // Instância do UsuarioDAO para verificar os dados no banco
            UsuarioDAO usuDAO = new UsuarioDAO();
            Usuario usuarioLogado = usuDAO.receberDados(email, senha);            

            if (usuarioLogado != null) {
                // Usuário autenticado - armazena o objeto Usuario na sessão
                session.setAttribute("usuarioLogado", usuarioLogado);
                response.sendRedirect("../feed/feed-index.jsp");
            } else {
                // Credenciais incorretas - redireciona para página de erro ou login novamente
                response.sendRedirect("../editar-perfil/erro.jsp");
            }
        %>
    </body>
</html>

