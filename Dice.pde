Die prepareTo, polarMolecule;
boolean startRolling, multiplyDice, resetDice;
int i;

void setup()
{

	loop();
	frameRate(20);

	frameRate(10);
	size(400, 400);
	prepareTo = new Die(0, 0);
	polarMolecule = new Die(200, 0);
	multiplyDice = false;
	resetDice = false;
}
void draw()
{
	if (multiplyDice) {
		prepareTo.siz = prepareTo.siz/2;
		polarMolecule.siz = polarMolecule.siz/2;
		prepareTo = new Die(prepareTo.myX + prepareTo.siz, prepareTo.myY);
		prepareTo = new Die(prepareTo.myX, prepareTo.myY + prepareTo.siz);
		prepareTo = new Die(prepareTo.myX + prepareTo.siz, prepareTo.myY + prepareTo.siz);
	}

	if (resetDice) 
	{
		prepareTo.siz = 20;
		polarMolecule.siz = 20;
		prepareTo.myX = 0;
		prepareTo.myY = 0;
		polarMolecule.myX = 200;
		polarMolecule. myY = 0;

		resetDice = false;
	}

	startRolling = true;
	if (i < 10) {
		background(0);
		prepareTo.roll();
		polarMolecule.roll();
		prepareTo.show();
		polarMolecule.show();
		fill(255);
		text("Total: " + (prepareTo.rollResult + polarMolecule.rollResult), 20, 380);
	}
	i ++;
	
	
}
void mousePressed()
{
	if (mouseButton == LEFT) {
		
	}
	else if (mouseButton == RIGHT) {
		multiplyDice = true;
	} else if (mouseButton == CENTER) 
	{
		multiplyDice = false;
		resetDice = true;
	}
	i = 0;
}

class Die //models one single dice cube
{
	//variable declarations here
	int myX, myY, rollResult, siz;
	Die(int inX, int inY) //constructor
	{
		//variable initializations here
		siz = 20;
		myX = inX;
		myY = inY;
		rollResult = 6;
		
	}
	void roll()
	{
		if (startRolling) {
			rollResult = (int)(Math.random()*6) + 1;
		}
		
	}
	void show()
	{
		fill(255);
		rect(myX, myY, siz * 10, siz * 10);
		fill(0, 0, 0);
		//System.out.println(rollResult);

		if (rollResult == 1) 
		{
			ellipse(myX + 5 * siz, myY + 5 * siz, siz, siz);
		}
		else if (rollResult == 2) 
		{
			ellipse(myX + siz * 3, myY + siz * 3, siz, siz);
			ellipse(myX + siz * 7, myY + siz * 7, siz, siz);
		}
		else if (rollResult == 3) {
			ellipse(myX + siz * 2, myY + siz * 2, siz, siz);
			ellipse(myX + siz * 5, myY + siz * 5, siz, siz);
			ellipse(myX + siz * 8, myY + siz * 8, siz, siz);
		}
		else if (rollResult == 4) {
			ellipse(myX + siz * 2, myY + siz * 2, siz, siz);
			ellipse(myX + siz * 2, myY + siz * 8, siz, siz);
			ellipse(myX + siz * 8, myY + siz * 2, siz, siz);
			ellipse(myX + siz * 8, myY + siz * 8, siz, siz);
		}
		else if (rollResult == 5) {
			ellipse(myX + siz * 2, myY + siz * 2, siz, siz);
			ellipse(myX + siz * 2, myY + siz * 8, siz, siz);
			ellipse(myX + siz * 8, myY + siz * 2, siz, siz);
			ellipse(myX + siz * 8, myY + siz * 8, siz, siz);
			ellipse(myX + siz * 5, myY + siz * 5, siz, siz);
		}
		else if (rollResult == 6) {
			ellipse(myX + siz * 2, myY + siz * 2, siz, siz);
			ellipse(myX + siz * 2, myY + siz * 5, siz, siz);
			ellipse(myX + siz * 2, myY + siz * 8, siz, siz);
			ellipse(myX + siz * 8, myY + siz * 2, siz, siz);
			ellipse(myX + siz * 8, myY + siz * 5, siz, siz);
			ellipse(myX + siz * 8, myY + siz * 8, siz, siz);
		}
	}
}
