package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Especialidade;

public class EspecialidadeDAOImpl {
	private Connection con; 
	
	public List<Especialidade> listarEspecialidade() throws DAOException {
		List<Especialidade> lista = new ArrayList<>();
		con = ConnectionBuilder.getInstance().getConnection();
		try {
			String sql = "SELECT * FROM especialidade";
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) { 
				Especialidade esp = new Especialidade();
				esp.setId(rs.getInt("id_especialidade"));
				esp.setNome(rs.getString("nome"));
				lista.add(esp);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException(e);
		}
		return lista;
	}
}
