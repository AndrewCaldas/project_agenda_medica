package model;

import java.io.Serializable;
import java.util.Date;

public class Login implements Serializable{
	private static final long serialVersionUID = 1L;
	private String nome = "";
	private String email = "";
	private String senha = "";
	private int perfil;
	private int sistema;
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}	
	public int getPerfil() {
		return perfil;
	}
	public void setPerfil(int perfil) {
		this.perfil = perfil;
	}
	public int getSistema() {
		return sistema;
	}
	public void setSistema(int sistema) {
		this.sistema = sistema;
	}
	
}
