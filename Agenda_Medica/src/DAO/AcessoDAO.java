package DAO;

import java.util.List;

import model.AcessoLogin;

public interface AcessoDAO {
	List<AcessoLogin> acessar(String email, String senha) throws DAOException;
}
