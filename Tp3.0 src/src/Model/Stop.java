package Model;
import Command.Commandes;

/**
 * Classe Stop qui implémente le patron Commandes.
 * @version 2.6
 * @author Rafik gharsalli , Olivier Charrier , Fahd Kacem
 * copyright (c) 2012 UQAM
 * All Rights Reserved
 */
public class Stop implements Commandes 
{

	Cerveau unCerveau ;

	public Stop (Cerveau cerveau)
	{
		this.unCerveau = cerveau ;
	}



	@Override
	public void executer() {
		Cerveau.getInstance().setStop();
	}

	public final synchronized static Stop getInstance() {
		if (instance==null)
			instance = new Stop (Cerveau.getInstance());
		return instance;

	}	
	private static Stop instance; 


}
