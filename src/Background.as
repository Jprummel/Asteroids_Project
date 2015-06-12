package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class Background extends Sprite
	{
		[Embed(source="../lib/Background.jpg")]
		public var backgroundImage	:Class;
		private var bgImage			:Bitmap		
		
		public function Background() 
		{
			//Add Background
			bgImage = new backgroundImage;
			bgImage.x = 0;
			bgImage.width = 815;
			bgImage.height = 815;
			addChild(bgImage);
		}
	}
}