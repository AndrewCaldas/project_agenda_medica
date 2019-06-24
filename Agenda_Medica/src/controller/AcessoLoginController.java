package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DAOException;
import model.AcessoLogin;
import DAO.AcessoDAO;
import DAO.AcessoDAOImpl;
import DAO.ConnectionBuilder;

@WebServlet("/acessoLoginController")
public class AcessoLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

		public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws IOException {
		AcessoDAO acessoDao = new AcessoDAOImpl();

		try {
			String email = req.getParameter("email");
			String senha = req.getParameter("senha");

			System.out.println(email);
			System.out.println(senha);
			
			AcessoLogin al = new AcessoLogin();
			al.setEmail(email);
			al.setSenha(senha);
			
				try {
					String result = "";
					acessoDao.acessar(al);
					if (acessoDao.acessar(al) == true) {

						try{
							Connection con = ConnectionBuilder.getInstance().getConnection();
							String sql = "SELECT c.nome "
									+ "FROM credenciado AS c NATURAL JOIN login as l "
									+ "WHERE email = ?;";
							PreparedStatement stmt = con.prepareStatement(sql);
							stmt.setString(1, al.getEmail());
							ResultSet rs = stmt.executeQuery ();   
							rs.absolute (1);  
							//System.out.println (rs.getString (1));
							result = rs.getString (1);
						
							//stmt.execute();
							con.close();}
						catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						
						System.out.println("Bem vindo " + result + "!");
						res.sendRedirect("./view/verAgenda.jsp");
					} else {
						System.out.println("Acesso negado!");
						res.sendRedirect("./view/index.jsp");
					}
					
				} catch (DAOException e) {
					e.printStackTrace();
				}
			
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
	}
}
