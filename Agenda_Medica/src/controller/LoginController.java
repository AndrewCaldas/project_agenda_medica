package controller;

import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DAOException;
import DAO.LoginDAO;
import model.Login;
import DAO.LoginDAOImpl;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/loginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		LoginDAO loginDao = new LoginDAOImpl();
		try {
			String email = request.getParameter("email");
			String senha = request.getParameter("senha");
		
			Login l = new Login();
			l.setEmail(email);
			l.setSenha(senha);
			
			String texto = "";
			loginDao.adicionar(l);
			texto = "Login cadastrado com sucesso";
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (DAOException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("./view/conta.jsp");		
	}

}
