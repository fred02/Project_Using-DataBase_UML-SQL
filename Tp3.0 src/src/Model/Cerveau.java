package Model;

import java.util.Timer;
import java.util.TimerTask;

import IHM.Ecran;
import IHM.ObjetClavier;
import IHM.ObjetMolette;
import Sortie.EmettreBip;
import Sortie.FlasherLed1;
import Sortie.FlasherLed2;



/**
 * Classe Cerveau permet de déclencher les commandes du métronome .
 * @version 3.0
 * @author Rafik Gharsalli , Olivier Charrier , Fahd Kacem
 * copyright (c) 2012 UQAM
 * All Rights Reserved
 */

public class Cerveau {
	static Ecran ecran ;
	private boolean start = false;
	
	Timer timer  = new Timer();
	
	boolean moletteChanger = false;
	boolean mesureChanger = false;
    int compteur = ObjetClavier.getInstance().getValeurMesure();
	

	/**
	 * 
	 * @param ecran
	 */
	//constructeur du detecteur
	@SuppressWarnings("static-access")
	
	private Cerveau(Ecran ecran ){
		this.ecran = ecran;	   

	}

	/**
	 * Permet de produire le flash du led.
	 */
	FlasherLed1 flasher  ;
	
	public void produireSortie(){


		long monTempo = ObjetMolette.getInstance().valeurMolette();
        
        
		timer.schedule (new TimerTask() { 
			

			public void run()
			{
				
				
				
				if (moletteChanger){
					cancel();
					moletteChanger = false ;
					
					produireSortie();

				}else if (start){
					
					FlasherLed1.getInstance().executer();
					EmettreBip.getInstance().executer();
					
					compteur--;
					
					
					if(compteur==0){
						
						FlasherLed2.getInstance().executer();
						compteur = ObjetClavier.getInstance().getValeurMesure();
					}
					


				}else{

					cancel();
				} 
			}
		}, 0, (60000/monTempo));	


	}




	/**
	 * 
	 * @param a
	 */
	public void setTempo(long a){ 	
	}	
	/**
	 * 
	 */
	public void setStart(){



		if (start != true){
			start = true; 	

			produireSortie();
		}
	}
	/**
	 * 
	 */
	public void setStop(){

		start = false;


	}
	
	/**
	 * 
	 * @param a
	 */
	public void changement(){

		moletteChanger = true ;
	}	
	
	
	/**
	 * 
	 * @return
	 */
	public boolean getStart(){
		return start;	
	}

	public void setInc(){
		
		mesureChanger = true;	
	}
	
	public void setDec(){
		
		mesureChanger = true;	
	}

	public final synchronized static Cerveau getInstance() {
		if (instance==null)
			instance = new Cerveau(Ecran.getInstance());
		return instance;

	}	
	private static Cerveau instance; 




}