package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class ResourceCounter extends MovieClip
	{
		// element details filled out by game engine
		public var gameAPI:Object;
		public var globals:Object;
		public var elementName:String;
		
		public function ResourceCounter() { }
		
		// called by the game engine when this .swf has finished loading
		public function onLoaded():void
		{
			trace( "[RTSUI] ResourceCounter loaded" );
			visible = true;
			gameAPI.SubscribeToGameEvent( "rts_resource_update", onResourceUpdate );
		}
		
		// called by the game engine after onLoaded and whenever the screen size is changed
		public function onScreenSizeChanged():void
		{
			// By default, your 1024x768 swf is scaled to fit the vertical resolution of the game
			//   and centered in the middle of the screen.
			// You can override the scaling and positioning here if you need to.
			// stage.stageWidth and stage.stageHeight will contain the full screen size.
			trace( "[RTSUI] onScreenSizeChanged" );
			trace( stage.stageWidth );
			trace( stage.stageHeight );
			x = stage.stageWidth - ( 440.0 * this.scaleY );
		}
		
		public function onResourceUpdate( eventData:Object )
		{
			if( eventData.playerID != globals.Players.GetLocalPlayer() )
				return;
			
			wood_text.text = "Wood: " + eventData.wood;
			stone_text.text = "Stone: " + eventData.stone;
		}
	}
}
