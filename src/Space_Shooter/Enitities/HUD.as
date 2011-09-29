package Space_Shooter.Enitities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author Ryan Lower
	 */
	public class HUD extends Entity 
	{
		
		public static var livesLeft:int = 5;
		
		private var livesText:Text;
		
		public function HUD() 
		{
			livesText = new Text("Lives: " + livesLeft, 0, 0, null, 20);
			livesText.size = 24;
			
		}
		
		override public function update():void 
		{
			livesText.text = "Lives: " + livesLeft;
			addGraphic(livesText);
		}
		
		
		
	}

}