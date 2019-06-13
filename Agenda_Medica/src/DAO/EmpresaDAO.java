package DAO;

import java.util.List;

import model.Empresa;

public interface EmpresaDAO {
	void adicionar(Empresa c) throws DAOException;
	void atualizar(int id, Empresa c) throws DAOException;
	void remover(int id) throws DAOException;
	List<Empresa> pesquisarPorNome(String nome) throws DAOException;
	List<Empresa> pesquisarTodos() throws DAOException;
	Empresa pesquisarPorId(int id) throws DAOException;
}