package Space_Shooter.Enitities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author ...
	 */
	public class EnemyBullet extends Entity 
	{
		[Embed(source = "../../../assets/player_bullet_2.png")] private var BULLET_GRAPHIC:Class;
		
		private const speed:int = 300;
		public var bulletType:int;
		
		public function EnemyBullet(_x:int , _y:int, _bulletType:int) 
		{
			x = _x;
			y = _y;
			setHitbox(5, 16, 0, 1);
			type = "enemy bullet";
			//graphic = new Image(BULLET_GRAPHIC);
			graphic = Image.createRect(3, 16, 0xFFFFFF);
		}
		
		override public function update():void
		{
			y += speed * FP.elapsed;
			if (y > FP.screen.height/2) { destroy(); }
		}
		
		public function move():void
		{
			y += speed * FP.elapsed;
			if (y > 0) { destroy(); }
		}
		
		public function destroy():void
		{
			FP.world.remove(this);
		}
	}

}