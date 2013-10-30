package Sortie;

import java.awt.Toolkit;

import Command.Commandes;
import IHM.Ecran;
/**
 * 
 * @version 2.6
 * @author Rafik gharsalli , Olivier Charrier , Fahd Kacem
 * copyright (c) 2012 UQAM
 * All Rights Reserved
 */

public class EmettreBip implements Commandes{
	Ecran unEcran ;



	public EmettreBip (Ecran ecran)
	{
		this.unEcran = ecran ;
	}


	@Override
	public void executer() {
		// TODO Auto-generated method stub
		Toolkit.getDefaultToolkit().beep();
	}
	public final synchronized static EmettreBip getInstance() {
		if (instance==null)
			instance = new EmettreBip(Ecran.getInstance());
		return instance;

	}	
	private static EmettreBip instance; 



}
