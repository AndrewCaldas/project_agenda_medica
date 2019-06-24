package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.AcessoLogin;

public class AcessoDAOImpl implements AcessoDAO{
	private Connection con;
	
	@Override
	public boolean acessar(AcessoLogin al) throws DAOException {
		boolean result = false;
		
		con = ConnectionBuilder.getInstance().getConnection();
		try {
			/*String sql = "SELECT CASE WHEN a = 1 THEN 'TRUE' ELSE 'FALSE' END AS ACESSO "
						+ "FROM (SELECT COUNT(ID_LOGIN) AS a FROM login	"
						+ "WHERE email = ? AND senha = ?) a;";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, al.getEmail());
			stmt.setString(2, al.getSenha());*/
			
			String sql = "CALL Acessar(?,?);";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, al.getEmail());
			stmt.setString(2, al.getSenha());
			ResultSet rs = stmt.executeQuery ();   
			rs.absolute (1);  
			//System.out.println (rs.getString (1));
			result = Boolean.parseBoolean(rs.getString (1));
			
			//stmt.execute();
			con.close();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException(e);
		}
	}
	
}
