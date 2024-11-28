<!--UNIVERSIDADE DE MOGI DAS CRUZES - UMC
ANDRÉ HIDEKI HATAISHI DA SILVA - 11231100985
RODRIGO GAZOLLI DE OLIVEIRA - 11231101823
17314-PADRÕES DE PROJETOS ORIENTADOS A OBJETOS
PROFESSOR: PEDRO TOLEDO
07/11/2024
PROJETO REDE SOCIAL-->

<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%@page import="model.dao.*"%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Exclusão</h1>
        <%
            //Entrada/Receber
            String senha = request.getParameter("senha");
            Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

            // Instância e atrib de valor
            Usuario usu = new Usuario();
            usu.setId_usuario(usuarioLogado.getId_usuario());

            UsuarioDAO usuDAO = new UsuarioDAO();
            //Apagar
            if (senha.equals(usuarioLogado.getSenha())) {
                if (usuDAO.Deletar(usu)) {
                    response.sendRedirect("../login/logout.jsp");
                    //out.println("");                
                } else {
                    response.sendRedirect("erro.jsp");
                }
            } else {
                response.sendRedirect("erro.jsp");
            }
        %>
    </body>
</html>
