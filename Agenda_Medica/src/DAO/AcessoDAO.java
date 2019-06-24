package DAO;

import model.AcessoLogin;

public interface AcessoDAO {
	boolean acessar(AcessoLogin al) throws DAOException;
}
