package Space_Shooter.Worlds 
{
	import net.flashpunk.World;
	import Space_Shooter.Enitities.Enemy;
	import Space_Shooter.Enitities.HUD;
	import Space_Shooter.Enitities.Player;
	import Space_Shooter.Main;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Ryan Lower
	 */
	public class GameWorld extends World 
	{
		private var field:Starfield = new Starfield();
		private var hud:HUD = new HUD;
		
		public var wave:Array = new Array();
		public var totalEnemies:int = 0;
		public var enemiesDestroyed:int = 0;
		public var waveDestroyed:Boolean = true;
		
		public function GameWorld() 
		{
			add(new Player);
			add(hud);
			HUD.livesLeft = 5;
			
			wave[0] = new Array(25, 50, 1);
			wave[1] = new Array(75, 50, 1);
			wave[2] = new Array(125, 50, 1);
			wave[3] = new Array(175, 50, 1);
			wave[4] = new Array(225, 50, 1);
			wave[5] = new Array(275, 50, 1);
			wave[6] = new Array(325, 50, 1);
			wave[7] = new Array(375, 50, 1);
			wave[8] = new Array(25, 10, 1);
			wave[9] = new Array(75, 10, 1);
			wave[10] = new Array(125, 10, 1);
			wave[11] = new Array(175, 10, 1);
			wave[12] = new Array(225, 10, 1);
			wave[13] = new Array(275, 10, 1);
			wave[14] = new Array(325, 10, 1);
			wave[15] = new Array(375, 10, 1);
			
			
		}
		
		override public function update():void
		{
			field.update();
			
			//checkGameOver();
			
			if (Input.pressed(Key.ENTER)) 
			{
				Main.gameWorld.active = false;
				Main.pauseWorld.active = true;
				FP.world = Main.pauseWorld;
				
			}
			
			//create wave
			if (totalEnemies == enemiesDestroyed )
			{
				enemiesDestroyed = 0;
				totalEnemies = wave.length;
				
				for (var x:int = 0; x < wave.length; x++ )
				{
					add(new Enemy(wave[x][0], wave[x][1], wave[x][2]));
				}
			}
			
			super.update();
		}
		
		public function checkGameOver():void
		{
			if (HUD.livesLeft <= 0) 
			{
				Main.gameWorld.active = false;
				Main.gameOverWorld.active = true;
				FP.world = Main.gameOverWorld;
			}
		}
		
		override public function render():void 
		{
			// draw the starfield
			field.render(FP.buffer, new Point, FP.camera);
			super.render();
		}
		
	}

}