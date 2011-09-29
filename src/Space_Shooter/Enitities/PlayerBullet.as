package Space_Shooter.Enitities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author ...
	 */
	public class PlayerBullet extends Entity 
	{
		[Embed(source = "../../../assets/player_bullet_2.png")] private var BULLET_GRAPHIC:Class;
		
		private const speed:int = 400;
		public var damage:int;
		
		public function PlayerBullet(_x:int , _y:int, _damage:int) 
		{
			x = _x;
			y = _y;
			damage = _damage;
			setHitbox(5, 16, 0, 1);
			type = "player bullet";
			graphic = new Image(BULLET_GRAPHIC);
			//graphic = Image.createRect(3, 16, 0xFFFFFF);
		}
		
		override public function update():void
		{
			y -= speed * FP.elapsed;
			if (y < 0) { destroy(); }
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