//<!--UNIVERSIDADE DE MOGI DAS CRUZES - UMC
//ANDRÉ HIDEKI HATAISHI DA SILVA - 11231100985
//RODRIGO GAZOLLI DE OLIVEIRA - 11231101823
//17314-PADRÕES DE PROJETOS ORIENTADOS A OBJETOS
//PROFESSOR: PEDRO TOLEDO
//07/11/2024
//PROJETO REDE SOCIAL-->

package util; // Pacote Util

import java.sql.*; // Import do SQL

// Classe para conectar ao banco
public class ConectaDB {
    public static Connection conectar() throws ClassNotFoundException{
        Connection conexao = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            // conexão = jdbc:mysql://localhost:3306/ NOME DO BANCO , USUARIO , SENHA
            conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/loopsocial","root","");
            return conexao;
        }catch(SQLException ex){ 
            System.out.println("Error: " + ex);
        }                  
        return conexao;        
    }
}
