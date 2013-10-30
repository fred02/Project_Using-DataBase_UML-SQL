package IHM;
import java.util.ArrayList;


import Observer.Observable;
import Observer.Observateur;


/**
 * Classe ObjetClavier qui implémente le patron observateur.
 * @version 3.0
 * @author Rafik gharsalli , Olivier Charrier , Fahd Kacem
 * copyright (c) 2012 UQAM
 * All Rights Reserved
 */

public class ObjetClavier implements Observable{

	static Ecran unEcran;
	boolean etatBoutonStart , etatBoutonStop ,etatBoutonInc, etatBoutonDec;
	@SuppressWarnings({  "rawtypes" })
	private ArrayList tabObservateur2 = new ArrayList ();
	Integer mesure = 2;
	

	@SuppressWarnings({ "rawtypes", "static-access" })
	private ObjetClavier(Ecran monEcran){
		this.unEcran=monEcran;
		tabObservateur2 = new ArrayList();


	}


	public void setTouchePresseeStartTrue(){
		notifierObservateurs();	
		etatBoutonStart=true;
	}
	public void setTouchePresseeStopTrue(){
		notifierObservateurs();
		etatBoutonStop=true;
	}
	public void setTouchePresseeIncTrue(){
		
		if(mesure!=7){
		notifierObservateurs();
		etatBoutonInc=true;
		mesure=mesure+1;
		
		
		Ecran.affichMes.setText(mesure.toString());
		}
	
	
	}
	public void setTouchePresseeDecTrue(){
		if(mesure!=2){
			notifierObservateurs();
			etatBoutonDec=true;
			mesure=mesure-1;
			Ecran.affichMes.setText(mesure.toString());
			}
	}

	public void setTouchePresseeStartFalse(){
		notifierObservateurs();

		etatBoutonStart=false;
	}
	public void setTouchePresseeStopFalse(){
		notifierObservateurs();
		etatBoutonStop=false;
	}
	public void setTouchePresseeIncFalse(){
		notifierObservateurs();
		etatBoutonInc=false;
	}
	public void setTouchePresseeDecFalse(){
		notifierObservateurs();
		etatBoutonDec=false;
	}
	public boolean getEtatToucheStart(){
		return etatBoutonStart ;
	}
	public boolean getEtatTouchePresseStop(){
		return etatBoutonStop;	
	}
	public boolean getEtatTouchePresseInc(){
		return etatBoutonInc;	
	}
	public boolean getEtatTouchePresseDec(){
		return etatBoutonDec;	
	}
	
 
	
	public void setValeurMesure(Integer mesure ){
		this.mesure=mesure;

		Ecran.affichMes.setText(mesure.toString());
		notifierObservateurs();


	}
	
	public int getValeurMesure (){
		return mesure  ;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void ajouterObservateur(Observateur objet) {
		// TODO Auto-generated method stub
		tabObservateur2.add(objet);

	}


	@Override
	public void supprimerObservateur(Observateur objet) {
		tabObservateur2.remove(objet);	

	}


	@Override
	public void notifierObservateurs() {
		for (int i=0 ; i<tabObservateur2.size() ; i++ ){
			Observateur objet = (Observateur) tabObservateur2.get(i);
			( (Observateur) objet ).actualiser(this);
		}

	}

	public final synchronized static ObjetClavier getInstance() {
		if (instance==null)
			instance = new ObjetClavier(unEcran);
		return instance;

	}	
	private static ObjetClavier instance; 	

}
