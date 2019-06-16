package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Atendente;

public class AtendenteDAOImpl implements AtendenteDAO {
	private Connection con; 

	@Override
	public void adicionar(Atendente ate) throws DAOException {
		con = ConnectionBuilder.getInstance().getConnection();
		try {
			String sql = "INSERT INTO atendente "
					+ "(id_atendente, id_login, id_clinica, nome, cpf, nascimento, endereco, cep, bairro, cidade, estado, telefone, celular) VALUES "
					+ "(0, 3, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, ate.getClinica());
			stmt.setString(2, ate.getNome());
			stmt.setString(3, ate.getCpf());
			stmt.setDate(4, 
					new java.sql.Date(ate.getDatanasc().getTime()));
			stmt.setString(5, ate.getEnd());
			stmt.setString(6, ate.getCep());
			stmt.setString(7, ate.getBairro());
			stmt.setString(8, ate.getCidade());
			stmt.setString(9, ate.getEstado());
			stmt.setString(10, ate.getTel());
			stmt.setString(11, ate.getCel());
			stmt.execute();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException(e);
		}
	}

	@Override
	public void atualizar(int id, Atendente ate) throws DAOException {
		con = ConnectionBuilder.getInstance().getConnection();
		try {
			String sql = "UPDATE atendente SET nome=?, cpf=?, nascimento=?, endereco=?, cep=?, bairro=?, cidade=?, estado=?, telefone=?, celular=? WHERE id_atendente = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, ate.getNome());
			stmt.setString(2, ate.getCpf());
			stmt.setDate(3, 
					new java.sql.Date(ate.getDatanasc().getTime()));
			stmt.setString(4, ate.getEnd());
			stmt.setString(5, ate.getCep());
			stmt.setString(6, ate.getBairro());
			stmt.setString(7, ate.getCidade());
			stmt.setString(8, ate.getEstado());
			stmt.setString(9, ate.getTel());
			stmt.setString(10, ate.getCel());
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
			String sql = "DELETE FROM atendente WHERE id_atendente = ?";
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
	public List<Atendente> pesquisarPorNome(String nome) throws DAOException {
		List<Atendente> lista = new ArrayList<>();
		con = ConnectionBuilder.getInstance().getConnection();
		try {
			String sql = "SELECT ate.id_atendente, cli.nome, ate.nome, ate.cpf, ate.nascimento, ate.endereco, ate.cep, ate.bairro, ate.cidade, ate.estado, ate.telefone, ate.celular FROM atendente ate inner join clinica cli on (ate.id_clinica = cli.id_clinica) WHERE ate.nome like ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, "%" + nome + "%");
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) { 
				Atendente ate = new Atendente();
				ate.setId(rs.getInt("ate.id_atendente"));
				ate.setNome(rs.getString("ate.nome"));
				ate.setCpf(rs.getString("ate.cpf"));
				ate.setCep(rs.getString("ate.cep"));
				ate.setDatanasc(rs.getDate("ate.nascimento"));
				ate.setEnd(rs.getString("ate.endereco"));
				ate.setBairro(rs.getString("ate.bairro"));
				ate.setCidade(rs.getString("ate.cidade"));
				ate.setEstado(rs.getString("ate.estado"));
				ate.setTel(rs.getString("ate.telefone"));
				ate.setCel(rs.getString("ate.celular"));
				ate.setClinicaNome(rs.getString("cli.nome"));
				lista.add(ate);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException(e);
		}
		return lista;
	}

	@Override
	public List<Atendente> pesquisarTodos() throws DAOException {
		return pesquisarPorNome("");
	}

	@Override
	public Atendente pesquisarPorId(int id) throws DAOException {
		Atendente ate = null;
		con = ConnectionBuilder.getInstance().getConnection();
		try {
			String sql = "SELECT * FROM atendente WHERE id_atendente = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) { 
				ate = new Atendente();
				ate.setId(rs.getInt("id_atendente"));
				ate.setClinica(rs.getInt("id_clinica"));
				ate.setNome(rs.getString("nome"));
				ate.setCpf(rs.getString("cpf"));
				ate.setCep(rs.getString("cep"));
				ate.setDatanasc(rs.getDate("nascimento"));
				ate.setEnd(rs.getString("endereco"));
				ate.setBairro(rs.getString("bairro"));
				ate.setCidade(rs.getString("cidade"));
				ate.setEstado(rs.getString("estado"));
				ate.setTel(rs.getString("telefone"));
				ate.setCel(rs.getString("celular"));
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException(e);
		}
		return ate;
	}

}

