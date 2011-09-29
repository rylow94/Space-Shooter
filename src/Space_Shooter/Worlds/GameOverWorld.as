package Space_Shooter.Worlds 
{
	import net.flashpunk.World;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import Space_Shooter.Main;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Ryan Lower
	 */
	public class GameOverWorld extends World 
	{
		
		public function GameOverWorld() 
		{
			var titleText:Text = new Text("You died...", 0, 0, null, 20);
			titleText.size = 36;
			addGraphic(titleText, 0, 25, 50);
			
			var lineText1:Text = new Text("Press <ENTER> to try again!", 0, 0, null, 20);
			titleText.size = 24;
			addGraphic(lineText1, 0, 25, 150);
		}
		
		override public function update():void
		{
			if (Input.pressed(Key.ENTER)) 
			{
				
				Main.gameOverWorld.active = false;
				Main.gameWorld = new GameWorld;
				Main.gameWorld.active = true;
				FP.world = Main.gameWorld;
				
				
				
				
			}
			
			super.update();
		}
		
	}

}