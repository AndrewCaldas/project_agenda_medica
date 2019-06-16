package DAO;

import java.util.List;

import model.Atendente;

public interface AtendenteDAO {
	void adicionar(Atendente ate) throws DAOException;
	void atualizar(int id, Atendente ate) throws DAOException;
	void remover(int id) throws DAOException;
	List<Atendente> pesquisarPorNome(String nome) throws DAOException;
	List<Atendente> pesquisarTodos() throws DAOException;
	Atendente pesquisarPorId(int id) throws DAOException;
}