package DAO;

import java.io.*;
import java.util.Scanner;
import IHM.Ecran;
import IHM.ObjetClavier;
import IHM.ObjetMolette;
/**
 * Classe ObjetSauvegarde
 * @version 3.0
 * @author Rafik gharsalli , Olivier Charrier , Fahd Kacem
 * copyright (c) 2012 UQAM
 * All Rights Reserved
 */
public class ObjetSauvegarde extends DAO<ObjetSauvegarde> {


	//private static  Integer tempo = 60;
	private static Integer tempo_T  ;
	private static Integer mesure;
	private static Integer monTempo  ;
	static Ecran unEcran;
	ObjetMolette mol ;

	int monTem = 100;

	private ObjetSauvegarde(Ecran ecran) {
		unEcran = ecran;
	}



	/*
	 * Méthode qui ecrit  dans le fichier
	 */
	public void ecrireDansFichier (String a , String b) {   

		//mol.setValeurMolette(tempo);
		try 
		{
			FileWriter fichier = new FileWriter("sauvegarde.txt");

			fichier.write (a);
			fichier.write("\r\n");
			fichier.write(b);

			fichier.close();
		}

		catch (java.io.IOException e) {
			e.printStackTrace();
		}		

	}


	/* 
	 * Méthode qui lit dans le fichier
	 */	 
	public int update (ObjetSauvegarde obj){
		tempo_T = 60;
		mesure = 2;
		try
		{	
		String filePath = "sauvegarde.txt";		 
		Scanner scanner= new Scanner(new File(filePath));
		while (scanner.hasNextLine()) {
		    String line = scanner.nextLine();
            tempo_T = Integer.parseInt(line);
            
            if(tempo_T >= 20 && tempo_T <= 200){
    		    monTempo = tempo_T;
    		    ObjetMolette.getInstance().setValeurMolette(monTempo);
    	 		ObjetMolette.getInstance().setEtatMoletteVraie();
    		    
            }
            else if (tempo_T >= 2 && tempo_T <= 7){
    		    mesure = tempo_T ;
    		    ObjetClavier.getInstance().setValeurMesure(mesure);
    		    

            }
            
		}
		 
		scanner.close();
		}	   
		catch (Exception e) 
		{
           
			
		}      
			        

		return monTempo;
	} // fin méthode 

	public final synchronized static ObjetSauvegarde getInstance() {
		if (instance==null)
			instance = new ObjetSauvegarde(unEcran);
		return instance;

	}	
	private static ObjetSauvegarde instance;

	@Override
	public ObjetSauvegarde Trouver(int id) {
		// TODO Auto-generated method stub
		return null;
	} 


} // fin classe
