package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.mysql.cj.jdbc.Blob;
import model.Login;
public class LoginDAOImp implements LoginDAO{
	private Connection con; 
	@Override
	public void adicionar(Login l) throws DAOException {
		// TODO Auto-generated method stub
		con = ConnectionBuilder.getInstance().getConnection();
		try {
			String sql = "INSERT INTO login "
					+ "(id_perfil, acesso_sistema, senha, email) VALUES "
					+ "(?, ?, ?, ?);";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, l.getPerfil());
			stmt.setInt(2, l.getSistema());
			//stmt.setString(3, l.getLogin());
			stmt.setString(3, l.getSenha());
			stmt.setString(4, l.getEmail());
			stmt.execute();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException(e);
		}
	

	}

	@Override
	public void atualizar(int id, Login l) throws DAOException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remover(int id) throws DAOException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Login> pesquisarPorNome(String nome) throws DAOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Login> pesquisarTodos() throws DAOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Login pesquisarPorId(int id) throws DAOException {
		// TODO Auto-generated method stub
		return null;
	}

}
