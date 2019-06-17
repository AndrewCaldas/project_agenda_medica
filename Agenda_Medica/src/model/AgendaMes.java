package model;

public class AgendaMes {
	private int id = 0;
	private String mes = "";
	private String dia = "";
	private String horaInicio = "";
	private String horaFInal = "";
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getMes() {
		return mes;
	}
	public void setMes(String mes) {
		this.mes = mes;
	}
	
	public String getDia() {
		return dia;
	}
	public void setDia(String dia) {
		this.dia = dia;
	}
	
	public String getHoraInicio() {
		return horaInicio;
	}
	public void setHoraInicio(String horaInicio) {
		this.horaInicio = horaInicio;
	}
	
	public String getHoraFInal() {
		return horaFInal;
	}
	public void setHoraFInal(String horaFInal) {
		this.horaFInal = horaFInal;
	}
}
