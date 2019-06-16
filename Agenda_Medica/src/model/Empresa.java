package model;

import java.io.Serializable;

public class Empresa implements Serializable {
	private static final long serialVersionUID = 5342902659347926787L;
	private int id;
	private String nome = "";
	private String cnpj = "";
	private String cep = "";
	private String end = "";
	private String bairro = "";
	private String cidade = "";
	private String estado = "";
	private String tel = "";
	private String responsavel = "";
	private String cpfresponsavel = "";
	
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
	
	public String getCnpj() {
		return cnpj;
	}
	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}
	
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
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
	
	public String getResponsavel() {
		return responsavel;
	}
	public void setResponsavel(String responsavel) {
		this.responsavel = responsavel;
	}
	
	public String getCpfResponsavel() {
		return cpfresponsavel;
	}
	public void setCpfResponsavel(String cpfresponsavel) {
		this.cpfresponsavel = cpfresponsavel;
	}
	
}
