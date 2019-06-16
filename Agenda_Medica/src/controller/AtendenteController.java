package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.DAOException;
import model.Atendente;
import DAO.AtendenteDAO;
import DAO.AtendenteDAOImpl;

@WebServlet("/atendenteController")
public class AtendenteController extends HttpServlet {
	// private List<Jogo> lista;
	private static final long serialVersionUID = 5931706310984055050L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws IOException { 
		AtendenteDAO atendenteDao = new AtendenteDAOImpl();
		String id = req.getParameter("id");
		String cmd = req.getParameter("cmd");
		HttpSession session = req.getSession();
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
				res.sendRedirect("./view/atendente.jsp");
			}
			else if ("remover".equals(cmd)) {
				try {
					atendenteDao.remover(numId);
					session.setAttribute("ENCONTRADOS", atendenteDao.pesquisarTodos());
				} catch (DAOException e) {
					e.printStackTrace();
				}
				res.sendRedirect("./view/atendente.jsp");
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
				res.sendRedirect("./view/atendente.jsp");
			}
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws IOException {
		AtendenteDAO atendenteDao = new AtendenteDAOImpl();
		HttpSession session = req.getSession();
		// lista = (List<Jogo>)getServletContext().getAttribute("LISTA");
		// if (lista == null) { 
		//	lista = new ArrayList<>();
		//	getServletContext().setAttribute("LISTA", lista);
		//}
		try {
			String id = req.getParameter("id");
			if (id == null || id.isEmpty()) { 
				id = "0";
			}
			String cmd = req.getParameter("cmd");
			String nome = req.getParameter("nome");
			String cpf = req.getParameter("cpf");
			String cep = req.getParameter("cep");
			String datanasc = req.getParameter("datanasc");
			String end = req.getParameter("end");
			String bairro = req.getParameter("bairro");
			String cidade = req.getParameter("cidade");
			String estado = req.getParameter("estado");
			String tel = req.getParameter("tel");
			String cel = req.getParameter("cel");
			int clinica = Integer.parseInt(req.getParameter("clinica"));
			int intId = Integer.parseInt(id);

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");	

			System.out.println(cmd);
			System.out.println(intId);
			System.out.println(nome);
			System.out.println(cpf);
			System.out.println(cep);
			System.out.println(datanasc);
			System.out.println(end);
			System.out.println(bairro);
			System.out.println(cidade);
			System.out.println(tel);
			System.out.println(cel);
			System.out.println(clinica);
			
			Atendente ate = new Atendente();
			ate.setId(intId);
			ate.setNome(nome);
			ate.setCpf(cpf);
			ate.setCep(cep);
			ate.setDatanasc(sdf.parse(datanasc));
			ate.setEnd(end);
			ate.setBairro(bairro);
			ate.setCidade(cidade);
			ate.setEstado(estado);
			ate.setTel(tel);
			ate.setCel(cel);
			ate.setClinica(clinica);

			String texto = "";
			List<Atendente> encontrados = new ArrayList<>();
			if ("Cadastrar".equals(cmd)) { 
				try {
					atendenteDao.adicionar(ate);
					texto = "Atendente cadastrado com sucesso";
					session.setAttribute("ATENDENTE", null);
					encontrados.addAll(atendenteDao.pesquisarTodos());
				} catch (DAOException e) {
					e.printStackTrace();
				}
			} else if ("Salvar".equals(cmd)) {
				//				for (Jogo jogo : lista) { 
				//					if (jogo.getId() == j.getId()) {
				//						lista.remove(jogo);
				//						lista.add(j);
				//						break;
				//					}
				//				}
				try {
					atendenteDao.atualizar(ate.getId(), ate);
//					texto = "Atendente atualizado com sucesso";
					encontrados.addAll(atendenteDao.pesquisarTodos());
					session.setAttribute("ATENDENTE", null);
				} catch (DAOException e) {
					e.printStackTrace();
				}
			} else if ("Pesquisar".equals(cmd)) {
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
			}
			//session.setAttribute("MENSAGEM", texto);
			session.setAttribute("ENCONTRADOS", encontrados);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		res.sendRedirect("./view/atendente.jsp");
	}
}
