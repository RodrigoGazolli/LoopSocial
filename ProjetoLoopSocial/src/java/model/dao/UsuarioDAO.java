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
import model.Usuario;
import util.ConectaDB;

// Classe UsuarioDAO
public class UsuarioDAO {

    ResultSet rs;
    PreparedStatement sql;
    Connection conexao;

    //Método booleano para capturar se a inserção foi sucedida ou não
    public boolean insUsu(Usuario p_usuario) throws ClassNotFoundException {

        //Connexão ao banco de dados
        conexao = ConectaDB.conectar(); // Abre a conexão
        try {

            Statement stmt = conexao.createStatement(); // Criar o comando SQL
            // Comando SQL para inserir os dados dentro do banco, utilizando Getters para pegar 
            // os dados inseridos anteriormente pelo usuario que já foram armazenados pelo Setters na página do site                       
            String sql = "INSERT INTO usuario (nome, sobrenome, email, senha, resumo, seguindo, seguidores, aceiteTermo) VALUES ('" + p_usuario.getNome()
                    + "','" + p_usuario.getSobrenome()
                    + "','" + p_usuario.getEmail()
                    + "','" + p_usuario.getSenha()
                    + "','" + p_usuario.getResumo()
                    + "'," + 0
                    + "," + 0
                    + "," + p_usuario.getAceiteTermo() + ")";

            stmt.executeUpdate(sql); // Executa o SQL: Insert / Delete ou Update
            conexao.close(); // Fecha a conexão
            return true; // Retorna True caso tenha funcionado
        } catch (SQLException ex) { // Catch para pegar o erro
            System.out.println(" Exception: " + ex.toString());  // Informa o erro
            return false; // Retorna False caso não tenha funcionado
        }
    }
    
    // Metodo para verificar se o email existe no bacno de dados
    public boolean emailExiste(String email) throws ClassNotFoundException {
        boolean emailEncontrado = false;
        try {
            conexao = ConectaDB.conectar();
            sql = conexao.prepareStatement("SELECT email FROM usuario WHERE email = ?");
            sql.setString(1, email);
            rs = sql.executeQuery();

            if (rs.next()) {
                emailEncontrado = true; // Retorna true se o email for encontrado no banco de dados
            }
            conexao.close(); // Fecha a conexão
        } catch (SQLException ex) {
            // Registra o erro para diagnóstico
            System.out.println("Exception: " + ex.toString());

        }
        return emailEncontrado;
    }

    // Armazena no objto usuario os dados do banco de dados
    public Usuario receberDados(String email, String senha) throws ClassNotFoundException {
        Usuario usuario = null; // Inicialize um novo objeto Usuario

        try {
            conexao = ConectaDB.conectar();
            sql = conexao.prepareStatement("SELECT * FROM usuario WHERE email = ? AND senha = ?");
            sql.setString(1, email);
            sql.setString(2, senha);
            rs = sql.executeQuery();

            if (rs.next()) {
                usuario = new Usuario();
                usuario.setEmail(email);
                usuario.setSenha(senha);
                usuario.setNome(rs.getString("nome"));
                usuario.setSobrenome(rs.getString("sobrenome"));
                usuario.setSeguidores(Integer.parseInt(rs.getString("seguidores")));
                usuario.setSeguindo(Integer.parseInt(rs.getString("seguindo")));
                usuario.setResumo(rs.getString("resumo"));
                usuario.setId_usuario(Integer.parseInt(rs.getString("id_usuario")));
            }
            conexao.close(); // Fecha a conexão

        } catch (SQLException ex) {
            System.out.println("Exception: " + ex.toString());
        }

        return usuario; // Retorna o objeto Usuario completo ou null se não encontrado
    }

    // Alterar o cadastro
    public void AlterarCadastro(Usuario ac_usuario) {

        try {
            conexao = ConectaDB.conectar();

            // Preparar o comando SQL 
            sql = conexao.prepareStatement(
                    "UPDATE usuario SET nome = ?, sobrenome = ?, resumo = ?, aceiteTermo = ? WHERE id_usuario = ?"
            );

            // Definir os parâmetros na query SQL
            sql.setString(1, ac_usuario.getNome());
            sql.setString(2, ac_usuario.getSobrenome());
            sql.setString(3, ac_usuario.getResumo());
            sql.setBoolean(4, ac_usuario.getAceiteTermo());
            sql.setInt(5, ac_usuario.getId_usuario());

            // Executar a atualização no banco de dados
            int verifica = sql.executeUpdate();

            if (verifica > 0) {
                System.out.println("Registro alterado com sucesso !!!");
            } else {
                System.out.println("Registro não alterado !!!");
            }
            conexao.close(); // Fecha a conexão

        } catch (Exception e) {
            System.out.println("Exception: " + e.toString());
        }
    }

    
    // Deletar cadastro
    public boolean Deletar(Usuario del) throws ClassNotFoundException {
        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            //DELETE from pesquisa WHERE id = 100            
            String sql = "DELETE from postagem WHERE id_usuario = " + del.getId_usuario();
            stmt.executeUpdate(sql); //GO - Executar - Insert / Delete / Update
            sql = "DELETE from usuario WHERE id_usuario = " + del.getId_usuario();
            stmt.executeUpdate(sql); //GO - Executar - Insert / Delete / Update
            conexao.close(); // Fecha a conexão
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex);
            return false;
        }
    }

}
