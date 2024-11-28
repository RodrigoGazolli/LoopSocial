<!--UNIVERSIDADE DE MOGI DAS CRUZES - UMC
ANDRÉ HIDEKI HATAISHI DA SILVA - 11231100985
RODRIGO GAZOLLI DE OLIVEIRA - 11231101823
17314-PADRÕES DE PROJETOS ORIENTADOS A OBJETOS
PROFESSOR: PEDRO TOLEDO
07/11/2024
PROJETO REDE SOCIAL-->

<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="model.*"%>
<%@page import="model.dao.*"%>


<!doctype html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
//            Inicia o usuario logado
            Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");

            // Pega os parametros 
            String titulo = request.getParameter("titulo");
            String conteudo = request.getParameter("conteudo");

//            Calendar dataAtual = Calendar.getInstance();            
//            post.setDataPostagem(dataAtual);
            Calendar data = Calendar.getInstance();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm ");

            //Inicia um obj post
            Postagem post = new Postagem();
            post.setConteudo(conteudo);
            post.setTitulo(titulo);
            post.setFk_Id_Usuario(usuario.getId_usuario());
            post.setDataPostagem(sdf.format(data.getTime()));

//            Inicia postagem dao
            PostagemDAO postDAO = new PostagemDAO();
            if (postDAO.insPost(post)) {
                // Redireciona para a página de index caso os dados forem aceitos
                response.sendRedirect("feed-index.jsp");

                // Redireciona para a página de erro caso os daods mão forem aceitos            
            } else {
                response.sendRedirect("../editar-perfil/erro.jsp");

            }
        %>
    </body>
</html>

