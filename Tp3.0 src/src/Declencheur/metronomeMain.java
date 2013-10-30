package Declencheur;

import Model.Detecteur;

/**
 * Classe main
 * @version 3.0
 * @author Rafik gharsalli , Olivier Charrier , Fahd Kacem
 * copyright (c) 2012 UQAM
 * All Rights Reserved
 */

public class metronomeMain {

	public static void main(String[] args) {

		
		Detecteur detecteur = Detecteur.getInstance();
		detecteur.detectionIhm();

	}	
}	






