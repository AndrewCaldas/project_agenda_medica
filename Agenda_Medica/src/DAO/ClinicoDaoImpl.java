package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.mysql.cj.jdbc.Blob;
import model.Clinico;
public class ClinicoDaoImpl implements ClinicoDAO{
	private static final Blob foto = null;
	private Connection con;
	
	@Override
	public void adicionar(Clinico c) throws DAOException {
		con = ConnectionBuilder.getInstance().getConnection();
		
		try {
			String sql = "UPDATE login SET "
					+ "id_perfil = 2, acesso_sistema = 1 WHERE "
					+ "id_login = (SELECT * FROM (SELECT MAX(id_login) FROM login) a);";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.execute();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException(e);
		}
		
		con = ConnectionBuilder.getInstance().getConnection();
		try {
			String sql = "INSERT INTO medico "
					//+ "(id_medico, id_clinica, id_login, nome, cpf, crm, nascimento, endereco, cep, bairro, id_cidade, telefone, celular, foto) VALUES "
					+ "(id_login, id_clinica, nome, cpf, crm, nascimento, endereco, cep, bairro, cidade, estado, telefone, celular) VALUES "
					+ "((SELECT MAX(id_login) FROM login), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
			PreparedStatement stmt = con.prepareStatement(sql);
			//stmt.setInt(1, c.getId_medico());
			stmt.setInt(1, c.getId_login());
			stmt.setInt(2, c.getId_clinica());
			stmt.setString(3, c.getNome());
			stmt.setString(4, c.getCpf());
			stmt.setInt(5, c.getCrm());
			stmt.setDate(6, new java.sql.Date(c.getDatanacimento().getTime()));
			stmt.setString(7, c.getEndereco());
			stmt.setString(8, c.getCep());
			stmt.setString(9, c.getBairro());
			stmt.setString(10, c.getCidade());
			stmt.setString(11, c.getEstado());
			stmt.setString(12, c.getTelefone());
			stmt.setString(13, c.getCelular());
			 
			
			//stmt.setInt(13, c.getCelular());
			//stmt.setBytes(14, c.getFoto());
			stmt.execute();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException(e);
		}
	}

	@Override
	public void atualizar(int id, Clinico c) throws DAOException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remover(int id) throws DAOException {
		// TODO Auto-generated method stub
		
	}

	//@Override
	//public List<Clinico> pesquisarPorNome(String nome) throws DAOException {
		// TODO Auto-generated method stub
		//return null;
	//}

	@Override
	public List<Clinico> pesquisarPorNome(String nome) throws DAOException {
		List<Clinico> lista = new ArrayList<>(); 
		con = ConnectionBuilder.getInstance().getConnection();
		try {
			String sql = "SELECT id_medico,nome,cpf,crm,endereco,cep,bairro,cidade,estado,telefone,celular FROM medico";
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) { 
				Clinico c = new Clinico();
				c.setNome(rs.getString("nome"));
				c.setCpf(rs.getString("cpf"));
				c.setCrm(rs.getInt("crm"));
				c.setEndereco(rs.getString("endereco"));
				c.setCep(rs.getString("cep"));
				c.setBairro(rs.getString("bairro"));
				c.setCidade(rs.getString("cidade"));
				c.setEstado(rs.getString("estado"));
				c.setTelefone(rs.getString("telefone"));
				c.setCelular(rs.getString("celular"));
				lista.add(c);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException(e);
		}
		return lista;
	}
	@Override
	public List<Clinico> pesquisarTodos() throws DAOException {
		return pesquisarPorNome("");
	}

	@Override
	public Clinico pesquisarPorId(int id) throws DAOException {
		Clinico c = null;
		con = ConnectionBuilder.getInstance().getConnection();
		try {
			String sql = "SELECT * FROM medico";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) { 
				c = new Clinico();
				c.setId_medico(rs.getInt("id_medico"));
				c.setNome(rs.getString("nome"));
				c.setCpf(rs.getString("cpf"));
				c.setCrm(rs.getInt("crm"));
				c.setEndereco(rs.getString("endereco"));
				c.setBairro(rs.getString("bairro"));
				c.setCep(rs.getString("cep"));
				c.setCidade(rs.getString("cidade"));
				c.setCidade(rs.getString("estado"));
				c.setTelefone(rs.getString("telefone"));
				c.setCelular(rs.getString("celular"));
				c.setDatanacimento(rs.getDate("datanascimento"));
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException(e);
		}
		return c;
	}

}
