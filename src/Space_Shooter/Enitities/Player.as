package Space_Shooter.Enitities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import Space_Shooter.Enitities.HUD;
	
	/**
	 * ...
	 * @author Ryan Lower
	 */
	public class Player extends Entity 
	{
		[Embed(source="../../../assets/player_ship.png")] private const PLAYER:Class;
		
		public static var speed:int = 300;
		private var timeTillShot:int;
		public var shotInterval:int = 10;
		
		public function Player()
		{
			graphic = new Image(PLAYER);
			setHitbox(37, 31, 0, 0);
			x = 230;
			y = 300;
			type = "player";
		}
		
		override public function update():void 
		{
			//trace("Player updates");
			move();
			constrain();
			shoot();
			
			collided();
			
			
			
		}
		
		public function move():void
		{
			if (Input.check(Key.LEFT)) { x -= speed*FP.elapsed; }
			if (Input.check(Key.RIGHT)) { x += speed*FP.elapsed; }
			if (Input.check(Key.UP)) { y -= speed*FP.elapsed; }
			if (Input.check(Key.DOWN)) { y += speed*FP.elapsed; }
		}
		
		public function constrain():void
		{
			if (x < 0) { x = 0; }
			if (x > FP.screen.width/2 - 39) { x = FP.screen.width/2 - 39; }
			if( y < 0) { y = 0; }
			if (y > FP.screen.height/2 - 40) { y = FP.screen.height/2 - 40;}
		}
		
		public function shoot():void
		{
			if (timeTillShot > 0) { timeTillShot--;}
			
			if (Input.check(Key.SPACE) && timeTillShot == 0) 
			{ 
				FP.world.add(new PlayerBullet(x + 18, y - 16, 0)); 
				timeTillShot = shotInterval;
			}
		}
		
		public function collided():void
		{
			var e:Enemy = collide("enemy", x, y) as Enemy;
			var b:EnemyBullet = collide("enemy bullet", x, y) as EnemyBullet;
			
			if (e) 
			{
				x = 230;
				y = 300;
				HUD.livesLeft--;
			}else if (b)
			{
				b.destroy();
				x = 230;
				y = 300;
				HUD.livesLeft--;
			}
			
			
		}
		
		public function destroy():void
		{
			FP.world.remove(this);
		}
		
	}

}