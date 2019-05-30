package DAO;

import java.util.List;

import model.Credenciado;

public interface CredenciadoDAO {
	void adicionar(Credenciado c) throws DAOException;
	/*void atualizar(String nome, Credenciado c) throws DAOException;*/
	/*void remover(String nome) throws DAOException;*/
	List<Credenciado> pesquisarPorNome(String nome) throws DAOException;
	List<Credenciado> pesquisarTodos() throws DAOException;
	/*Credenciado pesquisarPorCpf(String cpf) throws DAOException;*/
}