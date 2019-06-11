package model;

public class Cidade {
	private int id_cidade = 0;
	private int id_estado = 0;
	private String cidade = "";
	
	public int getId_cidade() {
		return id_cidade;
	}
	public void setId_cidade(int id_cidade) {
		this.id_cidade = id_cidade;
	}
	
	public int getId_estado() {
		return id_estado;
	}
	public void setId_estado(int id_estado) {
		this.id_estado = id_estado;
	}
	
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	
}
