package controller;

//import java.awt.List;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AtendenteDAO;
import DAO.AtendenteDAOImpl;
import DAO.ClinicoDAO;
import DAO.ClinicoDaoImpl;
import DAO.DAOException;
import model.Atendente;
import model.Clinico;

@WebServlet("/clinicoController")
public class ClinicoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { 
		AtendenteDAO atendenteDao = new AtendenteDAOImpl();
		//ClinicoDAO clinicoDao = new ClinicoDAOImpl();
		String id = request.getParameter("id");
		String cmd = request.getParameter("cmd");
		HttpSession session = request.getSession();
		List<Atendente> encontrados = new ArrayList<>();
		// lista = (List<Jogo>)getServletContext().getAttribute("LISTA");
		if (id != null && !id.isEmpty()) {
			int numId = Integer.parseInt(id);
			Atendente ate = null;
			if ("editar".equals(cmd)) {	
				try {	
					ate = atendenteDao.pesquisarPorId(numId);
				} catch (DAOException e) {
					e.printStackTrace();
				}
				session.setAttribute("ATENDENTE", ate);
				response.sendRedirect("./view/atendente.jsp");
			}
			else if ("listar".equals(cmd)) {
				//try {
				session.setAttribute("ENCONTRADOS",null);
					//session.setAttribute("ENCONTRADOS", clinicoDao.pesquisarTodos());
				//} //catch (DAOException e) {
					//e.printStackTrace();
				//} 
				response.sendRedirect("./view/verAgenda.jsp");
			}
			else if ("remover".equals(cmd)) {
				try {
					atendenteDao.remover(numId);
					session.setAttribute("ENCONTRADOS", atendenteDao.pesquisarTodos());
				} catch (DAOException e) {
					e.printStackTrace();
				}
				response.sendRedirect("./view/atendente.jsp");
			}
			else if ("pesquisar".equals(cmd)) {
				encontrados.clear();
				//				for (Jogo jogo : lista) { 
				//					if (jogo.getNome().contains(j.getNome())) {
				//						encontrados.add(jogo);
				//					}
				//				}
				try {
					encontrados.addAll(atendenteDao.pesquisarPorNome(ate.getNome()));
				} catch (DAOException e) {
					e.printStackTrace();
				}
				session.setAttribute("ATENDENTE", null);
				response.sendRedirect("./view/atendente.jsp");
			}
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ClinicoDAO clinicoDao = new ClinicoDaoImpl();
		HttpSession session = request.getSession();
		try {
			String id = request.getParameter("id_medico");
			if (id == null || id.isEmpty()) { 
			id = "0";
		}
		// pegando os parâmetros do request
		String idlogin = request.getParameter("Id_login");
		idlogin= "2";
		String idclinica = request.getParameter("Id_clinica");
		idclinica = "1";
		String cmd = request.getParameter("cmd");
		String nome = request.getParameter("nome");
		String cpf = request.getParameter("cpf");
		String crm = request.getParameter("crm");
		String endereco = request.getParameter("endereco");
		String bairro = request.getParameter("bairro");
		String cep = request.getParameter("cep");
		String cidade = request.getParameter("cidade");
		String estado = request.getParameter("estado");
		String telefone = request.getParameter("telefone");
		String celular = request.getParameter("celular");
		String datanascimento = request.getParameter("nascimento");
		String login = request.getParameter("cmd");
		int numId = Integer.parseInt(id);
		int numlogin = Integer.parseInt(idlogin);
		int numclinica = Integer.parseInt(idclinica);
		int numcrm = Integer.parseInt(crm);
		
		//int numclinica = Integer.parseInt(idclinica);
		
		// fazendo a conversão da data
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Clinico c = new Clinico();
		c.setId_login(numlogin);
		c.setId_clinica(numclinica);
		c.setNome(nome);
		c.setCpf(cpf);
		c.setCrm(numcrm);
		c.setEndereco(endereco);
		c.setBairro(bairro);
		c.setCep(cep);
		c.setCidade(cidade);
		c.setEstado(estado);
		c.setTelefone(telefone);
		c.setCelular(celular);
		c.setDatanascimento(sdf.parse(datanascimento));
		
		String texto = "";
		List<Clinico> encontrados = new ArrayList<>();
		if ("Cadastrar".equals(cmd)) { 
			try {
				System.out.println("ok");
				clinicoDao.adicionar(c);
				//texto = "Clínico cadastrado com sucesso";
				session.setAttribute("CLINICO", null);
				encontrados.addAll(clinicoDao.pesquisarTodos());
				
			} catch (DAOException e) {
				e.printStackTrace();
			}
		} else  if("Salvar".equals(cmd)) {
		try {
			clinicoDao.atualizar(c.getId_medico(), c);
			texto = "Clinico atualizado com sucesso";
			encontrados.addAll(clinicoDao.pesquisarTodos());
			session.setAttribute("CLINICO", null);
			
			//c.setDatanacimento(sdf.parse(datanascimento));
		} catch (DAOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		} else if ("Pesquisar".equals(cmd)) {
				encontrados.clear();
				try {
					encontrados.addAll(clinicoDao.pesquisarPorNome(c.getNome()));
				} catch (DAOException e) {
					e.printStackTrace();
				}
				session.setAttribute("CLINICO", null);
			}
			session.setAttribute("ENCONTRADOS", encontrados);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		//session.setAttribute("CLINICO", null);
		response.sendRedirect("./view/confirmaCadastroClinico.jsp");
	}

	
}
