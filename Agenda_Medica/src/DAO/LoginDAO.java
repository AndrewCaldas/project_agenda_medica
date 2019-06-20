package DAO;

import java.util.List;

import model.Login;

public interface LoginDAO {
	void adicionar(Login l) throws DAOException;
	void atualizar(int id, Login l) throws DAOException;
	void remover(int id) throws DAOException;
	List<Login> pesquisarPorNome(String nome) throws DAOException;
	List<Login> pesquisarTodos() throws DAOException;
	Login pesquisarPorId(int id) throws DAOException;
}
