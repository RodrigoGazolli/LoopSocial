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

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //Entrada/Request dos dados                 
            String nome = request.getParameter("nome"); // Captura o nome do usuario
            String sobrenome = request.getParameter("sobrenome"); // Captura o sobrenome do usuario
            String email = request.getParameter("email"); // Captura o email do usuario
            String senha = request.getParameter("senha"); // Captura a senha do usuario
            String resumo = request.getParameter("resumo"); // Captura o resumo de hab. do usuario
            String aceiteTermo = request.getParameter("aceiteTermo"); // Captura o aceite dos termos

            
            // base nos dados que o próprio usuário do site colocou, é capturado pelo request
            Usuario usu = new Usuario();
            usu.setNome(nome);
            usu.setSobrenome(sobrenome);
            usu.setEmail(email);
            usu.setSenha(senha);
            usu.setResumo(resumo);
            usu.setAceiteTermo(aceiteTermo != null); // Para o aceiteTermo retornar true (obrigatório) para o banco de dados            

            // Instancia de objeto da classe UsuarioDAO
            UsuarioDAO usuDAO = new UsuarioDAO();

            
            // Verifica se o email já existe no banco de dados
            if (usuDAO.emailExiste(usu.getEmail())) {
                // Redireciona para a página de email duplicado se o email já está cadastrado
                response.sendRedirect("email-duplicado.jsp");
            } else {
                // Tenta inserir o usuário no banco de dados
                if (usuDAO.insUsu(usu)) {
                    // Redireciona para a página de login se a inserção for bem-sucedida
                    response.sendRedirect("../login/login-index.jsp");
                } else {
                    // Redireciona para a página de erro em caso de erro na inserção
                    response.sendRedirect("../editar-perfil/erro.jsp");
                }
            }
        %>
    </body>
</html>

