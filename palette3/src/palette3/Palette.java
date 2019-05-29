package palette3;

import java.awt.Color;
import java.util.Random;

public class Palette {
	Color currentColor;
	Color red;
	Color blue;
	Color green;
	Random rand;
	
	public Palette() {
		currentColor = new Color(250, 250, 250);//WHITE
		red = new Color(255,0,0);//RED
		green = new Color(0,255,0);//GREEN
		blue = new Color(0,0,255);//BLUE
		rand = new Random();
	}
	
	public Color changeRadColor() {
		int r = rand.nextInt(255);
		int g = rand.nextInt(255);
		int b = rand.nextInt(255);
		
		return new Color(r, g, b);
	}
	
}
