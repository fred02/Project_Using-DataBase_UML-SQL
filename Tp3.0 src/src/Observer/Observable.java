package Observer;

public interface Observable {
	
	public void ajouterObservateur (Observateur objet);
	public void supprimerObservateur (Observateur obejt );
	public void notifierObservateurs ();

}
