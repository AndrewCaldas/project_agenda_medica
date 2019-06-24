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
		String cmd = req.getParameter("cmd");
		HttpSession session = req.getSession();
		List<Empresa> encontrados = new ArrayList<>();
		// lista = (List<Jogo>)getServletContext().getAttribute("LISTA");
		if (id != null && !id.isEmpty()) {
			int numId = Integer.parseInt(id);
			Empresa emp = null;
			if ("editar".equals(cmd)) {	
				try {	
					emp = empresaDao.pesquisarPorId(numId);
				} catch (DAOException e) {
					e.printStackTrace();
				}
				session.setAttribute("EMPRESA", emp);
				res.sendRedirect("./view/empresa.jsp");
			}
			else if ("listar".equals(cmd)) {
				try {
					session.setAttribute("ENCONTRADOS",null);
					session.setAttribute("ENCONTRADOS", empresaDao.pesquisarTodos());
				} catch (DAOException e) {
					e.printStackTrace();
				} 
				res.sendRedirect("./view/verAgenda.jsp");
			}
			else if ("remover".equals(cmd)) {
				try {
					empresaDao.remover(numId);
					session.setAttribute("ENCONTRADOS", empresaDao.pesquisarTodos());
				} catch (DAOException e) {
					e.printStackTrace();
				}
				res.sendRedirect("./view/empresa.jsp");
			}
			else if ("pesquisar".equals(cmd)) {
				encontrados.clear();
				//				for (Jogo jogo : lista) { 
				//					if (jogo.getNome().contains(j.getNome())) {
				//						encontrados.add(jogo);
				//					}
				//				}
				try {
					encontrados.addAll(empresaDao.pesquisarPorNome(emp.getNome()));
				} catch (DAOException e) {
					e.printStackTrace();
				}
				session.setAttribute("EMPRESA", null);
				res.sendRedirect("./view/empresa.jsp");
			}
		}
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
			System.out.println(estado);
			System.out.println(tel);
			System.out.println(responsavel);
			System.out.println(cpfresponsavel);
			
			Empresa emp = new Empresa();
			emp.setId(intId);
			emp.setNome(nome);
			emp.setCnpj(cnpj);
			emp.setCep(cep);
			emp.setEnd(end);
			emp.setBairro(bairro);
			emp.setCidade(cidade);
			emp.setEstado(estado);
			emp.setTel(tel);
			emp.setResponsavel(responsavel);
			emp.setCpfResponsavel(cpfresponsavel);

			String texto = "";
			List<Empresa> encontrados = new ArrayList<>();
			if ("Cadastrar".equals(cmd)) { 
				try {
					empresaDao.adicionar(emp);
					texto = "Empresa cadastrado com sucesso";
					session.setAttribute("EMPRESA", null);
					encontrados.addAll(empresaDao.pesquisarTodos());
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
					empresaDao.atualizar(emp.getId(), emp);
//					texto = "Empresa atualizado com sucesso";
					encontrados.addAll(empresaDao.pesquisarTodos());
					session.setAttribute("EMPRESA", null);
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
					encontrados.addAll(empresaDao.pesquisarPorNome(emp.getNome()));
				} catch (DAOException e) {
					e.printStackTrace();
				}
				session.setAttribute("EMPRESA", null);
			}
			//session.setAttribute("MENSAGEM", texto);
			session.setAttribute("ENCONTRADOS", encontrados);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		res.sendRedirect("./view/empresa.jsp");
	}
}
