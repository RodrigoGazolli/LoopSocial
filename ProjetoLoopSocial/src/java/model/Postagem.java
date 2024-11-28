//<!--UNIVERSIDADE DE MOGI DAS CRUZES - UMC;
//ANDRÉ HIDEKI HATAISHI DA SILVA - 11231100985
//RODRIGO GAZOLLI DE OLIVEIRA - 11231101823
//17314-PADRÕES DE PROJETOS ORIENTADOS A OBJETOS
//PROFESSOR: PEDRO TOLEDO
//07/11/2024
//PROJETO REDE SOCIAL-->

package model;

public class Postagem {
    
    //atrib.
    private int id_postagem;
    private String conteudo;
    private String titulo;
    private String dataPostagem;
    private int curtida;
    private int Fk_Id_Usuario;
    private String nome;
    private String sobrenome;
    
    // get e set
    public String getConteudo() {
        return conteudo;
    }

    public void setConteudo(String conteudo) {
        this.conteudo = conteudo;
    }

    public String getDataPostagem() {
        return dataPostagem;
    }

    public void setDataPostagem(String dataPostagem) {
        this.dataPostagem = dataPostagem;
    }

    public int getCurtida() {
        return curtida;
    }

    public void setCurtida(int curtida) {
        this.curtida = curtida;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public int getId_postagem() {
        return id_postagem;
    }

    public void setId_postagem(int id_postagem) {
        this.id_postagem = id_postagem;
    }

    public int getFk_Id_Usuario() {
        return Fk_Id_Usuario;
    }

    public void setFk_Id_Usuario(int Fk_Id_Usuario) {
        this.Fk_Id_Usuario = Fk_Id_Usuario;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSobrenome() {
        return sobrenome;
    }

    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }

    
            
}
