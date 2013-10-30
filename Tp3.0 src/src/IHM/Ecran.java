package IHM;

import java.awt.Color;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JSlider;
import javax.swing.JTextField;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;

import DAO.ObjetSauvegarde;
/**
 * Classe qui permet de creer l'inetrface graphique du métronome .
 * @version 3.0
 * @author Rafik gharsalli , Olivier Charrier , Fahd Kacem
 * copyright (c) 2012 UQAM
 * All Rights Reserved
 */
public class Ecran extends JFrame  {

	private static final long serialVersionUID = 1L;
	private JPanel pan = new JPanel();
	public JPanel panLed = new JPanel();
	public JPanel panLed2 = new JPanel();
	private JButton bStart = new JButton("Start");
	private JButton bStop = new JButton("Stop");
	private JButton bInc = new JButton("Inc");
	private JButton bDec = new JButton("Dec");
	private JSlider sliderTempo = new JSlider(20,200);

	public static JTextField affichTemp = new JTextField ("60", 3);
	private JTextField affichTempTitre = new JTextField (" Tempo : ");
	public static JTextField affichMes = new JTextField ("", 3);
	private JTextField affichMesTitre = new JTextField (" Mesure : ");


	private Ecran() {

		Toolkit.getDefaultToolkit().beep();
		this.setTitle("seiko");
		this.setSize(400, 140);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);             
		
		this.setContentPane(pan);
		pan.add(bStart);
		pan.add(bStop);
		pan.add(affichTempTitre);
		pan.add(affichTemp);
		pan.add(bInc);
		pan.add(bDec);
		pan.add(affichMesTitre);
		pan.add(affichMes);

		sliderTempo.setValue(ObjetSauvegarde.getInstance().update(ObjetSauvegarde.getInstance()));
		sliderTempo.setMajorTickSpacing(40);
		sliderTempo.setMinorTickSpacing(20);
		sliderTempo.setPaintLabels(true);
		pan.add(sliderTempo);
		panLed.setBackground(Color.white);
		pan.add(panLed);
		panLed2.setBackground(Color.white);
		pan.add(panLed2);
		this.setVisible(true);

		sliderTempo.addChangeListener(new ChangeListener() {
			@Override
			public void stateChanged(ChangeEvent e) {
				JSlider uneSource = (JSlider)e.getSource();
				if(!uneSource.getValueIsAdjusting()){

					ObjetMolette.getInstance().setValeurMolette(((JSlider) e.getSource()).getValue());
					ObjetMolette.getInstance().setEtatMoletteVraie();

				}

			}

		});

		bStart.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent arg0) {
				ObjetClavier.getInstance().setTouchePresseeStartTrue();


			}
		});

		bStop.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				ObjetClavier.getInstance().setTouchePresseeStopTrue();

			}
		});
		bInc.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				ObjetClavier.getInstance().setTouchePresseeIncTrue();

			}
		});
		bDec.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				ObjetClavier.getInstance().setTouchePresseeDecTrue();

			}
		});
		this.addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent e) {
				ObjetSauvegarde.getInstance().ecrireDansFichier(Integer.toString(ObjetMolette.getInstance().getValeurMolette()) ,Integer.toString(ObjetClavier.getInstance().getValeurMesure()));


			}
		});


	}

	

	public final synchronized static Ecran getInstance() {
		if (instance==null)
			instance = new Ecran();
		return instance;

	}	
	private static Ecran instance; 



}

