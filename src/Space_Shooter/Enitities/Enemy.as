package Space_Shooter.Enitities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import Space_Shooter.Main;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Enemy extends Entity 
	{
		[Embed(source="../../../assets/enemy_1.png")] private const ENEMY1:Class;
		
		private const speed:int = 100;
		private var direction:Boolean = true, ready:Boolean = false;
		
		private var timeTillShot:int = FP.rand(100);
		public var shotInterval:int = 100;
		
		public var origX:int, origY:int, enemyType:int;
		
		public function Enemy(_x:int, _y:int, _enemyType:int) 
		{
			x = _x;
			y = _y-200;
			origX = _x;
			origY = _y;
			setHitbox(15, 15, 0, 0);
			graphic = new Image(ENEMY1);
			type = "enemy";
		}
		
		override public function update():void
		{
			move();
			shoot();
			collided();
			
			
		}
		
		public function move():void
		{
			if (!ready)
			{
				y += speed * FP.elapsed;
				if (y > origY) {
					y = origY;
					ready = true;
				}
				
			}else {
			
				if (direction) 
				{ 
					x += speed * FP.elapsed; 
					if (x > origX + 75)
					{
						x = origX + 75;
						direction = false;
					}
				}
				else 
				{ 
					x -= speed * FP.elapsed; 
					if (x < origX)
					{
						x = origX;
						direction = true;
					}
				}
			}
		}
		
		public function shoot():void
		{
			if(ready) {
			
				if (timeTillShot > 0) { timeTillShot--;}
			
				if(timeTillShot == 0) {
					FP.world.add(new EnemyBullet(x + 8, y + 24, enemyType)); 
					timeTillShot = shotInterval;
				}
			}
		}
		
		public function collided():void
		{
			var b:PlayerBullet = collide("player bullet", x, y) as PlayerBullet;
			
			if (b) 
			{
				b.destroy();
				this.destroy();
			}
			
			
		}
		
		public function destroy():void
		{
			Main.gameWorld.enemiesDestroyed++;
			FP.world.remove(this);
		}
		
	}

}