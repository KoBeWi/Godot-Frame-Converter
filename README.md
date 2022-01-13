# <img src="https://github.com/KoBeWi/Godot-Frame-Converter/blob/master/Media/Icon.png" width="64" height="64"> Godot Frame Converter

This plugin will convert animations using Sprite's `frame` property to `frame_coords`, which is more resistant to changing the spritesheet layout, because it references the actual x/y coordinate of frame instead of some index that is prone to move. The new property was introduced in Godot 3.2, so the converter is not as relevant now, but maybe you have some old animations or just discovered `frame_coords` and now you can't live without it idk.

## Usage

Just run the script from script editor, while having AnimationPlayer selected. The script will automatically convert all `frame` tracks of any referenced Sprite node.

![](https://github.com/KoBeWi/Godot-Frame-Converter/blob/master/Media/ReadmeHowToUse.gif)

1. Select AnimationPlayer node
2. Open `ConvertFrames.gd` in Script Editor
3. Select File -> Run (<kbd>Ctrl + Shift + X</kbd> by default)
4. Check the console for output
