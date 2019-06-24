package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Empresa;

public class EmpresaDAOImpl implements EmpresaDAO {
	private Connection con; 

	@Override
	public void adicionar(Empresa emp) throws DAOException {
		con = ConnectionBuilder.getInstance().getConnection();
		
		try {
			String sql = "UPDATE login SET "
					+ "id_perfil = 1, acesso_sistema = 2 WHERE "
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
			String sql = "INSERT INTO clinica "
					+ "(id_clinica, id_login, nome, cnpj, cep, endereco, bairro, cidade, estado, telefone, responsavel, cpf_responsavel) VALUES "
					+ "(0, (SELECT MAX(id_login) FROM login), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, emp.getNome());
			stmt.setString(2, emp.getCnpj());
			stmt.setString(3, emp.getCep());
			stmt.setString(4, emp.getEnd());
			stmt.setString(5, emp.getBairro());
			stmt.setString(6, emp.getCidade());
			stmt.setString(7, emp.getEstado());
			stmt.setString(8, emp.getTel());
			stmt.setString(9, emp.getResponsavel());
			stmt.setString(10, emp.getCpfResponsavel());
			stmt.execute();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException(e);
		}
	}

	@Override
	public void atualizar(int id, Empresa emp) throws DAOException {
		con = ConnectionBuilder.getInstance().getConnection();
		try {
			String sql = "UPDATE clinica SET nome=?, cnpj=?, cep=?, endereco=?, bairro=?, cidade=?, estado=?, telefone=?, responsavel=?, cpf_responsavel=? WHERE id_clinica = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, emp.getNome());
			stmt.setString(2, emp.getCnpj());
			stmt.setString(3, emp.getCep());
			stmt.setString(4, emp.getEnd());
			stmt.setString(5, emp.getBairro());
			stmt.setString(6, emp.getCidade());
			stmt.setString(7, emp.getEstado());
			stmt.setString(8, emp.getTel());
			stmt.setString(9, emp.getResponsavel());
			stmt.setString(10, emp.getCpfResponsavel());
			stmt.setInt(11, id);
			stmt.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException(e);
		}
	}

	@Override
	public void remover(int id) throws DAOException {
		con = ConnectionBuilder.getInstance().getConnection();
		try {
			String sql = "DELETE FROM clinica WHERE id_clinica = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, id);
			stmt.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException(e);
		}
	}

	@Override
	public List<Empresa> pesquisarPorNome(String nome) throws DAOException {
		List<Empresa> lista = new ArrayList<>();
		con = ConnectionBuilder.getInstance().getConnection();
		try {
			String sql = "SELECT * FROM clinica WHERE nome like ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, "%" + nome + "%");
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) { 
				Empresa emp = new Empresa();
				emp.setId(rs.getInt("id_clinica"));
				emp.setNome(rs.getString("nome"));
				emp.setCnpj(rs.getString("cnpj"));
				emp.setCep(rs.getString("cep"));
				emp.setEnd(rs.getString("endereco"));
				emp.setBairro(rs.getString("bairro"));
				emp.setCidade(rs.getString("cidade"));
				emp.setEstado(rs.getString("estado"));
				emp.setTel(rs.getString("telefone"));
				emp.setResponsavel(rs.getString("responsavel"));
				emp.setCpfResponsavel(rs.getString("cpf_responsavel"));
				lista.add(emp);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException(e);
		}
		return lista;
	}

	@Override
	public List<Empresa> pesquisarTodos() throws DAOException {
		return pesquisarPorNome("");
	}

	@Override
	public Empresa pesquisarPorId(int id) throws DAOException {
		Empresa emp = null;
		con = ConnectionBuilder.getInstance().getConnection();
		try {
			String sql = "SELECT * FROM clinica WHERE id_clinica = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) { 
				emp = new Empresa();
				emp.setId(rs.getInt("id_clinica"));
				emp.setNome(rs.getString("nome"));
				emp.setCnpj(rs.getString("cnpj"));
				emp.setCep(rs.getString("cep"));
				emp.setEnd(rs.getString("endereco"));
				emp.setBairro(rs.getString("bairro"));
				emp.setCidade(rs.getString("cidade"));
				emp.setEstado(rs.getString("estado"));
				emp.setTel(rs.getString("telefone"));
				emp.setResponsavel(rs.getString("responsavel"));
				emp.setCpfResponsavel(rs.getString("cpf_responsavel"));
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException(e);
		}
		return emp;
	}
	
	@Override
	public List<Empresa> listarEmpresa() throws DAOException {
		List<Empresa> lista = new ArrayList<>();
		con = ConnectionBuilder.getInstance().getConnection();
		try {
			String sql = "SELECT * FROM clinica";
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) { 
				Empresa emp = new Empresa();
				emp.setId(rs.getInt("id_clinica"));
				emp.setCnpj(rs.getString("cnpj"));
				emp.setNome(rs.getString("nome"));
				lista.add(emp);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException(e);
		}
		return lista;
	}

}

