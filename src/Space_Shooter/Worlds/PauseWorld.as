package Space_Shooter.Worlds 
{
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import Space_Shooter.Main
	
	/**
	 * ...
	 * @author Ryan Lower
	 */
	public class PauseWorld extends World 
	{
		
		public function PauseWorld() 
		{
			
			var titleText:Text = new Text("Paused", 0, 0, null, 20);
			titleText.size = 36;
			addGraphic(titleText, 0, 25, 50);
			
			var lineText1:Text = new Text("Press <ENTER> to continue!", 0, 0, null, 20);
			titleText.size = 24;
			addGraphic(lineText1, 0, 25, 150);
		}
		
		override public function update():void
		{
			if (Input.pressed(Key.ENTER)) 
			{
				
				Main.pauseWorld.active = false;
				Main.gameWorld = new GameWorld;
				Main.gameWorld.active = true;
				FP.world = Main.gameWorld;
				
				
				
				
			}
			
			super.update();
		}
	}

}