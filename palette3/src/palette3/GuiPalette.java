package palette3;

import java.awt.EventQueue;

import javax.swing.JFrame;
import java.awt.BorderLayout;
import java.awt.GridBagLayout;
import javax.swing.JButton;
import java.awt.GridBagConstraints;
import com.jgoodies.forms.layout.FormLayout;
import com.jgoodies.forms.layout.ColumnSpec;
import com.jgoodies.forms.layout.RowSpec;
import java.awt.Color;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class GuiPalette {

	private JFrame frame;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					GuiPalette window = new GuiPalette();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public GuiPalette() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 450, 300);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(new FormLayout(new ColumnSpec[] {
				ColumnSpec.decode("100px"),
				ColumnSpec.decode("250px"),},
			new RowSpec[] {
				RowSpec.decode("60px"),
				RowSpec.decode("150px"),}));
		
		JButton PaletteButton = new JButton("");
		PaletteButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Palette p = new Palette();
				PaletteButton.setBackground(p.changeRadColor());
			}
		});
		PaletteButton.setBackground(Color.WHITE);
		frame.getContentPane().add(PaletteButton, "2, 2, center, fill");
	}

}
