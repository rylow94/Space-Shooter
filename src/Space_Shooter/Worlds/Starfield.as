package Space_Shooter.Worlds 
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	
	
	/**
	 * implements a simple starfield
	 * @author Richard Marks
	 */
	public class Starfield extends Graphic
	{
		// stars is [star1, star2, star3, etc]
		// star# is [graphic, Point(x, y), color, speed]
		private var stars:Array;
		
		// number of stars
		private var fieldDensity:int;
		private var fieldColors:Array;
		
		override public function update():void 
		{

				// move stars from the top of the screen to the bottom
				for each(var star:Array in stars)
				{
					// add speed to the star
					Point(star[1]).y += star[3];
					
					if (Point(star[1]).y > FP.height)
					{
						// new random x position and warp back to top
						Point(star[1]).x = FP.random * FP.width;
						Point(star[1]).y = 0;
					}
				}
			
		}
		
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			for each(var star:Array in stars)
			{
				Image(star[0]).render(target, Point(star[1]), camera);
			}
		}
		
		/**
		 * creates a new starfield
		 * @param	density - number of stars
		 * @param	colors - an array of unsigned integers for each star color depth
		 */
		public function Starfield(density:int = 400, colors:Array = null) 
		{
			if (colors == null)
			{
				colors = [0x444444, 0x999999, 0xBBBBBB, 0xFFFFFF];
			}
			
			if (density > 1000)
			{
				density = 1000;
			}
			
			fieldDensity = density;
			fieldColors = colors;
			active = true;
			visible = true;
			
			CreateField();
		}
		
		// creates the starfield
		private function CreateField():void
		{
			// new array of stars
			stars = new Array;
			
			for (var i:int = 0; i < fieldDensity; i++)
			{
				// star is [graphic, Point(x,y), color, speed]
				var star:Array = [null, new Point(0,0), null, null];
				
				// random position
				Point(star[1]).x = FP.random * FP.width;
				Point(star[1]).y = FP.random * FP.height;
				
				// random speed based on number of available colors
				star[3] = Math.floor(FP.random * fieldColors.length);
				
				// color based on speed
				star[2] = fieldColors[star[3]];
				
				// star graphic itself
				star[0] = Image.createRect(1, 1, star[2]);
				
				// add star to the stars array
				stars.push(star);
			}
		}	
	}
}