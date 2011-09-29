package Space_Shooter
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import Space_Shooter.Worlds.GameOverWorld;
	import Space_Shooter.Worlds.GameWorld;
	import Space_Shooter.Worlds.PauseWorld;
	import Space_Shooter.Worlds.TitleWorld;

	public class Main extends Engine
	{
		public static var titleWorld:TitleWorld;
		public static var gameWorld:GameWorld;
		public static var pauseWorld:PauseWorld;
		public static var gameOverWorld:GameOverWorld;
		
		public function Main()
		{
			super(1000, 800, 30, false);
			FP.console.enable();
			FP.screen.scale = 2;
			
			Main.titleWorld = new TitleWorld;
			Main.gameWorld = new GameWorld;
			Main.pauseWorld = new PauseWorld;
			Main.gameOverWorld = new GameOverWorld;
			
			
			FP.world = titleWorld;

		}

		override public function init():void
		{
			trace("FlashPunk has started successfully!");
			

		}
	}
}