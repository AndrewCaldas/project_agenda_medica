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
	public void adicionar(Empresa e) throws DAOException {
		con = ConnectionBuilder.getInstance().getConnection();
		try {
			String sql = "INSERT INTO clinica "
					+ "(id_clinica, id_login, nome, cnpj, cep, endereco, bairro, cidade, estado, telefone, responsavel, cpf_responsavel) VALUES "
					+ "(0, 1, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, e.getNome());
			stmt.setString(2, e.getCnpj());
			stmt.setString(3, e.getCep());
			stmt.setString(4, e.getEnd());
			stmt.setString(5, e.getBairro());
			stmt.setString(6, e.getCidade());
			stmt.setString(7, e.getEstado());
			stmt.setString(8, e.getTel());
			stmt.setString(9, e.getResponsavel());
			stmt.setString(10, e.getCpfResponsavel());
			stmt.execute();
			con.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
			throw new DAOException(ex);
		}
	}

	@Override
	public void atualizar(int id, Empresa e) throws DAOException {
		con = ConnectionBuilder.getInstance().getConnection();
		try {
			String sql = "UPDATE jogo SET nome=?, genero=?, "
					+ "preco=?, lancamento=? WHERE id = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, e.getNome());
			stmt.setString(2, e.getCnpj());
			stmt.setString(3, e.getCep());
			stmt.setInt(4, id);
			stmt.executeUpdate();
			con.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
			throw new DAOException(ex);
		}
	}

	@Override
	public void remover(int id) throws DAOException {
		con = ConnectionBuilder.getInstance().getConnection();
		try {
			String sql = "DELETE FROM jogo WHERE id = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, id);
			stmt.executeUpdate();
			con.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
			throw new DAOException(ex);
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
				Empresa e = new Empresa();
				//c.setId(rs.getInt("id"));
				e.setNome(rs.getString("nome"));
				e.setCnpj(rs.getString("cnpj"));
				e.setCep(rs.getString("cep"));
				e.setEnd(rs.getString("end"));
				e.setBairro(rs.getString("bairro"));
				e.setCidade(rs.getString("cidade"));
				e.setEstado(rs.getString("estado"));
				e.setTel(rs.getString("tel"));
				e.setResponsavel(rs.getString("responsavel"));
				e.setCpfResponsavel(rs.getString("cpfresponsavel"));
				lista.add(e);
			}
			con.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
			throw new DAOException(ex);
		}
		return lista;
	}

	@Override
	public List<Empresa> pesquisarTodos() throws DAOException {
		return pesquisarPorNome("");
	}

	@Override
	public Empresa pesquisarPorId(int id) throws DAOException {
		Empresa e = null;
		con = ConnectionBuilder.getInstance().getConnection();
		try {
			String sql = "SELECT * FROM clinica WHERE id = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) { 
				e = new Empresa();
				e.setId(rs.getInt("id"));
				e.setNome(rs.getString("nome"));
				e.setCnpj(rs.getString("cnpj"));
				e.setCep(rs.getString("cep"));
				e.setEnd(rs.getString("end"));
				e.setBairro(rs.getString("bairro"));
				e.setCidade(rs.getString("cidade"));
				e.setEstado(rs.getString("estado"));
				e.setTel(rs.getString("tel"));
				e.setResponsavel(rs.getString("responsavel"));
				e.setCpfResponsavel(rs.getString("cpfresponsavel"));
			}
			con.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
			throw new DAOException(ex);
		}
		return e;
	}

}

