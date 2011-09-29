package Space_Shooter.Worlds 
{
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import Space_Shooter.Main;
	
	
	/**
	 * ...
	 * @author ...
	 */
	public class TitleWorld extends World 
	{
		
		public function TitleWorld() 
		{
			var titleText:Text = new Text("Space Game!!!!", 0, 0, null, 20);
			titleText.size = 36;
			addGraphic(titleText, 0, 25, 50);
			
			var lineText1:Text = new Text("Press <ENTER> to begin!", 0, 0, null, 20);
			lineText1.size = 24;
			addGraphic(lineText1, 0, 25, 150);
		}
		
		override public function update():void
		{
			if (Input.pressed(Key.ENTER)) 
			{
				Main.gameWorld.active = true;
				FP.world = Main.gameWorld;
				
			}
			super.update();
		}
		
	}

}