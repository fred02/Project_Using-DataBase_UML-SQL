package DAO;

/**
 * Classe Abstraite DAO 
 * @version 3.0
 * @author Rafik gharsalli , Olivier Charrier , Fahd Kacem
 * copyright (c) 2012 UQAM
 * All Rights Reserved
 */
public abstract class DAO<T> {

	public abstract T Trouver (int id) ;
	public abstract int  update(T obj) ;

}
