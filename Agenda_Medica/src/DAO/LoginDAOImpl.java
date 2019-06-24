package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.mysql.cj.jdbc.Blob;
import model.Login;
public class LoginDAOImpl implements LoginDAO{
	private Connection con; 
	@Override
	public void adicionar(Login l) throws DAOException {
		// TODO Auto-generated method stub
		con = ConnectionBuilder.getInstance().getConnection();
		try {
			String sql = "INSERT INTO login "
					+ "(senha, email) VALUES "
					+ "(?, ?);";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, l.getSenha());
			stmt.setString(2, l.getEmail());
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
