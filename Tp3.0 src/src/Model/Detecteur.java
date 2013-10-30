package Model;

import java.util.Timer;
import java.util.TimerTask;

import Command.Commandes;
import IHM.Ecran;
import IHM.ObjetClavier;
import IHM.ObjetMolette;
import Observer.*;
/**
 * Classe Detecteur qui permet de scrutter les boutons et la molette et verifie tout changment d'etat.
 * @version 3.0
 * @author Rafik gharsalli , Olivier Charrier , Fahd Kacem
 * copyright (c) 2012 UQAM
 * All Rights Reserved
 */
public class Detecteur implements Commandes , Observateur {


	//private long dettempoMolette = 0;
	
 

	static Ecran ecran;
	/**
	 * 
	 * @param ecran
	 */
	@SuppressWarnings("static-access")
	private Detecteur(Ecran ecran ){

		this.ecran = ecran;


	}
	/**
	 * 
	 * Active l'action toute les period en secondes. L'action se repete a l'infini sans
     * tant que la method scruter n'est pas utilisé
	 */
	public void detectionIhm(){
		Timer timer = new Timer();

		timer.schedule (new TimerTask() {

			public void run()
			{
				scruterStart(ObjetClavier.getInstance());
				scruterStop(ObjetClavier.getInstance());
				scruterInc(ObjetClavier.getInstance());
				scruterDec(ObjetClavier.getInstance());
				scrutermolette(ObjetMolette.getInstance());

			}
		}, 0, 100);	


	}
	/**
	 * Permet de scrutter le bouton Start de l'objet Clavier et verifie s'il y'a un changemet d'etat .
	 */
	
	
	 
	 private void scruterStart(Observable o){



			if (o instanceof ObjetClavier)   {
				ObjetClavier g = (ObjetClavier) o;
				if(g.getEtatToucheStart() == true){
					Start.getInstance().executer();
					//ObjetClavier.getInstance().ajouterObservateur(Detecteur.getInstance());
				}

			}

			ObjetClavier.getInstance().setTouchePresseeStartFalse();
		}
	 

	/**
	 * Permet de scruter le bouton Stop de l'objet Clavier et verifie s'il y'a un changement d'etat .
	 */
	private void scruterStop(Observable o){

		if (o instanceof ObjetClavier){
			ObjetClavier g = (ObjetClavier) o;
			if(g.getEtatTouchePresseStop() == true){
				Stop.getInstance().executer();
				
			}
			
		}
		
	
	//	ObjetClavier.getInstance().ajouterObservateur(Detecteur.getInstance());
		ObjetClavier.getInstance().setTouchePresseeStopFalse();
	}

	private void scruterInc(Observable o){

		if(o instanceof ObjetClavier){
            ObjetClavier g = (ObjetClavier) o;
            if(g.getEtatTouchePresseInc() == true){
				Inc.getInstance().executer();
				Cerveau.getInstance().changement();
			}
			
		}
		
		
		ObjetClavier.getInstance().setTouchePresseeIncFalse();

	}
	
	private void scruterDec(Observable o){

		if(o instanceof ObjetClavier){
            ObjetClavier g = (ObjetClavier) o;
            
            if(g.getEtatTouchePresseInc() == true){
				Dec.getInstance().executer();
				Cerveau.getInstance().changement();
			}
			
		}
		
		ObjetClavier.getInstance().setTouchePresseeDecFalse();

	}
	
	/**
	 * Permet de scruter la molette de l'objet Molette et verifie s'il y'a un changement d'etat .
	 */
	
	private void scrutermolette(Observable o){

		if(o instanceof ObjetMolette){
            
            	Cerveau.getInstance().changement();
           
			
		}
		
		//ObjetMolette.getInstance().ajouterObservateur(Detecteur.getInstance());
		ObjetMolette.getInstance().setEtatMoletteFaux();

	}

	@Override
	public void executer() {
		// TODO Auto-generated method stub

	}
	public final synchronized static Detecteur getInstance() {
		if (instance==null)
			instance = new Detecteur(Ecran.getInstance());
		return instance;

	}	
	private static Detecteur instance;


	@Override
	public void actualiser(Observable objet) {
		// TODO Auto-generated method stub
		
	}


	






}


