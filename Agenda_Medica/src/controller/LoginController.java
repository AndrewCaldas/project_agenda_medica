package controller;

import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CredenciadoDAO;
import DAO.CredenciadoDAOImpl;
import DAO.DAOException;
import DAO.LoginDAO;
import model.Login;
import DAO.LoginDAOImp;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/loginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		LoginDAO loginDao = new LoginDAOImp();
		
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		String perfil = request.getParameter("perfil");
		perfil= "1";
		//String login = request.getParameter("login");
		//login = "ADM.03";
		String sistema = request.getParameter("sistema");
		sistema = "1";
		int numperfil = Integer.parseInt(perfil);
		int numsistema = Integer.parseInt(sistema);
		
		// fazendo a conversão da data
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				
				Login l = new Login();
				l.setNome(nome);
				l.setEmail(email);
				l.setSenha(senha);
				l.setPerfil(numperfil);
				//l.setLogin(login);
				System.out.println("ok");
				try {
					loginDao.adicionar(l);
				} catch (DAOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				response.sendRedirect("./view/conta.jsp");		
		
	}

}
