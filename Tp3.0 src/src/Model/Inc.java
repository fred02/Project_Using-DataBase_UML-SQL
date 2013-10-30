package Model;
import Command.Commandes;

/**
 * Classe Incémenter qui implémente le patron Commandes
 * @version 3.0
 * @author Rafik gharsalli , Olivier Charrier , Fahd Kacem
 * copyright (c) 2012 UQAM
 * All Rights Reserved
 */

public class Inc implements Commandes {

	static Cerveau unCerveau; 
	/**
	 * 
	 * @param cerveau
	 */
	@SuppressWarnings("static-access")
	public Inc (Cerveau cerveau) {
		this.unCerveau = cerveau;
	}
     /**
      * 
      */
	public void desactivate() {
		// TODO Auto-generated method stub
		
	}

	/**
	 * 
	 */
	public void executer() {
		Cerveau.getInstance().setInc();
	}
	
	public final synchronized static Start getInstance() {
	    if (instance==null)
	             instance = new Start(Cerveau.getInstance());
	return instance;

	}	
	private static Start instance; 


	
	
	
}