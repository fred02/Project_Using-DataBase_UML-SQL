package Sortie;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.Timer;

import Command.Commandes;
import IHM.Ecran;

/**
 * 
 * @version 2.6
 * @author Rafik gharsalli , Olivier Charrier , Fahd Kacem
 * copyright (c) 2012 UQAM
 * All Rights Reserved
 */
public class FlasherLed2 implements Commandes{

	Ecran unEcran ;

	private FlasherLed2 (Ecran ecr ){
		this.unEcran = ecr ;

	}

	@Override
	public void executer() {
		// TODO Auto-generated method stub
		//AllumerLed.getInstance().executer();
		unEcran.panLed2.setBackground(Color.red);
		//EteindreLed.getInstance().executer();
		Timer timer=new Timer(150, new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				//eteindreLED()  ; 
				//unEcran.panLed.setBackground(Color.white);
				Ecran.getInstance().panLed2.setBackground(Color.white);


			}
		});
		timer.setRepeats(false);     
		timer.start();
	}

	


	public final synchronized static FlasherLed2 getInstance() {
		if (instance==null)
			instance = new FlasherLed2(Ecran.getInstance());
		return instance;

	}	
	private static FlasherLed2 instance; 

}