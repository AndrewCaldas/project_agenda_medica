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
import model.Credenciado;
import DAO.CredenciadoDAO;
import DAO.CredenciadoDAOImpl;

@WebServlet("/credenciadoController")
public class CredenciadoController extends HttpServlet {
	// private List<Jogo> lista;
	private static final long serialVersionUID = 5931706310984055050L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws IOException { 
		CredenciadoDAO credenciadoDao = new CredenciadoDAOImpl();
		String id = req.getParameter("id");
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
		String escolha = req.getParameter("escolha");
		HttpSession session = req.getSession();
		// lista = (List<Jogo>)getServletContext().getAttribute("LISTA");
		if (id != null && !id.isEmpty()) {
			
			/*if ("Cadastrar".equals(cmd)) {*/	
				int numId = Integer.parseInt(id);
				Credenciado c = null;
				try {	
					c = credenciadoDao.pesquisarPorId(numId);
				} catch (DAOException e) {
					e.printStackTrace();
				}
				session.setAttribute("CREDENCIADO", c);
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
		CredenciadoDAO credenciadoDao = new CredenciadoDAOImpl();
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
			int cpf = Integer.parseInt(req.getParameter("cpf"));
			int cep = Integer.parseInt(req.getParameter("cep"));
			String datanasc = req.getParameter("datanasc");
			String end = req.getParameter("end");
			String bairro = req.getParameter("bairro");
			String cidade = req.getParameter("cidade");
			String estado = req.getParameter("estado");
			String tel = req.getParameter("tel");
			String cel = req.getParameter("cel");
			String escolha = req.getParameter("escolha");
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
			System.out.println(escolha);
			
			Credenciado c = new Credenciado();
			c.setId(intId);
			c.setNome( nome );
			c.setCpf(cpf);
			c.setCep(cep);
			c.setDatanasc(sdf.parse(datanasc));
			c.setEnd(end);
			c.setBairro(bairro);
			c.setCidade(cidade);
			c.setEstado(estado);
			c.setTel(tel);
			c.setCel(cel);
			c.setEscolha(escolha);

			String texto = "";
			List<Credenciado> encontrados = new ArrayList<>();
			if ("Cadastrar".equals(cmd)) { 
				try {
					credenciadoDao.adicionar(c);
					texto = "Credenciado cadastrado com sucesso";
					session.setAttribute("CREDENCIADO", null);
					encontrados.addAll(credenciadoDao.pesquisarTodos());
				} catch (DAOException e) {
					e.printStackTrace();
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
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		res.sendRedirect("./verAgenda.jsp");
	}
}
