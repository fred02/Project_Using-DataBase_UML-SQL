package Model;
import Command.Commandes;

/**
 * Classe Start qui implémente le patron Comamnde
 * @version 2.6
 * @author Rafik gharsalli , Olivier Charrier , Fahd Kacem
 * copyright (c) 2012 UQAM
 * All Rights Reserved
 */

public class Start implements Commandes {

	static Cerveau unCerveau; 
	/**
	 * 
	 * @param cerveau
	 */
	@SuppressWarnings("static-access")
	public Start (Cerveau cerveau) {
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
		Cerveau.getInstance().setStart();
	}
	
	public final synchronized static Start getInstance() {
	    if (instance==null)
	             instance = new Start(Cerveau.getInstance());
	return instance;

	}	
	private static Start instance; 


	
	
	
}
