package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.mysql.cj.jdbc.Blob;

import model.AcessoLogin;
public class AcessoDAOImpl{
	
	private Connection con; 
	public List<AcessoLogin> acessar(String email, String senha) throws DAOException {
		List<AcessoLogin> lista = new ArrayList<>();
		con = ConnectionBuilder.getInstance().getConnection();
		try {
			String sql = "SELECT email, senha FROM login WHERE email = ? and senha = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, email);
			stmt.setString(2, senha);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) { 
				AcessoLogin acesso = new AcessoLogin();
				acesso.setEmail(rs.getString("email"));
				acesso.setSenha(rs.getString("senha"));
				lista.add(acesso);				
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException(e);
		}
		return lista;
	}
	
}
