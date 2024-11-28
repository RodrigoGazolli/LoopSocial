//<!--UNIVERSIDADE DE MOGI DAS CRUZES - UMC
//ANDRÉ HIDEKI HATAISHI DA SILVA - 11231100985
//RODRIGO GAZOLLI DE OLIVEIRA - 11231101823
//17314-PADRÕES DE PROJETOS ORIENTADOS A OBJETOS
//PROFESSOR: PEDRO TOLEDO
//07/11/2024
//PROJETO REDE SOCIAL-->


package model.dao;

//imports do SQL para comandos SQL, pacote model.Usuario para fazer o insert, pacote util.ConcectaDB para conexão ao banco
import java.sql.*;
import model.*;
import util.ConectaDB;
import java.util.ArrayList;
import java.util.List;
// Classe UsuarioDAO

public class PostagemDAO {

    ResultSet rs;
    PreparedStatement sql;
    Statement comando;
    Connection conexao;

    //Método booleano para capturar se a inserção foi sucedida ou não
    public boolean insPost(Postagem u_Postagem) throws ClassNotFoundException {

        //Connexão ao banco de dados
        conexao = ConectaDB.conectar(); // Abre a conexão
        try {

            Statement stmt = conexao.createStatement(); // Criar o comando SQL
            // Comando SQL para inserir os dados dentro do banco, utilizando Getters para pegar                 
            String sql = "INSERT INTO postagem (conteudo, titulo, dataPostagem, curtida, id_usuario) VALUES ('" + u_Postagem.getConteudo()
                    + "','" + u_Postagem.getTitulo()
                    + "','" + u_Postagem.getDataPostagem()
                    + "'," + 0
                    + "," + u_Postagem.getFk_Id_Usuario() + ")";

            stmt.executeUpdate(sql); // Executa o SQL: Insert / Delete ou Update
            conexao.close(); // Fecha a conexão
            return true; // Retorna True caso tenha funcionado
        } catch (SQLException ex) { // Catch para pegar o erro
            System.out.println(" Exception: " + ex.toString());  // Informa o erro
            return false; // Retorna False caso não tenha funcionado
        }
    }

    public List ListaPostagem() throws ClassNotFoundException {

        List lista = new ArrayList(); // Minha Lista querida!
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = """
                         SELECT usuario.nome, usuario.sobrenome, POSTAGEM.*
                         FROM USUARIO
                         INNER JOIN POSTAGEM
                         ON Usuario.id_usuario = postagem.id_usuario""";
            ResultSet rs = stmt.executeQuery(sql); //GO - Executar - Select

            int n_reg = 0;
            while (rs.next()) {
                Postagem post = new Postagem();
                post.setId_postagem(Integer.parseInt(rs.getString("id_postagem")));
                post.setTitulo(rs.getString("titulo"));
                post.setConteudo(rs.getString("conteudo"));
                post.setDataPostagem(rs.getString("dataPostagem"));
                post.setCurtida(Integer.parseInt(rs.getString("curtida")));
                post.setFk_Id_Usuario(Integer.parseInt(rs.getString("id_usuario")));
                post.setNome(rs.getString("nome"));
                post.setSobrenome(rs.getString("sobrenome"));
                lista.add(post);
                n_reg++;
            }
            conexao.close();

            if (n_reg == 0) {
                return null;
            } else {
                return lista;
            }
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex);
            return null;
        }
    }


}
