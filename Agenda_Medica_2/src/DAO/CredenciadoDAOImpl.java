package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Credenciado;

public class CredenciadoDAOImpl implements CredenciadoDAO {
	private Connection con; 

	@Override
	public void adicionar(Credenciado c) throws DAOException {
		con = ConnectionBuilder.getInstance().getConnection();
		try {
			String sql = "INSERT INTO credenciado "
					+ "(id, nome, cpf, cep, datanasc, end, bairro, cidade, estado, tel, cel, escolha) VALUES "
					+ "(0, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, c.getNome());
			stmt.setInt(2, c.getCpf());
			stmt.setInt(3, c.getCep());
			stmt.setDate(4, 
					new java.sql.Date(c.getDatanasc().getTime()));
			stmt.setString(5, c.getEnd());
			stmt.setString(6, c.getBairro());
			stmt.setString(7, c.getCidade());
			stmt.setString(8, c.getEstado());
			stmt.setString(9, c.getTel());
			stmt.setString(10, c.getCel());
			stmt.setString(11, c.getEscolha());
			stmt.execute();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException(e);
		}
	}

	@Override
	public void atualizar(int id, Credenciado c) throws DAOException {
		con = ConnectionBuilder.getInstance().getConnection();
		try {
			String sql = "UPDATE jogo SET nome=?, genero=?, "
					+ "preco=?, lancamento=? WHERE id = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, c.getNome());
			stmt.setInt(2, c.getCpf());
			stmt.setInt(3, c.getCep());
			stmt.setDate(4, 
					new java.sql.Date(c.getDatanasc().getTime()));
			stmt.setInt(5, id);
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
			String sql = "DELETE FROM jogo WHERE id = ?";
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
	public List<Credenciado> pesquisarPorNome(String nome) throws DAOException {
		List<Credenciado> lista = new ArrayList<>();
		con = ConnectionBuilder.getInstance().getConnection();
		try {
			String sql = "SELECT * FROM credenciado WHERE nome like ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, "%" + nome + "%");
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) { 
				Credenciado c = new Credenciado();
				c.setId(rs.getInt("id"));
				c.setNome(rs.getString("nome"));
				c.setCpf(rs.getInt("cpf"));
				c.setCep(rs.getInt("cep"));
				c.setDatanasc(rs.getDate("datanasc"));
				c.setEnd(rs.getString("end"));
				c.setBairro(rs.getString("bairro"));
				c.setCidade(rs.getString("cidade"));
				c.setEstado(rs.getString("estado"));
				c.setTel(rs.getString("tel"));
				c.setCel(rs.getString("cel"));
				c.setEscolha(rs.getString("escolha"));
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
	public List<Credenciado> pesquisarTodos() throws DAOException {
		return pesquisarPorNome("");
	}

	@Override
	public Credenciado pesquisarPorId(int id) throws DAOException {
		Credenciado c = null;
		con = ConnectionBuilder.getInstance().getConnection();
		try {
			String sql = "SELECT * FROM jogo WHERE id = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) { 
				c = new Credenciado();
				c.setId(rs.getInt("id"));
				c.setNome(rs.getString("nome"));
				c.setCpf(rs.getInt("cpf"));
				c.setCep(rs.getInt("cep"));
				c.setDatanasc(rs.getDate("datanasc"));
				c.setEnd(rs.getString("end"));
				c.setBairro(rs.getString("bairro"));
				c.setCidade(rs.getString("cidade"));
				c.setEstado(rs.getString("estado"));
				c.setTel(rs.getString("tel"));
				c.setCel(rs.getString("cel"));
				c.setEscolha(rs.getString("escolha"));
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException(e);
		}
		return c;
	}

}

