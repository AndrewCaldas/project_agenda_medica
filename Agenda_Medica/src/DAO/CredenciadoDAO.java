package DAO;

import java.util.List;

import model.Credenciado;

public interface CredenciadoDAO {
	void adicionar(Credenciado c) throws DAOException;
	void atualizar(int id, Credenciado c) throws DAOException;
	void remover(int id) throws DAOException;
	List<Credenciado> pesquisarPorNome(String nome) throws DAOException;
	List<Credenciado> pesquisarTodos() throws DAOException;
	Credenciado pesquisarPorId(int id) throws DAOException;
}