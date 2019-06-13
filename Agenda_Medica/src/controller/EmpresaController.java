package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.DAOException;
import model.Empresa;
import DAO.EmpresaDAO;
import DAO.EmpresaDAOImpl;

@WebServlet("/empresaController")
public class EmpresaController extends HttpServlet {
	// private List<Jogo> lista;
	private static final long serialVersionUID = 5931706310984055050L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws IOException { 
		EmpresaDAO empresaDao = new EmpresaDAOImpl();
		String id = req.getParameter("id");
		String nome = req.getParameter("nome");
		String cnpj = req.getParameter("cnpj");
		String cep = req.getParameter("cep");
		String end = req.getParameter("end");
		String bairro = req.getParameter("bairro");
		String cidade = req.getParameter("cidade");
		String estado = req.getParameter("estado");
		String tel = req.getParameter("tel");
		String responsavel = req.getParameter("responsavel");
		String cpfresponsavel = req.getParameter("cpfresponsavel");
		HttpSession session = req.getSession();
		// lista = (List<Jogo>)getServletContext().getAttribute("LISTA");
		if (id != null && !id.isEmpty()) {
			
			/*if ("Cadastrar".equals(cmd)) {*/	
				int numId = Integer.parseInt(id);
				Empresa e = null;
				try {	
					e = empresaDao.pesquisarPorId(numId);
				} catch (DAOException ex) {
					ex.printStackTrace();
				}
				session.setAttribute("EMPRESA", e);
			//}
			/*else if ("remover".equals(cmd)) {
				try {
					jogoDao.remover(numId);
					session.setAttribute("ENCONTRADOS", 
							jogoDao.pesquisarTodos());
				} catch (DAOException e) {
					e.printStackTrace();
				}
			}*/
		}
		res.sendRedirect("./verAgenda.jsp");
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws IOException {
		EmpresaDAO empresaDao = new EmpresaDAOImpl();
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
			String cnpj = req.getParameter("cnpj");
			String cep = req.getParameter("cep");
			String end = req.getParameter("end");
			String bairro = req.getParameter("bairro");
			String cidade = req.getParameter("cidade");
			String estado = req.getParameter("estado");
			String tel = req.getParameter("tel");
			String responsavel = req.getParameter("responsavel");
			String cpfresponsavel = req.getParameter("cpfresponsavel");
			int intId = Integer.parseInt(id);	

			System.out.println(cmd);
			System.out.println(intId);
			System.out.println(nome);
			System.out.println(cnpj);
			System.out.println(cep);
			System.out.println(end);
			System.out.println(bairro);
			System.out.println(cidade);
			System.out.println(tel);
			System.out.println(responsavel);
			System.out.println(cpfresponsavel);
			
			Empresa e = new Empresa();
			e.setId(intId);
			e.setNome(nome);
			e.setCnpj(cnpj);
			e.setCep(cep);
			e.setEnd(end);
			e.setBairro(bairro);
			e.setCidade(cidade);
			e.setEstado(estado);
			e.setTel(tel);
			e.setResponsavel(responsavel);
			e.setCpfResponsavel(cpfresponsavel);

			String texto = "";
			List<Empresa> encontrados = new ArrayList<>();
			if ("Cadastrar".equals(cmd)) { 
				try {
					empresaDao.adicionar(e);
					texto = "Empresa cadastrada com sucesso";
					session.setAttribute("EMPRESA", null);
					encontrados.addAll(empresaDao.pesquisarTodos());
				} catch (DAOException ex) {
					ex.printStackTrace();
				}
			} /*else if ("Salvar".equals(cmd)) {
				//				for (Jogo jogo : lista) { 
				//					if (jogo.getId() == j.getId()) {
				//						lista.remove(jogo);
				//						lista.add(j);
				//						break;
				//					}
				//				}
				try {
					jogoDao.atualizar(j.getId(), j);
					texto = "Jogo atualizado com sucesso";
					encontrados.addAll(jogoDao.pesquisarTodos());
					session.setAttribute("JOGO", null);
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
					encontrados.addAll(
							jogoDao.pesquisarPorNome(j.getNome()));
				} catch (DAOException e) {
					e.printStackTrace();
				}
				session.setAttribute("JOGO", null);
			}*/
			session.setAttribute("MENSAGEM", texto);
			session.setAttribute("ENCONTRADOS", encontrados);
		} catch (NumberFormatException ex) {
			ex.printStackTrace();
		}
		res.sendRedirect("./verAgenda.jsp");
	}
}
