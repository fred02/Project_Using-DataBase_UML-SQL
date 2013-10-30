package IHM;
import java.util.ArrayList;

import Observer.Observable;
import Observer.Observateur;


/**
 * Classe ObjetMolette qui implémente le patron observateur.
 * @version 3.0
 * @author Rafik gharsalli , Olivier Charrier , Fahd Kacem
 * copyright (c) 2012 UQAM
 * All Rights Reserved
 */
public class ObjetMolette implements Observable   {

	static Ecran unEcran;
	Integer unePosition;
	public boolean etat;
	@SuppressWarnings("rawtypes")
	private ArrayList tabObservateur = new ArrayList ();

	@SuppressWarnings("rawtypes")
	private ObjetMolette(Ecran ecran) {
		unEcran = ecran;
		tabObservateur = new ArrayList();
	}


	
	
	public void setValeurMolette(Integer positionMolette ){
		this.unePosition=positionMolette;

		Ecran.affichTemp.setText(unePosition.toString());
		notifierObservateurs();


	}

	public Integer valeurMolette (){
		return unePosition;
	}


	public void setEtatMoletteVraie(){
		etat = true ;
		notifierObservateurs();
	}

	public void setEtatMoletteFaux (){
		etat = false ;
		notifierObservateurs();
	}

	public boolean etatMolette (){
		return etat ;
	}

	public int getValeurMolette (){
		return unePosition  ;
	}


	@SuppressWarnings("unchecked")
	@Override
	public void ajouterObservateur(Observateur objet) {
		// TODO Auto-generated method stub
		tabObservateur.add(objet);

	}


	@Override
	public void supprimerObservateur(Observateur objet) {
		// TODO Auto-generated method stub
		tabObservateur.remove(objet);	
	}


	@Override
	public void notifierObservateurs() {
		// TODO Auto-generated method stub
		//System.out.println("tabObserv: " + tabObservateur.size());

		for (int i=0 ; i<tabObservateur.size() ; i++ ){
			Observateur objet = (Observateur) tabObservateur.get(i);
			( (Observateur) objet ).actualiser(this);
			//System.out.println("tabObserv: " + tabObservateur.size());
		}

	}

	public final synchronized static ObjetMolette getInstance() {
		if (instance==null)
			instance = new ObjetMolette(unEcran);
		return instance;

	}	
	private static ObjetMolette instance; 



}

