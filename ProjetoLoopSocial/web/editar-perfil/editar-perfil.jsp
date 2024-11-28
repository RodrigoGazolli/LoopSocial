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

<!doctype html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //Inicia um objto do usuario baseado no atributo da session
            Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

            // Capturar os dados do formulário
            String nome = request.getParameter("nome");
            String sobrenome = request.getParameter("sobrenome");
            String resumo = request.getParameter("resumo");
            boolean aceiteTermo = request.getParameter("aceiteTermo") != null;

            // Criar e preencher o objeto Usuario com os dados atualizados
            Usuario usu = new Usuario();
            usu.setId_usuario(usuarioLogado.getId_usuario());
            usu.setNome(nome);
            usu.setSobrenome(sobrenome);
            usu.setResumo(resumo);
            usu.setAceiteTermo(aceiteTermo);

            // Atualizar o cadastro no banco
            UsuarioDAO usuDAO = new UsuarioDAO();
            usuDAO.AlterarCadastro(usu);

            // Atualizar os dados da sessão com o usuário atualizado
            usuarioLogado = usuDAO.receberDados(usuarioLogado.getEmail(), usuarioLogado.getSenha());
            session.setAttribute("usuarioLogado", usuarioLogado);

            // Redirecionar para o feed
            response.sendRedirect("../feed/feed-index.jsp");
        %>
    </body>
</html>

