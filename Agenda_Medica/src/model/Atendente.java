package model;

import java.util.Date;

public class Atendente {
	private int id;
	private String nome = "";
	private String cpf = "";
	private String cep = "";
	private Date datanasc = new Date();
	private String end = "";
	private String bairro = "";
	private String cidade = "";
	private String estado = "";
	private String tel = "";
	private String cel = "";
	private int clinica = 0;
	private String clinicanome = "";
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	
	public Date getDatanasc() {
		return datanasc;
	}
	public void setDatanasc(Date datanasc) {
		this.datanasc = datanasc;
	}
	
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	
	public String getBairro() {
		return bairro;
	}
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getCel() {
		return cel;
	}
	public void setCel(String cel) {
		this.cel = cel;
	}
	
	public int getClinica() {
		return clinica;
	}
	public void setClinica(int clinica) {
		this.clinica = clinica;
	}
	
	public String getClinicaNome() {
		return clinicanome;
	}
	public void setClinicaNome(String clinicanome) {
		this.clinicanome = clinicanome;
	}
	
}
