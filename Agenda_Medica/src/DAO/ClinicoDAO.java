package DAO;

import java.util.List;

import model.Clinico;

public interface ClinicoDAO {
	void adicionar(Clinico c) throws DAOException;
	void atualizar(int id, Clinico c) throws DAOException;
	void remover(int id) throws DAOException;
	List<Clinico> pesquisarPorNome(String nome) throws DAOException;
	List<Clinico> pesquisarTodos() throws DAOException;
	Clinico pesquisarPorId(int id) throws DAOException;
}
