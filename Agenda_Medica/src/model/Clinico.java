package model;

import java.io.Serializable;
import java.util.Date;

import com.mysql.cj.jdbc.Blob;

public class Clinico implements Serializable{
	private static final long serialVersionUID = 5342902659347926787L;
	private int id_medico;
	private int id_login;
	private int id_clinica;
	private String nome = "";
	private String cpf = "";
	private int crm;
	private Date datanascimento = new Date();
	private String endereco = "";
	private String cep = "";
	private String bairro = "";
	private String cidade = "";
	private String estado = "";
	private String telefone = "";
	private String celular= "";
	private Blob foto;
	
	public int getId_medico() {
		return id_medico;
	}
	public void setId_medico(int id_medico) {
		this.id_medico = id_medico;
	}
	
	public int getId_login() {
		return id_login;
	}
	public void setId_login(int id_login) {
		this.id_login = id_login;
	}
	public int getId_clinica() {
		return id_clinica;
	}
	public void setId_clinica(int id_clinica) {
		this.id_clinica = id_clinica;
	}
	public Date getDatanascimento() {
		return datanascimento;
	}
	public void setDatanascimento(Date datanascimento) {
		this.datanascimento = datanascimento;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public int getCrm() {
		return crm;
	}
	public void setCrm(int crm) {
		this.crm = crm;
	}
	public Date getDatanacimento() {
		return datanascimento;
	}
	public void setDatanacimento(Date datanacimento) {
		this.datanascimento = datanacimento;
	}
	public String getEndereco() {
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
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
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getCelular() {
		return celular;
	}
	public void setCelular(String celular) {
		this.celular = celular;
	}
	public Blob getFoto() {
		return foto;
	}
	public void setFoto(Blob foto) {
		this.foto = foto;
	}
	
	
	
	
}
